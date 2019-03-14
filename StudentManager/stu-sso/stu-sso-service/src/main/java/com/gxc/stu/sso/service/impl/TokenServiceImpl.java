package com.gxc.stu.sso.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gxc.stu.pojo.User;
import com.gxc.stu.sso.service.TokenService;

import jedis.JedisClient;
import utils.JsonUtils;
import utils.MyResult;

@Service
public class TokenServiceImpl implements TokenService {

	@Autowired
	private JedisClient jedisClient;
	
	@Value("${SESSION_EXPIRE}")
	private Integer SESSION_EXPIRE;
	
	@Override
	public MyResult getUserByToken(String token) {
		//根据token到redis中取用户信息
		String json = jedisClient.get("SESSION:" + token);
		
		//取不到用户信息，登录已经过期，返回登录过期
		if (StringUtils.isBlank(json)) {
			return MyResult.build(201, "用户登录已经过期");
		}
		
		//取到用户信息更新token的过期时间
		jedisClient.expire("SESSION:" + token, SESSION_EXPIRE);
		
		//返回结果，MyResult其中包含User对象
		User user = JsonUtils.jsonToPojo(json, User.class);
		return MyResult.ok(user);
	}

}
