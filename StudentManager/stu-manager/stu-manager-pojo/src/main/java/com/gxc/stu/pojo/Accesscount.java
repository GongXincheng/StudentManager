package com.gxc.stu.pojo;

import java.io.Serializable;

public class Accesscount implements Serializable{
	private static final long serialVersionUID = -338914499680481627L;

	private Integer id;

    private String date;

    private Integer count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}