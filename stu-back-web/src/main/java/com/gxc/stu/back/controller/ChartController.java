package com.gxc.stu.back.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxc.stu.pojo.Accesscount;
import com.gxc.stu.service.AccessCountService;
import com.gxc.stu.service.DeptmentService;
import com.gxc.stu.service.SpecialtyService;

import pojo.ChartBean;

@Controller
public class ChartController {

	@Autowired
	private AccessCountService accessCountService; 
	@Autowired
	private DeptmentService deptmentService;
	@Autowired
	private SpecialtyService specialtyService;
	
	/**
	 * 访问数量表
	 * @param page
	 * @param size
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/back/chart/getAccessChart")
	@ResponseBody
	public Map<String,List> getAccessChart( @RequestParam(defaultValue="1")Integer page, 
			@RequestParam(defaultValue="7")Integer size){
		
		//查询列表
		List<Accesscount> list = accessCountService.findAccessCountList(page,size);
		
		//创建List集合
		List<String> strList = new ArrayList<>();
		List<Integer> intList = new ArrayList<>();

		//遍历列表,添加数据
		for(int i = size-1; i >= 0; i--){
			String dataStr = list.get(i).getDate();
			strList.add(dataStr.substring(dataStr.indexOf("/")+1));
			intList.add(list.get(i).getCount());
		}
		
		//遍历列表,添加数据（问题，顺序会变反）
		/*for(Accesscount acc : list){
			strList.add(acc.getDate());
			intList.add(acc.getCount());
		}*/
		
		//将List集合放入到Map中去
		Map<String,List> result = new HashMap<>();
		result.put("xData", strList);
		result.put("yData", intList);
		
		return result;
	}
	
	
	/**
	 * 院系人数统计
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/back/chart/getDeptChart")
	@ResponseBody
	public Map<String,List> getDeptChart(){
		
		//查询各院系统计人数
		List<ChartBean> list =  deptmentService.findDeptStuCount();
		
		//创建List
		List<String> strList = new ArrayList<>();
		//遍历 List<ChartBean> 获取names列表
		for (ChartBean chartBean : list) {
			strList.add(chartBean.getName());
		}
		
		//创建Map集合
		Map<String,List> result = new HashMap<>();
		result.put("data1", strList);
		result.put("data2", list);
		
		return result;
	}
	
	/**
	 * 统计专业人数
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/back/chart/getSpeChart")
	@ResponseBody
	public Map<String,List> getSpeChart(){
		
		//查询各院系统计人数
		List<ChartBean> list =  specialtyService.findSpeStuCount();
		
		//创建List
		List<String> strList = new ArrayList<>();
		//遍历 List<ChartBean> 获取names列表
		for (ChartBean chartBean : list) {
			strList.add(chartBean.getName());
		}
		
		//创建Map集合
		Map<String,List> result = new HashMap<>();
		result.put("data1", strList);
		result.put("data2", list);
		
		return result;
	}
	
}
