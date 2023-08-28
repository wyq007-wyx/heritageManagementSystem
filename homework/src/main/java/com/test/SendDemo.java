package com.test;

public class SendDemo {
	 
	/**
	 * 若频繁发送，腾讯服务器会将邮件自动识别为垃圾邮件并且屏蔽
	 * @param args
	 */
	public static void main(String[] args) {
		String SMTPHost="smtp.163.com";
		String Port="25";//SMTP端口为25
		String MailUsername="qiyeswinner@163.com"; //直接用我的邮件进行发送测试
		String MailPassword="TKNNVJJBUZJLOCBB"; //密码请勿修改
		SendMail sendMail=new SendMail(SMTPHost,Port,MailUsername,MailPassword);
		
		String MailFrom="qiyeswinner@163.com"; //发件人
		String MailTo="zhangpengfei@bjfu.edu.cn"; //收件人
		String MailCopyTo=null; //抄送人
		String MailBCopyTo=null; //暗送人
		String MailSubject="JavaSE发送邮件测试"; //邮件主题
		String MailBody="引用mail.jar和activation.jar实现邮件发送！"; //邮件内容
		
		//发送邮件
		boolean isSend=sendMail.sendingMimeMail(MailFrom, MailTo, MailCopyTo, MailBCopyTo, MailSubject, MailBody);
		if(isSend){
			System.out.println("邮件发送成功");
		}else{
			System.out.println("邮件发送失败");
		}
	}
 
}
