package com.ex.ssm.service;

import com.ex.ssm.domain.SysLog;

import java.util.List;

public interface ISysLogService {

    void insertOneSysLog(SysLog sysLog);

    List<SysLog> findAll(Integer page, Integer size);
}
