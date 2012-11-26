package com.aisino2.jdy.domain;

import com.aisino2.sysadmin.domain.User;

/**
 * 消息用户关联
 *
 */
public class Xxyh {
	private Integer id;
	private Integer xx_id;
	private User jsyh;
	private String zt;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getXx_id() {
		return xx_id;
	}
	public void setXx_id(Integer xx_id) {
		this.xx_id = xx_id;
	}
	public User getJsyh() {
		return jsyh;
	}
	public void setJsyh(User jsyh) {
		this.jsyh = jsyh;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	
	
}
