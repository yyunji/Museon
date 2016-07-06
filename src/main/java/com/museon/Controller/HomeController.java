package com.museon.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping( value="/signUp" )
	public ModelAndView signUp (
			HttpServletRequest request, HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView("/user/sign-up");
		
		return mav;
	}
	
	@RequestMapping( value="/signProc", method= RequestMethod.POST )
	public ModelAndView signProc (
			HttpServletRequest request, HttpServletResponse response
			) {
		
		ModelAndView mav = new ModelAndView("/user/fail-signUp");
		int result = 0;
		if ( result >= 1 ) {
			mav.setViewName("/user/success-signUp");
		}
		
		return mav;
	}
	
}
