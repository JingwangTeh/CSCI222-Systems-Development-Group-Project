package com.suw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suw.dao.BaseDAO;
import com.suw.entity.User2;
import com.suw.service.User2Service;

@Service("user2Service")
public class User2ServiceImpl implements User2Service {
	
	@Resource
	private BaseDAO<User2> baseDAO;

	@Override
	public void saveUser(User2 user) {
		baseDAO.save(user);
	}

	@Override
	public User2 findUserById(int id) {
		return baseDAO.get(User2.class, id);
	}

	@Override
	public User2 findUserByEmailAndPWD(String email, String password) {
		return baseDAO.get(" from User2 u where u.email = ? and u.password = ? ", new Object[] { email, password });
	}
	@Transactional
	@Override
	public List<User2> list() {
		return baseDAO.find("from User2 u where u.role!=?",new Object[]{"admin"});
	}

	@Override
	@Transactional
	public void modify(User2 user2) {
		User2 us = baseDAO.get(User2.class, user2.getId());
		us.setRole(user2.getRole());
		us.setStatus(user2.getStatus());
		baseDAO.saveOrUpdate(us);
		
	}

	
	
}
