package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.bean.User;
import com.dao.UserDao;



@Repository("userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Override
	public List<User> getUserList() {
		return userDao.selectAllUser();
	}
	@Override
	public int getUserRole(int uid) {
		return userDao.getUserRole(uid);
	}
	@Override
	public int updateUserSate(int uid, int user_state) {
		return userDao.updateUserState(uid, user_state);
	}
	@Override
	public int updateLast_logintime(int uid, String last_logintime) {
		return userDao.updateLast_logintime(uid, last_logintime);
	}
	@Override
	public User findUserByUsernameAndEamil(String username, String email) {
		return userDao.findUserByUsernameAndEmail(username, email);
	}
	@Override
	public void updatePwd(String name, String repwd) {
		userDao.updateUserPwd(name, repwd);
	}
	
}

