package com.museon.RestController;

import java.util.Arrays;

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

import com.museon.Service.UserService;

@Controller
public class CommonRestController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping( value="/signProc", method= RequestMethod.POST )
	@ResponseBody
	public ResponseEntity<Integer> signProc (
			
			) {
		
		int req = 0;
		
		// req Service calling
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping( value="/idCheck", method= RequestMethod.POST )
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
	
	@RequestMapping( value="/emailCheck", method = RequestMethod.POST )
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
	
	@RequestMapping( value="/signUpProcess", method = RequestMethod.POST )
	public ResponseEntity<Integer> signUpProcess (
			@RequestParam(value="userId") String userId,
			@RequestParam(value="userId") String userPw,
			@RequestParam(value="userId") String userName,
			@RequestParam(value="userId") String userEmail
			){
		
		int req = userService.signUpProcess(userId, userPw, userName, userEmail);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
		
	}
			
}
