package com.aisino2.icksystem.domain;

import java.util.List;
import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Icktjrb extends BaseObject {

	/** @param IC卡统计日报(t_icktjrb) */

	/** @ --IC卡统计日报ID--icktjrbid--Integer--10-- */
	private Integer icktjrbid;

	/** @ --统计日期--tjrq--Date---- */
	private Date tjrq;

	/** @ --企业ID--qyid--Integer--10-- */
	private Integer qyid;

	/** @ --行业类别代码--hylbdm--String--3-- */
	private String hylbdm;

	/** @ --行业类别--hylb--String--40-- */
	private String hylb;

	/** @ --企业编码--qybm--String--20-- */
	private String qybm;

	/** @ --企业名称--qymc--String--120-- */
	private String qymc;

	/** @ --管辖单位代码--gxdwbm--String--20-- */
	private String gxdwbm;

	/** @ --管辖单位名称--gxdwmc--String--60-- */
	private String gxdwmc;

	/** @ --所属地县级公安机关代码--ssdxjgajgdm--String--20-- */
	private String ssdxjgajgdm;

	/** @ --所属地县级公安机关名称--ssdxjgajgmc--String--200-- */
	private String ssdxjgajgmc;

	/** @ --所属地地市机构代码--ssddsjgdm--String--20-- */
	private String ssddsjgdm;

	/** @ --所属地地市机构名称--ssddsjgmc--String--200-- */
	private String ssddsjgmc;

	/** @ --已录入从业人员数--lrcyrys--Integer--6-- */
	private Integer lrcyrys;

	/** @ --受理IC卡数--slicks--Integer--6-- */
	private Integer slicks;

	/** @ --发放IC卡数--fficks--Integer--6-- */
	private Integer fficks;

	/** @ --刷卡次数--skcs--Integer--6-- */
	private Integer skcs;

	/** @ --刷卡IC卡数--skicks--Integer--6-- */
	private Integer skicks;

	/** 分页排序 */
	private String pageSort;
	
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
	
	/** 地市机关标志 非数据库字段 */
	private String dsjgbz;
	/** 分县局标志 非数据库字段 */
	private String fxjbz;
	/** 科所队标志 非数据库字段 */
	private String gxdwbz;
	
	/** @ --录入 场所数--非数据库字段  */
	private Integer lrcss;
	
	/** @ --当日刷卡IC卡数--非数据库字段  */
	private Integer drskicks;

	/** @ --装机状态名称--非数据库字段  */
	private String zjztmc;
	
	/** @ IC卡统计日报ID(icktjrbid) */
	public Integer getIcktjrbid() {
		return icktjrbid;
	}

	public void setIcktjrbid(Integer icktjrbid) {
		this.icktjrbid = icktjrbid;
	}

	/** @ 统计日期(tjrq) */
	public Date getTjrq() {
		return tjrq;
	}

	public void setTjrq(Date tjrq) {
		this.tjrq = tjrq;
	}

	/** @ 企业ID(qyid) */
	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
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

	/** @ 管辖单位代码(gxdwbm) */
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

	/** @ 所属地县级公安机关代码(ssdxjgajgdm) */
	public String getSsdxjgajgdm() {
		return ssdxjgajgdm;
	}

	public void setSsdxjgajgdm(String ssdxjgajgdm) {
		this.ssdxjgajgdm = ssdxjgajgdm;
	}

	/** @ 所属地县级公安机关名称(ssdxjgajgmc) */
	public String getSsdxjgajgmc() {
		return ssdxjgajgmc;
	}

	public void setSsdxjgajgmc(String ssdxjgajgmc) {
		this.ssdxjgajgmc = ssdxjgajgmc;
	}

	/** @ 所属地地市机构代码(ssddsjgdm) */
	public String getSsddsjgdm() {
		return ssddsjgdm;
	}

	public void setSsddsjgdm(String ssddsjgdm) {
		this.ssddsjgdm = ssddsjgdm;
	}

	/** @ 所属地地市机构名称(ssddsjgmc) */
	public String getSsddsjgmc() {
		return ssddsjgmc;
	}

	public void setSsddsjgmc(String ssddsjgmc) {
		this.ssddsjgmc = ssddsjgmc;
	}

	/** @ 已录入从业人员数(lrcyrys) */
	public Integer getLrcyrys() {
		return lrcyrys;
	}

	public void setLrcyrys(Integer lrcyrys) {
		this.lrcyrys = lrcyrys;
	}

	/** @ 受理IC卡数(slicks) */
	public Integer getSlicks() {
		return slicks;
	}

	public void setSlicks(Integer slicks) {
		this.slicks = slicks;
	}

	/** @ 发放IC卡数(fficks) */
	public Integer getFficks() {
		return fficks;
	}

	public void setFficks(Integer fficks) {
		this.fficks = fficks;
	}

	/** @ 刷卡次数(skcs) */
	public Integer getSkcs() {
		return skcs;
	}

	public void setSkcs(Integer skcs) {
		this.skcs = skcs;
	}

	/** @ 刷卡IC卡数(skicks) */
	public Integer getSkicks() {
		return skicks;
	}

	public void setSkicks(Integer skicks) {
		this.skicks = skicks;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
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

	public Integer getLrcss() {
		return lrcss;
	}

	public void setLrcss(Integer lrcss) {
		this.lrcss = lrcss;
	}

	public Integer getDrskicks() {
		return drskicks;
	}

	public void setDrskicks(Integer drskicks) {
		this.drskicks = drskicks;
	}

	public String getZjztmc() {
		return zjztmc;
	}

	public void setZjztmc(String zjztmc) {
		this.zjztmc = zjztmc;
	}

}
