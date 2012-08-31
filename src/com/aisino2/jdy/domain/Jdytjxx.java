package com.aisino2.jdy.domain;

import java.io.Serializable;

/**
 * 
 * 寄递业统计
 * @author hooxin
 *
 */
public class Jdytjxx implements Serializable {
//	公共
	private Integer cs;
	private String lxdh;
	private String xxdz;
	private Integer seqnum;
//	寄递对象
	private String xm;
	private String zjhm;
	private String rdrxxid;
	
//	企业对象
	private String qymc;
	private Integer qyid;
	private String gxdwbm;
	private String gxdwmc;
	
	
	public Integer getSeqnum() {
		return seqnum;
	}
	public void setSeqnum(Integer seqnum) {
		this.seqnum = seqnum;
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
	public Integer getCs() {
		return cs;
	}
	public void setCs(Integer cs) {
		this.cs = cs;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getXxdz() {
		return xxdz;
	}
	public void setXxdz(String xxdz) {
		this.xxdz = xxdz;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getZjhm() {
		return zjhm;
	}
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	public String getRdrxxid() {
		return rdrxxid;
	}
	public void setRdrxxid(String rdrxxid) {
		this.rdrxxid = rdrxxid;
	}
	public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public Integer getQyid() {
		return qyid;
	}
	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}
	
	
}
