package com.gxc.stu.service;

import com.gxc.stu.pojo.User;

import utils.Page;

public interface UserService {

	/**
	 * 根据条件，分页查询
	 * @param user：条件
	 * @param page：当前页码数
	 * @param size：每页显示条数
	 * @return
	 */
	Page<User> findUserList(User user, Integer page, Integer size);

}
