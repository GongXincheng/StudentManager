package com.gxc.stu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.pojo.Deptment;
import com.gxc.stu.pojo.Specialty;
import com.gxc.stu.service.DeptmentService;
import com.gxc.stu.service.SpecialtyService;

import utils.MyResult;
import utils.Page;

@Controller
public class SpecialtyController {

	@Autowired
	DeptmentService deptmentService;
	
	@Autowired
	SpecialtyService specialtyService;
	
	/**
	 * 查询列表
	 * @param deptId
	 * @param model
	 * @return
	 */
	@RequestMapping("/spe/spetList")
	public String showSpeList(@RequestParam(defaultValue="0")Integer deptId,
			@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="12")Integer size,
			Model model){
		
		//1、获取所有的部门,为了通过部门查询专业
		List<Deptment> deptList = deptmentService.findDeptLists();
		model.addAttribute("deptList", deptList);
		
		//2、创建Page<Specialty>对象
		Page<Specialty> speList = new Page<>();
		
		//3、判断是否选择院系
		if(deptId != 0){
			//使用Specialty的findSpeByDeptId()方法查询列表
			//List<Specialty> SpeList = specialtyService.findSpeListByDeptId(deptId);
			speList = specialtyService.findSpeListByDeptIdAndPage(deptId,page,size);
			//数据回显，将deptId放入model中，页面判断
			model.addAttribute("slctDeptId", deptId);
			//将数据放入列表
			model.addAttribute("page",speList);
			//返回视图
			return "speList";
		}
		
		//如果等于零查询全部列表
		//List<Specialty> SpeList = specialtyService.findAllSpeList();
		speList = specialtyService.findAllSpeListByPage(page,size);
		
		model.addAttribute("page",speList);
		return "speList";
	}
	
	/**
	 *  添加专业
	 * @param specialty
	 * @return
	 */
	@RequestMapping("/spe/addSpe")
	public String addSpe(Specialty specialty){
		
		specialtyService.addSpecialty(specialty);
		return "redirect:/spe/spetList.html";
	}
	
	/**
	 * 修改前查询(根据ID查询专业)
	 * @param speId
	 * @return
	 */
	@RequestMapping("/spe/findSpeBySpeId")
	@ResponseBody
	public MyResult findSpeBySpeId(Integer speId){
		//验证
		if(speId==null || speId==0){
			return MyResult.build(201, "修改失败");
		}
		//查询
		Specialty specialty = specialtyService.findSpeBySpeId(speId);
		return MyResult.ok(specialty);
	}
	
	/**
	 * 更新专业信息
	 * @param specialty
	 * @return
	 */
	@RequestMapping("/spe/updateSpe")
	@ResponseBody
	public MyResult updateSpe(Specialty specialty){
		specialtyService.updateSpe(specialty);
		return MyResult.build(200, "专业信息更新成功!");
	}
	
}
