package com.gxc.stu.sso.service;

import utils.MyResult;

public interface TokenService {

	MyResult getUserByToken(String token);

}
