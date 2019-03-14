package com.gxc.stu.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxc.stu.mapper.SpecialtyMapper;
import com.gxc.stu.pojo.Specialty;
import com.gxc.stu.service.SpecialtyService;

import pojo.ChartBean;
import utils.Page;

@Service
public class SpecialtyServiceImpl implements SpecialtyService {

	@Autowired
	SpecialtyMapper specialtyMapper;
	
	/**
	 * 添加专业
	 */
	@Override
	public void addSpecialty(Specialty specialty) {
		specialty.setCreateDate(new Date());
		specialtyMapper.addSpecialty(specialty);
	}

	/**
	 * 根据部门ID查询专业
	 */
	@Override
	public List<Specialty> findSpeListByDeptId(Integer deptId) {
		List<Specialty> list = specialtyMapper.findSpeListByDeptId(deptId);
		return list;
	}

	/**
	 * 查询所有专业
	 */
	@Override
	public List<Specialty> findAllSpeList() {
		List<Specialty> list = specialtyMapper.findAllSpeList();
		return list;
	}

	/**
	 * 根据ID查询专业
	 */
	@Override
	public Specialty findSpeBySpeId(Integer speId) {
		return specialtyMapper.findSpeBySpeId(speId);
	}

	/**
	 * 更新专业
	 */
	@Override
	public void updateSpe(Specialty specialty) {
		specialtyMapper.updateSpe(specialty);
	}

	
	/**
	 * 根据部门查询专业(分页)
	 */
	@Override
	public Page<Specialty> findSpeListByDeptIdAndPage(Integer deptId, Integer page, Integer size) {
		
		PageHelper.startPage(page, size);
		Page<Specialty> pageBean = new Page<>();
		//查询列表
		List<Specialty> speList = specialtyMapper.findSpeListByDeptId(deptId);
		//获取总条数
		PageInfo<Specialty> pageInfo = new PageInfo<>(speList);
		long total = pageInfo.getTotal();
		
		//封装Page
		pageBean.setPage(page);
		pageBean.setSize(size);
		pageBean.setTotal((int)total);
		pageBean.setRows(speList);
		
		return pageBean;
	}

	/**
	 * 查询所有专业(分页)
	 */
	@Override
	public Page<Specialty> findAllSpeListByPage(Integer page, Integer size) {
		PageHelper.startPage(page, size);
		Page<Specialty> pageBean = new Page<>();
		//查询列表
		List<Specialty> speList = specialtyMapper.findAllSpeList();
		//获取总条数
		PageInfo<Specialty> pageInfo = new PageInfo<>(speList);
		long total = pageInfo.getTotal();
		
		//封装Page
		pageBean.setPage(page);
		pageBean.setSize(size);
		pageBean.setTotal((int)total);
		pageBean.setRows(speList);
		
		return pageBean;
	}

	/**
	 * 统计专业人数
	 */
	@Override
	public List<ChartBean> findSpeStuCount() {
		List<ChartBean> list = specialtyMapper.findDeptStuCount();
		return list;
	}

}
