package com.museon.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.museon.Model.User;


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
	
	public int signUpProcess ( final User user ) {
		final String sql = "insert into museon_member (user_id, user_pw, user_name, user_email) values (?, ?, ?, ?)";
	
		Object[] params = {
				user.getUserId(),
				user.getUserPw(),
				user.getUserName(),
				user.getUserEmail()
		};
		
		try {
			KeyHolder holder = new GeneratedKeyHolder();
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement( Connection con ) throws SQLException {
					// TODO Auto-generated method stub
					PreparedStatement ps = con.prepareStatement( sql );
					ps.setString(1, user.getUserId());
					return null;
				}
			},holder);
			
			return holder.getKey().intValue();
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
	//// System.out.println( "---------------------------Dao---------------------------" )
