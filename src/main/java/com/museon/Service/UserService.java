package com.museon.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museon.Dao.UserDao;
import com.museon.Model.User;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public List<Map<String, Object>> test () {
		return userDao.test();
	}
	
	public int idCheck ( String userId ) {
		return userDao.idCheck(userId);
	}

	public int emailCheck ( String userEmail ) {
		return userDao.emailCheck(userEmail);
	}
	
	public int signUpProcess ( User user ) {
		return userDao.signUpProcess( user );		
	}
}