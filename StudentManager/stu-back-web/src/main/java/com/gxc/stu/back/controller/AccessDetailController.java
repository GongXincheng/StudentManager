package com.gxc.stu.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.pojo.Accessdetail;
import com.gxc.stu.pojo.User;
import com.gxc.stu.service.AccessDetailService;

import utils.MyResult;
import utils.Page;

@Controller
public class AccessDetailController {

	@Autowired
	private AccessDetailService accessDetailService;
	
	/**
	 * 条件查询,分页
	 * @param accessDetail
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping("/back/accessList")
	public String accessList(
			Accessdetail accessDetail, Model model,
			@RequestParam(defaultValue="1")Integer page, 
			@RequestParam(defaultValue="20")Integer size,
			HttpServletRequest request){
		
		//更新专业前，判断是否为登录状态
		User user = (User)request.getAttribute("user");
		//1.如果不是登录状态,提示暂无权限，请登录
		if(user == null){
			return "noAccess";
		}
		//2.如果是登录状态，判断user的权限，如果权限不够，提示暂无权限更新
		if(user.getRole() == 2){
			return "noAccess";
		}
		
		
		//根据条件查询
		Page<Accessdetail> pageList = accessDetailService.findAccessDetailListByCondition(accessDetail,page,size);
		
		//不要忘记数据回显
		model.addAttribute("page", pageList);
		model.addAttribute("search", accessDetail);
		
		return "accessList";
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/back/deleteAccess")
	@ResponseBody
	public MyResult deleteAccess(Integer id){
		accessDetailService.deleteAccessDetailById(id);
		return MyResult.ok();
	}
}
