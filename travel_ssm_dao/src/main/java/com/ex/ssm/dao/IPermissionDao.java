package com.ex.ssm.dao;

import com.ex.ssm.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {

    //查询所有权限
    @Select("select * from permission")
    List<Permission> findAll();

    //根据 角色Id 查询权限
    @Select("select * from permission where id in(select permissionId from role_permission where roleId=#{id})")
    List<Permission> selectByRoleId(String id);

    //根据 权限Id 查询权限
    @Select("select * from permission where id=#{id}")
    Permission selectById(String id);

    //插入数据，id由oracle自动生成
    @Insert("insert into permission(permissionName，url) values(#{permissionName},#{url})")
    void insertOnePermission(Permission permission);

    //根据 权限Id 删除权限
    @Delete("delete from permission where id=#{id}")
    void delete(String id);

    //根据 角色Id 删除权限
    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRolePermission(String permissionId);
}
