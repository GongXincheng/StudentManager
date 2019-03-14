package com.gxc.stu.sso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {
	
	@RequestMapping("/")
	public String showLoginPage(){
		return "login";
	}
	
	@RequestMapping("index")
	public String showIndexPage(){
		return "login";
	}
	
	@RequestMapping("/page/{page}")
	public String showPage(@PathVariable String page,Model model,
			@RequestParam(defaultValue = "")String redirectUrl){
		
		model.addAttribute("redirectUrl", redirectUrl);
		
		return page;
	}
	
}
