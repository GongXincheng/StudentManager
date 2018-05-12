package com.gxc.stu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gxc.stu.pojo.Deptment;
import com.gxc.stu.service.DeptmentService;
import utils.Page;

@Controller
public class DeptmentController {

	@Autowired
	DeptmentService deptmentService; 
	
	/**
	 * 添加部门
	 * @param deptment
	 * @return
	 */
	@RequestMapping("/dept/addDept")
	public String addDept(Deptment deptment){
		deptmentService.addDeptment(deptment);
		return "redirect:/dept/deptList.html";
	}
	
	/**
	 * 查询所有部门
	 * @param model
	 * @return
	 */
	@RequestMapping("/dept/deptList")
	public String findDeptList(Model model,
			@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="6")Integer size){
		
		//分页查询
		Page<Deptment> deptList = this.deptmentService.findDeptListByPage(page,size);
		//必须为page
		model.addAttribute("page", deptList);
		return "deptList";
	}
	
	/**
	 * 编辑前通过ID查询用户
	 * @param deptId
	 * @return
	 */
	@RequestMapping("/dept/editById")
	@ResponseBody
	public Deptment editById(Integer deptId){
		Deptment deptment = deptmentService.findDeptById(deptId);
		return deptment;
	}
	
	/**
	 * 更新部门信息
	 * @param deptment
	 * @return
	 */
	@RequestMapping("/dept/updateDept")
	public String updateDept(Deptment deptment){
		deptmentService.updateDeptById(deptment);
		return "redirect:/dept/deptList.html";
	}
}
