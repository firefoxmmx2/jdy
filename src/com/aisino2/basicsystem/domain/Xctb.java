package com.aisino2.basicsystem.domain;

import java.util.List;
import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Xctb extends BaseObject {

	/** @param 协查通报(t_xctb) */
	
	///// 查询结果的序号
	private String rowno;
	private String applyid;
	/** @ --通报ID--tbid--Integer--10-- */
	private Integer tbid;

	/** @ --标题--bt--String--100-- */
	private String bt;

	/** @ --发布时间--fbsj--Date---- */
	private Date fbsj;

	/** @ --发布内容--fbnr--String--2000-- */
	private String fbnr;

	/** @ --发布人--fbr--String--100-- */
	private String fbr;

	/** @ --发布单位--fbdw--String--200-- */
	private String fbdw;

	/** @ --行业类型--hylx--String--100-- */
	private String hylx;

	/** @ --截止日期--jzrq--Date---- */
	private Date jzrq;

	/** @ --过期标识--gqbs--String--2-- */
	private String gqbs;
	private Integer ytbid;//原通报id  用于保存webservice同步时原协查通报的id
	private String sbzt;
	
	///发布单位编码
	private String fbdwbm;
	//发布单位等级
	private Integer fbdwLevel;
    //发布开始时间
	private Date fbkssj;
	//发布结束时间������ʼʱ��
	private Date fbjssj;	
	//协查通报附件的List
	private List xctbfj;
	//协查通报场所List
	private List xctbjsdw;
	//所选行业类别名称
	private String sxhylbmc;
	//所选行业类别代码
	private String sxhylbdm;
	//接受单位名称
	private String jsdwmc;
	//接受单位编码
	private String jsdwbm;
	//接受单位ID
	private Integer jsdwid;
	
	/////附件的base64码
	private String fjbase64;
	////附件的名称
	private String fjname;
	private String fbdwbmforIn;
	/////传base64的文件de 专用属性
	private List lXctbfjList;
	private List lXctbjsdwList;
	
	/** @ --截止日期条件--jzrq--Date---- */
	private Date jzrqauto;

	/** 分页排序 */
	private String pageSort;
	
	private String sxhylbdmall;
	
	//公安机关代码
	private String gajgbm;   
	
	private String gajgcheck;
	
	private String hf;  //用于公安端右下角弹出的未回复的协查通报链接
	
	public String getHf() {
		return hf;
	}

	public void setHf(String hf) {
		this.hf = hf;
	}

	public String getGajgbm() {
		return gajgbm;
	}

	public void setGajgbm(String gajgbm) {
		this.gajgbm = gajgbm;
	}

	public String getGajgcheck() {
		return gajgcheck;
	}

	public void setGajgcheck(String gajgcheck) {
		this.gajgcheck = gajgcheck;
	}

	public String getSxhylbdmall() {
		return sxhylbdmall;
	}

	public void setSxhylbdmall(String sxhylbdmall) {
		this.sxhylbdmall = sxhylbdmall;
	}

	/** @ 通报ID(tbid) */
	public Integer getTbid() {
		return tbid;
	}

	public void setTbid(Integer tbid) {
		this.tbid = tbid;
	}

	/** @ 标题(bt) */
	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	/** @ 发布时间(fbsj) */
	public Date getFbsj() {
		return fbsj;
	}

	public void setFbsj(Date fbsj) {
		this.fbsj = fbsj;
	}

	/** @ 发布内容(fbnr) */
	public String getFbnr() {
		return fbnr;
	}

	public void setFbnr(String fbnr) {
		this.fbnr = fbnr;
	}

	/** @ 发布人(fbr) */
	public String getFbr() {
		return fbr;
	}

	public void setFbr(String fbr) {
		this.fbr = fbr;
	}

	/** @ 发布单位(fbdw) */
	public String getFbdw() {
		return fbdw;
	}

	public void setFbdw(String fbdw) {
		this.fbdw = fbdw;
	}

	/** @ 行业类型(hylx) */
	public String getHylx() {
		return hylx;
	}

	public void setHylx(String hylx) {
		this.hylx = hylx;
	}

	/** @ 截止日期(jzrq) */
	public Date getJzrq() {
		return jzrq;
	}

	public void setJzrq(Date jzrq) {
		this.jzrq = jzrq;
	}

	/** @ 过期标识(gqbs) */
	public String getGqbs() {
		return gqbs;
	}

	public void setGqbs(String gqbs) {
		this.gqbs = gqbs;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public String getFbdwbm() {
		return fbdwbm;
	}

	public void setFbdwbm(String fbdwbm) {
		this.fbdwbm = fbdwbm;
	}

	public Integer getFbdwLevel() {
	    return fbdwLevel;
	}

	public void setFbdwLevel(Integer fbdwLevel) {
	    this.fbdwLevel = fbdwLevel;
	}

	public Date getFbkssj() {
		return fbkssj;
	}

	public void setFbkssj(Date fbkssj) {
		this.fbkssj = fbkssj;
	}

	public Date getFbjssj() {
		return fbjssj;
	}

	public void setFbjssj(Date fbjssj) {
		this.fbjssj = fbjssj;
	}

	public List getXctbfj() {
		return xctbfj;
	}

	public void setXctbfj(List xctbfj) {
		this.xctbfj = xctbfj;
	}

	public List getXctbjsdw() {
		return xctbjsdw;
	}

	public void setXctbjsdw(List xctbjsdw) {
		this.xctbjsdw = xctbjsdw;
	}

	public String getSxhylbmc() {
		return sxhylbmc;
	}

	public void setSxhylbmc(String sxhylbmc) {
		this.sxhylbmc = sxhylbmc;
	}

	public String getSxhylbdm() {
		return sxhylbdm;
	}

	public void setSxhylbdm(String sxhylbdm) {
		this.sxhylbdm = sxhylbdm;
	}

	public String getJsdwmc() {
		return jsdwmc;
	}

	public void setJsdwmc(String jsdwmc) {
		this.jsdwmc = jsdwmc;
	}

	public String getJsdwbm() {
		return jsdwbm;
	}

	public void setJsdwbm(String jsdwbm) {
		this.jsdwbm = jsdwbm;
	}

	public String getFjbase64() {
		return fjbase64;
	}

	public void setFjbase64(String fjbase64) {
		this.fjbase64 = fjbase64;
	}

	public String getFjname() {
		return fjname;
	}

	public void setFjname(String fjname) {
		this.fjname = fjname;
	}

	public List getLXctbfjList() {
		return lXctbfjList;
	}

	public void setLXctbfjList(List xctbfjList) {
		lXctbfjList = xctbfjList;
	}

	public String getRowno() {
		return rowno;
	}

	public void setRowno(String rowno) {
		this.rowno = rowno;
	}

	public Date getJzrqauto() {
		return jzrqauto;
	}

	public void setJzrqauto(Date jzrqauto) {
		this.jzrqauto = jzrqauto;
	}

	public Integer getJsdwid() {
		return jsdwid;
	}

	public void setJsdwid(Integer jsdwid) {
		this.jsdwid = jsdwid;
	}

	public Integer getYtbid() {
		return ytbid;
	}

	public void setYtbid(Integer ytbid) {
		this.ytbid = ytbid;
	}

	public List getLXctbjsdwList() {
		return lXctbjsdwList;
	}

	public void setLXctbjsdwList(List xctbjsdwList) {
		lXctbjsdwList = xctbjsdwList;
	}

	public String getSbzt() {
		return sbzt;
	}

	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}

	public String getApplyid() {
		return applyid;
	}

	public void setApplyid(String applyid) {
		this.applyid = applyid;
	}

	public String getFbdwbmforIn() {
		return fbdwbmforIn;
	}

	public void setFbdwbmforIn(String fbdwbmforIn) {
		this.fbdwbmforIn = fbdwbmforIn;
	}

	
	

	
}
