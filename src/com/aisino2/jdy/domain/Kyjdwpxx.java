package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

import com.aisino2.publicsystem.domain.Qyryxx;

/**
 * 
 * 可疑寄递物品信息
 * @author hooxin
 *
 */
public class Kyjdwpxx implements Serializable {
    
    /**
     *  #可疑业务登记序号 主键
     */
    private String kyywdjxh;
	/**
	 * #物流单号
	 */
	private String wldh;
	/**
	 * #可疑物品描述
	 */
	private String kywpms;
	/**
	 * #可疑物品类别
	 */
	private String kywplb;
	/**
	 *  #报告人 关联从业人员信息
	 */
	private Qyryxx bgr;
	/**
	 * #报告时间 年月日
	 */
	private Date bgsj;
	
	public String getKyywdjxh() {
		return kyywdjxh;
	}
	public void setKyywdjxh(String kyywdjxh) {
		this.kyywdjxh = kyywdjxh;
	}
	public String getWldh() {
		return wldh;
	}
	public void setWldh(String wldh) {
		this.wldh = wldh;
	}
	public String getKywpms() {
		return kywpms;
	}
	public void setKywpms(String kywpms) {
		this.kywpms = kywpms;
	}
	public String getKywplb() {
		return kywplb;
	}
	public void setKywplb(String kywplb) {
		this.kywplb = kywplb;
	}
	public Qyryxx getBgr() {
		return bgr;
	}
	public void setBgr(Qyryxx bgr) {
		this.bgr = bgr;
	}
	public Date getBgsj() {
		return bgsj;
	}
	public void setBgsj(Date bgsj) {
		this.bgsj = bgsj;
	}
	
	
}
