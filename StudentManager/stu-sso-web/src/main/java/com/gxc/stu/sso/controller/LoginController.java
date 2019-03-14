package com.gxc.stu.sso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.pojo.User;
import com.gxc.stu.sso.service.LoginService;

import utils.CookieUtils;
import utils.MyResult;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	/**
	 * 用户登录验证
	 * @param user：用户信息
	 * @param yanzhengma：验证码
	 * @param request		
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public MyResult login(User user, String yanzhengma,HttpServletRequest request, HttpServletResponse response){
		
		//1.判断验证码是否正确
		HttpSession session = request.getSession();
		String yzm = (String)session.getAttribute("yzm");
		
		if(yzm == null){
			return MyResult.build(201, "网络连接失败，请重试");
		}
		
		//如果不正确，返回
		if(!yzm.equalsIgnoreCase(yanzhengma)){
			return MyResult.build(201, "验证码输入有误");
		}
		
		//2.如果正确，进行登录
		MyResult result = loginService.userLogin(user.getUsername(), user.getPassword());
		
		//3.如果登录成功，将token保存到cookie中
		if(result.getStatus() == 200){
			//获取token
			String token = result.getData().toString();
			//将返回的token返回保存到cookie中，cookie的key为 "token"
			CookieUtils.setCookie(request, response, "token", token);
		}
		return result;
	}
	
	
	/**
	 * 退出登录，清除cookie，和redis中的数据
	 * @param redirectUrl
	 * @return
	 */
	@RequestMapping("/user/loginOut")
	public String loginOut(String redirectUrl,
			HttpServletRequest request, HttpServletResponse response){
		//从Cookie中获取token
		String token = CookieUtils.getCookieValue(request, "token");
		//清除redis
		loginService.deleteRedisToken(token);
		//清除cookie
		CookieUtils.deleteCookie(request, response, "token");
		return "redirect:" + redirectUrl;
	}
	
}
