package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IUserDao;
import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import com.ex.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        UserInfo userInfo = userDao.selectByName(userName);
        //将自己的userInfo对象封装成UserDetails的实现类User
        User user = new User(userName, userInfo.getPassword(),userInfo.getStatus()==1?true:false, true,true,true,getAuthorities(userInfo.getRoles()));
        return user;
    }

    //将Role集合封装成GrantedAuthority集合
    public List<SimpleGrantedAuthority> getAuthorities(List<Role> roles){
        List<SimpleGrantedAuthority> list=new ArrayList<>();
        for (Role role:roles){
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }


    @Override
    public List<UserInfo> findAll() {
        List<UserInfo> all = userDao.findAll();
        return all;
    }


    @Override
    public UserInfo selectById(String id) {
        UserInfo uf = userDao.selectById(id);
        return uf;
    }


    @Override
    public void insertOneUser(UserInfo userInfo) {
        //对存储的密码进行加密处理
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.insertOneUser(userInfo);
    }


    @Override
    public List<Role> showRemainRole(String id) {
        List<Role> roles = userDao.showRemainRole(id);
        return roles;
    }


    @Override
    public void addRoleToUser(String userId, String[] roleIds) {
        for (String roleId:roleIds) {
            userDao.addRoleToUser(userId,roleId);
        }
    }

    @Override
    public void deleteOneUser(String id) {
        //从users_role表中 删除该user所在行
        userDao.deleteFromUsersRole(id);
        //从users表中，删除该user
        userDao.deleteOneUser(id);
    }
}
