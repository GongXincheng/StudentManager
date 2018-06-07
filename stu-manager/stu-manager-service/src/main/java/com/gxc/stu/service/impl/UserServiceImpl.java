package com.gxc.stu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxc.stu.mapper.UserMapper;
import com.gxc.stu.pojo.User;
import com.gxc.stu.pojo.UserExample;
import com.gxc.stu.service.UserService;

import utils.Page;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public Page<User> findUserList(User user, Integer page, Integer size) {
		//开启分页
		PageHelper.startPage(page, size);
		
		//数据库查询
		UserExample example = new UserExample();
		example.setOrderByClause("lastlogindate desc");
		List<User> userList = userMapper.selectByExample(example);
		
		//查询分页总记录数
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		long total = pageInfo.getTotal();
		
		//封装并返回数据
		Page<User> pageList = new Page<>();
		pageList.setTotal((int)total);
		pageList.setPage(page);
		pageList.setSize(size);
		pageList.setRows(userList);
		
		return pageList;
	}

}
