package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ProfilUserDao;
import com.spring.model.ProfilUser;

@Service( "userProfileService" )
@Transactional
public class ProfilUserServiceImpl implements ProfilUserService {

    @Autowired
    ProfilUserDao dao;

    @Override
    public List< ProfilUser > findAll() {
        return this.dao.findAll();
    }

    @Override
    public ProfilUser findByType( final String type ) {
        return this.dao.findByType( type );
    }

    @Override
    public ProfilUser findById( final int id ) {
        return this.dao.findById( id );
    }
}
