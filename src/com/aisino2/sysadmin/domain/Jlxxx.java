package com.aisino2.sysadmin.domain;

import com.aisino2.core.domain.BaseObject;

public class Jlxxx extends BaseObject {

	/** @param 街路巷信息(T_JLXXX) */

	/** @ --街路巷ID--jlxid--Integer--9-- */
	private Integer jlxid;

	/** @ --地址ID--addressid--Integer--9-- */
	private Integer addressid;

	/** @ --街路巷代码--jlxdm--String--20-- */
	private String jlxdm;

	/** @ --街路巷名称--jlxmc--String--100-- */
	private String jlxmc;

	/** 分页排序 */
	private String pageSort;

	/** @ 街路巷ID(jlxid) */
	public Integer getJlxid() {
		return jlxid;
	}

	public void setJlxid(Integer jlxid) {
		this.jlxid = jlxid;
	}

	/** @ 地址ID(addressid) */
	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	/** @ 街路巷代码(jlxdm) */
	public String getJlxdm() {
		return jlxdm;
	}

	public void setJlxdm(String jlxdm) {
		this.jlxdm = jlxdm;
	}

	/** @ 街路巷名称(jlxmc) */
	public String getJlxmc() {
		return jlxmc;
	}

	public void setJlxmc(String jlxmc) {
		this.jlxmc = jlxmc;
	}

	/** 分页排序 */
	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}
}
