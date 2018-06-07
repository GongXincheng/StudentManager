package com.gxc.stu.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gxc.stu.pojo.User;
import com.gxc.stu.service.UserService;

import utils.Page;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	/**
	 * 根据条件，分页查询用户列表
	 * @param user
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping("/back/userList")
	public String userList(User user, Model model, 
			@RequestParam(defaultValue="1")Integer page, 
			@RequestParam(defaultValue="20")Integer size){
		
		Page<User> pageList = userService.findUserList(user,page,size);
		
		model.addAttribute("page", pageList);
		return "userList";
	}
	
}
