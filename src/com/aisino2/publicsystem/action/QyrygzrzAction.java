package com.aisino2.publicsystem.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Qyrygzrz;
import com.aisino2.publicsystem.service.IQyrygzrzService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class QyrygzrzAction extends PageAction{
	private IQyrygzrzService qyrygzrzService;
	private List lQyrygzrz=new ArrayList();
	private Qyrygzrz qyrygzrz=new Qyrygzrz();
	private String tabledata="";
	private int totalrows=0;
	private String result="success";
	
	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getTabledata() {
		return tabledata;
	}

	public Qyrygzrz getQyrygzrz() {
		return qyrygzrz;
	}
	
	public List getLQyrygzrz() {
		return lQyrygzrz;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setQyrygzrzService(IQyrygzrzService qyrygzrzService) {
		this.qyrygzrzService = qyrygzrzService;
	}
	
	public void setTabledataGad(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qyrygzrzid");
		lPro.add("cyrybh");
		lPro.add("xm");
		lPro.add("gzkssj");
		lPro.add("gzjssj");
		lPro.add("gwxx");
		lPro.add("jydz");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("gxdwmc");
    	
    	List lCol=new ArrayList();
    	Qyrygzrz getQyrygzrz=new Qyrygzrz();
        this.setData(getQyrygzrz,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qyid");
		lPro.add("cyrybh");
		lPro.add("xm");
		lPro.add("zjhm");
		lPro.add("gzkssj");
		lPro.add("gzjssj");
		lPro.add("gwxx");
		lPro.add("cylb");
		lPro.add("jydz");
    	
    	List lCol=new ArrayList();
    	Qyrygzrz getQyrygzrz=new Qyrygzrz();
        this.setData(getQyrygzrz,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylistGad() throws Exception{
		try {
			Qyrygzrz setQyrygzrz = new Qyrygzrz();
			setQyrygzrz = (Qyrygzrz)this.setClass(setQyrygzrz, null);
			Map map = new HashMap();
			map.put("ryid", setQyrygzrz.getRyid());
			map.put("zjhm", setQyrygzrz.getZjhm());
			map.put("zjhmjqcx", setQyrygzrz.getZjhmjqcx());//2011-05-20国内外人员查询，工作人员日志链接证件号码精确查询
			map.put("qybm", setQyrygzrz.getQybm());
			map.put("qymc", setQyrygzrz.getQymc());
			map.put("xm", setQyrygzrz.getXm());
			map.put("allhylbdm",setQyrygzrz.getAllhylbdm());
			/*
			map.put("gzrqf", setQyrygzrz.getGzrqf());
			map.put("gzrqt", setQyrygzrz.getGzrqt());
			*/
			map.put("gzkssj", setQyrygzrz.getGzkssj());
			map.put("gzjssj", setQyrygzrz.getGzjssj());
 
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			map.put("gxdwbm", StringUtil.trimEven0(user.getDepartment().getDepartcode()));
			Page page = qyrygzrzService.getListForPageGad(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
			totalrows=page.getTotalRows();
			setTabledataGad(page.getData()); 
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String querylistQyd() throws Exception{
		try {
			Qyrygzrz setQyrygzrz = new Qyrygzrz();
			setQyrygzrz = (Qyrygzrz)this.setClass(setQyrygzrz, null);
			String kh = setQyrygzrz.getKh();
			
			Map map = new HashMap();
			if(kh!=null&&!"".equals(kh)){
				map.put("isJoinIcksl", "1");
				map.put("kh", kh);
			}
			map.put("qybm", setQyrygzrz.getQybm());
			//map.put("hylbdm", "J");
			map.put("zjhm", setQyrygzrz.getZjhm());
			map.put("xm", setQyrygzrz.getXm());
			map.put("gzrqf", setQyrygzrz.getGzrqf());
			map.put("gzrqt", setQyrygzrz.getGzrqt());
			map.put("cyrybh", setQyrygzrz.getCyrybh());
			Page page = qyrygzrzService.getListForPage(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
			totalrows=page.getTotalRows();
			setTabledata(page.getData()); 
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	
	/**
	 * 企业端，从业人员工作日志信息查询导出功能
	 * 
	 * @param lData
	 * @throws Exception
	 */
	public String queryqyrygzrzxxForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("QyrygzrzxxExportResult");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			Qyrygzrz setQyrygzrz = new Qyrygzrz();
			setQyrygzrz = (Qyrygzrz) this.setClass(setQyrygzrz, null);
			String kh = setQyrygzrz.getKh();
			Map map = new HashMap();
			if (kh != null && !"".equals(kh)) {
				map.put("isJoinIcksl", "1");
				map.put("kh", kh);
			}
			map.put("qybm", setQyrygzrz.getQybm());
			map.put("zjhm", setQyrygzrz.getZjhm());
			map.put("xm", setQyrygzrz.getXm());
			map.put("gzrqf", setQyrygzrz.getGzrqf());
			map.put("gzrqt", setQyrygzrz.getGzrqt());
			map.put("cyrybh", setQyrygzrz.getCyrybh());
			Page page = qyrygzrzService.getListForPage(map, 1, Integer
					.parseInt(maxRows), sort, dir);
			session.setAttribute("QyrygzrzxxExportResult", page.getData());
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/**
	 * 导出excel
	 * 
	 * @param lData
	 * @throws Exception
	 */
	public void exportqyrygzrzxxExcel() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		Qyrygzrz setQyrygzrz = new Qyrygzrz();
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList();
			List qyrygzrzxxList = (List) session
					.getAttribute("QyrygzrzxxExportResult");
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qyrygzrzxxList);
			lResult.add(setQyrygzrz);
			this.setExcelCreate("Qyrygzrz", lResult);
			this.result = "ok";
		} catch (IOException e) {
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}

	}
	
	public String query() throws Exception{
		try {
			Qyrygzrz setQyrygzrz=new Qyrygzrz();
			qyrygzrz=(Qyrygzrz)this.setClass(setQyrygzrz, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qyrygzrz=qyrygzrzService.getQyrygzrz(qyrygzrz);
        lQyrygzrz.clear();
        lQyrygzrz.add(qyrygzrz);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Qyrygzrz setQyrygzrz=new Qyrygzrz();
			qyrygzrz=(Qyrygzrz)this.setClass(setQyrygzrz, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qyrygzrz=qyrygzrzService.insertQyrygzrz(qyrygzrz);
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Qyrygzrz setQyrygzrz=new Qyrygzrz();
			qyrygzrz=(Qyrygzrz)this.setClass(setQyrygzrz, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qyrygzrzService.updateQyrygzrz(qyrygzrz);
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Qyrygzrz setQyrygzrz=new Qyrygzrz();
			qyrygzrz=(Qyrygzrz)this.setClass(setQyrygzrz, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qyrygzrzService.deleteQyrygzrz(qyrygzrz);
        this.result="success";
        return "success";
    }
	
	/**
	 * 企业人员工作日志查询 标准化公安端台账
	 * @return
	 */
	public String querylistGadTz() throws Exception{
		try {
			Map map = new HashMap();
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute(Constants.userKey);
			if(user!=null){
				String depertCode0 = StringUtil.trimEven0(user.getDepartment().getDepartcode());
				map.put("gxdwbm", depertCode0);
				Page page = qyrygzrzService.getListForPageGad(map, 1, 50,null,"DESC");
				lQyrygzrz = page.getData();
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
}