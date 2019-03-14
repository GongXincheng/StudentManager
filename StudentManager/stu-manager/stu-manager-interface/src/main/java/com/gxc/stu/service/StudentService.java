package com.gxc.stu.service;

import java.util.List;

import com.gxc.stu.pojo.Student;

import pojo.StudentCondition;
import utils.Page;

public interface StudentService {

	Student findStuByStuId(String stuId);

	void addStudent(Student student);

	List<Student> findStiListByCondition(StudentCondition student);

	Student findStuByStuIdEdit(String stuId);

	void updateStudent(Student student);

	void deleteStuById(Integer id);

	Student findStuById(Integer id);

	Page<Student> findStiListByConditionAndPage(StudentCondition student, Integer page, Integer size);

}
