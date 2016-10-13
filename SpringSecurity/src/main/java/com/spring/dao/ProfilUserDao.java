package com.spring.dao;

import java.util.List;

import com.spring.model.ProfilUser;

public interface ProfilUserDao {

	List<ProfilUser> findAll();
	
	ProfilUser findByType(String type);
	
	ProfilUser findById(int id);
}
