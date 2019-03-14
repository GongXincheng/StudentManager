package com.gxc.stu.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxc.stu.mapper.DeptmentMapper;
import com.gxc.stu.pojo.Deptment;
import com.gxc.stu.service.DeptmentService;

import pojo.ChartBean;
import utils.Page;

@Service
public class DeptmentServiceImpl implements DeptmentService {

	@Autowired
	DeptmentMapper deptmentMapper;
	
	/**
	 * 添加部门
	 */
	@Override
	public void addDeptment(Deptment deptment) {
		//初始化创建,更新时间
		deptment.setCreateDate(new Date());
		deptment.setUpdateDate(new Date());
		deptmentMapper.addDeptment(deptment);
	}

	/**
	 * 查询所有部门
	 * eg:无分页
	 */
	@Override
	public List<Deptment> findDeptLists() {
		return deptmentMapper.findDeptLists();
	}

	/**
	 * 根据ID查询部门
	 */
	@Override
	public Deptment findDeptById(Integer deptId) {
		Deptment deptment = deptmentMapper.findDeptById(deptId);
		return deptment;
	}

	/**
	 * 根据部门id更新部门
	 */
	@Override
	public void updateDeptById(Deptment deptment) {
		deptment.setUpdateDate(new Date());
		deptmentMapper.updateDeptById(deptment);
	}


	/**
	 * 分页查询所有部门
	 */
	@Override
	public Page<Deptment> findDeptListByPage(Integer page, Integer size) {
		
		PageHelper.startPage(page, size);
		//查询列表
		List<Deptment> deptList = deptmentMapper.findDeptLists();
		//查询总记录数
		PageInfo<Deptment> pageInfo = new PageInfo<>(deptList);
		long total = pageInfo.getTotal();
		
		//设置Page<Deptment>
		Page<Deptment> pageBean = new Page<>();
		pageBean.setPage(page);
		pageBean.setSize(size);
		pageBean.setTotal((int)total);
		pageBean.setRows(deptList);
		
		//返回结果
		return pageBean;
	}

	
	/**
	 * 统计院系学生数量
	 */
	@Override
	public List<ChartBean> findDeptStuCount() {
		List<ChartBean> list = deptmentMapper.findDeptStuCount();
		return list;
	}

}
