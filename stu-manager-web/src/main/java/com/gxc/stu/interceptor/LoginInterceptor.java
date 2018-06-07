package com.gxc.stu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gxc.stu.pojo.User;
import com.gxc.stu.sso.service.TokenService;

import utils.CookieUtils;
import utils.MyResult;

/**
 * 判断用户是否登录
 * @author 宫新程
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private TokenService tokenService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1.从cookie中获取token
		String token = CookieUtils.getCookieValue(request, "token");
		//如果不存在，放行
		if(StringUtils.isBlank(token)){
			return true;
		}
		
		//2.如果存在，根据token查询用户
		MyResult result = tokenService.getUserByToken(token);
		//如果status!=200，放行
		if(result.getStatus() != 200){
			return true;
		}
		
		//3.如果为200，将User放到request中
		User user = (User)result.getData();
		request.setAttribute("user", user);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
