package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;

/**
 * 揽件基本信息
 * @author hooxin
 *
 */
/**
 * @author hooxin
 *
 */
public class Ljjbxx implements Serializable {
    /**
     * #登记序号 主键
     */
    private String djxh;
    /**
     * #寄件人实体，关联寄件人收件人实体
     */
    private Rdrjbxx jjr;
    /**
     * #收件人实体，关联寄件人收件人实体
     */
    private Rdrjbxx sjr;
    /**
     *  #揽件人 （从业人员实体）
     */
    private Qyryxx ljr;
    /**
     * #揽件时间 年月日 
     */
    private Date ljsj;
    /**
     *  #揽件填报时间 年月日 默认当前时间
     */
    private Date ljtbsj;
    /**
     * #揽件填报人 关联从业人员实体 默认为当前用户
     */
    private Qyryxx ljtbr;
    
    /**
     * 揽件信息所包含的寄递品
     */
    private List<Jdpxx> jdp_list;
    
    /**
     *  物流单号
     */
    private String wldh;
    
    /**
     *  添加企业信息，关联查询
     */
    private Qyjbxx qyjbxx;
    /**
     * 是否补件
     */
    private String sfbj;
    
	public String getSfbj() {
		return sfbj;
	}
	public void setSfbj(String sfbj) {
		this.sfbj = sfbj;
	}
	public Qyjbxx getQyjbxx() {
		return qyjbxx;
	}
	public void setQyjbxx(Qyjbxx qyjbxx) {
		this.qyjbxx = qyjbxx;
	}
	public String getWldh() {
		return wldh;
	}
	public void setWldh(String wldh) {
		this.wldh = wldh;
	}
	public List<Jdpxx> getJdp_list() {
		return jdp_list;
	}
	public void setJdp_list(List<Jdpxx> jdp_list) {
		this.jdp_list = jdp_list;
	}
	public String getDjxh() {
		return djxh;
	}
	public void setDjxh(String djxh) {
		this.djxh = djxh;
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
	public Qyryxx getLjr() {
		return ljr;
	}
	public void setLjr(Qyryxx ljr) {
		this.ljr = ljr;
	}
	public Date getLjsj() {
		return ljsj;
	}
	public void setLjsj(Date ljsj) {
		this.ljsj = ljsj;
	}
	public Date getLjtbsj() {
		return ljtbsj;
	}
	public void setLjtbsj(Date ljtbsj) {
		this.ljtbsj = ljtbsj;
	}
	public Qyryxx getLjtbr() {
		return ljtbr;
	}
	public void setLjtbr(Qyryxx ljtbr) {
		this.ljtbr = ljtbr;
	}
    
    
}
