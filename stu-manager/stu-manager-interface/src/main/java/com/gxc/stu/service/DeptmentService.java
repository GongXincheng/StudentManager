package com.gxc.stu.service;

import java.util.List;

import com.gxc.stu.pojo.Deptment;

import pojo.ChartBean;
import utils.Page;

public interface DeptmentService {

	void addDeptment(Deptment deptment);

	List<Deptment> findDeptLists();

	Deptment findDeptById(Integer deptId);

	void updateDeptById(Deptment deptment);

	Page<Deptment> findDeptListByPage(Integer page, Integer size);

	List<ChartBean> findDeptStuCount();
}
