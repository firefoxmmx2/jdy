package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Qyyyrz extends BaseObject {

	/** @param 企业营业日志(t_qyyyrz) */

	/** @ --企业ID--qyid--Integer--10-- */
	private Integer qyid;

	/** @ --营业日志ID--yyrzid--Integer--10-- */
	private Integer yyrzid;

	/** @ --行业类别代码--hylbdm--String--3-- */
	private String hylbdm;

	/** @ --行业类别--hylb--String--40-- */
	private String hylb;

	/** @ --日期--riqi--Date---- */
	private Date riqi;

	/** @ --开始营业时间--ksyysj--Date---- */
	private Date ksyysj;

	/** @ --结束营业时间--jsyysj--Date---- */
	private Date jsyysj;

	/** @ --场所负责人编号--csfzrbh--String--20-- */
	private String csfzrbh;

	/** @ --场所负责人姓名--csfe--String--30-- */
	private String csfe;

	/** @ --治安负责人编号--zafzrbh--String--20-- */
	private String zafzrbh;

	/** @ --治安负责人姓名--zafzrxm--String--30-- */
	private String zafzrxm;

	/** @ --是否有治安、刑事案件或事故发生--sffsaj--String--1-- */
	private String sffsaj;

	/** @ --是否有管理部门检查--sfglbmjc--String--1-- */
	private String sfglbmjc;

	/** @ --当日营业状况--dryysj--String--2000-- */
	private String dryysj;
	
	/** @ --填写人姓名--txrxm--String--30-- */
	private String txrxm;
	
	/** @ --开始日期-- */
	private Date riqif;
	/** @ --结束日期-- */
	private Date riqit;

	/** 分页排序 */
	private String pageSort;
	
	private String qybm;
	private String qymc;
	
	private String gxdwbm;// 管辖单位编码
	private String gxdwmc;// 管辖单位名称
	private String applyid;
	
	private Integer cyryzs;//从业人员总数
	private Integer dtsbrs;//当天上班人数
	private Integer dtxzrys;//当天新增人员数
	private Integer dtlzrs;//当天离职人数
	private String sbzt;
	private String qyzflbm;//场所主分类编码
	private String qyzflmc;//场所主分类名称
	private String allhylbdm;
	
	private String frdb;//法人姓名
	private String jydz;//经营地址
	private String zjbh;//证件编号
	private String yyztdm;//营业状态代码
	private String yyztmc;//营业状态代码
	private String zjztdm;//营业状态代码
	private String zjztmc;//营业状态代码
	private String zabdm;//治安级别代码
	private String zajbmc;//治安级别名称


	public String getAllhylbdm() {
		return allhylbdm;
	}

	public void setAllhylbdm(String allhylbdm) {
		this.allhylbdm = allhylbdm;
	}

	public String getSbzt() {
		return sbzt;
	}

	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}

	public Integer getCyryzs() {
		return cyryzs;
	}

	public void setCyryzs(Integer cyryzs) {
		this.cyryzs = cyryzs;
	}

	public Integer getDtsbrs() {
		return dtsbrs;
	}

	public void setDtsbrs(Integer dtsbrs) {
		this.dtsbrs = dtsbrs;
	}

	public Integer getDtxzrys() {
		return dtxzrys;
	}

	public void setDtxzrys(Integer dtxzrys) {
		this.dtxzrys = dtxzrys;
	}

	public Integer getDtlzrs() {
		return dtlzrs;
	}

	public void setDtlzrs(Integer dtlzrs) {
		this.dtlzrs = dtlzrs;
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

	/** @ 企业ID(qyid) */
	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}

	/** @ 营业日志ID(yyrzid) */
	public Integer getYyrzid() {
		return yyrzid;
	}

	public void setYyrzid(Integer yyrzid) {
		this.yyrzid = yyrzid;
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

	/** @ 日期(riqi) */
	public Date getRiqi() {
		return riqi;
	}

	public void setRiqi(Date riqi) {
		this.riqi = riqi;
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

	/** @ 场所负责人编号(csfzrbh) */
	public String getCsfzrbh() {
		return csfzrbh;
	}

	public void setCsfzrbh(String csfzrbh) {
		this.csfzrbh = csfzrbh;
	}

	/** @ 场所负责人姓名(csfe) */
	public String getCsfe() {
		return csfe;
	}

	public void setCsfe(String csfe) {
		this.csfe = csfe;
	}

	/** @ 治安负责人编号(zafzrbh) */
	public String getZafzrbh() {
		return zafzrbh;
	}

	public void setZafzrbh(String zafzrbh) {
		this.zafzrbh = zafzrbh;
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

	/** @ 当日营业状况(dryysj) */
	public String getDryysj() {
		return dryysj;
	}

	public void setDryysj(String dryysj) {
		this.dryysj = dryysj;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public Date getRiqif() {
		return riqif;
	}

	public void setRiqif(Date riqif) {
		this.riqif = riqif;
	}

	public Date getRiqit() {
		return riqit;
	}

	public void setRiqit(Date riqit) {
		this.riqit = riqit;
	}

	public String getQybm() {
		return qybm;
	}

	public void setQybm(String qybm) {
		if(qybm!=null &&!"".equals(qybm))
			this.qybm = qybm.toUpperCase();
		else 
			this.qybm = qybm;
	}

	public String getQymc() {
		return qymc;
	}

	public void setQymc(String qymc) {
		this.qymc = qymc;
	}

	public String getTxrxm() {
		return txrxm;
	}

	public void setTxrxm(String txrxm) {
		this.txrxm = txrxm;
	}

	public String getApplyid() {
		return applyid;
	}

	public void setApplyid(String applyid) {
		this.applyid = applyid;
	}

	public String getQyzflbm() {
		return qyzflbm;
	}

	public void setQyzflbm(String qyzflbm) {
		this.qyzflbm = qyzflbm;
	}

	public String getQyzflmc() {
		return qyzflmc;
	}

	public void setQyzflmc(String qyzflmc) {
		this.qyzflmc = qyzflmc;
	}

	public String getFrdb() {
		return frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getJydz() {
		return jydz;
	}

	public void setJydz(String jydz) {
		this.jydz = jydz;
	}

	public String getZjbh() {
		return zjbh;
	}

	public void setZjbh(String zjbh) {
		this.zjbh = zjbh;
	}

	public String getYyztdm() {
		return yyztdm;
	}

	public void setYyztdm(String yyztdm) {
		this.yyztdm = yyztdm;
	}

	public String getYyztmc() {
		return yyztmc;
	}

	public void setYyztmc(String yyztmc) {
		this.yyztmc = yyztmc;
	}

	public String getZabdm() {
		return zabdm;
	}

	public void setZabdm(String zabdm) {
		this.zabdm = zabdm;
	}

	public String getZajbmc() {
		return zajbmc;
	}

	public void setZajbmc(String zajbmc) {
		this.zajbmc = zajbmc;
	}


	public String getZjztdm() {
		return zjztdm;
	}

	public void setZjztdm(String zjztdm) {
		this.zjztdm = zjztdm;
	}

	public String getZjztmc() {
		return zjztmc;
	}

	public void setZjztmc(String zjztmc) {
		this.zjztmc = zjztmc;
	}
}
