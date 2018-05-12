package com.gxc.stu.pojo;

import java.io.Serializable;
import java.util.Date;

public class Specialty implements Serializable{
	private static final long serialVersionUID = 7376558164848749385L;
	
	private Integer speId;
	private String speName;
	private Date createDate;
	private String description;
	private Integer deptId;
	private String deptName;
	
	public Integer getSpeId() {
		return speId;
	}
	public void setSpeId(Integer speId) {
		this.speId = speId;
	}
	public String getSpeName() {
		return speName;
	}
	public void setSpeName(String speName) {
		this.speName = speName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@Override
	public String toString() {
		return "Specialty [speId=" + speId + ", speName=" + speName + ", createDate=" + createDate + ", description="
				+ description + ", deptId=" + deptId + ", deptName=" + deptName + "]";
	}
}
