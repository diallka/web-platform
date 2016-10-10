package com.spring.service;

import java.util.List;

import com.spring.model.User;

public interface UserService {

	void save(User user);
	
	User findById(int id);
	
	User findBySso(String sso);
	
	//*************************
	User getRandom();
	void updateUser(User user);
	List<User> listUsers();
	void removeUser(int id);
	//*************************
	
}