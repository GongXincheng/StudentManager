package com.gxc.stu.service;

import com.gxc.stu.pojo.User;

import utils.MyResult;
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

	/**
	 * 更新User
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 根据用户ID查询用户信息
	 * @param id
	 * @return
	 */
	User findUserById(Integer id);

	/**
	 * 更新用户信息，并更新redis中token
	 * @param user
	 * @param token
	 */
	void updateUserAddPic(User user, String token);

	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	int deleteUser(Integer id);

	/**
	 * 删除用户
	 * @param id	用户id
	 * @param user  操作者
	 * @return
	 */
	MyResult deleteUser(Integer id, User user);

	/**
	 * 更新用户权限
	 * @param userId 需要修改的用户id
	 * @param roleId 修改够的权限id
	 * @param user	 操作者
	 * @return
	 */
	MyResult updateUserRole(Integer userId, Integer roleId, User user);

}
