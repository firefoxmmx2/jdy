
package com.aisino2.jdy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 寄递对象照片信息
 * @author hooxin
 *
 */
public class Jddxzpxx implements Serializable {
	private Integer id;
	private byte[] zpnr;
	private Date scsj;
	private Integer rdrjbxx_id;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public byte[] getZpnr() {
		return zpnr;
	}
	public void setZpnr(byte[] zpnr) {
		this.zpnr = zpnr;
	}
	public Date getScsj() {
		return scsj;
	}
	public void setScsj(Date scsj) {
		this.scsj = scsj;
	}
	public Integer getRdrjbxx_id() {
		return rdrjbxx_id;
	}
	public void setRdrjbxx_id(Integer rdrjbxx_id) {
		this.rdrjbxx_id = rdrjbxx_id;
	}
	
	
}
