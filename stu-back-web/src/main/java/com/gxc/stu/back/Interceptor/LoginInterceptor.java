package com.gxc.stu.back.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gxc.stu.pojo.User;
import com.gxc.stu.sso.service.TokenService;

import utils.CookieUtils;
import utils.MyResult;

public class LoginInterceptor implements HandlerInterceptor{

	@Autowired
	private TokenService tokenService;

	@Value("${LOGIN_URL}")
	private String LOGIN_URL;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//1.从cookie当中获取token
		String token = CookieUtils.getCookieValue(request, "token");
		//不存在：拦截
		if(StringUtils.isBlank(token)){
			response.sendRedirect(LOGIN_URL + "/page/login.html?redirectUrl=" + request.getRequestURL());
			return false;
		}
		
		//2.存在：//根据token查询用户
		MyResult result = tokenService.getUserByToken(token);
		//如果用户为空 登录超时
		if(result.getStatus() != 200){
			response.sendRedirect(LOGIN_URL + "/page/login.html?redirectUrl=" + request.getRequestURL());
			return false;
		}
		
		//3.如果不为空，放行
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
