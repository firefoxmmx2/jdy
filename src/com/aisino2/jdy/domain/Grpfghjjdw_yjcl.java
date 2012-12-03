package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 个人频繁更换寄件单位  结果集表
 * 
 * @author renhao
 *
 */
public class Grpfghjjdw_yjcl implements Serializable {
	public static final String SFCL_YCL="1";
	public static final String SFCL_WCL="0";
	
	private Integer    id;//id
	private String     jjr;//寄件人
	private String     jjsj;//寄件时间
	private String     qybm;//企业编码  
	private String     qymc;//企业名称
	private String     wldh;//物流单号
	private String     sjr;//收件人
	private String     sjrdh;//收件人电话
	private String     sjrxxdz;//收件信息地址
	private String     sfcl;//是否处理
	private String     gxdwbm;//管辖单位编码
	private String     gxdwmc;//管辖单位名称
	private String     xh;//序号
	private String     djxh;//登记序号
	
	
	
	public String getDjxh() {
		return djxh;
	}
	public void setDjxh(String djxh) {
		this.djxh = djxh;
	}
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getGxdwmc() {
		return gxdwmc;
	}
	public void setGxdwmc(String gxdwmc) {
		this.gxdwmc = gxdwmc;
	}
	public String getSfcl() {
		return sfcl;
	}
	public void setSfcl(String sfcl) {
		this.sfcl = sfcl;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJjr() {
		return jjr;
	}
	public void setJjr(String jjr) {
		this.jjr = jjr;
	}
	public String getJjsj() {
		return jjsj;
	}
	public void setJjsj(String jjsj) {
		this.jjsj = jjsj;
	}
	public String getQybm() {
		return qybm;
	}
	public void setQybm(String qybm) {
		this.qybm = qybm;
	}
	public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public String getWldh() {
		return wldh;
	}
	public void setWldh(String wldh) {
		this.wldh = wldh;
	}
	public String getSjr() {
		return sjr;
	}
	public void setSjr(String sjr) {
		this.sjr = sjr;
	}
	public String getSjrdh() {
		return sjrdh;
	}
	public void setSjrdh(String sjrdh) {
		this.sjrdh = sjrdh;
	}
	public String getSjrxxdz() {
		return sjrxxdz;
	}
	public void setSjrxxdz(String sjrxxdz) {
		this.sjrxxdz = sjrxxdz;
	}
	
	
}
