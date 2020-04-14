package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IPermissionDao;
import com.ex.ssm.domain.Permission;
import com.ex.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements IPermissionService{
    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll() {
        List<Permission> all = permissionDao.findAll();
        return all;
    }

    @Override
    public void insertOnePermission(Permission permission) {
        permissionDao.insertOnePermission(permission);
    }

    @Override
    public Permission selectById(String id) {
        Permission permission = permissionDao.selectById(id);
        return permission;
    }

    @Override
    public void deleteOnePermission(String id) {
        //先删除中间表role_permission中 该permission的数据
        permissionDao.deleteFromRolePermission(id);
        //再删除permission表中 该permission的数据
        permissionDao.delete(id);
    }
}
