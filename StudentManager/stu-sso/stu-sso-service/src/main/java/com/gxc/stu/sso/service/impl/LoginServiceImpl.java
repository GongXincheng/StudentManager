package com.gxc.stu.sso.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gxc.stu.mapper.UserMapper;
import com.gxc.stu.pojo.User;
import com.gxc.stu.pojo.UserExample;
import com.gxc.stu.sso.service.LoginService;

import jedis.JedisClient;
import utils.JsonUtils;
import utils.MyResult;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${SESSION_EXPIRE}")
	private Integer SESSION_EXPIRE;
	
	@Override
	public MyResult userLogin(String username, String password) {
		//1.从数据库中查询，用户名密码是否匹配
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example);
		//2.如果失败，返回
		if(list == null || list.size() == 0){
			return MyResult.build(400, "用户名或密码错误");
		}
		//获取User对象
		User user = list.get(0);
		//判断密码是否正确
		if(!user.getPassword().equals(password)){
			return MyResult.build(400, "用户名或密码错误");
		}
		
		//3.登陆成功 更新信息，登录次数，上次登录时间
		user.setLastlogindate(new Date());
		user.setLoginnum(user.getLoginnum() + 1);
		userMapper.updateByPrimaryKeySelective(user);
		
		//4、如果正确生成token。
		String token = UUID.randomUUID().toString();
		//4、使用UUID生成token，并将token放到redis中，key：token value：用户信息
		user.setPassword(null);
		jedisClient.set("SESSION:" + token, JsonUtils.objectToJson(user));
		// 5、设置Session的过期时间
		jedisClient.expire("SESSION:" + token, SESSION_EXPIRE);
		
		// 6、把token返回
		return MyResult.ok(token);
	}

	/**
	 * 根据token清除redis中token
	 */
	@Override
	public void deleteRedisToken(String token) {
		jedisClient.expire("SESSION:" + token, -1);
	}

	
}
