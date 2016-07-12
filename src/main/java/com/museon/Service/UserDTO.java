package com.museon.Service;

import org.springframework.stereotype.Component;

@Component
public class UserDTO {
	public int signCheck ( String userId, String userPw ) {
		System.out.println( userId );
		System.out.println( userPw );
		return 1;
	}
}
