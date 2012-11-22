package com.aisino2.publicsystem.domain;

import com.aisino2.core.domain.BaseObject;

public class Zzcl extends BaseObject{
	/** @param 典当企业纸质材料_照片(t_zzcl_zp) */

	/** @ --企业信息ID--qyid--Integer--10-- */
	private Integer qyid;

	/** @ --纸质材料照片ID--zzclid--Integer--10-- */
	private Integer zzclid;

	/** @ --图片名称--tpmc--String--100-- */
	private String tpmc;

	/** @ --操作类型--czlx--String--40-- */
	private String czlx;
	
	/** @ --操作类型----String--40-- */
	private String tplx;

	/** @ --图片内容--tpnr--byte[]---- */
	private byte[] tpnr;
	
	/** @ --图片临时名称--tplsmc--String--100-- */
	private String tplsmc;

	/** 分页排序 */
	private String pageSort;


	public Integer getQyid() {
		return qyid;
	}

	public void setQyid(Integer qyid) {
		this.qyid = qyid;
	}

	public Integer getZzclid() {
		return zzclid;
	}

	public void setZzclid(Integer zzclid) {
		this.zzclid = zzclid;
	}

	public String getTpmc() {
		return tpmc;
	}

	public void setTpmc(String tpmc) {
		this.tpmc = tpmc;
	}

	public String getTplx() {
		return tplx;
	}

	public void setTplx(String tplx) {
		this.tplx = tplx;
	}

	public byte[] getTpnr() {
		return tpnr;
	}

	public void setTpnr(byte[] tpnr) {
		this.tpnr = tpnr;
	}

	public String getPageSort() {
		return pageSort;
	}

	public void setPageSort(String pageSort) {
		this.pageSort = pageSort;
	}

	public String getTplsmc() {
		return tplsmc;
	}

	public void setTplsmc(String tplsmc) {
		this.tplsmc = tplsmc;
	}

	public String getCzlx() {
		return czlx;
	}

	public void setCzlx(String czlx) {
		this.czlx = czlx;
	}
	
	
}
