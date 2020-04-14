package com.ex.ssm.dao;

import com.ex.ssm.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {

    //插入数据
    @Insert("insert into syslog(visitTime,username,ip,url,executionTime,method) " +
            "values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void insertOneSysLog(SysLog sysLog);

    //查找所有日志
    @Select("select * from syslog")
    List<SysLog> findAll();
}
