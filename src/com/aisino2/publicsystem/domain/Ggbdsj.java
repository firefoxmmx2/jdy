package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Ggbdsj extends BaseObject {

	/** @param 公共比对数据表(T_GGBDSJ) */

	/** @ --比对数据ID--bdsjid--Integer--10-- */
	private Integer bdsjid;

	/** @ --姓名--xm--String--100-- */
	private String xm;

	/** @ --证件号码--zjhm--String--20-- */
	private String zjhm;

	/** @ --企业名称--qymc--String--120-- */
	private String qymc;

	/** @ --企业地址--qydz--String--200-- */
	private String qydz;

	/** @ --管辖单位编码--gxdwbm--String--20-- */
	private String gxdwbm;

	/** @ --管辖单位名称--gxdwmc--String--60-- */
	private String gxdwmc;

	/** @ --行业类别代码--hylbdm--String--3-- */
	private String hylbdm;

	/** @ --行业类别--hylb--String--40-- */
	private String hylb;

	/** @ --业务表名--ywbm--String--100-- */
	private String ywbm;

	/** @ --业务表主键--ywbzj--String--30-- */
	private String ywbzj;
	
	/** @ --业务表原主键--ywbzj--String--30-- */
	private String ywbyzj;

	/** @ --写入时间--xrsj--Date---- */
	private Date xrsj;

	/** @ --更新时间--gxsj--Date---- */
	private Date gxsj;
	
	/** @ --无效时间--wxsj--Date---- */
	private Date wxsj;

	/** @ --比对标志--biduiflag--String--1-- */
	private String biduiflag;
	
	/** @ --是否有效--sfyx--String--1-- */
	private String sfyx;

	/** 分页排序 */
	private String pageSort;

	/** @ 比对数据ID(bdsjid) */
	public Integer getBdsjid() {
		return bdsjid;
	}

	public void setBdsjid(Integer bdsjid) {
		this.bdsjid = bdsjid;
	}

	/** @ 姓名(xm) */
	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	/** @ 证件号码(zjhm) */
	public String getZjhm() {
		return zjhm;
	}

	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}

	/** @ 企业名称(qymc) */
	public String getQymc() {
		return qymc;
	}

	public void setQymc(String qymc) {
		this.qymc = qymc;
	}

	/** @ 企业地址(qydz) */
	public String getQydz() {
		return qydz;
	}

	public void setQydz(String qydz) {
		this.qydz = qydz;
	}

	/** @ 管辖单位编码(gxdwbm) */
	public String getGxdwbm() {
		return gxdwbm;
	}

	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}

	/** @ 管辖单位名称(gxdwmc) */
	public String getGxdwmc() {
		return gxdwmc;
	}

	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}

	/** @ 行业类别代码(hylbdm) */
	public String getHylbdm() {
		return hylbdm;
	}

	public void setHylbdm(String hylbdm) {
		this.hylbdm = hylbdm;
	}

	/** @ 行业类别(hylb) */
	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	/** @ 业务表名(ywbm) */
	public String getYwbm() {
		return ywbm;
	}

	public void setYwbm(String ywbm) {
		this.ywbm = ywbm;
	}

	/** @ 业务表主键(ywbzj) */
	public String getYwbzj() {
		return ywbzj;
	}

	public void setYwbzj(String ywbzj) {
		this.ywbzj = ywbzj;
	}

	/** @ 写入时间(xrsj) */
	public Date getXrsj() {
		return xrsj;
	}

	public void setXrsj(Date xrsj) {
		this.xrsj = xrsj;
	}

	/** @ 更新时间(gxsj) */
	public Date getGxsj() {
		return gxsj;
	}

	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	/** @ 比对标志(biduiflag) */
	public String getBiduiflag() {
		return biduiflag;
	}

	public void setBiduiflag(String biduiflag) {
		this.biduiflag = biduiflag;
	}

	public String getYwbyzj() {
		return ywbyzj;
	}

	public void setYwbyzj(String ywbyzj) {
		this.ywbyzj = ywbyzj;
	}

	public String getSfyx() {
		return sfyx;
	}

	public void setSfyx(String sfyx) {
		this.sfyx = sfyx;
	}

	public Date getWxsj() {
		return wxsj;
	}

	public void setWxsj(Date wxsj) {
		this.wxsj = wxsj;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}
}
