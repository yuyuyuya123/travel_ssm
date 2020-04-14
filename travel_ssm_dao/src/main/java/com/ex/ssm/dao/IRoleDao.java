package com.ex.ssm.dao;

import com.ex.ssm.domain.Permission;
import com.ex.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    //查询所有角色
    @Select("select * from role")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "permissions",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IPermissionDao.selectByRoleId"))
    })
    List<Role> findAll();

    //根据 用户Id 查找到该用户所拥有的角色
    @Select("select * from role where id in(select roleId from users_role where userId=#{id})")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "permissions",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IPermissionDao.selectByRoleId"))
    })
    List<Role> selectByUserId(String id);

    //插入数据到 role表
    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void insertOneRole(Role role);

    //根据 角色Id 查找角色
    @Select("select * from role where id=#{id}")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "permissions",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IPermissionDao.selectByRoleId"))
    })
    Role selectById(String id);

    //根据 角色Id 查找该角色还有哪些角色是没有的（可添加的）
    @Select("select * from permission where id not in(select permissionId from role_permission where roleId=#{id})")
    List<Permission> showRemainPermission(String id);

    //插入数据到 中间表role_permission
    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);

    //根据 角色Id 删除角色
    @Delete("delete from role where id=#{id}")
    void deleteOneRole(String id);

    //根据 角色Id 从中间表role_permission删除与该角色相关的数据
    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRolePermission(String roleId);

    //根据 角色Id 从中间表users_role删除与该角色相关的数据
    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteFromUsersRole(String roleId);
}
