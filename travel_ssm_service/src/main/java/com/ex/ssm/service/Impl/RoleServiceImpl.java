package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IRoleDao;
import com.ex.ssm.domain.Permission;
import com.ex.ssm.domain.Role;
import com.ex.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService{
    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() {
        List<Role> all = roleDao.findAll();
        return all;
    }

    @Override
    public void insertOneRole(Role role) {
        roleDao.insertOneRole(role);
    }

    @Override
    public Role selectById(String id) {
        Role role = roleDao.selectById(id);
        return role;
    }

    @Override
    public List<Permission> showRemainPermission(String id) {
        List<Permission> permissions = roleDao.showRemainPermission(id);
        return permissions;
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for (String permissionId:permissionIds) {
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }

    @Override
    public void deleteOneRole(String id) {
        //删除role_permission中 该role所在的行
        roleDao.deleteFromRolePermission(id);
        //删除users_role中 该role所在的行
        roleDao.deleteFromUsersRole(id);
        //从role表中 删除该role
        roleDao.deleteOneRole(id);
    }
}
