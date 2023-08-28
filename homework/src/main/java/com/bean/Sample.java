package com.bean;

public class Sample {
	private int sid;
	private String belong;
	private String samplename;
	private String findplace;
	private String findtime;
	private String material;
	private String ofyear;
	private String person;
	private String description;
	private String logtime;
	private String image_url;
	private int open;//公开为1，隐藏为0
	private int borrow_state;//可借为1，不可借为0
	public static final int OPEN=1;
	public static final int HIDEN=0;
	public static final int BORROWABLE=1;
	public static final int UNBORROWABLE=0;
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getBorrow_state() {
		return borrow_state;
	}
	public void setBorrow_state(int borrow_state) {
		this.borrow_state = borrow_state;
	}
	public Sample() {
		
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSamplename() {
		return samplename;
	}
	public void setSamplename(String samplename) {
		this.samplename = samplename;
	}
	public String getFindplace() {
		return findplace;
	}
	public void setFindplace(String findplace) {
		this.findplace = findplace;
	}
	public String getFindtime() {
		return findtime;
	}
	public void setFindtime(String findtime) {
		this.findtime = findtime;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getOfyear() {
		return ofyear;
	}
	public void setOfyear(String ofyear) {
		this.ofyear = ofyear;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	@Override
	public String toString() {
		return "Sample [sid=" + sid + ", samplename=" + samplename + ", findplace=" + findplace + ", findtime="
				+ findtime + ", material=" + material + ", ofyear=" + ofyear + ", person=" + person + ", description="
				+ description + ", logtime=" + logtime + ", image_url=" + image_url + "]";
	}
}
