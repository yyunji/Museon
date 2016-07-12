package com.museon.Service;


<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> song
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
	
<<<<<<< HEAD
}
=======
}
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	UserDTO userDTO;
	
	public int signCheck ( String userId, String userPw ) {
		return userDTO.signCheck( userId, userPw );
	}
	
}
>>>>>>> 1f55b7da6b8d4b90341f60020cbc6c4983aebaf9
>>>>>>> song
