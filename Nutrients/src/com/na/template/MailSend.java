package com.na.template;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {

	
	public static int naverMailSend(String userEmail) {
		
		String host = "smtp.naver.com";
		String user = "nutrientsalmighty@naver.com";
		String password = "sbdhf1234!";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password);
				}
			});
		
        int autNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		
		try { 
			
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			
			// 메일 제목
			message.setSubject("Nutrients Almighty 인증번호");
			
			// 메일 내용
			message.setText("인증번호 : " + autNo);
			
			// send the message
			Transport.send(message);
			
			System.out.println("Success Message Send");

		
		} catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		
        return autNo;
		
	}
	
	public static void idSend(String userEmail, String userId) {
		
		String host = "smtp.naver.com";
		String user = "nutrientsalmighty@naver.com";
		String password = "sbdhf1234!";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password);
				}
			});
		
		
		try { 
			
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			
			// 메일 제목
			message.setSubject("Nutrients Almighty 계정 찾기");
			
			// 메일 내용
			message.setText("아이디 : " + userId);
			
			// send the message
			Transport.send(message);
			
			System.out.println("Success Message Send");

		
		} catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		
	}
	
	public static void pwdSend(String userEmail, String userPwd) {
		
		String host = "smtp.naver.com";
		String user = "nutrientsalmighty@naver.com";
		String password = "sbdhf1234!";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password);
				}
			});
		
		
		try { 
			
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			
			// 메일 제목
			message.setSubject("Nutrients Almighty 계정 찾기");
			
			// 메일 내용
			message.setText("비밀번호 : " + userPwd);
			
			// send the message
			Transport.send(message);
			
			System.out.println("Success Message Send");

		
		} catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	



	
}
