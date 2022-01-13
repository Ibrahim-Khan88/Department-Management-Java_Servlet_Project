package com.contact;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sendemail.EmailUtility;
import com.sendemail.SendMail;

/**
 * Servlet implementation class SendFeedBack
 */
@WebServlet("/Contact/SendFeedBack")
public class SendFeedBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		SendMail send = new SendMail();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String Message, Usergmail, resultsend = "",subject;
		subject = "Message From CSE department of BSMRSTU";
		Usergmail = (String) session.getAttribute("feedbackgmail");
		Message = request.getParameter("Message");
		
		send.sendemail(Usergmail, Message, subject);		
		
		out.print("<script> forward('ContactShow.jsp'); </script>");
		
		
	}

}
