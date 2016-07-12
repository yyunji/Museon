package com.museon.Service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museon.Dao.UserDao;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public List<Map<String, Object>> test () {
		return userDao.test();
	}
	
//	public int signCheck ( String userId, String userPw ) {
//		return userDao.signCheck( userId, userPw );
//	}
	
}