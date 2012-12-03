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
 * 物品类别预警设置action
 * 
 * @author jjqueen
 */
public class WpyjszjAction extends PageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3315419313131646663L;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private String itemId;
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	private Jdpxx jdpxx;
	private IJdpxxService jdpxxService;
	private List lJdpxx=new ArrayList();
	public List getlJdpxx() {
		return lJdpxx;
	}

	public void setlJdpxx(List lJdpxx) {
		this.lJdpxx = lJdpxx;
	}

	public void setJdpxxService(IJdpxxService jdpxxService) {
		this.jdpxxService = jdpxxService;
	}

	public Jdpxx getJdpxx() {
		return jdpxx;
	}

	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}


	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
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
	 *  查询预警物品
	 * @return
	 */
	public String findYjwpPage(){
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			Page pageinfo = jdpxxService.findYjwpForPage(params,pagesize,pagerow, "", "");
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lJdpxx = pageinfo.getData();
			setTableData(lJdpxx);
		} catch (ParseException e) {
			this.result=e.getMessage();
			e.printStackTrace();
		}

		this.result = "success";
		return SUCCESS;
	}

	private void setTableData(List lData) throws ParseException {
		List lPro = new ArrayList();
		lPro.add("id");
		lPro.add("jdpdlxmc");
		lPro.add("jdplxmc");

		List lCol = new ArrayList(); 

		List lDelete = new ArrayList();
		lDelete.add("removeYjwp");
		lDelete.add("删除");
		lCol.add(lDelete);

		
		Jdpxx setjdpxx = new Jdpxx();
		this.setData(setjdpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
	/**
	 * 设置预警物品
	 * 根据页面参数当传入的参数有del 为当前预警的物品删除
	 * @return
	 */
	public String setYjwp(){
		Map map=new HashMap();
		map.put("itemId", this.itemId);
		if(this.result!=null&&!"".endsWith(this.result))
			map.put("del", "del");
		else
			map.put("update", "update");
		jdpxxService.setYjwp(map);
		this.result = "success";
		return SUCCESS;
	}
	/**
	 *  查询揽件中有预警物品的处理信息
	 * @return
	 */
	public String findYjwuclList(){
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			Page pageinfo = jdpxxService.findYjwuclList(params,pagesize,pagerow, "", "");
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lJdpxx = pageinfo.getData();
			setYjwuclTableData(lJdpxx);
		} catch (ParseException e) {
			this.result=e.getMessage();
			e.printStackTrace();
		}

		this.result = "success";
		return SUCCESS;
	}
	
	private void setYjwuclTableData(List lData) throws ParseException {
		List lPro = new ArrayList();
		lPro.add("jdpxxid");
		lPro.add("qymc");
		lPro.add("wldh");
		lPro.add("jjrxm");
		lPro.add("jjrzjhm");
		lPro.add("sjrxm");
		lPro.add("jdpdlxmc");
		lPro.add("jdplxmc");
		lPro.add("ljtbsj");

		List lCol = new ArrayList(); 

		List lDetail = new ArrayList();
		lDetail.add("getDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		
		List lDispose = new ArrayList();
		lDispose.add("removeYjwpxx");
		lDispose.add("处理");
		lCol.add(lDispose);

		
		Ljjbxx setjdpxx = new Ljjbxx();
		this.setData(setjdpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
}
