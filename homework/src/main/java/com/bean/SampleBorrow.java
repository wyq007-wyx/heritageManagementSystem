package com.bean;

public class SampleBorrow {
	private int bid;
	private int sid;
	private String belong;
	private int wid;
	private String borrow_time;
	private String back_time;
	private String person;
	private String reason;
	private String tel;
	public String getBorrow_workplace() {
		return borrow_workplace;
	}
	public void setBorrow_workplace(String borrow_workplace) {
		this.borrow_workplace = borrow_workplace;
	}
	private String plus;
	private int check_state;
	private String borrow_workplace;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public String getBorrow_time() {
		return borrow_time;
	}
	public void setBorrow_time(String borrow_time) {
		this.borrow_time = borrow_time;
	}
	public String getBack_time() {
		return back_time;
	}
	public void setBack_time(String back_time) {
		this.back_time = back_time;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPlus() {
		return plus;
	}
	public void setPlus(String plus) {
		this.plus = plus;
	}
	public int getCheck_state() {
		return check_state;
	}
	public void setCheck_state(int check_state) {
		this.check_state = check_state;
	}
	public SampleBorrow() {
		super();
	}
	@Override
	public String toString() {
		return "SampleBorrow [bid=" + bid + ", sid=" + sid + ", belong=" + belong + ", wid=" + wid + ", borrow_time="
				+ borrow_time + ", back_time=" + back_time + ", person=" + person + ", reason=" + reason + ", tel="
				+ tel + ", plus=" + plus + ", check_state=" + check_state + "]";
	}
	
}
