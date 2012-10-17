package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 寄递对象基本信息表
 * 
 * @author hooxin
 *
 */
public class Rdrjbxx implements Serializable {
    
    /**
     * #寄件人收件人主键
     */
    private Integer id;
	/**
	 * #姓名
	 */
	private String xm;
	/**
	 * #证件号码
	 */
	private String zjhm;
	/**
	 *  #省市县地址
	 */
	private String ssx;
	/**
	 * #详细地址
	 */
	private String xxdz;
	/**
	 * #联系电话
	 */
	private String lxdh;
	/**
	 * #固定电话
	 */
	private String gddh;
	/**
	 * #单位
	 */
	private String dw;
	
	/**
	 * 证件类型
	 */
	private String zjlx;

	/**
	 * 照片信息
	 */
	private Jddxzpxx zpxx;
	
	/**
	 * 省市县名称 （冗余） 
	 */
	private String ssxmc;
	
	/**
	 * 寄递人员类型名称
	 */
	private String jdrylxmc;
	/**
	 * 寄递人员类型
	 */
	private String jdrylx;
	
	public String getJdrylxmc() {
		return jdrylxmc;
	}

	public void setJdrylxmc(String jdrylxmc) {
		this.jdrylxmc = jdrylxmc;
	}

	public String getJdrylx() {
		return jdrylx;
	}

	public void setJdrylx(String jdrylx) {
		this.jdrylx = jdrylx;
	}

	public String getSsxmc() {
		return ssxmc;
	}

	public void setSsxmc(String ssxmc) {
		this.ssxmc = ssxmc;
	}

	public Jddxzpxx getZpxx() {
		return zpxx;
	}

	public void setZpxx(Jddxzpxx zpxx) {
		this.zpxx = zpxx;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getSsx() {
		return ssx;
	}

	public void setSsx(String ssx) {
		this.ssx = ssx;
	}

	public String getXxdz() {
		return xxdz;
	}

	public void setXxdz(String xxdz) {
		this.xxdz = xxdz;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getGddh() {
		return gddh;
	}

	public void setGddh(String gddh) {
		this.gddh = gddh;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getZjlx() {
		return zjlx;
	}

	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
	/****
	 * 个人频繁更换寄件单位查询、和页面展示用到字段
	 */
	private Date kssj;//个人频繁更换寄件单位【开始时间】
	private Date jssj;//个人频繁更换寄件单位【结束时间】
	private String ghjjdwcs;//个人频繁更换寄件单位【更换寄件单位次数】
	private String ssxq;//个人频繁更换寄件单位统计查询，页面展示所需【所属辖区】
	private String gxdwbm;//个人频繁更换寄件单位【管辖单位编码】
	private String gxdwmc;//个人频繁更换寄件单位【管辖单位名称】
	
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
	public Date getKssj() {
		return kssj;
	}
	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}
	public Date getJssj() {
		return jssj;
	}
	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}
	public String getGhjjdwcs() {
		return ghjjdwcs;
	}
	public void setGhjjdwcs(String ghjjdwcs) {
		this.ghjjdwcs = ghjjdwcs;
	}
	public String getSsxq() {
		return ssxq;
	}
	public void setSsxq(String ssxq) {
		this.ssxq = ssxq;
	}
	
	
}
