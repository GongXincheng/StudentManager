package com.gxc.stu.pojo;

import java.io.Serializable;

public class Accessdetail implements Serializable{
	private static final long serialVersionUID = 8667309444181904219L;

	private Integer id;

    private String ip;

    private String iplocation;

    private String resourcepath;

    private String comedate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getIplocation() {
        return iplocation;
    }

    public void setIplocation(String iplocation) {
        this.iplocation = iplocation == null ? null : iplocation.trim();
    }

    public String getResourcepath() {
        return resourcepath;
    }

    public void setResourcepath(String resourcepath) {
        this.resourcepath = resourcepath == null ? null : resourcepath.trim();
    }

    public String getComedate() {
        return comedate;
    }

    public void setComedate(String comedate) {
        this.comedate = comedate == null ? null : comedate.trim();
    }
}