package com.aisino2.sysadmin.domain;

import java.util.Date;

import com.aisino2.core.domain.BaseObject;

public class Addressdetail extends BaseObject {

	/** @param 地址详址(T_ADDRESSDETAIL) */

	/** @ --地址详址ID--dzxzid--Integer--9-- */
	private Integer dzxzid;

	/** @ --地址ID--addressid--Integer--9-- */
	private Integer addressid;

	/** @ --地址详址名称--dzxzmc--String--100-- */
	private String dzxzmc;
	
	private String dzxzdm;//地址祥址代码
	
	private Integer jlxid;//街路巷ID
	
	private Date updatetime;//更新时间
  
  private String jlxdm;   //街路巷代码
  private String ssxq;	 
	private String jlxmc;
	
	/** 分页排序 */
	private String pageSort;

	/** @ 地址详址ID(dzxzid) */
	public Integer getDzxzid() {
		return dzxzid;
	}

	public void setDzxzid(Integer dzxzid) {
		this.dzxzid = dzxzid;
	}

	/** @ 地址ID(addressid) */
	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	/** @ 地址详址名称(dzxzmc) */
	public String getDzxzmc() {
		return dzxzmc;
	}

	public void setDzxzmc(String dzxzmc) {
		this.dzxzmc = dzxzmc;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public String getDzxzdm() {
		return dzxzdm;
	}

	public void setDzxzdm(String dzxzdm) {
		this.dzxzdm = dzxzdm;
	}

	public Integer getJlxid() {
		return jlxid;
	}

	public void setJlxid(Integer jlxid) {
		this.jlxid = jlxid;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	public String getJlxdm() {
		return jlxdm;
	}

	public void setJlxdm(String jlxdm) {
		this.jlxdm = jlxdm;
	}
	
	public String getSsxq() {
		return ssxq;
	}

	public void setSsxq(String ssxq) {
		this.ssxq = ssxq;
	}
	
	public String getJlxmc() {
		return jlxmc;
	}

	public void setJlxmc(String jlxmc) {
		this.jlxmc = jlxmc;
	}
	
}
