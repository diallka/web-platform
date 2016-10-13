package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ProfilUserDao;
import com.spring.model.ProfilUser;

@Service("userProfileService")
@Transactional
public class ProfilUserServiceImpl implements ProfilUserService{
	
	@Autowired
	ProfilUserDao dao;
	
	public List<ProfilUser> findAll() {
		return dao.findAll();
	}

	public ProfilUser findByType(String type){
		return dao.findByType(type);
	}

	public ProfilUser findById(int id) {
		return dao.findById(id);
	}
}
