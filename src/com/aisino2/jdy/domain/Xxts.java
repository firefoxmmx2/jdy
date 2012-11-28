package com.aisino2.jdy.domain;

import java.util.Date;
import java.util.List;

import com.aisino2.sysadmin.domain.User;

/**
 * 消息通知
 *
 */
public class Xxts {
	private Integer id;
	private String xxbt;
	private String xxnr;
	private String lj;
	private String clhs;
	private Date tssj;
	private String fsr;
	private List<Xxyh> xxyh_list;
	private User jsyh;
	private String zt;
	
	public static final String ZT_READED = "1";
	public static final String ZT_UNREAD = "0";
	
	public List<Xxyh> getXxyh_list() {
		return xxyh_list;
	}
	public void setXxyh_list(List<Xxyh> xxyh_list) {
		this.xxyh_list = xxyh_list;
	}
	public User getJsyh() {
		return jsyh;
	}
	public void setJsyh(User jsyh) {
		this.jsyh = jsyh;
	}
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
	public String getXxbt() {
		return xxbt;
	}
	public void setXxbt(String xxbt) {
		this.xxbt = xxbt;
	}
	public String getXxnr() {
		return xxnr;
	}
	public void setXxnr(String xxnr) {
		this.xxnr = xxnr;
	}
	public String getLj() {
		return lj;
	}
	public void setLj(String lj) {
		this.lj = lj;
	}
	public String getClhs() {
		return clhs;
	}
	public void setClhs(String clhs) {
		this.clhs = clhs;
	}
	public Date getTssj() {
		return tssj;
	}
	public void setTssj(Date tssj) {
		this.tssj = tssj;
	}
	public String getFsr() {
		return fsr;
	}
	public void setFsr(String fsr) {
		this.fsr = fsr;
	}
	
	
}
