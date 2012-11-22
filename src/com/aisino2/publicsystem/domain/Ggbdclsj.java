package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Ggbdclsj extends BaseObject {

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) */

	/** @ --比对数据ID--bdclsjid--Integer--10-- */
	private Integer bdclsjid;

	/** @ --物品名称--wpmc--VARCHAR--30-- */
	private String wpmc;

	/** @ --物品简拼--wpjp--VARCHAR--100-- */
	private String wpjp;

	/** @ --物品全拼--wpqp--VARCHAR--200-- */
	private String wpqp;

	/** @ --车牌号--cph--VARCHAR--32-- */
	private String cph;

	/** @ --发动机号--fdjh--VARCHAR--60-- */
	private String fdjh;

	/** @ --车架号--cjh--VARCHAR--50-- */
	private String cjh;

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
	public Integer getBdclsjid() {
		return bdclsjid;
	}

	public void setBdclsjid(Integer bdclsjid) {
		this.bdclsjid = bdclsjid;
	}

	/** @ 物品名称(wpmc) */
	public String getWpmc() {
		return wpmc;
	}

	public void setWpmc(String wpmc) {
		this.wpmc = wpmc;
	}

	/** @ 物品简拼(wpjp) */
	public String getWpjp() {
		return wpjp;
	}

	public void setWpjp(String wpjp) {
		this.wpjp = wpjp;
	}

	/** @ 物品全拼(wpqp) */
	public String getWpqp() {
		return wpqp;
	}

	public void setWpqp(String wpqp) {
		this.wpqp = wpqp;
	}

	/** @ 车牌号(cph) */
	public String getCph() {
		return cph;
	}

	public void setCph(String cph) {
		this.cph = cph;
	}

	/** @ 发动机号(fdjh) */
	public String getFdjh() {
		return fdjh;
	}

	public void setFdjh(String fdjh) {
		this.fdjh = fdjh;
	}

	/** @ 车架号(cjh) */
	public String getCjh() {
		return cjh;
	}

	public void setCjh(String cjh) {
		this.cjh = cjh;
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

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public String getSfyx() {
		return sfyx;
	}

	public void setSfyx(String sfyx) {
		this.sfyx = sfyx;
	}

	public String getYwbyzj() {
		return ywbyzj;
	}

	public void setYwbyzj(String ywbyzj) {
		this.ywbyzj = ywbyzj;
	}

	public Date getWxsj() {
		return wxsj;
	}

	public void setWxsj(Date wxsj) {
		this.wxsj = wxsj;
	}
	
	
}
