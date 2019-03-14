package com.gxc.stu.mapper;

import java.util.List;
import com.gxc.stu.pojo.Student;
import pojo.StudentCondition;

public interface StudentMapper {

	Student findStuByStuId(String stuId);

	void addStudent(Student student);

	List<Student> findStiListByCondition(StudentCondition student);

	Student findStuByStuIdEdit(String stuId);

	void updateStudent(Student student);

	void deleteStuById(Integer id);

	Student findStuById(Integer id);

}
