package pojo;

import java.io.Serializable;
/**
 * 按条件查询学生列表
 * @author 杨昆
 */
public class StudentCondition implements Serializable{
	private static final long serialVersionUID = 4855241620200212276L;
	
	private String stuId;
	private String stuName;
	private Integer deptId;
	private Integer speId;
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public Integer getSpeId() {
		return speId;
	}
	public void setSpeId(Integer speId) {
		this.speId = speId;
	}
	
	
}
