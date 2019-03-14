package com.gxc.stu.sso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public MyResult registUser(User user, String yanzhengma, HttpServletRequest request){
		
		//1.判断验证码是否正确
		HttpSession session = request.getSession();
		String yzm = (String)session.getAttribute("yzm");
		//如果不正确，返回
		if(!yzm.equalsIgnoreCase(yanzhengma)){
			return MyResult.build(201, "验证码输入有误");
		}
		
		//2.如果正确，注册
		MyResult result = registService.register(user);
		return result;
	}
	
}
