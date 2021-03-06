package com.aisino2.jdy.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import sun.misc.BASE64Encoder;

import com.aisino2.cache.CacheManager;
import com.aisino2.common.DateToString;
import com.aisino2.common.ImageUtil;
import com.aisino2.common.PageUtil;
import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jddxzpxx;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Jdytjxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.service.IJdpxxService;
import com.aisino2.jdy.service.IJdytjxxService;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.jdy.service.IPjjbxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * 重点人员管控查询action
 * 
 * @author xieli
 */
public class ZdrygkAction extends PageAction {

	private IJdytjxxService jdytjxx_service;
	private Jdytjxx jdytjxx;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List<Jdytjxx> lJdytjxx = new ArrayList<Jdytjxx>();

	public void setJdytjxx_service(IJdytjxxService jdytjxx_service) {
		this.jdytjxx_service = jdytjxx_service;
	}
	
	public Jdytjxx getJdytjxx() {
		return jdytjxx;
	}
	
	public List<Jdytjxx> getlJdytjxx() {
		return lJdytjxx;
	}
	
	public void setJdytjxx(Jdytjxx jdytjxx) {
		this.jdytjxx = jdytjxx;
	}
	
	public void setlJdytjxx(List<Jdytjxx> lJdytjxx) {
		this.lJdytjxx = lJdytjxx;
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

	public String queryList() throws Exception {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("ksrq", jdytjxx.getKsrq());
		params.put("jsrq", jdytjxx.getJsrq());
		params.put("gxdwbm", StringUtil.trimEven0(jdytjxx.getGxdwbm()));
		params.put("ywhyjqbbz",jdytjxx.getYwhyjqbbz());//2012年12月6日新添加的业务和预警区别标志
		Page pageinfo = jdytjxx_service.findZdryForPage(params, pagesize, pagerow, dir, sort);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lJdytjxx = pageinfo.getData();
		
		for (Jdytjxx jdytjxx : lJdytjxx) {
			//字典项性别翻译,翻译后赋值给业务类型字段
			Dict_item dict_item = CacheManager.getCacheDictitemOne("dm_xb", jdytjxx.getXb());
			if (dict_item != null) {
				jdytjxx.setXb(dict_item.getDisplay_name());
			}
			//字典项人员类型翻译,翻译后赋值给业务类型字段
			dict_item = CacheManager.getCacheDictitemOne("dm_jdy_rylx", jdytjxx.getYwlx());
			if (dict_item != null) {
				jdytjxx.setYwlx(dict_item.getDisplay_name());
			}
		}
		if("YWBZ".equals(jdytjxx.getYwhyjqbbz())){
			setTableDate_zdry(lJdytjxx);
		}else if("YJBZ".equals(jdytjxx.getYwhyjqbbz())){
			setTableDate_zdryyj(lJdytjxx);
		}
		

		this.result = "success";
		return SUCCESS;
	}

	/*** 重点人员查询主页面setable方法 ***/
	private void setTableDate_zdry(List<Jdytjxx> lData) {
		List lPro = new ArrayList();
		lPro.add("bkryid");
		lPro.add("xm");
		lPro.add("xb");
		lPro.add("zjhm");
		lPro.add("rylx");
		lPro.add("gxdwmc");
		lPro.add("ywdjsj");
		lPro.add("ywlx");
		lPro.add("wldh");
		lPro.add("djxh");
		lPro.add("bkryid");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("setZdryDetail");
		lDetail.add("寄递业务详情");
		
		lCol.add(lDetail);
		for(Jdytjxx jdytjxx:lData){
			if(null==jdytjxx.getDjxh()){
			   jdytjxx.setDjxh("无关联数据");
			}
			String wldh=jdytjxx.getWldh();
			if(null==jdytjxx.getWldh()){
				jdytjxx.setWldh("无关联数据");
			}
		}
		Jdytjxx setTjxx = new Jdytjxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setTjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	/*** 重点人员预警查询主页面setable方法 ***/
	private void setTableDate_zdryyj(List<Jdytjxx> lData) {
		List lPro = new ArrayList();
		lPro.add("bkryid");
		lPro.add("xm");
		lPro.add("xb");
		lPro.add("zjhm");
		lPro.add("rylx");
		lPro.add("gxdwmc");
		lPro.add("ywdjsj");
		lPro.add("ywlx");
		lPro.add("wldh");
		lPro.add("djxh");
		lPro.add("bkryid");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("setZdryDetail");
		lDetail.add("寄递业务详情");
		
		List lCl = new ArrayList();
		lCl.add("setZdryCl");
		lCl.add("处理");
		
		lCol.add(lDetail);
		lCol.add(lCl);
		for(Jdytjxx jdytjxx:lData){
			if(null==jdytjxx.getDjxh()){
			   jdytjxx.setDjxh("无关联数据");
			}
			String wldh=jdytjxx.getWldh();
			if(null==jdytjxx.getWldh()){
				jdytjxx.setWldh("无关联数据");
			}
		}
		Jdytjxx setTjxx = new Jdytjxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setTjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}


	/***
	 * 重点人员管控导出时的查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("zdrygkData");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("ksrq", jdytjxx.getKsrq());
			params.put("jsrq", jdytjxx.getJsrq());
			params.put("gxdwbm", StringUtil.trimEven0(jdytjxx.getGxdwbm()));
			params.put("ywhyjqbbz",jdytjxx.getYwhyjqbbz());//2012年12月6日新添加的业务和预警区别标志
			Page pageinfo = jdytjxx_service.findZdryForPage(params, 1, Integer.parseInt(maxRows), dir, sort);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lJdytjxx = pageinfo.getData();
			for (Jdytjxx jdytjxx : lJdytjxx) {
				//字典项性别翻译,翻译后赋值给业务类型字段
				Dict_item dict_item = CacheManager.getCacheDictitemOne("dm_xb", jdytjxx.getXb());
				if (null!=dict_item) {
					jdytjxx.setXb(dict_item.getDisplay_name());
				}
				//字典项人员类型翻译,翻译后赋值给业务类型字段
				dict_item = CacheManager.getCacheDictitemOne("dm_jdy_rylx", jdytjxx.getYwlx());
				if (null!=dict_item) {
					jdytjxx.setYwlx(dict_item.getDisplay_name());
				}
			}
			
			session.setAttribute("zdrygkData", lJdytjxx);
			
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/***
	 * 重点人员管控数据导出
	 */
	public void exportExcel() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.userKey);
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			// Excel输出
			List lResult = new ArrayList(); // //开头excel
			List qyryList = (List) session.getAttribute("zdrygkData");
			Jdytjxx setJdytjxx = new Jdytjxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qyryList);
			lResult.add(setJdytjxx);
			this.setExcelCreate("Jdytjxx", lResult);
			this.result = "ok";
		} catch (IOException e) {
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
	}

}
