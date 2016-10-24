package com.spring.service;

import java.util.List;

import com.spring.model.ProfilUser;

public interface ProfilUserService {

	List<ProfilUser> findAll();
	
	ProfilUser findByType(String type);
	
	ProfilUser findById(int id);
}
