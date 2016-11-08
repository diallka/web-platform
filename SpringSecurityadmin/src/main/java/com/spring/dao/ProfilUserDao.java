package com.spring.dao;

import java.util.List;

import com.spring.model.ProfilUser;

public interface ProfilUserDao {

    List< ProfilUser > findAll();

    ProfilUser findByType( final String type );

    ProfilUser findById( final int id );
}
