package com.gxc.stu.service;

import java.util.List;

import com.gxc.stu.pojo.Specialty;

import pojo.ChartBean;
import utils.Page;

public interface SpecialtyService {

	void addSpecialty(Specialty specialty);

	List<Specialty> findSpeListByDeptId(Integer deptId);

	List<Specialty> findAllSpeList();

	Specialty findSpeBySpeId(Integer speId);

	void updateSpe(Specialty specialty);

	Page<Specialty> findSpeListByDeptIdAndPage(Integer deptId, Integer page, Integer size);

	Page<Specialty> findAllSpeListByPage(Integer page, Integer size);

	List<ChartBean> findSpeStuCount();

}
