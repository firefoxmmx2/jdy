package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Qyzajbtj extends BaseObject{
	
	/** @ --企业ID--qyid--Integer--10-- */
	private Integer qyid;
	/** @ --行业类别代码--hylbdm--String--2-- */
	private String hylbdm;

	/** @ --行业类别--hylb--String--40-- */
	private String hylb;
	
	/** @ --地市机关标志--dsjgbz-- */
	private String dsjgbz;

	/** @ --地市机关代码--dsjgdm--String--20-- */
	private String dsjgdm;

	/** @ --地市机关名称--dsjgmc--String--60-- */
	private String dsjgmc;
	
	/** @ --分县局机关标志--fxjbz-- */
	private String fxjbz;

	/** @ --分县局代码--fxjdm--String--20-- */
	private String fxjdm;

	/** @ --分县局名称--fxjmc--String--60-- */
	private String fxjmc;
	
	/** @ --科所队标志标志--gxdwbz-- */
	private String gxdwbz;

	/** @ --管辖单位名称--gxdwmc--String--60-- */
	private String gxdwmc;

	/** @ --管辖单位代码--gxdwdm--String--20-- */
	private String gxdwdm;

	
	/** 场所标志 非数据库字段 */
	private String csbz;
	
	/** @ --场所编码--csbm--String--20-- */
	private String csbm;

	/** @ --企业编码--qybm--String--20-- */
	private String qybm;

	/** @ --企业名称--csmc--String--120-- */
	private String qymc;
	
	/**@ --A级个数 --ajc--Integer--*/
	private String ajc;
	
	/**@ --B级个数 --bjc--Integer--*/
	private String bjc;
	
	/**@ --C级个数 --cjc--Integer--*/
	private String cjc;
	
	/**@ --其它个数 --qtc--Integer--*/
	private String qtc;
	
	/**@ --治安级别名称 --zajbmc--String--*/
	private String zajbmc;
	
	/**@ --治安级别代码 --zabdm--String--*/
	private String zabdm;
	
	/**@ --原治安级别名称 --yzajbmc--String--*/
	private String yzajbmc;
	
	/**@ --原治安级别代码 --yzabdm--String--*/
	private String yzabdm;
	
	/**@ --变更时间 --bgsj--Date--*/
	private Date bgsj;
	
	/**@ --治安级别变更有高到底数量 --ygdd--String--*/
	private String ygdd;
	
	/**@ --治安级别变更有低到高数量 --yddg--String--*/
	private String yddg;
	
	private String relation;//用于区分治安级别有高到底，和有低到高
	
	private Date qssj;  ///起始时间
	
	private Date jzsj;  //截至时间

	public String getHylbdm() {
		return hylbdm;
	}

	public void setHylbdm(String hylbdm) {
		this.hylbdm = hylbdm;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getDsjgdm() {
		return dsjgdm;
	}

	public void setDsjgdm(String dsjgdm) {
		this.dsjgdm = dsjgdm;
	}

	public String getDsjgmc() {
		return dsjgmc;
	}

	public void setDsjgmc(String dsjgmc) {
		this.dsjgmc = dsjgmc;
	}

	public String getFxjdm() {
		return fxjdm;
	}

	public void setFxjdm(String fxjdm) {
		this.fxjdm = fxjdm;
	}

	public String getFxjmc() {
		return fxjmc;
	}

	public void setFxjmc(String fxjmc) {
		this.fxjmc = fxjmc;
	}

	public String getGxdwmc() {
		return gxdwmc;
	}

	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}

	public String getGxdwdm() {
		return gxdwdm;
	}

	public void setGxdwdm(String gxdwdm) {
		this.gxdwdm = gxdwdm;
	}

	public String getDsjgbz() {
		return dsjgbz;
	}

	public void setDsjgbz(String dsjgbz) {
		this.dsjgbz = dsjgbz;
	}

	public String getFxjbz() {
		return fxjbz;
	}

	public void setFxjbz(String fxjbz) {
		this.fxjbz = fxjbz;
	}

	public String getGxdwbz() {
		return gxdwbz;
	}

	public void setGxdwbz(String gxdwbz) {
		this.gxdwbz = gxdwbz;
	}

	public String getCsbz() {
		return csbz;
	}

	public void setCsbz(String csbz) {
		this.csbz = csbz;
	}

	public String getQybm() {
		return qybm;
	}

	public void setQybm(String qybm) {
		this.qybm = qybm;
	}

	public String getQymc() {
		return qymc;
	}

	public void setQymc(String qymc) {
		this.qymc = qymc;
	}

	public String getAjc() {
		return ajc;
	}

	public void setAjc(String ajc) {
		this.ajc = ajc;
	}

	public String getBjc() {
		return bjc;
	}

	public void setBjc(String bjc) {
		this.bjc = bjc;
	}

	public String getCjc() {
		return cjc;
	}

	public void setCjc(String cjc) {
		this.cjc = cjc;
	}

	public String getQtc() {
		return qtc;
	}

	public void setQtc(String qtc) {
		this.qtc = qtc;
	}

	public Date getQssj() {
		return qssj;
	}

	public void setQssj(Date qssj) {
		this.qssj = qssj;
	}

	public Date getJzsj() {
		return jzsj;
	}

	public void setJzsj(Date jzsj) {
		this.jzsj = jzsj;
	}

	public String getCsbm() {
		return csbm;
	}

	public void setCsbm(String csbm) {
		this.csbm = csbm;
	}

	public String getZajbmc() {
		return zajbmc;
	}

	public void setZajbmc(String zajbmc) {
		this.zajbmc = zajbmc;
	}

	public String getZabdm() {
		return zabdm;
	}

	public void setZabdm(String zabdm) {
		this.zabdm = zabdm;
	}

	public String getYgdd() {
		return ygdd;
	}

	public void setYgdd(String ygdd) {
		this.ygdd = ygdd;
	}

	public String getYddg() {
		return yddg;
	}

	public void setYddg(String yddg) {
		this.yddg = yddg;
	}

	public String getYzajbmc() {
		return yzajbmc;
	}

	public void setYzajbmc(String yzajbmc) {
		this.yzajbmc = yzajbmc;
	}

	public String getYzabdm() {
		return yzabdm;
	}

	public void setYzabdm(String yzabdm) {
		this.yzabdm = yzabdm;
	}

	public Date getBgsj() {
		return bgsj;
	}

	public void setBgsj(Date bgsj) {
		this.bgsj = bgsj;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}
	
}
