package com.ex.ssm.service;

import com.ex.ssm.domain.Permission;
import com.ex.ssm.domain.Role;

import java.util.List;

public interface IRoleService {

    List<Role> findAll();

    void insertOneRole(Role role);

    Role selectById(String id);

    List<Permission> showRemainPermission(String id);

    void addPermissionToRole(String roleId, String[] permissionIds);

    void deleteOneRole(String id);

}
