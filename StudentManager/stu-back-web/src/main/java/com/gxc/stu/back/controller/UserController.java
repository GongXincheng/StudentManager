package com.gxc.stu.back.controller;

import javax.servlet.http.HttpServletRequest;

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
			@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="20")Integer size,
			HttpServletRequest request){
		
		//更新专业前，判断是否为登录状态
		User user2 = (User)request.getAttribute("user");
		//1.如果不是登录状态,提示暂无权限，请登录
		if(user2 == null){
			return "noAccess";
		}
		//2.如果是登录状态，判断user的权限，如果权限不够，提示暂无权限更新
		if(user2.getRole() == 2){
			return "noAccess";
		}
		
		Page<User> pageList = userService.findUserList(user,page,size);
		
		model.addAttribute("page", pageList);
		return "userList";
	}
	
}
