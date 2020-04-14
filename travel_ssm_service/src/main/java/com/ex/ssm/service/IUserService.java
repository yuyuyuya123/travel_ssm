package com.ex.ssm.service;

import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {

    List<UserInfo> findAll();

    UserInfo selectById(String id);

    void insertOneUser(UserInfo userInfo);

    List<Role> showRemainRole(String id);

    void addRoleToUser(String userId, String[] roleIds);

    void deleteOneUser(String id);
}
