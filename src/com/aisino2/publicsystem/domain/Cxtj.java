package com.aisino2.publicsystem.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Cxtj extends BaseObject {

	/** @param 查询统计(t_cxtj) */

	/** @ --查询统计ID--cxtjid--Integer--10-- */
	private Integer cxtjid;

	/** @ --统计日期--tjrq--Date---- */
	private Date tjrq;

	/** @ --行业类别代码--hylbdm--String--3-- */
	private String hylbdm;

	/** @ --行业类别--hylb--String--40-- */
	private String hylb;

	/** @ --地市机关代码--dsjgdm--String--20-- */
	private String dsjgdm;

	/** @ --地市机关名称--dsjgmc--String--60-- */
	private String dsjgmc;

	/** @ --分县局代码--fxjdm--String--20-- */
	private String fxjdm;

	/** @ --分县局名称--fxjmc--String--60-- */
	private String fxjmc;

	/** @ --管辖单位代码--gxdwdm--String--20-- */
	private String gxdwdm;

	/** @ --管辖单位名称--gxdwmc--String--60-- */
	private String gxdwmc;

	/** @ --企业编码--qybm--String--20-- */
	private String qybm;

	/** @ --企业名称--qymc--String--120-- */
	private String qymc;

	/** @ --合计--hj--Integer--6-- */
	private Integer hj;
	
	/** 地市机关标志 */
	private String dsjgbz;
	/** 分县局标志  */
	private String fxjbz;
	/** 科所队标志 */
	private String gxdwbz;

	/** @ --起始日期--qsrq--Date---- */
	private Date qsrq;
	
	/** @ --截止日期--jzrq--Date---- */
	private Date jzrq;

	/** 分页排序 */
	private String pageSort;

	//日常检查添加字段
	private Integer qyzs;
	private Integer yjcqys;
	private Integer wjcqys;
	private Integer rcjccs;
	private Integer mjjczjccs;
	/** @ --管辖单位代码--gxdwbm--String--20-- */
	private String gxdwbm;
	/** @ --所属地县级公安机关代码--ssdxjgajgdm--String--20-- */
	private String ssdxjgajgdm;
	/** @ --所属地县级公安机关名称--ssdxjgajgmc--String--200-- */
	private String ssdxjgajgmc;
	/** @ --所属地地市机构代码--ssddsjgdm--String--20-- */
	private String ssddsjgdm;
	/** @ --所属地地市机构名称--ssddsjgmc--String--200-- */
	private String ssddsjgmc;
	
	//日常检查企业详细添加字段
	/** @ --企业ID--qyid--Integer--10-- */
	private Integer qyid;
	/** @ --联系电话--lxdh--String--30-- */
	private String lxdh;
	/** @ --营业状态代码--yyztdm--String--2-- */
	private String yyztdm;
	/** @ --营业状态名称--yyztmc--String--20-- */
	private String yyztmc;
	/** @ --装机状态名称--zjztdm--String--2-- */
	private String zjztdm;
	/** @ --装机状态名称--zjztmc--String--20-- */
	private String zjztmc;
	/** @ --总人数--zrs--Integer--6-- */
	private Integer zrs;
	
	//日常检查明细添加
	private Integer rcjcid;
	private Date jcrq;
	private String jcfs;
	private String fxwt;
	private String cljg;
	private String jcrxm;
	private String mjjczbh;
	private String jcjgmc;
	private String jcfsDisplay;
	
	//场所分类统计添加
	private Integer zjs;
	private Float zjl;
	/** @ --歌舞娱乐--gwyl--Integer--6-- */
	private Integer gwyl;
	/** @ --游艺场所--yysdzyxt--Integer--6-- */
	private Integer yysdzyxt;
	/** @ --其他娱乐场所--qtylcs--Integer--6-- */
	private Integer qtylcs;
	/** @ --桑拿、洗浴、按摩--snxyam--Integer--6-- */
	private Integer snxyam;
	/** @ --美容美发、足浴--mrmfzy--Integer--6-- */
	private Integer mrmfzy;
	/** @ --其他服务场所--qtfwcs--Integer--6-- */
	private Integer qtfwcs;
	/** @ --公共场所--ggcs--Integer--6-- */
	private Integer ggcs;
	/** @ --是否查询全部--sfcxqb--Integer--6-- */
	private String sfcxqb;
	
	//场所营业状态统计添加
	/** @ --营业--yy--Integer--6-- */
	private Integer yy;
	/** @ --自主停业--zzty--Integer--6-- */
	private Integer zzty;
	/** @ --勒令停业--llty--Integer--6-- */
	private Integer llty;
	/** @ --歇业--xy--Integer--6-- */
	private Integer xy;
	/** @ --注销--zx--Integer--6-- */
	private Integer zx;
	/** @ --其他--qt--Integer--6-- */
	private Integer qt;
	
	/** @ 查询统计ID(cxtjid) */
	public Integer getCxtjid() {
		return cxtjid;
	}

	public void setCxtjid(Integer cxtjid) {
		this.cxtjid = cxtjid;
	}

	/** @ 统计日期(tjrq) */
	public Date getTjrq() {
		return tjrq;
	}

	public void setTjrq(Date tjrq) {
		this.tjrq = tjrq;
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

	/** @ 地市机关代码(dsjgdm) */
	public String getDsjgdm() {
		return dsjgdm;
	}

	public void setDsjgdm(String dsjgdm) {
		this.dsjgdm = dsjgdm;
	}

	/** @ 地市机关名称(dsjgmc) */
	public String getDsjgmc() {
		return dsjgmc;
	}

	public void setDsjgmc(String dsjgmc) {
		this.dsjgmc = dsjgmc;
	}

	/** @ 分县局代码(fxjdm) */
	public String getFxjdm() {
		return fxjdm;
	}

	public void setFxjdm(String fxjdm) {
		this.fxjdm = fxjdm;
	}

	/** @ 分县局名称(fxjmc) */
	public String getFxjmc() {
		return fxjmc;
	}

	public void setFxjmc(String fxjmc) {
		this.fxjmc = fxjmc;
	}

	/** @ 管辖单位代码(gxdwdm) */
	public String getGxdwdm() {
		return gxdwdm;
	}

	public void setGxdwdm(String gxdwdm) {
		this.gxdwdm = gxdwdm;
	}

	/** @ 管辖单位名称(gxdwmc) */
	public String getGxdwmc() {
		return gxdwmc;
	}

	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}

	/** @ 企业编码(qybm) */
	public String getQybm() {
		return qybm;
	}

	public void setQybm(String qybm) {
		this.qybm = qybm;
	}

	/** @ 企业名称(qymc) */
	public String getQymc() {
		return qymc;
	}

	public void setQymc(String qymc) {
		this.qymc = qymc;
	}

	/** @ 合计(hj) */
	public Integer getHj() {
		return hj;
	}

	public void setHj(Integer hj) {
		this.hj = hj;
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

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public Integer getQyzs() {
		return qyzs;
	}

	public void setQyzs(Integer qyzs) {
		this.qyzs = qyzs;
	}

	public Integer getYjcqys() {
		return yjcqys;
	}

	public void setYjcqys(Integer yjcqys) {
		this.yjcqys = yjcqys;
	}

	public Integer getWjcqys() {
		return wjcqys;
	}

	public void setWjcqys(Integer wjcqys) {
		this.wjcqys = wjcqys;
	}

	public Integer getRcjccs() {
		return rcjccs;
	}

	public void setRcjccs(Integer rcjccs) {
		this.rcjccs = rcjccs;
	}

	public Integer getMjjczjccs() {
		return mjjczjccs;
	}

	public void setMjjczjccs(Integer mjjczjccs) {
		this.mjjczjccs = mjjczjccs;
	}

	public String getGxdwbm() {
		return gxdwbm;
	}

	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}

	public String getSsdxjgajgdm() {
		return ssdxjgajgdm;
	}

	public void setSsdxjgajgdm(String ssdxjgajgdm) {
		this.ssdxjgajgdm = ssdxjgajgdm;
	}

	public String getSsdxjgajgmc() {
		return ssdxjgajgmc;
	}

	public void setSsdxjgajgmc(String ssdxjgajgmc) {
		this.ssdxjgajgmc = ssdxjgajgmc;
	}

	public String getSsddsjgdm() {
		return ssddsjgdm;
	}

	public void setSsddsjgdm(String ssddsjgdm) {
		this.ssddsjgdm = ssddsjgdm;
	}

	public String getSsddsjgmc() {
		return ssddsjgmc;
	}

	public void setSsddsjgmc(String ssddsjgmc) {
		this.ssddsjgmc = ssddsjgmc;
	}

	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
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

	public Integer getZrs() {
		return zrs;
	}

	public void setZrs(Integer zrs) {
		this.zrs = zrs;
	}

	public Integer getRcjcid() {
		return rcjcid;
	}

	public void setRcjcid(Integer rcjcid) {
		this.rcjcid = rcjcid;
	}

	public Date getJcrq() {
		return jcrq;
	}

	public void setJcrq(Date jcrq) {
		this.jcrq = jcrq;
	}

	public String getJcfs() {
		return jcfs;
	}

	public void setJcfs(String jcfs) {
		this.jcfs = jcfs;
	}

	public String getFxwt() {
		return fxwt;
	}

	public void setFxwt(String fxwt) {
		this.fxwt = fxwt;
	}

	public String getCljg() {
		return cljg;
	}

	public void setCljg(String cljg) {
		this.cljg = cljg;
	}

	public String getJcrxm() {
		return jcrxm;
	}

	public void setJcrxm(String jcrxm) {
		this.jcrxm = jcrxm;
	}

	public String getMjjczbh() {
		return mjjczbh;
	}

	public void setMjjczbh(String mjjczbh) {
		this.mjjczbh = mjjczbh;
	}

	public String getJcjgmc() {
		return jcjgmc;
	}

	public void setJcjgmc(String jcjgmc) {
		this.jcjgmc = jcjgmc;
	}

	public String getJcfsDisplay() {
		return jcfsDisplay;
	}

	public void setJcfsDisplay(String jcfsDisplay) {
		this.jcfsDisplay = jcfsDisplay;
	}

	public Integer getZjs() {
		return zjs;
	}

	public void setZjs(Integer zjs) {
		this.zjs = zjs;
	}

	public Float getZjl() {
		return zjl;
	}

	public void setZjl(Float zjl) {
		this.zjl = zjl;
	}

	public Integer getGwyl() {
		return gwyl;
	}

	public void setGwyl(Integer gwyl) {
		this.gwyl = gwyl;
	}

	public Integer getYysdzyxt() {
		return yysdzyxt;
	}

	public void setYysdzyxt(Integer yysdzyxt) {
		this.yysdzyxt = yysdzyxt;
	}

	public Integer getQtylcs() {
		return qtylcs;
	}

	public void setQtylcs(Integer qtylcs) {
		this.qtylcs = qtylcs;
	}

	public Integer getSnxyam() {
		return snxyam;
	}

	public void setSnxyam(Integer snxyam) {
		this.snxyam = snxyam;
	}

	public Integer getMrmfzy() {
		return mrmfzy;
	}

	public void setMrmfzy(Integer mrmfzy) {
		this.mrmfzy = mrmfzy;
	}

	public Integer getQtfwcs() {
		return qtfwcs;
	}

	public void setQtfwcs(Integer qtfwcs) {
		this.qtfwcs = qtfwcs;
	}

	public Integer getGgcs() {
		return ggcs;
	}

	public void setGgcs(Integer ggcs) {
		this.ggcs = ggcs;
	}

	public String getSfcxqb() {
		return sfcxqb;
	}

	public void setSfcxqb(String sfcxqb) {
		this.sfcxqb = sfcxqb;
	}

	public Integer getYy() {
		return yy;
	}

	public void setYy(Integer yy) {
		this.yy = yy;
	}

	public Integer getZzty() {
		return zzty;
	}

	public void setZzty(Integer zzty) {
		this.zzty = zzty;
	}

	public Integer getLlty() {
		return llty;
	}

	public void setLlty(Integer llty) {
		this.llty = llty;
	}

	public Integer getXy() {
		return xy;
	}

	public void setXy(Integer xy) {
		this.xy = xy;
	}

	public Integer getZx() {
		return zx;
	}

	public void setZx(Integer zx) {
		this.zx = zx;
	}

	public Integer getQt() {
		return qt;
	}

	public void setQt(Integer qt) {
		this.qt = qt;
	}
	
}
