package com.aisino2.sysadmin.domain;

import com.aisino2.core.domain.BaseObject;

public class Address extends BaseObject {

	private Integer addressid;//地址ID
	private Integer departid;//机构ID
	private String addresscode;//地址代码
	private String addressname;//地址名称
	private Integer addresslevel;//地址层次
	private Integer parentaddressid;//父地址ID
	private String addressfullcode;//地址全路径代码
	private Integer nodeorder;//节点顺序
	private String isleaf;//是否叶结点
	private String addresssimplepin;//地址名称简拼
	private String addressallpin;//地址名称全拼
	private String addressbrevitycode;//地址简码
	private String oldAddressCode;//旧的地址代码，用于验证是否重复
	private String parentaddressname;//父地址名称
	private String departname;//机构名称
	
	/**
	 * 地址ID get
	 * @return Integer
	 */
	public Integer getAddressid() {
		return addressid;
	}
	/**
	 * 地址ID set
	 * @return Integer
	 */
	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	/**
	 * 机构ID get
	 * @return Integer
	 */
	public Integer getDepartid() {
		return departid;
	}
	/**
	 * 机构ID set
	 * @return Integer
	 */
	public void setDepartid(Integer departid) {
		this.departid = departid;
	}
	/**
	 * 地址代码get
	 * @return String
	 */
	public String getAddresscode() {
		return addresscode;
	}
	/**
	 * 地址代码set
	 * @return String
	 */
	public void setAddresscode(String addresscode) {
		this.addresscode = addresscode;
	}
	/**
	 * 地址名称get
	 * @return String
	 */
	public String getAddressname() {
		return addressname;
	}
	/**
	 * 地址名称set
	 * @return String
	 */
	public void setAddressname(String addressname) {
		this.addressname = addressname;
	}
	/**
	 * 地址层次get
	 * @return Integer
	 */
	public Integer getAddresslevel() {
		return addresslevel;
	}
	/**
	 * 地址层次set
	 * @return Integer
	 */
	public void setAddresslevel(Integer addresslevel) {
		this.addresslevel = addresslevel;
	}
	/**
	 * 父地址ID get
	 * @return Integer
	 */
	public Integer getParentaddressid() {
		return parentaddressid;
	}
	/**
	 * 父地址ID set
	 * @return Integer
	 */
	public void setParentaddressid(Integer parentaddressid) {
		this.parentaddressid = parentaddressid;
	}
	/**
	 * 地址全路径代码 get
	 * @return String
	 */
	public String getAddressfullcode() {
		return addressfullcode;
	}
	/**
	 * 地址全路径代码 set
	 * @return String
	 */
	public void setAddressfullcode(String addressfullcode) {
		this.addressfullcode = addressfullcode;
	}
	/**
	 * 节点顺序 get
	 * @return Integer
	 */
	public Integer getNodeorder() {
		return nodeorder;
	}
	/**
	 * 节点顺序 set
	 * @return Integer
	 */
	public void setNodeorder(Integer nodeorder) {
		this.nodeorder = nodeorder;
	}
	/**
	 * 是否叶结点 get
	 * @return String
	 */
	public String getIsleaf() {
		return isleaf;
	}
	/**
	 * 是否叶结点 set
	 * @return String
	 */
	public void setIsleaf(String isleaf) {
		this.isleaf = isleaf;
	}
	/**
	 * 地址名称简拼 get
	 * @return String
	 */
	public String getAddresssimplepin() {
		return addresssimplepin;
	}
	/**
	 * 地址名称简拼 set
	 * @return String
	 */
	public void setAddresssimplepin(String addresssimplepin) {
		this.addresssimplepin = addresssimplepin;
	}
	/**
	 * 地址名称全拼 get
	 * @return String
	 */
	public String getAddressallpin() {
		return addressallpin;
	}
	/**
	 * 地址名称全拼 set
	 * @return String
	 */
	public void setAddressallpin(String addressallpin) {
		this.addressallpin = addressallpin;
	}
	/**
	 * 地址简码 get
	 * @return String
	 */
	public String getAddressbrevitycode() {
		return addressbrevitycode;
	}
	/**
	 * 地址简码 set
	 * @return String
	 */
	public void setAddressbrevitycode(String addressbrevitycode) {
		this.addressbrevitycode = addressbrevitycode;
	}
	/**
	 * 旧的地址代码 get
	 * @return String
	 */
	public String getOldAddressCode() {
		return oldAddressCode;
	}
	/**
	 * 旧的地址代码 set
	 * @return String
	 */
	public void setOldAddressCode(String oldAddressCode) {
		this.oldAddressCode = oldAddressCode;
	}
	/**
	 * 父地址名称 get
	 * @return String
	 */
	public String getParentaddressname() {
		return parentaddressname;
	}
	/**
	 * 父地址名称 set
	 * @return String
	 */
	public void setParentaddressname(String parentaddressname) {
		this.parentaddressname = parentaddressname;
	}
	/**
	 * 机构名称 get
	 * @return String
	 */
	public String getDepartname() {
		return departname;
	}
	/**
	 * 机构名称 set
	 * @return String
	 */
	public void setDepartname(String departname) {
		this.departname = departname;
	}
	
}
