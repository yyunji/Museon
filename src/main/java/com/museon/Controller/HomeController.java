package com.museon.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.museon.Service.UserService;

@Controller
public class HomeController {
	@Autowired
	UserService userService; 
	
	@RequestMapping ( value="/" )
	public ModelAndView index (
			HttpServletRequest request, HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView("/index");
		
		List<Map<String, Object>> test = userService.test();
		mav.addObject("test", test);
		return mav;
	}
	
	@RequestMapping( value="/signUp" )
	public ModelAndView signUp (
			HttpServletRequest request, HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView("/user/sign-up");
		
		return mav;
	}
	
//	@RequestMapping( value="/signProc", method= RequestMethod.POST )
//	public ModelAndView signProc (
//			@RequestParam( value="userId" ) String userId,
//			@RequestParam( value="userPw" ) String userPw,
//			HttpServletRequest request, HttpServletResponse response
//			) {
//		
//		ModelAndView mav = new ModelAndView("/user/fail-signUp");
//		
//		int result = 0;
//		
////		result = userService.signCheck( userId, userPw );
//		
//		
//		if ( result >= 1 ) {
//			mav.setViewName("/user/success-signUp");
//		}
//		
//		return mav;
//	}
	
}