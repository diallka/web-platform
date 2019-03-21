package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.config.MailParams;

@Controller
public class EmailController {
 
    @Autowired
    public JavaMailSender emailSender;
 
    @ResponseBody
    @RequestMapping("/sendEmail")
    public String sendSimpleEmail() {
    	
    	
        // Create a Simple MailMessage.
        SimpleMailMessage message = new SimpleMailMessage();
        
        //set the below param in order to prevent error ==> can't determine local email address
        message.setFrom(MailParams.MY_EMAIL);
        
        message.setTo(MailParams.FRIEND_EMAIL);
        message.setSubject("Test");
        message.setText("Hello, This is test email using javaMail on SpringBoot");
 
        //Less secure apps activation on gmail is needed, see below link
        //https://myaccount.google.com/lesssecureapps?pli=1
        // Send Message!
        this.emailSender.send(message);
 
        return "Email Sent!";
    }
 
}