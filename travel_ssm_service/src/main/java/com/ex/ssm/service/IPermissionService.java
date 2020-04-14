package com.ex.ssm.service;

import com.ex.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll();

    void insertOnePermission(Permission permission);

    Permission selectById(String id);

    void deleteOnePermission(String id);
}
