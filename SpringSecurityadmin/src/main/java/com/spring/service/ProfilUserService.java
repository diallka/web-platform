package com.spring.service;

import java.util.List;

import com.spring.model.ProfilUser;

public interface ProfilUserService {

    List< ProfilUser > findAll();

    ProfilUser findByType( final String type );

    ProfilUser findById( final int id );
}
