package com.gxc.stu.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/index.html")
	public String backIndex(){
		return "chartList";
	}
	
	@RequestMapping("/{page}")
	public String goPage(@PathVariable String page){
		return page;
	}
	
}
