package com.aisino2.jdy.domain;

import java.util.Date;

/**
 * 预警参数
 *
 */
public class Yjcs {
	private Integer id;
	private String yjmc;
	private String yjxxms;
	private String yjyj;
	private String yhlb;
	/**
	 * 预警规则时间 使用cron表达式.
	 */
	private String yjgzsj;
	private Date cjsj;
	private String cjr;
	/**
	 * 开关状态 1 表示活跃, 0 表示停用 
	 */
	private String zt;
	
	
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYjmc() {
		return yjmc;
	}
	public void setYjmc(String yjmc) {
		this.yjmc = yjmc;
	}
	public String getYjxxms() {
		return yjxxms;
	}
	public void setYjxxms(String yjxxms) {
		this.yjxxms = yjxxms;
	}
	public String getYjyj() {
		return yjyj;
	}
	public void setYjyj(String yjyj) {
		this.yjyj = yjyj;
	}
	public String getYhlb() {
		return yhlb;
	}
	public void setYhlb(String yhlb) {
		this.yhlb = yhlb;
	}
	public String getYjgzsj() {
		return yjgzsj;
	}
	public void setYjgzsj(String yjgzsj) {
		this.yjgzsj = yjgzsj;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	
	
}
