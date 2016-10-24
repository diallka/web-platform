package com.spring.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.UserDao;
import com.spring.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	public void save(User user){
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao.save(user);
	}
	
	public User findById(int id) {
		return dao.findById(id);
	}

	public User findBySso(String sso) {
		return dao.findBySSO(sso);
	}
	//**************************************************
	//Ajout pour TestController**************************************************************************************
		String[] names = {"Nikolaus Otto", "Robert Ford", "Gottlieb Daimler", "Lt. General Masaharu Homma"};
		
		@Override
		public User getRandom() {
			User user = new User();
			user.setLastName(randomName());
			user.setAge(randomAge());
			return user;
		}
		private Integer randomAge() {
			Random random = new Random();
			return 10 + random.nextInt(100);
		}

		private String randomName() {
			Random random = new Random();
			return names[random.nextInt(names.length)];
		}
	
	@Override
	public void updateUser(User user) {
		this.dao.updateUser(user);
		
	}

	@Override
	public List<User> listUsers() {
		return this.dao.listUsers();
	}

	@Override
	public void removeUser(int id) {
		this.dao.removeUser(id);
		
	}
	//****************************************************
}
