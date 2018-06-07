package com.gxc.stu.sso.service;

import utils.MyResult;

public interface LoginService {

	MyResult userLogin(String username, String password);

	void deleteRedisToken(String token);
	
}
