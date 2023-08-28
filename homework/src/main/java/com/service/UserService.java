package com.service;

import java.util.List;





import com.bean.User;




public interface UserService {
	//获取所有user列表
	List<User> getUserList();
	//获取用户角色
	int getUserRole(int uid);
	//更新用户状态
	int updateUserSate(int uid,int user_state);
	//更新上次登录时间
	int updateLast_logintime(int uid,String last_logintime);
	//根据用户名和邮箱获得查询用户
	User findUserByUsernameAndEamil(String username, String email);
	//更新用户密码
	void updatePwd(String username, String repwd);
}
