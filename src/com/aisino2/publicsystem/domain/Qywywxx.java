package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Qywywxx extends BaseObject {

	/** @param 企业无业务信息(t_qywywxx) */

	/** @ --企业ID--qyid--Integer--10-- */
	private Integer qyid;

	/** @ --企业无业务信息ID--qywywxxid--Integer--10-- */
	private Integer qywywxxid;

	/** @ --开始营业时间--ksyysj--Date---- */
	private Date ksyysj;

	/** @ --结束营业时间--jsyysj--Date---- */
	private Date jsyysj;

	/** @ --场所负责人姓名--csfe--String--30-- */
	private String csfe;

	/** @ --治安负责人姓名--zafzrxm--String--30-- */
	private String zafzrxm;

	/** @ --是否有治安、刑事案件或事故发生--sffsaj--String--1-- */
	private String sffsaj;

	/** @ --是否有管理部门检查--sfglbmjc--String--1-- */
	private String sfglbmjc;

	/** @ --登记日期--djrq--Date---- */
	private Date djrq;

	/** @ --填写人姓名--txrxm--String--30-- */
	private String txrxm;

	/** @ --当日无业务情况说明--drwywqksm--String--2000-- */
	private String drwywqksm;
	
	private String gxdwbm;
	private String qymc;
	private String hylbdm;
	private String qyzflbm;
	private String gxdwmc;
	private String hylb;

	/** 分页排序 */
	private String pageSort;

	/** @ 企业ID(qyid) */
	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}

	/** @ 企业无业务信息ID(qywywxxid) */
	public Integer getQywywxxid() {
		return qywywxxid;
	}

	public void setQywywxxid(Integer qywywxxid) {
		this.qywywxxid = qywywxxid;
	}

	/** @ 开始营业时间(ksyysj) */
	public Date getKsyysj() {
		return ksyysj;
	}

	public void setKsyysj(Date ksyysj) {
		this.ksyysj = ksyysj;
	}

	/** @ 结束营业时间(jsyysj) */
	public Date getJsyysj() {
		return jsyysj;
	}

	public void setJsyysj(Date jsyysj) {
		this.jsyysj = jsyysj;
	}

	/** @ 场所负责人姓名(csfe) */
	public String getCsfe() {
		return csfe;
	}

	public void setCsfe(String csfe) {
		this.csfe = csfe;
	}

	/** @ 治安负责人姓名(zafzrxm) */
	public String getZafzrxm() {
		return zafzrxm;
	}

	public void setZafzrxm(String zafzrxm) {
		this.zafzrxm = zafzrxm;
	}

	/** @ 是否有治安、刑事案件或事故发生(sffsaj) */
	public String getSffsaj() {
		return sffsaj;
	}

	public void setSffsaj(String sffsaj) {
		this.sffsaj = sffsaj;
	}

	/** @ 是否有管理部门检查(sfglbmjc) */
	public String getSfglbmjc() {
		return sfglbmjc;
	}

	public void setSfglbmjc(String sfglbmjc) {
		this.sfglbmjc = sfglbmjc;
	}

	/** @ 登记日期(djrq) */
	public Date getDjrq() {
		return djrq;
	}

	public void setDjrq(Date djrq) {
		this.djrq = djrq;
	}

	/** @ 填写人姓名(txrxm) */
	public String getTxrxm() {
		return txrxm;
	}

	public void setTxrxm(String txrxm) {
		this.txrxm = txrxm;
	}

	/** @ 当日无业务情况说明(drwywqksm) */
	public String getDrwywqksm() {
		return drwywqksm;
	}

	public void setDrwywqksm(String drwywqksm) {
		this.drwywqksm = drwywqksm;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public String getGxdwbm() {
		return gxdwbm;
	}

	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}

	public String getQymc() {
		return qymc;
	}
	
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}

	public String getHylbdm() {
		return hylbdm;
	}

	public void setHylbdm(String hylbdm) {
		this.hylbdm = hylbdm;
	}

	public String getQyzflbm() {
		return qyzflbm;
	}
	
	public void setQyzflbm(String qyzflbm) {
		this.qyzflbm = qyzflbm;
	}

	public String getGxdwmc() {
		return gxdwmc;
	}

	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}	
	
	
	
}
