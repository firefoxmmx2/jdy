package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 寄递对象基本信息历史表
 * 
 * @author hooxin
 *
 */
public class Rdrjbxx_ls implements Serializable {
	/**
     * #人员对象主键
     */
    private Integer id;
	/**
	 * #姓名
	 */
	private String xm;
	/**
	 * 证件类型
	 */
	private String zjlx;
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
	 * 省市县名称 （冗余） 
	 */
	private String ssxmc;
	/**
	 * 寄递人员类型
	 */
	private String jdrylx;
	/**
	 * 寄递人员性别
	 */
    private String xb;
    /**
     * 揽件基本信息登记序号
     */
	private String ljjbxx_id;
	/**
	 * 基地对象人员ID
	 */
	private Integer ryid;
	/**
	 *管辖单位编码 
	 */
	private String gxdwbm;
	/**
	 *管辖单位名称 
	 */
	private String gxdwmc;
//业务查询所需字段	
	private Date ljsjf;//开始时间
	private Date ljsjt;//截止时间
	private String jjcs;//寄件次数
	
	
	
    public String getJjcs() {
		return jjcs;
	}
	public void setJjcs(String jjcs) {
		this.jjcs = jjcs;
	}
	public Date getLjsjf() {
		return ljsjf;
	}
	public void setLjsjf(Date ljsjf) {
		this.ljsjf = ljsjf;
	}
	public Date getLjsjt() {
		return ljsjt;
	}
	public void setLjsjt(Date ljsjt) {
		this.ljsjt = ljsjt;
	}
	public Integer getRyid() {
		return ryid;
	}
	public void setRyid(Integer ryid) {
		this.ryid = ryid;
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
	public String getZjlx() {
		return zjlx;
	}
	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
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
	public String getSsxmc() {
		return ssxmc;
	}
	public void setSsxmc(String ssxmc) {
		this.ssxmc = ssxmc;
	}
	public String getJdrylx() {
		return jdrylx;
	}
	public void setJdrylx(String jdrylx) {
		this.jdrylx = jdrylx;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getLjjbxx_id() {
		return ljjbxx_id;
	}
	public void setLjjbxx_id(String ljjbxx_id) {
		this.ljjbxx_id = ljjbxx_id;
	}	
	
	

	
}
