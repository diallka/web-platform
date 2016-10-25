package com.spring.service;

import java.util.List;

import com.spring.model.User;

public interface UserService {

    void save( final User user );

    User findById( final int id );

    User findBySso( final String sso );

    //*************************
    User getRandom();

    void updateUser( final User user );

    List< User > listUsers();

    List< User > count();

    void removeUser( final int id );
    //*************************

}
