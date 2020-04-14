package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.ISysLogDao;
import com.ex.ssm.domain.SysLog;
import com.ex.ssm.service.ISysLogService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {
    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public void insertOneSysLog(SysLog sysLog) {
        sysLogDao.insertOneSysLog(sysLog);
    }

    @Override
    public List<SysLog> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        List<SysLog> all = sysLogDao.findAll();
        return all;
    }
}
