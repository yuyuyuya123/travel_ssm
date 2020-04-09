package com.ex.ssm.dao;

import com.ex.ssm.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRoleDao {

    @Select("select * from role where id in(select roleId from users_role where userId=#{id})")
    List<Role> selectById(String id);
}
