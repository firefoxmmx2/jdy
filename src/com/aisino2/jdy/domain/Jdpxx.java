package com.aisino2.jdy.domain;

import java.io.Serializable;

/**
 * 寄递品信息
 * @author hooxin
 *
 */
public class Jdpxx implements Serializable {
    
	/**
	 * 主键 使用jdpxx_id序列
	 */
	private Integer id;
	/**
	 * 寄递品大类
	 */
	private String jdpdlx;
	/**
	 * 寄递品大类名称
	 */
	private String jdpdlxmc;
	/**
	 *  #寄递品类型
	 */
	private String jdplx;
	
	/**
	 * 寄递品类型名称
	 */
	private String jdplxmc;
	/**
	 * #寄递品名称
	 */
	private String jdpmc;
	/**
	 * #寄递品数目
	 */
	private String jdpsm;
	/**
	 * #关联的揽件信息实体
	 */
	private Ljjbxx ljjbxx;
	
	/**
	 * 是否删除标志
	 */
	private String sfscbz;
	
	/**
	 * 寄递品重量
	 */
	private String jdpzl;
	
	/**
	 * 寄递品体积
	 */
	private String jdptj;
	
	/**
	 * 关联查询时用到
	 */
	private Pjjbxx pjjbxx;//派件人
	
	/**
	 *添加可疑寄递物品信息实体 
	 */
	private Kyjdwpxx kyjdwpxx;
	
	/**
	 * 可疑标志
	 */
	private String kybz;
	
	public String getKybz() {
		return kybz;
	}
	public void setKybz(String kybz) {
		this.kybz = kybz;
	}
	
	
	
	public Kyjdwpxx getKyjdwpxx() {
		return kyjdwpxx;
	}
	public void setKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		this.kyjdwpxx = kyjdwpxx;
	}
	public Pjjbxx getPjjbxx() {
		return pjjbxx;
	}
	public void setPjjbxx(Pjjbxx pjjbxx) {
		this.pjjbxx = pjjbxx;
	}
	public String getJdpdlx() {
		return jdpdlx;
	}
	public void setJdpdlx(String jdpdlx) {
		this.jdpdlx = jdpdlx;
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
	public String getJdpzl() {
		return jdpzl;
	}
	public void setJdpzl(String jdpzl) {
		this.jdpzl = jdpzl;
	}
	public String getJdptj() {
		return jdptj;
	}
	public void setJdptj(String jdptj) {
		this.jdptj = jdptj;
	}
	public String getSfscbz() {
		return sfscbz;
	}
	public void setSfscbz(String sfscbz) {
		this.sfscbz = sfscbz;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJdplx() {
		return jdplx;
	}
	public void setJdplx(String jdplx) {
		this.jdplx = jdplx;
	}
	public String getJdpmc() {
		return jdpmc;
	}
	public void setJdpmc(String jdpmc) {
		this.jdpmc = jdpmc;
	}
	public String getJdpsm() {
		return jdpsm;
	}
	public void setJdpsm(String jdpsm) {
		this.jdpsm = jdpsm;
	}
	public Ljjbxx getLjjbxx() {
		return ljjbxx;
	}
	public void setLjjbxx(Ljjbxx ljjbxx) {
		this.ljjbxx = ljjbxx;
	}
	
	
}
