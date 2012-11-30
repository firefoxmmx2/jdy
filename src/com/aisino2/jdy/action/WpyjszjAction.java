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
	private List<Jdpxx> lJdpxx=new ArrayList<Jdpxx>();
	public void setJdpxxService(IJdpxxService jdpxxService) {
		this.jdpxxService = jdpxxService;
	}

	public Jdpxx getJdpxx() {
		return jdpxx;
	}

	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}

	public List<Jdpxx> getlJdpxx() {
		return lJdpxx;
	}

	public void setlJdpxx(List<Jdpxx> lJdpxx) {
		this.lJdpxx = lJdpxx;
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
	
	public String findYjwpPage(){
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			Page pageinfo = jdpxxService.findYjwpForPage(params, pagerow, pagesize, "", "");
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

	private void setTableData(List<Jdpxx> lData) throws ParseException {
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
	
	public String setYjwp(){
		Map map=new HashMap();
		map.put("itemId", this.itemId);
		jdpxxService.setYjwp(map);
		this.result = "success";
		return SUCCESS;
	}
}
