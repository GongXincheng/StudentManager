package pojo;

import java.io.Serializable;

public class ChartBean implements Serializable{
	private static final long serialVersionUID = 976087177966051087L;
	
	private Integer value;
	private String name;
	
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
