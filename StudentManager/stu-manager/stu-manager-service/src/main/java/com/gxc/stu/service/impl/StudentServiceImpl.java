package com.gxc.stu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxc.stu.mapper.StudentMapper;
import com.gxc.stu.pojo.Student;
import com.gxc.stu.service.StudentService;

import pojo.StudentCondition;
import utils.Page;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	

	@Override
	public Student findStuByStuId(String stuId) {
		return studentMapper.findStuByStuId(stuId);
	}

	@Override
	public void addStudent(Student student) {
		studentMapper.addStudent(student);
	}

	@Override
	public List<Student> findStiListByCondition(StudentCondition student) {
		List<Student> list = studentMapper.findStiListByCondition(student);
		return list;
	}

	@Override
	public Student findStuByStuIdEdit(String stuId) {
		return studentMapper.findStuByStuIdEdit(stuId);
	}

	@Override
	public void updateStudent(Student student) {
		studentMapper.updateStudent(student);
	}

	@Override
	public void deleteStuById(Integer id) {
		studentMapper.deleteStuById(id);
	}

	@Override
	public Student findStuById(Integer id) {
		return studentMapper.findStuById(id);
	}

	@Override
	public Page<Student> findStiListByConditionAndPage(StudentCondition student, Integer page, Integer size) {
		PageHelper.startPage(page, size);
		
		//查询列表
		List<Student> stuList = studentMapper.findStiListByCondition(student);
		//获取总条数
		PageInfo<Student> pageInfo = new PageInfo<>(stuList);
		long total = pageInfo.getTotal();
		Page<Student> pageBean = new Page<>();
		pageBean.setPage(page);
		pageBean.setSize(size);
		pageBean.setTotal((int)total);
		pageBean.setRows(stuList);
		
		return pageBean;
	}

}
