package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

import com.aisino2.publicsystem.domain.Qyryxx;

/**
 * 派件基本信息
 * @author hooxin
 *
 */
public class Pjjbxx implements Serializable {
    /**
     * 主键使用 序列 pjjbxx_id
     */
    private Integer id;
	/**
	 * #派件关联的揽件信息 揽件实体
	 */
	private Ljjbxx ljjbxx;
	/**
	 * 代收人
	 */
	private Rdrjbxx dsr; 
	/**
	 * #派件人 关联从业人员实体
	 */
	private Qyryxx pjr;
	/**
	 * #派件时间 年月日
	 */
	private Date pjsj;
	/**
	 * #派件填报人 关联从业人员实体
	 */
	private Qyryxx pjtbr;
	/**
	 *  #派件填报时间 年月日
	 */
	private Date pjtbsj;
	
	/**
	 * 是否删除标志 Y 已删除 N 未删除
	 */
	private String sfscbz;
	/**
	 * 派件状态  Y 已派件 N 未派件
	 */
	private String zt;
	
//	查询列表用的
	private String djxh;
	private String wldh;
	private String sjr_xm;
	private String sjr_zjlx;
	private String sjr_zjhm;
	private String pjr_xm;
	private String overUpdateTime; // true / false
	private String kybz; //Y / N
	
	
	
	
	public String getKybz() {
		return kybz;
	}
	public void setKybz(String kybz) {
		this.kybz = kybz;
	}
	public String getOverUpdateTime() {
		return overUpdateTime;
	}
	public void setOverUpdateTime(String overUpdateTime) {
		this.overUpdateTime = overUpdateTime;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getSfscbz() {
		return sfscbz;
	}
	public void setSfscbz(String sfscbz) {
		this.sfscbz = sfscbz;
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
	public String getSjr_xm() {
		return sjr_xm;
	}
	public void setSjr_xm(String sjr_xm) {
		this.sjr_xm = sjr_xm;
	}
	public String getSjr_zjlx() {
		return sjr_zjlx;
	}
	public void setSjr_zjlx(String sjr_zjlx) {
		this.sjr_zjlx = sjr_zjlx;
	}
	public String getSjr_zjhm() {
		return sjr_zjhm;
	}
	public void setSjr_zjhm(String sjr_zjhm) {
		this.sjr_zjhm = sjr_zjhm;
	}
	public String getPjr_xm() {
		return pjr_xm;
	}
	public void setPjr_xm(String pjr_xm) {
		this.pjr_xm = pjr_xm;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Ljjbxx getLjjbxx() {
		return ljjbxx;
	}
	public void setLjjbxx(Ljjbxx ljjbxx) {
		this.ljjbxx = ljjbxx;
	}
	public Rdrjbxx getDsr() {
		return dsr;
	}
	public void setDsr(Rdrjbxx dsr) {
		this.dsr = dsr;
	}
	public Qyryxx getPjr() {
		return pjr;
	}
	public void setPjr(Qyryxx pjr) {
		this.pjr = pjr;
	}
	public Date getPjsj() {
		return pjsj;
	}
	public void setPjsj(Date pjsj) {
		this.pjsj = pjsj;
	}
	public Qyryxx getPjtbr() {
		return pjtbr;
	}
	public void setPjtbr(Qyryxx pjtbr) {
		this.pjtbr = pjtbr;
	}
	public Date getPjtbsj() {
		return pjtbsj;
	}
	public void setPjtbsj(Date pjtbsj) {
		this.pjtbsj = pjtbsj;
	}
	
	
}
