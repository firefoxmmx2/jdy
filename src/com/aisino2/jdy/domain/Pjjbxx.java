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
