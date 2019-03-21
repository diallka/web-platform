package com.spring.config;

import java.util.Properties;

import com.spring.config.MailParams;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
 
@Configuration
public class MailConfig {
 
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        //https://support.google.com/a/answer/176600?hl=fr ==> Port 465 (SSL) / Port 587 (TLS )
        mailSender.setHost("smtp.gmail.com");
        
        //mailSender.setPort(465);
        //mailSender.setProtocol("smtps");
        
        mailSender.setPort(587);
 
        mailSender.setUsername(MailParams.MY_EMAIL);
        mailSender.setPassword(MailParams.MY_PASSWORD);
 
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        //Logs DEBUG MODE active
        props.put("mail.debug", "true");
        
       
        
        return mailSender;
    }
 
}