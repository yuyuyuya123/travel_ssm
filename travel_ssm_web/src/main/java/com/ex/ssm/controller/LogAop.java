package com.ex.ssm.controller;

import com.ex.ssm.domain.SysLog;
import com.ex.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;

    private Date visitTime;
    private Method executionMethod;
    private Class executionClass;
    private long executionTime;
    private String url;
    private String ip;
    private String username;


    @Before("execution(* com.ex.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        //获取访问时间
        visitTime=new Date();
        //获取访问的类
        executionClass=jp.getTarget().getClass();
        //获取访问的方法
        String methodName = jp.getSignature().getName();//访问的方法名
        Object[] args = jp.getArgs();//访问的方法的参数
        if(args==null || args.length==0){
            executionMethod=executionClass.getMethod(methodName);//获取无参方法
        }else {
            Class[] params=new Class[args.length];
            for (int i=0;i<args.length;i++) {
                params[i]=args[i].getClass();
            }
            executionMethod=executionClass.getMethod(methodName,params);//获取有参方法
        }

    }

    @After("execution( * com.ex.ssm.controller.*.*(..))")
    public void doAfter(){
        //获取访问的用户的名字
        SecurityContext context = (SecurityContext) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        username = ((User) (context.getAuthentication().getPrincipal())).getUsername();
        //获取IP
        ip = request.getRemoteAddr();
        //获取url
        url="";
        if(executionClass!=SysLogController.class){//如果不是在访问日志，则记录该次访问的url
            RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
            if (classAnnotation!=null){//组装url
                url+=classAnnotation.value()[0];
            }
            url+=methodAnnotation.value()[0];
        }
        //获取访问时长
        executionTime = new Date().getTime() - visitTime.getTime();

        //将获取的数据封装到SysLog对象中
        SysLog sysLog = new SysLog();
        sysLog.setUsername(username);
        sysLog.setIp(ip);
        sysLog.setExecutionTime(executionTime);
        sysLog.setUrl(url);
        sysLog.setMethod("[类名] "+executionClass.getName()+"[方法名] "+executionMethod.getName());
        sysLog.setVisitTime(visitTime);

        //将数据插入到数据库
        sysLogService.insertOneSysLog(sysLog);

    }

}
