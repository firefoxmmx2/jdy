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
	
	/**
	 * 对应的揽件基本信息
	 */
	private Ljjbxx ljjbxx;
	
	/**
	 * 映射寄递物品实体
	 */
	private Jdpxx jdpxx;
	/**
	 * 映射寄递物品实体
	 */
	private Rdrjbxx jjr;
	/**
	 * 映射寄递物品实体
	 */
	private Rdrjbxx sjr;
	
	public Rdrjbxx getJjr() {
		return jjr;
	}
	public void setJjr(Rdrjbxx jjr) {
		this.jjr = jjr;
	}
	public Rdrjbxx getSjr() {
		return sjr;
	}
	public void setSjr(Rdrjbxx sjr) {
		this.sjr = sjr;
	}
	
	
	/**
	 * 关联查询所需字段
	 */
	private Integer ljjbxx_id;//寄递品信息ID
	private String wldhlb;//物流单号
	private String jdpmc;//寄递品名称
	private String jjrxm;//寄件人姓名
	private String jjrzjlx;//寄件人证件类型
	private String jjrzjhm;//寄件人证件号码
	private String jdpdlxmc;//寄递品大类名称
	private String jdplxmc;//寄递品小类名称
	private String bgrxm;//报告人姓名
	
	
	public String getBgrxm() {
		return bgrxm;
	}
	public void setBgrxm(String bgrxm) {
		this.bgrxm = bgrxm;
	}
	public Integer getLjjbxx_id() {
		return ljjbxx_id;
	}
	public void setLjjbxx_id(Integer ljjbxx_id) {
		this.ljjbxx_id = ljjbxx_id;
	}
	public String getWldhlb() {
		return wldhlb;
	}
	public void setWldhlb(String wldhlb) {
		this.wldhlb = wldhlb;
	}
	public String getJdpmc() {
		return jdpmc;
	}
	public void setJdpmc(String jdpmc) {
		this.jdpmc = jdpmc;
	}
	public String getJjrxm() {
		return jjrxm;
	}
	public void setJjrxm(String jjrxm) {
		this.jjrxm = jjrxm;
	}
	public String getJjrzjlx() {
		return jjrzjlx;
	}
	public void setJjrzjlx(String jjrzjlx) {
		this.jjrzjlx = jjrzjlx;
	}
	public String getJjrzjhm() {
		return jjrzjhm;
	}
	public void setJjrzjhm(String jjrzjhm) {
		this.jjrzjhm = jjrzjhm;
	}
	public String getJdpdlxmc() {
		return jdpdlxmc;
	}
	public void setJdpdlxmc(String jdpdlxmc) {
		this.jdpdlxmc = jdpdlxmc;
	}
	public String getJdplxmc() {
		return jdplxmc;
	}
	public void setJdplxmc(String jdplxmc) {
		this.jdplxmc = jdplxmc;
	}
	
	public Jdpxx getJdpxx() {
		return jdpxx;
	}
	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}
	public Ljjbxx getLjjbxx() {
		return ljjbxx;
	}
	public void setLjjbxx(Ljjbxx ljjbxx) {
		this.ljjbxx = ljjbxx;
	}
	public String getKyywdjxh() {
		return kyywdjxh;
	}
	public void setKyywdjxh(String kyywdjxh) {
		this.kyywdjxh = kyywdjxh;
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
	/*
	 * 主页面按时间查询时用到
	 */
	private Date sbsjf;//上报开始时间
	private Date sbsjt;//上报截止时间
	
	public Date getSbsjf() {
		return sbsjf;
	}
	public void setSbsjf(Date sbsjf) {
		this.sbsjf = sbsjf;
	}
	public Date getSbsjt() {
		return sbsjt;
	}
	public void setSbsjt(Date sbsjt) {
		this.sbsjt = sbsjt;
	}


	
	
}
