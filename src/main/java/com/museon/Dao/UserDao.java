package com.museon.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


// INSERT INTO museon_member (user_id, user_pw, user_name, user_email) VALUES (?, ?, ?, ?)

@Repository("userDao")
public class UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> test () {
		
		String sql = "SELECT * FROM museon_member";
		
		try {
			return jdbcTemplate.queryForList(sql);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return new ArrayList<Map<String,Object>>();
	}
	
	public int idCheck ( String userId ) {
		
		String sql = "select count(*) from museon_member where user_id = ?";
		
		Object[] params = {
				userId
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, Integer.class);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int emailCheck  ( String userEmail ) {
		
		String sql = "select count(*) from museon_member where user_email = ?";
		
		Object[] params = {
				userEmail
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, Integer.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	public int signUpProcess (String userId, String userPw, String userName, String userEmail) {
		
		String sql = "insert into museon_member (user_id, user_pw, user_name, user_email) values (?, ?, ?, ?)";
	
		Object[] params = {
				userId,
				userPw,
				userName,
				userEmail
		};
		
		try {
			return jdbcTemplate.update(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
	//// System.out.println( "---------------------------Dao---------------------------" )
