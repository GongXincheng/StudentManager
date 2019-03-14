package com.gxc.stu.sso.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.sso.service.TokenService;

import utils.JsonUtils;
import utils.MyResult;


@Controller
public class TokenController {

	@Autowired
	private TokenService tokenService;
	
	
	//解决跨域问题方法一：
	@RequestMapping(value="/user/token1/{token}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String getUserByToken1(@PathVariable String token, String callback){
		MyResult result = tokenService.getUserByToken(token);
		
		//响应结果之前，判断是否为jsonp请求
		if (StringUtils.isNotBlank(callback)) {
			//把结果封装成一个js语句响应
			return callback + "(" + JsonUtils.objectToJson(result)  + ");";
		}
		return JsonUtils.objectToJson(result);
	}
	
	
	//解决跨域问题方法二：
	@RequestMapping(value="/user/token/{token}")
	@ResponseBody
	public Object getUserByToken2(@PathVariable String token, String callback){
		MyResult result = tokenService.getUserByToken(token);
		//响应结果之前，判断是否为jsonp请求
		if (StringUtils.isNotBlank(callback)) {
			//把结果封装成一个js语句响应
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
		return result;
	}
	
	
}
