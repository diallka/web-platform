package com.spring.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.UserDao;
import com.spring.model.User;

@Service( "userService" )
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao         dao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void save( final User user ) {
        user.setPassword( this.passwordEncoder.encode( user.getPassword() ) );
        this.dao.save( user );
    }

    @Override
    public User findById( final int id ) {
        return this.dao.findById( id );
    }

    @Override
    public User findBySso( final String sso ) {
        return this.dao.findBySSO( sso );
    }

    //**************************************************
    //Ajout pour TestController**************************************************************************************
    String[] names = { "Nikolaus Otto", "Robert Ford", "Gottlieb Daimler", "Lt. General Masaharu Homma" };

    @Override
    public User getRandom() {
        final User user = new User();
        user.setLastName( this.randomName() );
        user.setAge( this.randomAge() );
        return user;
    }

    private Integer randomAge() {
        final Random random = new Random();
        return 10 + random.nextInt( 100 );
    }

    private String randomName() {
        final Random random = new Random();
        return this.names[random.nextInt( this.names.length )];
    }

    @Override
    public void updateUser( final User user ) {
        this.dao.updateUser( user );

    }

    @Override
    public List< User > listUsers() {
        return this.dao.listUsers();
    }

    @Override
    public void removeUser( final int id ) {
        this.dao.removeUser( id );

    }

    @Override
    public List< User > count() {

        return this.dao.count();
    }

    //****************************************************

}
