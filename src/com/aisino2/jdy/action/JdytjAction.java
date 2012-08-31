package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.common.StringUtil;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdytjxx;
import com.aisino2.jdy.service.IJdytjxxService;

public class JdytjAction extends PageAction {
	private IJdytjxxService jdytjxx_service;

	private String tabledata;
	
	private int totalrows;
	
	private String result;
	
	
	private List<Jdytjxx> jdytjxx_list;
	
	/**
	 * 统计时间开始
	 */
	private Date tjsjf;
	/**
	 * 统计时间结束
	 */
	private Date tjsjt;
	/**
	 * 管辖单位编码
	 */
	private String gxdwbm;
	/**
	 * 显示数
	 */
	private Integer show_number;
	
	
	
	public Integer getShow_number() {
		return show_number;
	}

	public void setShow_number(Integer show_number) {
		this.show_number = show_number;
	}

	public Date getTjsjf() {
		return tjsjf;
	}

	public void setTjsjf(Date tjsjf) {
		this.tjsjf = tjsjf;
	}

	public Date getTjsjt() {
		return tjsjt;
	}

	public void setTjsjt(Date tjsjt) {
		this.tjsjt = tjsjt;
	}

	public String getGxdwbm() {
		return gxdwbm;
	}

	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}

	public List<Jdytjxx> getJdytjxx_list() {
		return jdytjxx_list;
	}

	public void setJdytjxx_list(List<Jdytjxx> jdytjxx_list) {
		this.jdytjxx_list = jdytjxx_list;
	}


	public String getTabledata() {
		return tabledata;
	}

	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
	}

	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setJdytjxx_service(IJdytjxxService jdytjxx_service) {
		this.jdytjxx_service = jdytjxx_service;
	}
	
	/**
	 * 个人寄件量统计
	 * @return
	 * @throws Exception
	 */
	public String queryGrjjltj() throws Exception{
		
		Map<String,Object> paramap=new HashMap<String, Object>();
		
		if(tjsjf!=null)
			paramap.put("ljsjf",tjsjf);
		if(tjsjt!=null)
			paramap.put("ljsjt", tjsjt);
		
		if(StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if(show_number!=null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getJjltj(paramap);
		
		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();
		
		setTabledataJddxtj(jdytjxx_list);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	/**
	 * 个人收件量统计
	 * @return
	 * @throws Exception
	 */
	public String queryGrsjltj() throws Exception{
		Map<String,Object> paramap=new HashMap<String, Object>();
		
		if(tjsjf!=null)
			paramap.put("ljsjf",tjsjf);
		if(tjsjt!=null)
			paramap.put("ljsjt", tjsjt);
		
		if(StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if(show_number!=null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getSjltj(paramap);
		
		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();
		
		setTabledataJddxtj(jdytjxx_list);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	/**
	 * 企业揽件量统计
	 * @return
	 * @throws Exception
	 */
	public String queryQyljltj() throws Exception{
		Map<String,Object> paramap=new HashMap<String, Object>();
		
		if(tjsjf!=null)
			paramap.put("ljsjf",tjsjf);
		if(tjsjt!=null)
			paramap.put("ljsjt", tjsjt);
		
		if(StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if(show_number!=null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getQyljltj(paramap);
		
		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();
		
		setTabledataQyxxtj(jdytjxx_list);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	/**
	 * 企业派件量统计
	 * @return
	 * @throws Exception
	 */
	public String queryQypjltj() throws Exception{
		Map<String,Object> paramap=new HashMap<String, Object>();
		
		if(tjsjf!=null)
			paramap.put("pjsjf",tjsjf);
		if(tjsjt!=null)
			paramap.put("pjsjt", tjsjt);
		
		if(StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if(show_number!=null)
			paramap.put("show_number", show_number);
		jdytjxx_list=jdytjxx_service.getQypjltj(paramap);
		
		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();
		
		setTabledataQyxxtj(jdytjxx_list);
		
		this.result=SUCCESS;
		
		return SUCCESS;
	}
	
	/**
	 * 个人寄件量统计 和 个人收件量统计 用表格数据设置器
	 * @param ldata
	 */
	private void setTabledataJddxtj(List<Jdytjxx> ldata){
		List lPro = new ArrayList();
		lPro.add("seqnum");
		lPro.add("seqnum");
		lPro.add("xm");
		lPro.add("cs");
		lPro.add("xxdz");
		lPro.add("lxdh");
		lPro.add("zjhm");
		
		List lCol=new ArrayList();
		
		for(int i=0;i<ldata.size(); i++){
			ldata.get(i).setSeqnum(i+1);
		}
		
		Jdytjxx setJdytjxx=new Jdytjxx();
		this.setData(setJdytjxx, ldata, lPro, lCol);
		this.tabledata=this.getData();
		totalrows=this.getTotalrows();
	}
	
	/**
	 * 企业揽件量统计 和 企业派件量统计 用表格数据设置器
	 * @param ldata
	 */
	private void setTabledataQyxxtj(List<Jdytjxx> ldata){
		List lPro=new ArrayList();
		lPro.add("qyid");
		lPro.add("seqnum");
		lPro.add("qymc");
		lPro.add("cs");
		lPro.add("xxdz");
		lPro.add("lxdh");
		lPro.add("gxdwmc");
		
		List lCol = new ArrayList();
		//详情
		List lDetail=new ArrayList();
		lDetail.add("setQyDetail");
		lDetail.add("详情");
		
		
		lCol.add(lDetail);
		//设置排序号
		for(int i=0;i<ldata.size();i++){
			ldata.get(i).setSeqnum(i+1);
		}
		
		Jdytjxx setJdytjxx=new Jdytjxx();
		this.setData(setJdytjxx, ldata, lPro, lCol);
		
		this.tabledata=this.getData();
		totalrows=this.getTotalrows();
	}
	
}
