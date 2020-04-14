package com.ex.ssm.dao;

import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUserDao {

    //根据 用户名username 查找用户
    @Select("select * from users where username=#{userName}")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "roles",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IRoleDao.selectByUserId"))
    })
    UserInfo selectByName(String userName);

    //查找所有用户
    @Select("select * from users")
    List<UserInfo> findAll();

    //根据 用户Id 查找用户
    @Select("select * from users where id=#{id}")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "roles",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IRoleDao.selectByUserId"))
    })
    UserInfo selectById(String id);

    //插入数据
    @Insert("insert into users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void insertOneUser(UserInfo userInfo);

    //根据 用户Id 查找该用户没有的（可添加的）角色
    @Select("select * from role where id not in(select roleId from users_role where userId=#{id})")
    List<Role> showRemainRole(String id);

    //通过在users_role表里添加数据，来增加用户所拥有的角色
    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId);

    //根据 用户Id 删除用户
    @Delete("delete from users where id=#{id}")
    void deleteOneUser(String id);

    //根据 用户Id 从中间表users_role中删除该用户的相关数据
    @Delete("delete from users_role where userId=#{userId}")
    void deleteFromUsersRole(String userId);
}
