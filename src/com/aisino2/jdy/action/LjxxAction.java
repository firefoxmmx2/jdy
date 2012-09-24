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

import com.aisino2.cache.CacheManager;
import com.aisino2.common.DateToString;
import com.aisino2.common.PageUtil;
import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.service.IJdpxxService;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * 揽件信息action
 * 
 * @author renhao
 */
public class LjxxAction extends PageAction {

	private ILjjbxxService ljjbxxService;
	private Ljjbxx lj;
	private Jdpxx jdpxx;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List<Ljjbxx> lLjjbxx = new ArrayList();
	private String wldh;
	private boolean overUpdateTime;// 判断时间是否超过今日24点的标志

	public boolean isOverUpdateTime() {
		return overUpdateTime;
	}

	public void setOverUpdateTime(boolean overUpdateTime) {
		this.overUpdateTime = overUpdateTime;
	}

	public String getWldh() {
		return wldh;
	}

	public void setWldh(String wldh) {
		this.wldh = wldh;
	}

	public List<Ljjbxx> getlLjjbxx() {
		return lLjjbxx;
	}

	public void setlLjjbxx(List<Ljjbxx> lLjjbxx) {
		this.lLjjbxx = lLjjbxx;
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

	public void setLjjbxxService(ILjjbxxService ljjbxxService) {
		this.ljjbxxService = ljjbxxService;
	}

	public Ljjbxx getLj() {
		return lj;
	}

	public void setLj(Ljjbxx lj) {
		this.lj = lj;
	}

	public Jdpxx getJdpxx() {
		return jdpxx;
	}

	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}

	/**
	 * 揽件信息插入action
	 * 
	 * @author renhao
	 */
	public String insert() throws Exception {
		HttpSession session = this.getRequest().getSession();
		User user = (User) session.getAttribute(Constants.userKey);
		Qyryxx ljtbr = new Qyryxx();
		ljtbr.setCyrybh(user.getCyrybh());
		lj.setLjtbr(ljtbr);

		ljjbxxService.insertLjjbxx(lj);

		this.result = "success";
		return SUCCESS;
	}

	/**
	 * 更改揽件信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		if (lj == null)
			throw new RuntimeException("需要修改的派件信息参数不能为空");
		ljjbxxService.updateLjjbxx(lj);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 删除揽件信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		if (lj == null)
			throw new RuntimeException("需要删除的派件信息参数不能为空");
		// 删除时修改scbzw
		lj.setScbzw("1");
		ljjbxxService.deleteLjjbxx(lj);

		this.result = SUCCESS;
		return SUCCESS;
	}

	public String queryListlj() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("Ljjbxxdaoc");// 清除session中的导出查询条件

		// 如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		if (lj.getWldh() != null) {// 物流单号
			params.put("wldh", lj.getWldh());
		}
		if (lj.getJjr() != null) {// 寄件人信息
			params.put("jjr", lj.getJjr());
		}
		if (lj.getJdpxx() != null) {// 寄递品信息
			params.put("jdpxx", lj.getJdpxx());
		}
		if (lj.getLjr() != null) {// 揽件人信息
			params.put("ljr", lj.getLjr());
		}
		if (lj.getSjr() != null) {// 收件人
			params.put("sjr", lj.getSjr());
		}
		if (lj.getLjsjf() != null) {// 揽件登记时间开始
			params.put("ljsjf", lj.getLjsjf());
		}
		if (lj.getLjsjt() != null) {// 揽件登记时间结束
			params.put("ljsjt", lj.getLjsjt());
		}
		if (lj.getQyjbxx() != null) {// 企业基本信息
			params.put("qyjbxx", lj.getQyjbxx());
			if (StringUtil.isNotEmpty(lj.getQyjbxx().getGxdwbm())) {
				lj.getQyjbxx().setGxdwbm(
						StringUtil.trimEven0(lj.getQyjbxx().getGxdwbm()));
			}
		}
		if (lj.getScbzw() != null) {
			params.put("scbzw", lj.getScbzw());
		}
		session.setAttribute("Ljjbxxdaoc", params);

		Page pageinfo = ljjbxxService.findLjjbxxForPage(params, pagesize,
				pagerow, sort, dir);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lLjjbxx = pageinfo.getData();

		setTableDate_ljjbxx(pageinfo.getData());

		this.result = "success";
		return SUCCESS;
	}

	/**
	 * 单一获取
	 * 
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception {

		lj = ljjbxxService.getLjjbxx(lj);

		if (lj != null && lj.getLjtbsj() != null) {

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender = Calendar.getInstance();
			updateOverTimeCalender
					.setTime(sdf.parse(sdf.format(lj.getLjtbsj())));
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar = Calendar.getInstance();
			nowCalendar.setTime(now);
			if ((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				overUpdateTime = true;
			else
				overUpdateTime = false;
		}

		return SUCCESS;
	}

	/*** 揽件基本信息主页面setable方法 ***/
	private void setTableDate_ljjbxx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("djxh");
		lPro.add("djxh");
		lPro.add("wldh");
		lPro.add("jjrxm");
		lPro.add("jjrzjlx");
		lPro.add("jjrzjhm");
		lPro.add("ljyxm");
		lPro.add("ljtbsj");
		lPro.add("kybz");
		lPro.add("sjkzbz");
		lPro.add("sfpjbz");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		List lUpdate = new ArrayList();
		lUpdate.add("setLjxxUpdate");
		lUpdate.add("修改");
		lCol.add(lUpdate);

		List lDelete = new ArrayList();
		lDelete.add("setLjxxDelete");
		lDelete.add("删除");
		lCol.add(lDelete);
		for (Ljjbxx lj : lData) {
			lj.setJjrxm(lj.getJjr().getXm());// 寄件人姓名
			if (lj.getJjr().getZjlx().equals("11")) {
				lj.setJjrzjlx("身份证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("13")) {
				lj.setJjrzjlx("户口薄");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("90")) {
				lj.setJjrzjlx("军官证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("91")) {
				lj.setJjrzjlx("警官证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("92")) {
				lj.setJjrzjlx("士兵证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("93")) {
				lj.setJjrzjlx("护照");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("99")) {
				lj.setJjrzjlx("其他");// 寄件人证件类型
			}
			lj.setJjrzjhm(lj.getJjr().getZjhm());// 寄件人证件号码
			lj.setLjyxm(lj.getLjr().getXm());// 揽件人姓名
			if (lj.getSfpjbz() == "" || lj.getSfpjbz() == null) {// 派件标志
				lj.setSfpjbz("N");
			}

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender = Calendar.getInstance();
			try {
				updateOverTimeCalender.setTime(sdf.parse(sdf.format(lj
						.getLjtbsj())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar = Calendar.getInstance();
			nowCalendar.setTime(now);
			if ((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				lj.setSjkzbz("Y");
			else
				lj.setSjkzbz("N");
		}

		Ljjbxx setLjxx = new Ljjbxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	// ========================================企业端、公安端针对寄递物品信息查询==========================================================================================
	public String jdywxxquerylist() throws Exception {

		// 如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();

		// 管辖单位编码、企业名称
		if (lj.getQyjbxx() != null) {
			if (lj.getQyjbxx().getGxdwbm() != null) {
				lj.getQyjbxx().setGxdwbm(
						StringUtil.trimEven0(lj.getQyjbxx().getGxdwbm()));
			}
			params.put("qyjbxx", lj.getQyjbxx());
		}
		// 揽件基本信息 物流单号
		if (lj.getWldh() != null) {
			params.put("wldh", lj.getWldh());
		}
		// 寄件人
		if (lj.getJjr() != null) {
			params.put("jjr", lj.getJjr());
		}
		// 收件人
		if (lj.getSjr() != null) {
			params.put("sjr", lj.getSjr());
		}
		// 寄递品信息
		if (lj.getJdpxx() != null) {
			params.put("jdpxx", lj.getJdpxx());
		}
		// 登记时间
		if (lj.getLjsjf() != null) {
			params.put("ljsjf", lj.getLjsjf());
		}
		if (lj.getLjsjt() != null) {
			params.put("ljsjt", lj.getLjsjt());
		}
		if (lj.getGadqydcxqbbz() != null) {
			params.put("gadqydcxqbbz", lj.getGadqydcxqbbz());
		}
		Page pageinfo = ljjbxxService.gadjdpxxForPage(params, pagesize,
				pagerow, sort, dir);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lLjjbxx = pageinfo.getData();

		if (lj.getYwcxbz().equals("qydjdywxxcx")) {
			setTableDate_qydjdpxxcx(pageinfo.getData());
		} else if (lj.getYwcxbz().equals("gadjdywxxcx")) {
			setTableDate_gadjdpxxcx(pageinfo.getData());
		}

		this.result = "success";
		return SUCCESS;
	}

	/*** 公安端寄递品信息setable方法 ***/
	private void setTableDate_gadjdpxxcx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("djxh");
		lPro.add("qymc");// --
		lPro.add("wldh");
		lPro.add("jjrxm");// --
		lPro.add("jjrzjhm");// --
		lPro.add("sjrxm");// --
		lPro.add("jdpdlxmc");// --
		lPro.add("jdplxmc");// --
		lPro.add("ljtbsj");

		List lCol = new ArrayList();

		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		for (Ljjbxx lj : lData) {
			lj.setQymc(lj.getQyjbxx().getQymc());// 企业名称
			lj.setJjrxm(lj.getJjr().getXm());// 寄件人姓名
			lj.setJjrzjhm(lj.getJjr().getZjhm());// 寄件人证件号码
			lj.setSjrxm(lj.getSjr().getXm());// 收件人姓名
			lj.setJdpdlxmc(lj.getJdpxx().getJdpdlxmc());// 寄递品大类型名称
			lj.setJdplxmc(lj.getJdpxx().getJdplxmc());// 寄递品小类型名称
		}

		Ljjbxx setLjxx = new Ljjbxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/*** 企业端 可疑寄递物品信息查询 setable方法 ***/
	private void setTableDate_qydjdpxxcx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("jdpxxid");
		lPro.add("jdpxxid");// --
		lPro.add("djxh");
		lPro.add("jdpmc");// --
		lPro.add("wldh");
		lPro.add("jjrxm");// --
		lPro.add("jjrzjlx");// --
		lPro.add("jjrzjhm");// --
		lPro.add("ljyxm");// --
		lPro.add("ljtbsj");

		List lCol = new ArrayList();

		List lky = new ArrayList();
		lky.add("setLjxxKy");
		lky.add("可疑");
		lCol.add(lky);

		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		for (Ljjbxx lj : lData) {
			lj.setJdpxxid(lj.getJdpxx().getId());// 寄递品信息ID
			lj.setJdpmc(lj.getJdpxx().getJdpmc());// 寄递品名称
			lj.setJjrxm(lj.getJjr().getXm());// 寄件人姓名
			if (lj.getJjr().getZjlx().equals("11")) {
				lj.setJjrzjlx("身份证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("13")) {
				lj.setJjrzjlx("户口薄");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("90")) {
				lj.setJjrzjlx("军官证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("91")) {
				lj.setJjrzjlx("警官证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("92")) {
				lj.setJjrzjlx("士兵证");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("93")) {
				lj.setJjrzjlx("护照");// 寄件人证件类型
			}
			if (lj.getJjr().getZjlx().equals("99")) {
				lj.setJjrzjlx("其他");// 寄件人证件类型
			}
			lj.setJjrzjhm(lj.getJjr().getZjhm());// 寄件人证件号码
			lj.setLjyxm(lj.getLjr().getXm());// 揽件人姓名

		}

		Ljjbxx setLjxx = new Ljjbxx();
		// this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/***
	 * 验证物流单号在指定企业内是否可用。
	 * 
	 * @return result=success 表示可用, 否则不可用。
	 * @throws Exception
	 */
	public String isAvailableWldh() throws Exception {
		try {
			if (lj == null || lj.getQyjbxx() == null)
				throw new RuntimeException("验证物流单号是否可用，参数传递错误");
			boolean res = ljjbxxService.isAvailableWldh(lj.getQyjbxx()
					.getQybm(), lj.getWldh());
			if (res)
				result = SUCCESS;
			else
				result = "该物流单号已存在不可用";
		} catch (RuntimeException e) {
			e.printStackTrace();
			log.debug(e, e.fillInStackTrace());
			result = e.getMessage();
		}

		return SUCCESS;
	}

	// /***
	// * 揽件信息导出，企业端
	// *
	// */
	// public String queryljxxdc() throws Exception {
	//
	// HttpServletResponse response = ServletActionContext.getResponse();
	// String sFileName = (new
	// StringBuilder(DateToString.getDateTimeNoFormat14(new
	// Date()))).append(".xls").toString();
	// String excelExportPath =
	// ServletActionContext.getRequest().getRealPath("Excel");
	// ActionContext ctx = ActionContext.getContext();
	// HttpServletRequest request = (HttpServletRequest)
	// ctx.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
	// HttpSession session = request.getSession();
	// //如果派件查询参数不为空的话，配置数据库的查询参数
	// Map<String, Object> params = new HashMap<String, Object>();
	// params = (Map) session.getAttribute("Ljjbxxdaoc");
	//
	// Page pageinfo = ljjbxxService.findLjjbxxForPage(params, 1, 99999999, sort
	// , dir);
	// totalpage = pageinfo.getTotalPages();
	// totalrows = pageinfo.getTotalRows();
	// lLjjbxx = pageinfo.getData();
	// //创建excel工作簿
	// HSSFWorkbook workbook = new HSSFWorkbook();
	// HSSFSheet sheet = workbook.createSheet();
	// HSSFRow row = null;
	// if (sheet.getRow(0) == null) {
	// row = sheet.createRow(0);
	// for (int i = 0; i <= 11; i++) {
	// row.createCell(i);
	// }
	// }
	// row.getCell(0).setCellValue("登记序号");
	// row.getCell(1).setCellValue("物流单号");
	// row.getCell(2).setCellValue("寄件人姓名");
	// row.getCell(3).setCellValue("证件类型");
	// row.getCell(4).setCellValue("证件号码");
	// row.getCell(5).setCellValue("揽件员");
	// row.getCell(6).setCellValue("登记时间");
	//
	// SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	// Ljjbxx setLjjbxx = null;
	// for (int i = 1; i <= lLjjbxx.size(); i++) {
	// if (sheet.getRow(i) == null) {
	// row = sheet.createRow(i);
	// for (int j = 0; j <= 11; j++) {
	// row.createCell(j);
	// }
	// }
	// setLjjbxx = (Ljjbxx) lLjjbxx.get(i - 1);
	// if (setLjjbxx.getDjxh() != null)
	// row.getCell(0).setCellValue(setLjjbxx.getDjxh());
	// if (setLjjbxx.getWldh() != null)
	// row.getCell(1).setCellValue(setLjjbxx.getWldh());
	// if (setLjjbxx.getLjtbr() != null) {
	// row.getCell(2).setCellValue(df.format(setLjjbxx.getLjtbr()));
	// }
	//
	// }
	// if (!(new File(excelExportPath)).isDirectory())
	// (new File(excelExportPath)).mkdir();
	// String sExcelName = (new StringBuilder(String.valueOf(excelExportPath)))
	// .append("\\").append(sFileName).toString();
	// excelExportPath = sExcelName;
	// File excleFile = new File(sExcelName);
	// if (!excleFile.exists()) {
	// excleFile.createNewFile();
	// }
	// FileOutputStream fOut = new FileOutputStream(excleFile);
	// workbook.write(fOut);
	// fOut.flush();
	// fOut.close();
	//
	// excelFilePath = (new
	// StringBuilder("Excel/")).append(sFileName).toString();
	// response.setContentType("text/html; charset=UTF-8");
	// response.sendRedirect((new
	// StringBuilder(String.valueOf(request.getContextPath()))).append("/Excel/").append(sFileName).toString());
	// this.result = "success";
	// return "success";
	// }
	/***
	 * 揽件信息导出时的查询，企业端
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querycxForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("Ljjbxxdaocjg");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			// 如果派件查询参数不为空的话，配置数据库的查询参数
			Map<String, Object> params = new HashMap<String, Object>();
			params = (Map) session.getAttribute("Ljjbxxdaoc");

			// Page pageinfo = ljjbxxService.findLjjbxxForPage(params, 1,
			// Integer.parseInt(maxRows), sort , dir);
			Page pageinfo = ljjbxxService.findLjjbxxForPage(params, 1,
					Integer.parseInt(maxRows), sort, dir);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			// dictFanYi(pageinfo.getData());
			lLjjbxx = pageinfo.getData();
			for (Ljjbxx lj : lLjjbxx) {
				lj.setJjrxm(lj.getJjr().getXm());// 寄件人姓名
				if (lj.getJjr().getZjlx().equals("11")) {
					lj.setJjrzjlx("身份证");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("13")) {
					lj.setJjrzjlx("户口薄");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("90")) {
					lj.setJjrzjlx("军官证");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("91")) {
					lj.setJjrzjlx("警官证");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("92")) {
					lj.setJjrzjlx("士兵证");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("93")) {
					lj.setJjrzjlx("护照");// 寄件人证件类型
				}
				if (lj.getJjr().getZjlx().equals("99")) {
					lj.setJjrzjlx("其他");// 寄件人证件类型
				}
				lj.setJjrzjhm(lj.getJjr().getZjhm());// 寄件人证件号码
				lj.setLjyxm(lj.getLjr().getXm());// 揽件人姓名

			}
			session.setAttribute("Ljjbxxdaocjg", lLjjbxx);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/***
	 * 揽件信息导出
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
			List qyryList = (List) session.getAttribute("Ljjbxxdaocjg");
			Ljjbxx setLjjbxx = new Ljjbxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qyryList);
			lResult.add(setLjjbxx);
			this.setExcelCreate("Ljxx", lResult);
			this.result = "ok";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		}
	}

	/***
	 * 揽件寄递物品导出时的查询，公安端
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querycxForExportgad() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("Ljjdwpxxgad");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			// 如果派件查询参数不为空的话，配置数据库的查询参数
			Map<String, Object> params = new HashMap<String, Object>();

			// 管辖单位编码、企业名称
			if (lj.getQyjbxx() != null) {
				if (lj.getQyjbxx().getGxdwbm() != null) {
					lj.getQyjbxx().setGxdwbm(
							StringUtil.trimEven0(lj.getQyjbxx().getGxdwbm()));
				}
				params.put("qyjbxx", lj.getQyjbxx());
			}
			// 揽件基本信息 物流单号
			if (lj.getWldh() != null) {
				params.put("wldh", lj.getWldh());
			}
			// 寄件人
			if (lj.getJjr() != null) {
				params.put("jjr", lj.getJjr());
			}
			// 收件人
			if (lj.getSjr() != null) {
				params.put("sjr", lj.getSjr());
			}
			// 寄递品信息
			if (lj.getJdpxx() != null) {
				params.put("jdpxx", lj.getJdpxx());
			}
			// 登记时间
			if (lj.getLjsjf() != null) {
				params.put("ljsjf", lj.getLjsjf());
			}
			if (lj.getLjsjt() != null) {
				params.put("ljsjt", lj.getLjsjt());
			}
			if (lj.getGadqydcxqbbz() != null) {
				params.put("gadqydcxqbbz", lj.getGadqydcxqbbz());
			}
			Page pageinfo = ljjbxxService.gadjdpxxForPage(params, 1,
					Integer.parseInt(maxRows), sort, dir);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lLjjbxx = pageinfo.getData();
			for (Ljjbxx lj : lLjjbxx) {
				lj.setQymc(lj.getQyjbxx().getQymc());// 企业名称
				lj.setJjrxm(lj.getJjr().getXm());// 寄件人姓名
				lj.setJjrzjhm(lj.getJjr().getZjhm());// 寄件人证件号码
				lj.setSjrxm(lj.getSjr().getXm());// 收件人姓名
				lj.setJdpdlxmc(lj.getJdpxx().getJdpdlxmc());// 寄递品大类型名称
				lj.setJdplxmc(lj.getJdpxx().getJdplxmc());// 寄递品小类型名称
			}
			session.setAttribute("Ljjdwpxxgad", lLjjbxx);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/***
	 * 揽件寄递物品导出时的查询，公安端
	 */
	public void exportExcelgad() throws Exception {
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
			List qyryList = (List) session.getAttribute("Ljjdwpxxgad");
			Ljjbxx setLjjbxx = new Ljjbxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qyryList);
			lResult.add(setLjjbxx);
			this.setExcelCreate("Ljxx", lResult);
			this.result = "ok";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		}
	}
	// /**
	// * 翻译字典项
	// */
	// public void dictFanYi(List queryList){
	// String displayName;
	// if(queryList!=null&&queryList.size()>0){
	// Map jlztMap = new HashMap();
	// Dict_item dict_item = new Dict_item();
	// dict_item.setDict_code("dm_jlzt");
	// dict_item.setItem_allpin("");
	// dict_item.setItem_simplepin("");
	// dict_item.setFact_value("");
	// dict_item.setDisplay_name("");
	// dict_item.setAppend_value("");
	// List list = CacheManager.getCacheDictitem(dict_item);
	// if(list!=null&&list.size()>0){
	// for(int index=0,max=list.size();index<max;index++){
	// Dict_item temp = (Dict_item)list.get(index);
	// jlztMap.put(temp.getFact_value(), temp.getDisplay_name());
	// }
	// }
	//
	// }
	// }
}
