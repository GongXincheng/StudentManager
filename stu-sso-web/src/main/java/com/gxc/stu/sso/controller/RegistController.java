package com.gxc.stu.sso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.pojo.User;
import com.gxc.stu.sso.service.RegistService;

import utils.MyResult;

@Controller
public class RegistController {

	@Autowired
	private RegistService registService;
	
	@RequestMapping("/regist")
	@ResponseBody
	public MyResult registUser(User user,String yanzhengma){
		
		//1.判断验证码是否正确
		//如果不正确，返回
		
		
		//2.如果正确，注册
		MyResult result = registService.register(user);
		return result;
	}
	
}
