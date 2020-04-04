package com.ex.ssm.dao;

import com.ex.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {

    //根据ID查找会员
    @Select("select * from member where id=#{id}")
    Member selectById(String id);
}
