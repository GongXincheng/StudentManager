package com.gxc.stu.mapper;

import java.util.List;

import com.gxc.stu.pojo.Deptment;

import pojo.ChartBean;

public interface DeptmentMapper {

	void addDeptment(Deptment deptment);
	
	List<Deptment> findDeptLists();

	Deptment findDeptById(Integer deptId);

	void updateDeptById(Deptment deptment);

	List<ChartBean> findDeptStuCount();
}
