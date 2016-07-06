package com.museon.Service;

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
