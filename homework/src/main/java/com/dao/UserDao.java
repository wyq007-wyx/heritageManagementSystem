package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.User;



@Repository("userDao")//声明一个可以注入的实例
@Mapper//自动匹配注解，与xxxMapper.xml中的namespace中与当前全路径相同的接口对应，实现了接口的查询功能
public interface UserDao {
	//查询是否有用户id和密码匹配的用户
	User userLogin(@Param("username") String username,@Param("pwd") String pwd,@Param("rid") int userRole);
	//查询用户名是否已存在
	User register(String username);
	//根据uid查询用户
	User selectByUid(int uid);
	//添加一位游客用户
	int addVisitor(User user);
	//添加一条用户角色记录
	void addUserRole(@Param("uid") int uid,@Param("rid") int rid);
	//显示所有用户信息
	List<User> selectAllUser();
	//获取用户角色id
	int getUserRole(int uid);
	//更新用户头像
	int updateUserImage(@Param("uid")int uid, @Param("image_url")String image_url);
	//更新用户信息
	int updateUser(User user);
	//删除用户信息
	int deleteUser(int uid);
	//删除用户角色记录
    int deleteUserRole(int uid);
    //添加一位工作人员用户
  	int addStaff(User user);
  	//更新登录状态
  	int updateUserState(@Param("uid")int uid, @Param("user_state")int user_state);
  	//更新上次登录时间
  	int updateLast_logintime(@Param("uid")int uid, @Param("last_logintime")String last_logintime);
  	//通过邮箱和用户名查找用户
  	User findUserByUsernameAndEmail(@Param("username")String name, @Param("email")String email);
  	//更新用户密码
  	void updateUserPwd(@Param("username")String name,@Param("password") String pwd);
}
