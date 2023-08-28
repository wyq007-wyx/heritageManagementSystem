package com.bean;

/*
 * 用户表
 * 
 */
public class User {
	private int uid;
	private String username;
	private String password;
	private String image_url;
	private String realname;
	private String sex;
	private int register_state;
	private int user_state;
	private String tel;
	private String email;
	private String addr;
	private String createtime;
	private String last_logintime;
	private String workplace;
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", image_url=" + image_url
				+ ", realname=" + realname + ", sex=" + sex + ", register_state=" + register_state + ", user_state="
				+ user_state + ", tel=" + tel + ", email=" + email + ", addr=" + addr + ", createtime=" + createtime
				+ ", last_logintime=" + last_logintime + ", workplace=" + workplace + "]";
	}
	public User() {
		//super();
	}
	public String getWorkplace() {
		return workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public int getRegister_state() {
		return register_state;
	}
	public void setRegister_state(int register_state) {
		this.register_state = register_state;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getLast_logintime() {
		return last_logintime;
	}
	public void setLast_logintime(String last_logintime) {
		this.last_logintime = last_logintime;
	}
	
}
