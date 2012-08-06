package com.aisino2.icksystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Csryzhtj extends BaseObject {
	/** @param 场所人员综合查询统计(t_csryzhtj) */

	/** @ --场所人员查询统计ID--csryzhtjid--Integer--10-- */
	private Integer csryzhtjid;
	
	/** @ --统计日期--tjrq--Date---- */
	private Date tjrq;
	
	/** @ --地市机关代码--dsjgdm--String---- */
	private String dsjgdm;
	
	/** @ --地市机关名称--dsjgmc--String---- */
	private String dsjgmc;
	
	/** @ --地市机关标志--dsjgbz--String---- */
	private String dsjgbz;
	
	/** @ --分县局代码--fxjdm--String---- */
	private String fxjdm;
	
	/** @ --分县局名称--fxjmc--String---- */
	private String fxjmc;
	
	/** @ --分县局标志--fxjbz--String---- */
	private String fxjbz;
	
	/** @ --管辖单位代码--gxdwdm--String---- */
	private String gxdwdm;
	
	/** @ --管辖单位名称--gxdwmc--String---- */
	private String gxdwmc;
	
	/** @ --管辖单位标志--gxdwbz--String---- */
	private String gxdwbz;
	
	/** @ --场所数--css--Integer---- */
	private Integer css;
	
	/** @ --新增场所数--xzcss--Integer---- */
	private Integer xzcss;
	
	/** @ --注销场所数--zxcss--Integer---- */
	private Integer zxcss;
	
	/** @ --刷卡率--zskb--Integer---- */
	private Float zskb;
	
	/** @ --刷卡未达标场所数--skwdbcss--Integer---- */
	private Integer skwdbcss;
	
	/** @ --日常检查志场所数--rcjccs--Integer---- */
	private Integer rcjccs;
	
	/** @ --未填营业日志场所数--wtyyrzcss--Integer---- */
	private Integer wtyyrzcss;
	
	/** @ --处罚场所数--cfcss--Integer---- */
	private Integer cfcss;
	
	/** @ --奖励场所数--jlcss--Integer---- */
	private Integer jlcss;
	
	/** @ --发案场所数--facss--Integer---- */
	private Integer facss;
	
	/** @ --从业人员数--cyrys--Integer---- */
	private Integer cyrys;
	
	/** @ --注销人数--zxrys--Integer---- */
	private Integer zxrys;
	
	/** @ --新增人数--xzrys--Integer---- */
	private Integer xzrys;
	
	/** @ --处罚人数--cfrs--Integer---- */
	private Integer cfrs;
	
	/** @ --奖励人数--jlrs--Integer---- */
	private Integer jlrs;
	
	/** @ --报警回复率--bjhfl--Float---- */
	private Float bjhfl;
	
	/** @ --抓获在逃人数--zhztrs--Integer---- */
	private Integer zhztrs;
	
	/** @ --起始日期--qsrq--Date---- */
	private Date qsrq;
	
	/** @ --截止日期--jzrq--Date---- */
	private Date jzrq;
	
	/** @ --页面标识---- */
	private String ym;
	
	/** @ --装机场所数--zjcss--Integer---- */
	private Integer zjcss;
	
	/** @ --新增装机场所数--xzzjcss--Integer---- */
	private Integer xzzjcss;
	
	/** @ --新增装机率--xzzjl--Float---- */
	private Float xzzjl;
	
	/** @ --上传场所数--sccss--Integer---- */
	private Integer sccss;
	
	/** @ --场所刷卡上传率--csskscl--Float---- */
	private Float csskscl;
	
	/** @ --营业日志上传场所数--yyrzsccss--Integer---- */
	private Integer yyrzsccss;
	
	/** @ --刷卡人数--skrs--Integer---- */
	private Integer skrs;
	
	/** @ --人员刷卡上传率--ryskscl--Float---- */
	private Float ryskscl;
	
	/** @ --有效报警数--yxbjs--Integer---- */
	private Integer yxbjs;
	
	/** @ --回复数--hfs--Integer---- */
	private Integer hfs;
	
	/** @ --是否查询全部--sfcxqb--String---- */
	private String sfcxqb;
	
	public Integer getCsryzhtjid() {
		return csryzhtjid;
	}

	public void setCsryzhtjid(Integer csryzhtjid) {
		this.csryzhtjid = csryzhtjid;
	}

	public Date getTjrq() {
		return tjrq;
	}

	public void setTjrq(Date tjrq) {
		this.tjrq = tjrq;
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

	public String getDsjgbz() {
		return dsjgbz;
	}

	public void setDsjgbz(String dsjgbz) {
		this.dsjgbz = dsjgbz;
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

	public String getFxjbz() {
		return fxjbz;
	}

	public void setFxjbz(String fxjbz) {
		this.fxjbz = fxjbz;
	}

	public String getGxdwdm() {
		return gxdwdm;
	}

	public void setGxdwdm(String gxdwdm) {
		this.gxdwdm = gxdwdm;
	}

	public String getGxdwmc() {
		return gxdwmc;
	}

	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}

	public String getGxdwbz() {
		return gxdwbz;
	}

	public void setGxdwbz(String gxdwbz) {
		this.gxdwbz = gxdwbz;
	}

	public Integer getCss() {
		return css;
	}

	public void setCss(Integer css) {
		this.css = css;
	}

	public Integer getXzcss() {
		return xzcss;
	}

	public void setXzcss(Integer xzcss) {
		this.xzcss = xzcss;
	}

	public Integer xzzjcss() {
		return zxcss;
	}

	public void setZxcss(Integer zxcss) {
		this.zxcss = zxcss;
	}

	public Float getZskb() {
		return zskb;
	}

	public void setZskb(Float zskb) {
		this.zskb = zskb;
	}

	public Integer getSkwdbcss() {
		return skwdbcss;
	}

	public void setSkwdbcss(Integer skwdbcss) {
		this.skwdbcss = skwdbcss;
	}

	public Integer getRcjccs() {
		return rcjccs;
	}

	public void setRcjccs(Integer rcjccs) {
		this.rcjccs = rcjccs;
	}

	public Integer getWtyyrzcss() {
		return wtyyrzcss;
	}

	public void setWtyyrzcss(Integer wtyyrzcss) {
		this.wtyyrzcss = wtyyrzcss;
	}

	public Integer getCfcss() {
		return cfcss;
	}

	public void setCfcss(Integer cfcss) {
		this.cfcss = cfcss;
	}

	public Integer getJlcss() {
		return jlcss;
	}

	public void setJlcss(Integer jlcss) {
		this.jlcss = jlcss;
	}

	public Integer getFacss() {
		return facss;
	}

	public void setFacss(Integer facss) {
		this.facss = facss;
	}

	public Integer getCyrys() {
		return cyrys;
	}

	public void setCyrys(Integer cyrys) {
		this.cyrys = cyrys;
	}

	public Integer getZxrys() {
		return zxrys;
	}

	public void setZxrys(Integer zxrys) {
		this.zxrys = zxrys;
	}

	public Integer getXzrys() {
		return xzrys;
	}

	public void setXzrys(Integer xzrys) {
		this.xzrys = xzrys;
	}

	public Integer getCfrs() {
		return cfrs;
	}

	public void setCfrs(Integer cfrs) {
		this.cfrs = cfrs;
	}

	public Integer getJlrs() {
		return jlrs;
	}

	public void setJlrs(Integer jlrs) {
		this.jlrs = jlrs;
	}

	public Float getBjhfl() {
		return bjhfl;
	}

	public void setBjhfl(Float bjhfl) {
		this.bjhfl = bjhfl;
	}

	public Integer getZhztrs() {
		return zhztrs;
	}

	public void setZhztrs(Integer zhztrs) {
		this.zhztrs = zhztrs;
	}

	public Date getQsrq() {
		return qsrq;
	}

	public void setQsrq(Date qsrq) {
		this.qsrq = qsrq;
	}

	public Date getJzrq() {
		return jzrq;
	}

	public void setJzrq(Date jzrq) {
		this.jzrq = jzrq;
	}

	public String getYm() {
		return ym;
	}

	public void setYm(String ym) {
		this.ym = ym;
	}

	public Integer getZjcss() {
		return zjcss;
	}

	public void setZjcss(Integer zjcss) {
		this.zjcss = zjcss;
	}

	public Integer getXzzjcss() {
		return xzzjcss;
	}

	public void setXzzjcss(Integer xzzjcss) {
		this.xzzjcss = xzzjcss;
	}

	public Float getXzzjl() {
		return xzzjl;
	}

	public void setXzzjl(Float xzzjl) {
		this.xzzjl = xzzjl;
	}

	public Integer getSccss() {
		return sccss;
	}

	public void setSccss(Integer sccss) {
		this.sccss = sccss;
	}

	public Float getCsskscl() {
		return csskscl;
	}

	public void setCsskscl(Float csskscl) {
		this.csskscl = csskscl;
	}

	public Integer getYyrzsccss() {
		return yyrzsccss;
	}

	public void setYyrzsccss(Integer yyrzsccss) {
		this.yyrzsccss = yyrzsccss;
	}

	public Integer getSkrs() {
		return skrs;
	}

	public void setSkrs(Integer skrs) {
		this.skrs = skrs;
	}

	public Float getRyskscl() {
		return ryskscl;
	}

	public void setRyskscl(Float ryskscl) {
		this.ryskscl = ryskscl;
	}

	public Integer getYxbjs() {
		return yxbjs;
	}

	public void setYxbjs(Integer yxbjs) {
		this.yxbjs = yxbjs;
	}

	public Integer getHfs() {
		return hfs;
	}

	public void setHfs(Integer hfs) {
		this.hfs = hfs;
	}

	public Integer getZxcss() {
		return zxcss;
	}

	public String getSfcxqb() {
		return sfcxqb;
	}

	public void setSfcxqb(String sfcxqb) {
		this.sfcxqb = sfcxqb;
	}
}
