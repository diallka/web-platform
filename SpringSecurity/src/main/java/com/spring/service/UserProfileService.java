package com.spring.service;

import java.util.List;

import com.spring.model.UserProfile;

public interface UserProfileService {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
