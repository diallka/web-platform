package com.spring.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
 


public class MailParams {
	 
    // Replace with your email here:  
    public static final String MY_EMAIL = "sender@gmail.com";
 
    // Replace password!!
    public static final String MY_PASSWORD = "senderPassword";
 
    // And receiver!
    public static final String FRIEND_EMAIL = "receiver@email.com";
 
}