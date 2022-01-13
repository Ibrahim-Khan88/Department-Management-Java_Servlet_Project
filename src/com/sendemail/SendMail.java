package com.sendemail;

import javax.mail.internet.AddressException;

public class SendMail {
	
	public void sendemail(String Usergmail, String Message, String Subject) {
		
		String resultsend = "";
		
		
		try {
			EmailUtility.sendEmail(Usergmail, Message, Subject);
			resultsend = "send successfully";
		}catch (AddressException e) {
			// TODO Auto-generated catch block
			resultsend = "Fail to send because EmailAdress is not correct";
			e.printStackTrace();
		}catch (Exception ex) {
            ex.printStackTrace();
            resultsend = "There were an error: " + ex.getMessage();
        } finally {         
            System.out.println(resultsend);
        }
		
		
		
	}
	

}
