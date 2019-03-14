package com.gxc.stu.sso.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxc.stu.mapper.UserMapper;
import com.gxc.stu.pojo.User;
import com.gxc.stu.pojo.UserExample;
import com.gxc.stu.sso.service.RegistService;

import utils.MyResult;

@Service
public class RegistServiceImpl implements RegistService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public MyResult register(User user) {
		
		//1.验证
		if(StringUtils.isBlank(user.getUsername())){
			return MyResult.build(400, "用户名不能为空");
		}
		if(StringUtils.isBlank(user.getPassword())){
			return MyResult.build(400, "密码不能为空");
		}
		
		//2.判断用户名是否存在
		//如果存在  返回
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername());
		List<User> list = userMapper.selectByExample(example);
		if(list.size() > 0){
			return MyResult.build(400, "用户名已存在");
		}
		
		//3.如果不存在，完善信息，并插入
		user.setGender(1);
		user.setHeadpic("/images/defaultHead.jpg");
		user.setRegistdate(new Date());
		user.setLastlogindate(new Date());
		user.setLoginnum(1);
		user.setRole(2);
		userMapper.insert(user);
		
		return MyResult.ok();
	}


}
