package com.gxc.stu.mapper;

import java.util.List;

import com.gxc.stu.pojo.Specialty;

import pojo.ChartBean;

public interface SpecialtyMapper {

	void addSpecialty(Specialty specialty);

	List<Specialty> findSpeListByDeptId(Integer deptId);

	List<Specialty> findAllSpeList();

	Specialty findSpeBySpeId(Integer speId);

	void updateSpe(Specialty specialty);

	List<ChartBean> findDeptStuCount();

}
