package com.spring.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoding {

    /**
     * @param args
     */
    public static void main( final String[] args ) {
        final String password = "abc125";
        final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println( passwordEncoder.encode( password ) );
    }

}
