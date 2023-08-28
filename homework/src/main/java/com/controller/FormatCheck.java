package com.controller;

import java.util.regex.Pattern;

public class FormatCheck {
	public final static String telFormat="^1[3-9]\\d{9}$";
	public final static String emailFormat="^(\\w+([-.][A-Za-z0-9]+)*){3,18}@\\w+([-.][A-Za-z0-9]+)*\\.\\w+([-.][A-Za-z0-9]+)*$";
	public static boolean isValidPhoneNumber(String phoneNumber) {
		if(phoneNumber==null||"".equals(phoneNumber)) return true;
		return Pattern.matches(telFormat, phoneNumber);
	}
	public static boolean isBlank(String username,String password) {
		if(username==null||password==null) {
			return true;
		}
		if("".equals(username)||"".equals(password)) {
			return true;
		}
		return false;
	}
	public static boolean isValidUserName(String name) {
		if(name==null ||"".equals(name)) {
			return false;
		}
		return name.length()<20 && name.length()>0;
	}
	public static boolean isValidUserPassword(String pwd) {
		if(pwd==null ||"".equals(pwd)) {
			return false;
		}
		return pwd.length()<20 && pwd.length()>0;
	}
	public static boolean isValidConfirmPassword(String pwd,String cpwd) {
		if(pwd==null ||"".equals(pwd)) {
			return false;
		}
		if(cpwd==null ||"".equals(cpwd)) {
			return false;
		}
		return pwd.equals(cpwd);
	}
	public static boolean isValidEmail(String email) {
		if(email==null||"".equals(email)) return true;
		return Pattern.matches(emailFormat, email);
	}
	
}
