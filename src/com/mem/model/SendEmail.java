package com.mem.model;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

	public String sendPassword(String mb_email) {
		String to = mb_email;
		String subject = "---�s�K�X�H�e�q��---";
		SendEmail se = new SendEmail();
		String randomPwd = se.getStringRandom(8);
		String url = "http://localhost:8081/CEA103G3_Project/front-end/mem/MemLogin.jsp";
		String messageText = ("�z���s�K�X��: " + randomPwd + "�A���I��s�����W�n�J�z���b��  <a href=\"" + url + "\">Click Here</a>");
		
//		 \"  ->�L�X���޸�
//		System.out.println(messageText);

		
		try {
			// �]�w�ϥ�SSL�s�u�� Gmail smtp Server
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			// ���]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
			// �����NmyGmail���i�w����>>�w���ʸ��C�����ε{���s���v�j���}
			final String myGmail = "ixlogic.wu@gmail.com";
			final String myGmail_password = "CCC45678CCC";
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(myGmail, myGmail_password);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myGmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// �]�w�H�����D��
			message.setSubject(subject);
			// �]�w�H�������e
			message.setText(messageText);
			 message.setContent(messageText, "text/html;charset=UTF-8");
			

			Transport.send(message);
			System.out.println("�ǰe���\!");
		} catch (MessagingException e) {
			System.out.println("�ǰe����!");
			e.printStackTrace();
		}
		return randomPwd;
	}

	
	
	// �]�w�ǰe�l��:�ܦ��H�H��Email�H�c,Email�D��,Email���e
	public void sendMail (String mb_email) {
		String to = mb_email;
		String subject = "---�b���ҥγq��---";
		
		String url = "http://localhost:8081/CEA103G3_Project/mem/accountactivate.do?key1=" + to;
		String messageText = ("���I��s���Ұʱz���b��  <a href=\"" + url + "\">Click Here</a>");
		// \"  ->�L�X���޸�
//		System.out.println(messageText);
		
		try {
			// �]�w�ϥ�SSL�s�u�� Gmail smtp Server
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			// ���]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
			// �����NmyGmail���i�w����>>�w���ʸ��C�����ε{���s���v�j���}
			final String myGmail = "ixlogic.wu@gmail.com";
			final String myGmail_password = "CCC45678CCC";
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(myGmail, myGmail_password);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myGmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// �]�w�H�����D��
			message.setSubject(subject);
			// �]�w�H�������e
			message.setText(messageText);
//			message.setContent(messageText, "utf-8", "text/html");
			 message.setContent(messageText, "text/html;charset=UTF-8");
			

			Transport.send(message);
			System.out.println("�ǰe���\!");
		} catch (MessagingException e) {
			System.out.println("�ǰe����!");
			e.printStackTrace();
		}
	}
	
	
	// �H�����ͥ]�t�j�p�g�^��r��&�Ʀr���ü� (�i���w���ʹX�X)
		public String getStringRandom(int length) {
        
        String val = "";
        Random random = new Random();
        
        //�Ѽ�length�A��ܥͦ��X���H����
        for(int i = 0; i < length; i++) {
            
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //��X�r���٬O�Ʀr
            if( "char".equalsIgnoreCase(charOrNum) ) {
                //��X�O�j�g�r���٬O�p�g�r��
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char)(random.nextInt(26) + temp);
            } else if( "num".equalsIgnoreCase(charOrNum) ) {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }
}
