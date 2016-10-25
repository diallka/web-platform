package com.spring.dao;

import java.util.List;

import com.spring.model.User;

public interface UserDao {

    void save( final User user );

    User findById( final int id );

    User findBySSO( final String sso );

    //*****************************
    void updateUser( final User user );

    List< User > listUsers();

    void removeUser( final int id );

    List< User > count();

    //****************************
}
