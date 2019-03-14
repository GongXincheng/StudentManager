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

import utils.MyResult;
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

	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User findUserById(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	@Override
	public void updateUserAddPic(User user, String token) {
		//数据库更新数据
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int deleteUser(Integer id) {
		int num = userMapper.deleteByPrimaryKey(id);
		return num;
	}

	@Override
	public MyResult deleteUser(Integer id, User user) {
		if(user.getRole() > 0){
			return MyResult.build(201, "暂无权限删除用户!");
		}
		if(id == null){
			return MyResult.build(201, "网络连接失败!");
		}
		int num = deleteUser(id);
		if(num <= 0){
			return MyResult.build(201, "删除失败!");
		}
		return MyResult.build(200, "用户删除成功!");
	}

	@Override
	public MyResult updateUserRole(Integer userId, Integer roleId, User user) {
		//权限判断(是否是超级管理员)
		if(user.getRole() != 0){
			return MyResult.build(201, "暂无修改用户权限");
		}
		//自己不能修改自己的权限
		if(user.getId() == userId){
			return MyResult.build(201, "无法修改自己的权限");
		}
		
		if(userId==null || roleId==null){
			return MyResult.build(201, "网络连接失败!");
		}
		
		//先根据用户id查询该用户
		User editUser = userMapper.selectByPrimaryKey(userId);
		//更新用户信息
		editUser.setRole(roleId);
		int num = userMapper.updateByPrimaryKeySelective(editUser);
		if(num <= 0){
			return MyResult.build(201, "权限修改失败!");
		}
		return MyResult.build(200, "权限修改成功");
	}

}
