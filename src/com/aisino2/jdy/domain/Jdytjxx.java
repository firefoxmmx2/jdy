package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

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
	
	//运行情况
	private String qyzs;
	private String zjs;
	private String cyrys;
	private String ljs;
	private String pjs;
	private String wscqys;
	
	private Integer zrs;
	private String yyztmc;
	private String zjztmc;
	private String zt;
	private String jjlxmc;
	private String qybm;
	
	private Integer departlevel;
	
	private String jdplx;
	
	/*
	 * 历史数据轨迹查询用到
	 */
	private String sjfw;//查询历史数据时限定的时间范围
	private Date ywdjsj;//业务登记时间
	private String ywlx;//业务类型：寄件，收件，代收
	private String djxh;//业务登记序号
	private String wldh;//物流单号
	
	/*
	 * 重点人员管控查询用到
	 */
	private String xb;//性别
	private Date ksrq;//查询定义开始日期;
	private Date jsrq;//查询定义结束日期
	private String rylx;//重点人员管控类型
	private Zdryxx zdryxx;//重点人员
	private String bkryid;//布控人员ID
	private String ywhyjqbbz;//业务和预警查询时的区别标志（YWBZ：业务标志；YJBZ：预警标志）
	
	
	public String getYwhyjqbbz() {
		return ywhyjqbbz;
	}
	public void setYwhyjqbbz(String ywhyjqbbz) {
		this.ywhyjqbbz = ywhyjqbbz;
	}
	public String getBkryid() {
		return bkryid;
	}
	public void setBkryid(String bkryid) {
		this.bkryid = bkryid;
	}
	public String getJdplx() {
		return jdplx;
	}
	public void setJdplx(String jdplx) {
		this.jdplx = jdplx;
	}
	public Integer getDepartlevel() {
		return departlevel;
	}
	public void setDepartlevel(Integer departlevel) {
		this.departlevel = departlevel;
	}
	public String getQybm() {
		return qybm;
	}
	public void setQybm(String qybm) {
		this.qybm = qybm;
	}
	public String getYyztmc() {
		return yyztmc;
	}
	public void setYyztmc(String yyztmc) {
		this.yyztmc = yyztmc;
	}
	public String getZjztmc() {
		return zjztmc;
	}
	public void setZjztmc(String zjztmc) {
		this.zjztmc = zjztmc;
	}
	public String getJjlxmc() {
		return jjlxmc;
	}
	public void setJjlxmc(String jjlxmc) {
		this.jjlxmc = jjlxmc;
	}
	public Integer getZrs() {
		return zrs;
	}
	public void setZrs(Integer zrs) {
		this.zrs = zrs;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getQyzs() {
		return qyzs;
	}
	public void setQyzs(String qyzs) {
		this.qyzs = qyzs;
	}
	public String getZjs() {
		return zjs;
	}
	public void setZjs(String zjs) {
		this.zjs = zjs;
	}
	public String getCyrys() {
		return cyrys;
	}
	public void setCyrys(String cyrys) {
		this.cyrys = cyrys;
	}
	public String getLjs() {
		return ljs;
	}
	public void setLjs(String ljs) {
		this.ljs = ljs;
	}
	public String getPjs() {
		return pjs;
	}
	public void setPjs(String pjs) {
		this.pjs = pjs;
	}
	public String getWscqys() {
		return wscqys;
	}
	public void setWscqys(String wscqys) {
		this.wscqys = wscqys;
	}
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
	public String getSjfw() {
		return sjfw;
	}
	public void setSjfw(String sjfw) {
		this.sjfw = sjfw;
	}
	public Date getYwdjsj() {
		return ywdjsj;
	}
	public void setYwdjsj(Date ywdjsj) {
		this.ywdjsj = ywdjsj;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getDjxh() {
		return djxh;
	}
	public void setDjxh(String djxh) {
		this.djxh = djxh;
	}
	public String getWldh() {
		return wldh;
	}
	public void setWldh(String wldh) {
		this.wldh = wldh;
	}
	public Date getKsrq() {
		return ksrq;
	}
	public void setKsrq(Date ksrq) {
		this.ksrq = ksrq;
	}
	public Date getJsrq() {
		return jsrq;
	}
	public void setJsrq(Date jsrq) {
		this.jsrq = jsrq;
	}
	public String getRylx() {
		return rylx;
	}
	public void setRylx(String rylx) {
		this.rylx = rylx;
	}
	public Zdryxx getZdryxx() {
		return zdryxx;
	}
	public void setZdryxx(Zdryxx zdryxx) {
		this.zdryxx = zdryxx;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	
	
}
