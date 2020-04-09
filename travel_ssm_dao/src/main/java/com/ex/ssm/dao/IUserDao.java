package com.ex.ssm.dao;

import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface IUserDao {

    @Select("select * from users where username=#{userName}")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "id",property = "roles",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.IRoleDao.selectById"))
    })
    UserInfo selectByName(String userName);
}
