package com.aisino2.jdy.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.IRdrjbxxService;



/**
 * 揽件信息action
 * 
 * @author renhao
 */
public class RdrjbxxAction extends PageAction {

	private Rdrjbxx rdrjbxx;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List<Rdrjbxx> lRdrjbxx = new ArrayList();
	private IRdrjbxxService rdrjbxxService;




	

	public void setRdrjbxxService(IRdrjbxxService rdrjbxxService) {
		this.rdrjbxxService = rdrjbxxService;
	}

	public void setlRdrjbxx(List<Rdrjbxx> lRdrjbxx) {
		this.lRdrjbxx = lRdrjbxx;
	}

	public Rdrjbxx getRdrjbxx() {
		return rdrjbxx;
	}

	public void setRdrjbxx(Rdrjbxx rdrjbxx) {
		this.rdrjbxx = rdrjbxx;
	}
	public String getTabledata() {
		return tabledata;
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
	
	

/**
 * 个人频繁更换基建单位统计查询
 *
 */
	public String grpfghdwcx() throws Exception {
	
		Map<String, Object> params = new HashMap<String, Object>();
		//开始时间
	    if(rdrjbxx.getKssj()!=null){
	    	params.put("kssj", rdrjbxx.getKssj());
	    }
	    //借宿时间
	    if(rdrjbxx.getJssj()!=null){
	    	params.put("jssj", rdrjbxx.getJssj());
	    }
	    //更换寄件单位次数
	    if(rdrjbxx.getGhjjdwcs()!=null){
	    	params.put("ghjjdwcs", rdrjbxx.getGhjjdwcs());
	    }
	    //管辖单位编码
	    if(rdrjbxx.getGxdwbm()!=null && StringUtil.isNotEmpty(rdrjbxx.getGxdwbm())){
	    	rdrjbxx.setGxdwbm(
	    			StringUtil.trimEven0(rdrjbxx.getGxdwbm()));
	    	params.put("gxdwbm", rdrjbxx.getGxdwbm());
	    }
	    //省市县
	    if(rdrjbxx.getSsx()!=null){
	    	params.put("ssx", rdrjbxx.getSsx());
	    }

		Page pageinfo = rdrjbxxService.grpfghjjdwtjcxForPage(params, pagesize,pagerow, tabledata, result);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lRdrjbxx = pageinfo.getData();
		setTableDate_grpfghdwcx(pageinfo.getData());
		this.result = "success";
		return SUCCESS;
	}
	/**
	 * 个人频繁更换基建单位统计查询setTable解析函数
	 */
	private void setTableDate_grpfghdwcx(List<Rdrjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("xm");
		lPro.add("xm");
		lPro.add("kssj");
		lPro.add("jssj");
		lPro.add("gxdwmc");
		lPro.add("ghjjdwcs");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("grpfghdwcxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		Rdrjbxx setRdrjbxx = new Rdrjbxx();
		this.setData(setRdrjbxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/**
	 * 个人频繁更换基建单位统计---详细信息列表---查询函数
	 *
	 */
		public String grpfghdwcxdal() throws Exception {
		
			Map<String, Object> params = new HashMap<String, Object>();
		    //管辖单位编码
		    if(rdrjbxx.getXm()!=null && StringUtil.isNotEmpty(rdrjbxx.getXm())){
		    	rdrjbxx.setXm(
		    			StringUtil.trimEven0(rdrjbxx.getXm()));
		    	params.put("xm", rdrjbxx.getXm());
		    }
		    

			Page pageinfo = rdrjbxxService.grpfghjjdwtjcxdalForPage(params, pagesize,pagerow, tabledata, result);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lRdrjbxx = pageinfo.getData();
			setTableDate_grpfghdwcxdal(pageinfo.getData());
			this.result = "success";
			return SUCCESS;
		}
		/**
		 * 个人频繁更换基建单位统计---详细信息列表setTable解析函数
		 */
		private void setTableDate_grpfghdwcxdal(List<Rdrjbxx> lData) {
			// TODO Auto-generated method stub
			List lPro = new ArrayList();
			lPro.add("djxh");
			lPro.add("djxh");
			lPro.add("xh");
			lPro.add("jjrxm");
			lPro.add("jjsj");
			lPro.add("cjqy");
			lPro.add("wldh");
			lPro.add("sjrxm");
			lPro.add("sjrdh");
			lPro.add("sjrxxdz");
			
			List lXzcz = new ArrayList();
			Rdrjbxx setRdrjbxx = new Rdrjbxx();
	    	this.setDataCustomer(setRdrjbxx, lData, lPro, null, lXzcz);
			//this.setData(setRdrjbxx, lData, lPro, null);
			this.tabledata = this.getData();
			totalrows = this.getTotalrows();
		}
}
