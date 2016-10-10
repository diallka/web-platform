package com.spring.dao;

import java.util.List;

import com.spring.model.User;

public interface UserDao {

	void save(User user);
	
	User findById(int id);
	
	User findBySSO(String sso);
	
	//*****************************
	void updateUser (User user);
	List<User> listUsers();
	void removeUser(int id);
	//****************************
}

