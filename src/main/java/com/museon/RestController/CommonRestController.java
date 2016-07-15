package com.museon.RestController;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.museon.Model.User;
import com.museon.Service.UserService;

@Controller
public class CommonRestController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping( value="/rest/signProc", method= { RequestMethod.GET, RequestMethod.POST } )
	@ResponseBody
	public ResponseEntity<Integer> signProc (
			HttpServletRequest request, HttpServletResponse response
			) {
		
		int req = 0;
		
		System.out.println( "test" );
		
		// req Service calling
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping( value="/rest/idCheck", method= { RequestMethod.GET, RequestMethod.POST } )
	@ResponseBody
	public ResponseEntity<Integer> idCheck (
			@RequestParam(value="userId") String userId
			
			) {
		int req = userService.idCheck(userId);
		
		// req Service calling
		
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping( value="/rest/emailCheck", method = { RequestMethod.GET, RequestMethod.POST } )
	public ResponseEntity<Integer> emailCheck (
			@RequestParam(value="userEmail") String userEmail
			){
		
//		int req = 0;
		int req = userService.emailCheck(userEmail);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
		
	}
	
	@RequestMapping( value="/rest/signUpProcess", method = { RequestMethod.GET, RequestMethod.POST } )
	public ResponseEntity<Integer> signUpProcess (
			@RequestParam(value="userId") String userId,
			@RequestParam(value="userPw") String userPw,
			@RequestParam(value="userName") String userName,
			@RequestParam(value="userEamil") String userEmail
			){
		
		User user = new User();
		user.setUserId(userId);
		user.setUserPw(userPw);
		user.setUserName(userName);
		user.setUserEmail(userEmail);
		
		int req = 0;
		int insertId = userService.signUpProcess( user );
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
		
	}
			
}
