package com.gxc.stu.pojo;

import java.io.Serializable;
import java.util.List;

public class StudentEdit implements Serializable{
	private static final long serialVersionUID = -6867792818931573131L;

	private Student student;
	private List<Specialty> speList;
	private String birthday;
	private String comeDate;

	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public List<Specialty> getSpeList() {
		return speList;
	}
	public void setSpeList(List<Specialty> speList) {
		this.speList = speList;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getComeDate() {
		return comeDate;
	}
	public void setComeDate(String comeDate) {
		this.comeDate = comeDate;
	}
	
}
