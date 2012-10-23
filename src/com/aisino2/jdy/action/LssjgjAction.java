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
 * 历史数据轨迹分析action
 * 
 * @author xieli
 */
public class LssjgjAction extends PageAction {

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
		HttpSession session = this.getRequest().getSession();
		// 如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		if (jdytjxx.getSjfw() != null) {// 时间范围
			// 获取当前时间
//			String currentDate = "";//当前时间
//			Date dt = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			currentDate = sdf.format(dt);
//			String beforeDate = "";//当前时间前推时间
			Date currentDate = new Date();
			Date beforeDate;
			Calendar calendar = Calendar.getInstance();// 日历对象
			if ("half".equals(jdytjxx.getSjfw())) {// 设置时间范围为半年
//				calendar.setTime(dt);
//				calendar.add(Calendar.MONTH, -6);
//				beforeDate = sdf.format(calendar.getTime());
				calendar.setTime(currentDate);
				calendar.add(Calendar.MONTH, -6);
				beforeDate = calendar.getTime();
			}else if("one".equals(jdytjxx.getSjfw())){// 设置时间范围为一年
//				calendar.setTime(dt);
//				calendar.add(Calendar.YEAR, -1);
//				beforeDate = sdf.format(calendar.getTime());
				calendar.setTime(currentDate);
				calendar.add(Calendar.YEAR, -1);
				beforeDate = calendar.getTime();
			}else{// 设置时间范围为两年
//				calendar.setTime(dt);
//				calendar.add(Calendar.YEAR, -2);
//				beforeDate = sdf.format(calendar.getTime());
//				calendar.setTime(currentDate);
				calendar.add(Calendar.YEAR, -2);
				beforeDate = calendar.getTime();
			}
			params.put("beforeDate", beforeDate);
			params.put("currentDate", currentDate);
		}
		if (!"".equals(jdytjxx.getXm()) && jdytjxx.getXm() != null) {//关注对象姓名
			params.put("xm", jdytjxx.getXm());
		}
		if (!"".equals(jdytjxx.getZjhm()) && jdytjxx.getZjhm() != null) {//关注对象证件号码
			params.put("zjhm", jdytjxx.getZjhm());
		}
		session.setAttribute("Lssjxxdaochu", params);

		//获取当前登录用户的部门编码，做权限控制
		User userMan = (User) session.getAttribute(Constants.userKey);
		String departCode = userMan.getDepartment().getDepartcode();
		params.put("gxdwbm", StringUtil.trimEven0(departCode));
		//注意：dir为排序方式，sort为排序列号
		Page pageinfo = jdytjxx_service.findLssjForPage(params, pagesize, pagerow, dir, sort);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lJdytjxx = pageinfo.getData();
		
		for (Jdytjxx jdytjxx : lJdytjxx) {
			//字典项人员类型翻译,翻译后赋值给业务类型字段
			Dict_item dict_item = CacheManager.getCacheDictitemOne("dm_jdy_rylx", jdytjxx.getYwlx());
			if (dict_item != null) {
				jdytjxx.setYwlx(dict_item.getDisplay_name());
			}
		}
		
		setTableDate_lssjxx(lJdytjxx);

		this.result = "success";
		return SUCCESS;
	}

	/*** 历史数据轨迹查询主页面setable方法 ***/
	private void setTableDate_lssjxx(List<Jdytjxx> lData) {
		List lPro = new ArrayList();
		lPro.add("djxh");
		lPro.add("xm");
		lPro.add("zjhm");
		lPro.add("ywdjsj");
		lPro.add("ywlx");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		lPro.add("xxdz");
		lPro.add("wldh");
		lPro.add("djxh");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("setLssjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		Jdytjxx setTjxx = new Jdytjxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setTjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}



	/***
	 * 历史数据导出时的查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("Lssjxx");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			// 如果派件查询参数不为空的话，配置数据库的查询参数
			Map<String, Object> params = new HashMap<String, Object>();
			params = (Map)session.getAttribute("Lssjxxdaochu");
			
			Page pageinfo = jdytjxx_service.findLssjForPage(params, 1, Integer.parseInt(maxRows), sort, dir);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lJdytjxx = pageinfo.getData();
			
			for (Jdytjxx jdytjxx : lJdytjxx) {
				//字典项人员类型翻译,翻译后赋值给业务类型字段
				Dict_item dict_item = CacheManager.getCacheDictitemOne("dm_jdy_rylx", jdytjxx.getYwlx());
				if (dict_item != null) {
					jdytjxx.setYwlx(dict_item.getDisplay_name());
				}
			}
			
			session.setAttribute("Lssjxx", lJdytjxx);
			
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/***
	 * 历史数据导出
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
			List qyryList = (List) session.getAttribute("Lssjxx");
			Jdytjxx setJdytjxx = new Jdytjxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qyryList);
			lResult.add(setJdytjxx);
			this.setExcelCreate("Lssjxx", lResult);
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
