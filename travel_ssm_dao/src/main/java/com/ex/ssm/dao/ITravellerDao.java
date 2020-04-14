package com.ex.ssm.dao;

import com.ex.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITravellerDao {

    //根据 角色Id 从order_traveller表查找到该角色相关的travellers们
    @Select("select * from traveller where id in(select travellerId from order_traveller where orderId=#{id})")
    List<Traveller> selectById(String id);
}
