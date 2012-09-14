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
	//可疑基地物品公安端、企业端查询标志kyjdwpxxcxbz
	private String kyjdwpxxcxbz;
	
	//登记时间
	private Date djsj;//登记时间
	
	private String djsjbz;//用于判断是否可进行修改
	
	
	
	
	public String getDjsjbz() {
		return djsjbz;
	}
	public void setDjsjbz(String djsjbz) {
		this.djsjbz = djsjbz;
	}
	public Date getDjsj() {
		return djsj;
	}
	public void setDjsj(Date djsj) {
		this.djsj = djsj;
	}
	public String getKyjdwpxxcxbz() {
		return kyjdwpxxcxbz;
	}
	public void setKyjdwpxxcxbz(String kyjdwpxxcxbz) {
		this.kyjdwpxxcxbz = kyjdwpxxcxbz;
	}
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
	private String sjrxm;//收件人姓名
	private Date ljtbsj;//揽件填报时间
	private String qymc;//企业名称
	private Integer qyid;//企业ID
	
	
	
	
	public Integer getQyid() {
		return qyid;
	}
	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}
	public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public String getSjrxm() {
		return sjrxm;
	}
	public void setSjrxm(String sjrxm) {
		this.sjrxm = sjrxm;
	}
	public Date getLjtbsj() {
		return ljtbsj;
	}
	public void setLjtbsj(Date ljtbsj) {
		this.ljtbsj = ljtbsj;
	}
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
