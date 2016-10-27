package com.suw.service;

import java.util.List;

import com.suw.entity.User2;


public interface User2Service {

	public void saveUser(User2 user);
	
	
	public User2 findUserById(int id);
	
	public User2 findUserByEmailAndPWD(String email,String password);
	public List<User2> list();


	public void modify(User2 user2);
	
}
