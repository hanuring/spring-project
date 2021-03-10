package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CookieController {
	
	@RequestMapping("/delete_cookie.do")
	public String delete_cookie() {
		return "delete_cookie";
	}
	
}
