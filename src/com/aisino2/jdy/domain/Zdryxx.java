package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 重点人员管控信息
 * 
 * @author renhao
 *
 */
public class Zdryxx implements Serializable {
	/****对应数据库字段****/
	private Integer ryid;//人员ID
	private String xm;//姓名
	private String xb;//性别
	private String rylx;//人员类型：寄件人、收件人、代收人
	private String gxdwbm;//管辖单位编码
	private String gxdwmc;//管辖单位名称
	private String zjhm;//证件号码
	
	
	public Integer getRyid() {
		return ryid;
	}
	public void setRyid(Integer ryid) {
		this.ryid = ryid;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getRylx() {
		return rylx;
	}
	public void setRylx(String rylx) {
		this.rylx = rylx;
	}
	public String getGxdwbm() {
		return gxdwbm;
	}
	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}
	public String getGxdwmc() {
		return gxdwmc;
	}
	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}
	public String getZjhm() {
		return zjhm;
	}
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}

	
	
	
}
