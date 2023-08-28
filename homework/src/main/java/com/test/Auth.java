package com.test;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
/**
 * 
 * 用来验证SMTP服务器身份。程序继承了Authenticator类，
 * 它主要用来实现登录邮件服务器时的认证。它包含两个属性：username和password，
 * 分别用来存储认证时所需的用户名和密码信息。
 * 程序重写了Authenticator类的getPasswordAuthentication()方法，该方法返回PasswordAuthentication对象，
 * 此对象包含通过STMP服务器身份验证所需的用户名和密码，供认证时session调用。
 * Auth类，它继承了Authenticator类

 *
 */
public class Auth extends Authenticator {
	 
	private String username = "";
	private String password = "";
 
	public Auth(String username, String password) {
		this.username = username;
		this.password = password;
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
	} 

}
