package com.bean;

public class Institution {
	
	private int wid;
	private String name;
	private String manager;
	private String tel;
	private String email;
	private String addr;
	private String type;
	public Institution() {
		
	}
	@Override
	public String toString() {
		return "Institution [wid=" + wid + ", name=" + name + ", manager=" + manager + ", tel=" + tel + ", email="
				+ email + ", addr=" + addr + ", type=" + type + "]";
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
