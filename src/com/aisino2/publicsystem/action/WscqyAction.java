package com.aisino2.publicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Wscqy;
import com.aisino2.publicsystem.service.IWscqyService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Globalpar;
import com.aisino2.sysadmin.domain.User;
import com.aisino2.common.DateToString;
import com.aisino2.common.DepartmentUtil;
import com.aisino2.publicsystem.domain.Qyyyrztj;
import com.opensymphony.xwork2.ActionContext;
public class WscqyAction extends PageAction{
	private IWscqyService wscqyService;
	private List lWscqy=new ArrayList();
	private Wscqy wscqy=new Wscqy();
	private String tabledata="";
	private int totalrows=0;
	private String result="";
	
	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getTabledata() {
		return tabledata;
	}

	public Wscqy getWscqy() {
		return wscqy;
	}
	
	public List getLWscqy() {
		return lWscqy;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setWscqyService(IWscqyService wscqyService) {
		this.wscqyService = wscqyService;
	}
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("wscqyid");
		lPro.add("hylbdm");
		lPro.add("hylb");
		lPro.add("wscrq");
		lPro.add("dsjgdm");
		lPro.add("dsjgmc");
		lPro.add("fxjdm");
		lPro.add("fxjmc");
		lPro.add("gxdwdm");
		lPro.add("gxdwmc");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("lxdh");
		lPro.add("ztdm");

    	
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("setDelete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Wscqy getWscqy=new Wscqy();
    	
        this.setData(getWscqy,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	
//上传不充分

	
	public void setTabledatawsc(List lData,Wscqy getWscqys,String flag) throws Exception{
		List lPro=new ArrayList();
		
		 if("1".equals(getWscqys.getGxdwbz())){
			lPro.add("gxdwdm");
			lPro.add("gxdwmc");
		} else if("1".equals(getWscqys.getFxjbz())){
			lPro.add("fxjdm");
			lPro.add("fxjmc");
		} else if("1".equals(getWscqys.getDsjgbz())){
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		}else{
			 lPro.add("qybm");
		}  
		   lPro.add("qybm");
		   lPro.add("qymc");
		   lPro.add("wscts");
		   lPro.add("yljts");
		   lPro.add("nljts");

		
    	  List lCol=new ArrayList();
    
    		Wscqy getWscqy=new Wscqy();
    	

    	
        this.setData(getWscqy,lData,lPro,lCol);
    	
  
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	
	
	public String querylist() throws Exception{
    
        
        try {
            Wscqy setWscqy=new Wscqy();
            setWscqy = (Wscqy)this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			
			map.put("qsrq", setWscqy.getQssj());
			map.put("jzrq", setWscqy.getJzsj());
			map.put("hylbdm", setWscqy.getHylbdm());
			
			
			map.put("ztdm", setWscqy.getZtdm());
		
			map.put("shenheFlagCx", "yes");//统计已审核的
			map.put("sftjyg",  "1");//是否统计异构系统，1统计，0不统计
		    map.put("scbzFlagCx",  "yes");//删除标志等于0的

			map.put("yyzt", "yes");//只显示装机开业

			  
			
	        Page page = wscqyService.getListForPage(map, pagesize, pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        setTabledatawsc(page.getData(),setWscqy,"all"); 
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
		}
      return "success";
        
        
        
    }
	

	
	public String querylistExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
		    Wscqy setWscqy=new Wscqy();
			
			
			
		    setWscqy = (Wscqy)this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
	
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
	
			map.put("qsrq", setWscqy.getQssj());
			map.put("jzrq", setWscqy.getJzsj());
			map.put("hylbdm", setWscqy.getHylbdm());
			
			

			
			map.put("ztdm", setWscqy.getZtdm());
		
			map.put("shenheFlagCx", "yes");//统计已审核的
		    map.put("scbzFlagCx",  "yes");//删除标志等于0的

			map.put("yyzt", "yes");//只显示装机开业

			
		      Page page = wscqyService.getListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("wscqyList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
	}
	
	public void querylistExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			  Wscqy setWscqy=new Wscqy();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("wscqyList"));
			lResult.add(setWscqy);
			this.setExcelCreate("fileName",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	
	
	
	

	
	
	//场所未上传统计详细

	
	public void setTabledatawscxx(List lData,Wscqy getWscqys,String flag) throws Exception{
		List lPro=new ArrayList();
		
		 if("1".equals(getWscqys.getGxdwbz())){
			lPro.add("gxdwdm");
			lPro.add("gxdwmc");
		} else if("1".equals(getWscqys.getFxjbz())){
			lPro.add("fxjdm");
			lPro.add("fxjmc");
		} else if("1".equals(getWscqys.getDsjgbz())){
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		}else{
			 lPro.add("qybm");
		}  
		   lPro.add("qybm");
		   lPro.add("qymc");
		   lPro.add("wscrq");
		

		
    	  List lCol=new ArrayList();
    	
    	  Wscqy getWscqy=new Wscqy();
        this.setData(getWscqy,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	
	public String querylistxx() throws Exception{
		try {
			Wscqy setWscqy=new Wscqy();
			setWscqy = (Wscqy)this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			
			map.put("qsrq", setWscqy.getQssj());
			map.put("jzrq", setWscqy.getJzsj());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qybm", setWscqy.getQybm());
			
			map.put("ztdm", setWscqy.getZtdm());
		
			map.put("shenheFlagCx", "yes");//统计已审核的
		    map.put("scbzFlagCx",  "yes");//删除标志等于0的

			map.put("yyzt", "yes");//只显示装机开业

			  
			
	        Page page = wscqyService.getXxListForPage(map, pagesize, pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        setTabledatawscxx(page.getData(),setWscqy,"all"); 
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
		}
      return "success";
		
    }
	
	
	
	
	public String querylistExcelTempxx(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
			Wscqy setWscqy=new Wscqy();
			setWscqy = (Wscqy)this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
	
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
	
			map.put("qsrq", setWscqy.getQssj());
			map.put("jzrq", setWscqy.getJzsj());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qybm", setWscqy.getQybm());
			

			
			map.put("ztdm", setWscqy.getZtdm());
		
			map.put("shenheFlagCx", "yes");//统计已审核的
		    map.put("scbzFlagCx",  "yes");//删除标志等于0的

			map.put("yyzt", "yes");//只显示装机开业

			
		    Page page = wscqyService.getXxListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("wscqyxxList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querylistExcelxx() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Wscqy setWscqy=new Wscqy();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("wscqyxxList"));
			lResult.add(setWscqy);
			this.setExcelCreate("fileName",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	 
	public String query() throws Exception{
		try {
			Wscqy setWscqy=new Wscqy();
			wscqy=(Wscqy)this.setClass(setWscqy, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        wscqy=wscqyService.getWscqy(wscqy);
        lWscqy.clear();
        lWscqy.add(wscqy);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Wscqy setWscqy=new Wscqy();
			wscqy=(Wscqy)this.setClass(setWscqy, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        wscqy=wscqyService.insertWscqy(wscqy);
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Wscqy setWscqy=new Wscqy();
			wscqy=(Wscqy)this.setClass(setWscqy, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        wscqyService.updateWscqy(wscqy);
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Wscqy setWscqy=new Wscqy();
			wscqy=(Wscqy)this.setClass(setWscqy, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        wscqyService.deleteWscqy(wscqy);
        this.result="success";
        return "success";
    }
	
	/**
	 * 未上传企业信息查询 采集点台账用
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryWscqyList() throws Exception {

		try {
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();

			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			map.put("deptCode", StringUtil.trimEven0(user.getDepartment().getDepartcode()));
			Page page = wscqyService.getWscqyListForPage(map, pagesize, pagerow,
					sort, dir);
			totalpage = page.getTotalPages();
			totalrows = page.getTotalRows();
			setWscqyTabledata(page.getData());
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = "";
		}
		return "success";
	}

	public void setWscqyTabledata(List wscqyList) throws Exception {
		List lPro = new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("qyzflmc");
		lPro.add("yyztmc");
		lPro.add("zrs");
		lPro.add("yljts");
		lPro.add("nljts");

		List lCol=new ArrayList();
		
		Wscqy getWscqy = new Wscqy();

		this.setData(getWscqy, wscqyList, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
	/**
	 * 企业刷卡统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querySkcstjList() throws Exception {

		try {
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			Page page = wscqyService.getSkcstjListForPage(map, pagesize, pagerow,
					sort, dir);
			totalpage = page.getTotalPages();
			totalrows = page.getTotalRows();
			setSkcstjTabledata(page.getData(),setWscqy);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = "";
		}
		return "success";
	}
	public void setSkcstjTabledata(List wscqyList,Wscqy setWscqy) throws Exception {
		List lPro = new ArrayList();
		if ("1".equals(setWscqy.getGxdwbz())) {
			lPro.add("gxdwdm");
		} else if ("1".equals(setWscqy.getFxjbz())) {
			lPro.add("fxjdm");
		} else if ("1".equals(setWscqy.getDsjgbz())) {
			lPro.add("dsjgdm");
		} else {
			lPro.add("dsjgdm");
		}
		lPro.add("dsjgmc");
		lPro.add("fxjmc");
		lPro.add("gxdwmc");
		lPro.add("qyzs");
		lPro.add("wscqys");
		lPro.add("scqys");
		List lCol=new ArrayList();
		Wscqy getWscqy = new Wscqy();
		this.setData(getWscqy, wscqyList, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	public String querySkcstjListExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			
		    Page page = wscqyService.getSkcstjListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("skcstjList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querySkcstjListExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Wscqy setWscqy=new Wscqy();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("skcstjList"));
			lResult.add(setWscqy);
			this.setExcelCreate("fileName",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	/**
	 * 企业刷卡未上传明细
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querySkwscmxList() throws Exception {

		try {
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			map.put("jlscbz", "0");
			Page page = wscqyService.getSkwscmxListForPage(map, pagesize, pagerow,
					sort, dir);
			totalpage = page.getTotalPages();
			totalrows = page.getTotalRows();
			setSkwscmxTabledata(page.getData(),setWscqy);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = "";
		}
		return "success";
	}
	public void setSkwscmxTabledata(List wscqyList,Wscqy setWscqy) throws Exception {
		List lPro=new ArrayList();
		lPro.add("qysctjid");
		lPro.add("tjrq");
		lPro.add("qymc");
		lPro.add("qybm");
		lPro.add("zrs");
		lPro.add("lxdh");
		lPro.add("qyzflmc");
		lPro.add("yyztmc");
		lPro.add("zajbmc");
		List lCol=new ArrayList();
		Wscqy getWscqy = new Wscqy();
		this.setData(getWscqy, wscqyList, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	//导出
	public String querySkwscmxListExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			map.put("jlscbz", "0");
		    Page page = wscqyService.getSkwscmxListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("SkwscmxList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querySkwscmxListExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Wscqy setWscqy=new Wscqy();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("SkwscmxList"));
			lResult.add(setWscqy);
			this.setExcelCreate("Skwsc",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	/**
	 * 企业刷卡上传明细
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querySkscmxList() throws Exception {

		try {
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			map.put("jlscbz", "1");
			Page page = wscqyService.getSkwscmxListForPage(map, pagesize, pagerow, sort, dir);
			totalpage = page.getTotalPages();
			totalrows = page.getTotalRows();
			setSkscmxTabledata(page.getData(),setWscqy);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = "";
		}
		return "success";
	}
	public void setSkscmxTabledata(List wscqyList,Wscqy setWscqy) throws Exception {
		List lPro=new ArrayList();
		lPro.add("qysctjid");
		lPro.add("tjrq");
		lPro.add("qymc");
		lPro.add("qybm");
		lPro.add("zrs");
		lPro.add("lxdh");
		lPro.add("qyzflmc");
		lPro.add("yyztmc");
		lPro.add("zajbmc");
		List lCol=new ArrayList();
		Wscqy getWscqy = new Wscqy();
		this.setData(getWscqy, wscqyList, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	//导出
	public String querySkscmxListExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
			Wscqy setWscqy = new Wscqy();
			setWscqy = (Wscqy) this.setClass(setWscqy, null);
			Map map = new HashMap();
			map.put("dsjgdm", setWscqy.getDsjgdm());
			map.put("fxjdm", setWscqy.getFxjdm());
			map.put("gxdwdm", setWscqy.getGxdwdm());
			map.put("dsjgbz", setWscqy.getDsjgbz());
			map.put("fxjbz", setWscqy.getFxjbz());
			map.put("gxdwbz", setWscqy.getGxdwbz());
			map.put("hylbdm", setWscqy.getHylbdm());
			map.put("qssj", setWscqy.getQssj());
			map.put("jzsj", setWscqy.getJzsj());
			map.put("jlscbz", "1");
		    Page page = wscqyService.getSkwscmxListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("SkscmxList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querySkscmxListExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Wscqy setWscqy=new Wscqy();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("SkscmxList"));
			lResult.add(setWscqy);
			this.setExcelCreate("Sksc",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	/**
	 * 企业刷卡统计——NEW
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querySkcstjList_New() throws Exception {

	    Wscqy setWscqy = new Wscqy();
	    setWscqy = (Wscqy)setClass(setWscqy, null);
	    Map map = new HashMap();
	    querylistmap(map, setWscqy);
	    Page page = this.wscqyService.getSkcstjListForPage_New(map, this.pagesize, 
	      this.pagerow, this.sort, this.dir);
	    this.totalpage = page.getTotalPages();
	    this.totalrows = page.getTotalRows();
	    this.lWscqy = page.getData();
	    int qyzs = 0;
	    int zjs = 0;
	    int sccss = 0;
	    int wsccss = 0;

	    Wscqy sumWscqy = new Wscqy();
	    for (java.util.Iterator iter = this.lWscqy.iterator(); iter.hasNext(); ) {
	      Wscqy oneWscqy = (Wscqy)iter.next();
	      qyzs += oneWscqy.getQyzs().intValue();
	      sccss += oneWscqy.getScqys().intValue();
	      wsccss += oneWscqy.getWscqys().intValue();
	      zjs += oneWscqy.getZjs().intValue();
	      if ((oneWscqy.getGxdwdm() != null) && 
	        (!oneWscqy.getGxdwdm().equals(""))) {
	        oneWscqy
	          .setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('" + 
	          oneWscqy.getGxdwdm() + "')>详细</a>");
	      } else if ((oneWscqy.getFxjdm() != null) && 
	        (!oneWscqy.getFxjdm().equals("")))
	      {
	        oneWscqy
	          .setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('" + 
	          oneWscqy.getFxjdm() + "')>详细</a>"); } else {
	        if ((oneWscqy.getDsjgdm() == null) || 
	          (oneWscqy.getDsjgdm().equals("")))
	          continue;
	        oneWscqy
	          .setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('" + 
	          oneWscqy.getDsjgdm() + "')>详细</a>");
	      }
	    }
	    sumWscqy.setQyzs(Integer.valueOf(qyzs));
	    sumWscqy.setScqys(Integer.valueOf(sccss));

	    sumWscqy.setWscqys(Integer.valueOf(wsccss));
	    sumWscqy.setZjs(Integer.valueOf(zjs));

	    if (qyzs == 0) {
	      sumWscqy.setScl(new Float(0.0D));
	    } else {
	      Float xzzjl = new Float(
	        Math.round(new Float(sccss).floatValue() / 
	        new Float(zjs).floatValue() * 10000.0F));
	      sumWscqy.setScl(Float.valueOf(xzzjl.floatValue() / 100.0F));
	    }

	    sumWscqy.setDsjgmc("总计");
	    if ("1".equals(setWscqy.getDsjgbz())) {
	      this.lWscqy.add(sumWscqy);
	    }

	    this.result = "success";

	    return "success";
	}

	/**
	 * 条件设置MAP
	 * 
	 * @return
	 * @throws Exception
	 */
	public Map querylistmap(Map map, Wscqy setWscqy) throws Exception {
	    map.put("dsjgdm", setWscqy.getDsjgdm());
	    map.put("fxjdm", setWscqy.getFxjdm());
	    map.put("gxdwdm", setWscqy.getGxdwdm());
	    map.put("dsjgbz", setWscqy.getDsjgbz());
	    map.put("fxjbz", setWscqy.getFxjbz());
	    map.put("gxdwbz", setWscqy.getGxdwbz());
	    map.put("hylbdm", setWscqy.getHylbdm());
	    map.put("qyzflbm", setWscqy.getQyzflbm());
	    map.put("qsrq", setWscqy.getQsrq());
	    map.put("jzrq", setWscqy.getJzrq());
	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest)ctx
	      .get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
	    HttpSession session = request.getSession();
	    User user = (User)session.getAttribute("userKey_user");
	    String departTemp = user.getDepartment().getDepartcode();
	    String DeptCode = departTemp;
	    if (!setWscqy.getDsjgdm().equals(""))
	      DeptCode = setWscqy.getDsjgdm();
	    if (!setWscqy.getFxjdm().equals(""))
	      DeptCode = setWscqy.getFxjdm();
	    if (!setWscqy.getGxdwdm().equals(""))
	      DeptCode = setWscqy.getGxdwdm();
	    map.put("deptcode", StringUtil.trimEven0(DeptCode));
	    if (DepartmentUtil.departIsZxs(departTemp))
	      map.put("iszxs", "1");
	    Integer deptlevel = null;
	    Integer mindeptlevel = null;
	    if (!DepartmentUtil.departIsZxs(departTemp)) {
	      if ("1".equals(setWscqy.getGxdwbz())) {
	        deptlevel = Integer.valueOf(5);
	        mindeptlevel = Integer.valueOf(3);
	      } else if ("1".equals(setWscqy.getFxjbz())) {
	        deptlevel = Integer.valueOf(4);
	        mindeptlevel = Integer.valueOf(3);
	      } else if ("1".equals(setWscqy.getDsjgbz())) {
	        deptlevel = Integer.valueOf(3);
	        mindeptlevel = Integer.valueOf(3);
	      } else {
	        deptlevel = Integer.valueOf(2);
	        mindeptlevel = Integer.valueOf(2);
	      }
	    }
	    else if ("1".equals(setWscqy.getGxdwbz())) {
	      deptlevel = Integer.valueOf(4);
	      mindeptlevel = Integer.valueOf(2);
	    } else if ("1".equals(setWscqy.getFxjbz())) {
	      deptlevel = Integer.valueOf(3);
	      mindeptlevel = Integer.valueOf(2);
	    } else if ("1".equals(setWscqy.getDsjgbz())) {
	      deptlevel = Integer.valueOf(2);
	      mindeptlevel = Integer.valueOf(2);
	    } else {
	      deptlevel = Integer.valueOf(2);
	      mindeptlevel = Integer.valueOf(2);
	    }

	    map.put("deptlevel", deptlevel);
	    map.put("mindeptlevel", mindeptlevel);

	    return map;
	}

	public void setTabledatatjmx(List lData, Map map) throws Exception {
	    List lPro = new ArrayList();
	    if (((String)map.get("gxdwbz")).equals("1"))
	      lPro.add("gxdwdm");
	    else if (((String)map.get("fxjbz")).equals("1"))
	      lPro.add("fxjdm");
	    else if (((String)map.get("dsjgbz")).equals("1"))
	      lPro.add("dsjgdm");
	    else {
	      lPro.add("dsjgdm");
	    }
	    lPro.add("tjrq");
	    lPro.add("zjs");
	    lPro.add("scqys");
	    lPro.add("scl");
	    lPro.add("wscqys");

	    List lCol = new ArrayList();
	    Wscqy getWscqy = new Wscqy();
	    setData(getWscqy, lData, lPro, lCol);
	    this.tabledata = getData();
	    this.totalrows = getTotalrows();
	}

	public String querySkcstjList_Newmx() throws Exception {
	    Wscqy setWscqy = new Wscqy();
	    setWscqy = (Wscqy)setClass(setWscqy, null);
	    Map map = new HashMap();
	    map.put("dsjgdm", setWscqy.getDsjgdm());
	    map.put("fxjdm", setWscqy.getFxjdm());
	    map.put("gxdwdm", setWscqy.getGxdwdm());
	    map.put("dsjgbz", setWscqy.getDsjgbz());
	    map.put("fxjbz", setWscqy.getFxjbz());
	    map.put("gxdwbz", setWscqy.getGxdwbz());
	    map.put("qyzflbm", setWscqy.getQyzflbm());
	    map.put("hylbdm", setWscqy.getHylbdm());
	    map.put("qsrq", setWscqy.getQsrq());
	    map.put("jzrq", setWscqy.getJzrq());
	    Page page = this.wscqyService.getSkcstjListForPage_Newxx(map, this.pagesize, 
	      this.pagerow, this.sort, this.dir);
	    this.totalpage = page.getTotalPages();
	    this.totalrows = page.getTotalRows();
	    this.lWscqy = page.getData();
	    if (this.lWscqy.size() > 0) {
	      int qyzs = 0;
	      int sccss = 0;
	      int wsccss = 0;
	      int zjs = 0;
	      int sbrs = 0;
	      Wscqy sumWscqy = new Wscqy();
	      for (java.util.Iterator iter = this.lWscqy.iterator(); iter.hasNext(); ) {
	        Wscqy oneWscqy = (Wscqy)iter.next();
	        qyzs += oneWscqy.getQyzs().intValue();
	        sccss += oneWscqy.getScqys().intValue();
	        wsccss += oneWscqy.getWscqys().intValue();
	        zjs += oneWscqy.getZjs().intValue();
	      }

	      sumWscqy.setQyzs(Integer.valueOf(qyzs));
	      sumWscqy.setScqys(Integer.valueOf(sccss));
	      sumWscqy.setWscqys(Integer.valueOf(wsccss));
	      sumWscqy.setZjs(Integer.valueOf(zjs));
	      sumWscqy.setTjrqString("总计");
	      if (qyzs == 0) {
	        sumWscqy.setScl(new Float(0.0D));
	      } else {
	        Float xzzjl = new Float(
	          Math.round(new Float(sccss).floatValue() / 
	          new Float(zjs).floatValue() * 10000.0F));
	        sumWscqy.setScl(Float.valueOf(xzzjl.floatValue() / 100.0F));
	      }

	      if ("1".equals(setWscqy.getDsjgbz())) {
	        this.lWscqy.add(sumWscqy);
	      }
	    }
	    setTabledatatjmx(this.lWscqy, map);
	    this.result = "success";
	    return "success";
	}

	public String querySkcstjListNewmxExcelTemp() {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpSession session = request.getSession();
	        Globalpar glo = getCacheGlobalpar("exportmaxrows");
	        String maxRows = glo.getGlobalparvalue();
	        Wscqy setWscqy = new Wscqy();
	        setWscqy = (Wscqy)setClass(setWscqy, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setWscqy.getDsjgdm());
	        map.put("fxjdm", setWscqy.getFxjdm());
	        map.put("gxdwdm", setWscqy.getGxdwdm());
	        map.put("dsjgbz", setWscqy.getDsjgbz());
	        map.put("fxjbz", setWscqy.getFxjbz());
	        map.put("gxdwbz", setWscqy.getGxdwbz());
	        map.put("hylbdm", setWscqy.getHylbdm());
		    map.put("qyzflbm", setWscqy.getQyzflbm());
		    map.put("qsrq", setWscqy.getQsrq());
	        map.put("jzrq", setWscqy.getJzrq());
	        Page page = this.wscqyService.getSkcstjListForPage_Newxx(map, 1, 
	          Integer.parseInt(maxRows), this.sort, this.dir);
	        this.totalpage = page.getTotalPages();
	        this.totalrows = page.getTotalRows();
	        this.lWscqy = page.getData();
	        if (this.lWscqy.size() > 0) {
	          int qyzs = 0;
	          int sccss = 0;
	          int wsccss = 0;
	          int zjs = 0;
	          int sbrs = 0;
	          Wscqy sumWscqy = new Wscqy();
	          for (java.util.Iterator iter = this.lWscqy.iterator(); iter
	            .hasNext(); )
	          {
	            Wscqy oneWscqy = (Wscqy)iter.next();
	            qyzs += oneWscqy.getQyzs().intValue();
	            sccss += oneWscqy.getScqys().intValue();
	            wsccss += oneWscqy.getWscqys().intValue();
	            zjs += oneWscqy.getZjs().intValue();
	          }

	          sumWscqy.setQyzs(Integer.valueOf(qyzs));
	          sumWscqy.setScqys(Integer.valueOf(sccss));
	          sumWscqy.setWscqys(Integer.valueOf(wsccss));
	          sumWscqy.setZjs(Integer.valueOf(zjs));
	          sumWscqy.setTjrqString("总计");

	          if (qyzs == 0) {
	            sumWscqy.setScl(new Float(0.0D));
	          } else {
	            Float xzzjl = new Float(
	              Math.round(new Float(sccss).floatValue() / 
	              new Float(zjs).floatValue() * 10000.0F));
	            sumWscqy.setScl(Float.valueOf(xzzjl.floatValue() / 100.0F));
	          }

	          if ("1".equals(setWscqy.getDsjgbz())) {
	            this.lWscqy.add(sumWscqy);
	          }
	        }
	        session.setAttribute("skcstj_newxxList", page.getData());
	      }
	      catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	        return "success";
	      }
	      this.result = "success";
	      return "success";
	}

	public void querySkcstjListNewmxExcel() throws Exception {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpServletResponse response = ServletActionContext.getResponse();
	        HttpSession session = request.getSession();
	        Qyyyrztj setWscqy = new Qyyyrztj();

	        String bbmc = request.getParameter("bbmc");
	        String tabletitle = request.getParameter("tabletitle");
	        List lResult = new ArrayList();

	        List lColumn = getExcelColumn(tabletitle);
	        lResult.add(bbmc);
	        lResult.add(lColumn);
	        lResult.add(response);
	        lResult.add((List)session.getAttribute("skcstj_newxxList"));
	        lResult.add(setWscqy);
	        setExcelCreate("scsktjmx", lResult);
	      } catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	      }
	      this.result = "success";
	}

	public void setTabledatasktj_qyzs(List lData, Map map) throws Exception {
	    List lPro = new ArrayList();
	    lPro.add("qysctjid");
	    lPro.add("qymc");
	    lPro.add("qybm");
	    lPro.add("lxdh");
	    lPro.add("qyzflmc");
	    lPro.add("yyztmc");
	    lPro.add("zjztmc");
	    lPro.add("gxdwmc");
	    lPro.add("zajbmc");

	    List lCol = new ArrayList();
	    Wscqy getWscqy = new Wscqy();
	    setData(getWscqy, lData, lPro, lCol);
	    this.tabledata = getData();
	    this.totalrows = getTotalrows();
	}

	public String querylistsktj_qyzs() throws Exception {
	    Wscqy setWscqy = new Wscqy();
	    setWscqy = (Wscqy)setClass(setWscqy, null);
	    Map map = new HashMap();
	    map.put("dsjgdm", setWscqy.getDsjgdm());
	    map.put("fxjdm", setWscqy.getFxjdm());
	    map.put("gxdwdm", setWscqy.getGxdwdm());
	    map.put("hylbdm", setWscqy.getHylbdm());
	    map.put("qyzflbm", setWscqy.getQyzflbm());
	    if ((setWscqy.getTjrqString() != null) && 
	      (!setWscqy.getTjrqString().equals("")) && 
	      (!setWscqy.getTjrqString().equals("总计"))) {
	      map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	    } else {
	      map.put("qsrq", setWscqy.getQsrq());
	      map.put("jzrq", setWscqy.getJzrq());
	    }
	    Page page = this.wscqyService.getlistsktj_qyzs(map, this.pagesize, this.pagerow, this.sort, 
	      this.dir);
	    this.totalpage = page.getTotalPages();
	    this.totalrows = page.getTotalRows();
	    this.lWscqy = page.getData();

	    setTabledatasktj_qyzs(this.lWscqy, map);
	    this.result = "success";
	    return "success";
	}

	public String querylistqyzsExcelTemp() {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpSession session = request.getSession();
	        Globalpar glo = getCacheGlobalpar("exportmaxrows");
	        String maxRows = glo.getGlobalparvalue();
	        Wscqy setWscqy = new Wscqy();
	        setWscqy = (Wscqy)setClass(setWscqy, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setWscqy.getDsjgdm());
	        map.put("fxjdm", setWscqy.getFxjdm());
	        map.put("gxdwdm", setWscqy.getGxdwdm());
	        map.put("hylbdm", setWscqy.getHylbdm());
		    map.put("qyzflbm", setWscqy.getQyzflbm());
		    if ((setWscqy.getTjrqString() != null) && 
	          (!setWscqy.getTjrqString().equals("")) && 
	          (!setWscqy.getTjrqString().equals("总计"))) {
	          map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	        } else {
	          map.put("qsrq", setWscqy.getQsrq());
	          map.put("jzrq", setWscqy.getJzrq());
	        }
	        Page page = this.wscqyService.getlistsktj_qyzs(map, 1, 
	          Integer.parseInt(maxRows), this.sort, this.dir);
	        this.totalpage = page.getTotalPages();
	        this.totalrows = page.getTotalRows();
	        session.setAttribute("skcstj_qyzsmxList", page.getData());
	      }
	      catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	        return "success";
	      }
	      this.result = "success";
	      return "success";

	}

	public void querylistqyzsExcel() throws Exception {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpServletResponse response = ServletActionContext.getResponse();
	        HttpSession session = request.getSession();
	        Qyyyrztj setWscqy = new Qyyyrztj();

	        String bbmc = request.getParameter("bbmc");
	        String tabletitle = request.getParameter("tabletitle");
	        List lResult = new ArrayList();

	        List lColumn = getExcelColumn(tabletitle);
	        lResult.add(bbmc);
	        lResult.add(lColumn);
	        lResult.add(response);
	        lResult.add((List)session.getAttribute("skcstj_qyzsmxList"));
	        lResult.add(setWscqy);
	        setExcelCreate("csskqyxxmx", lResult);
	      } catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	      }
	      this.result = "success";
	}

	public void setTabledatasktj_scqy(List lData, Map map) throws Exception {
	    List lPro = new ArrayList();
	    lPro.add("qysctjid");
	    lPro.add("tjrq");
	    lPro.add("qymc");
	    lPro.add("qybm");
	    lPro.add("lxdh");
	    lPro.add("qyzflmc");
	    lPro.add("yyztmc");
	    lPro.add("zjztmc");
	    lPro.add("gxdwmc");
	    lPro.add("zajbmc");

	    List lCol = new ArrayList();
	    Wscqy getWscqy = new Wscqy();
	    setData(getWscqy, lData, lPro, lCol);
	    this.tabledata = getData();
	    this.totalrows = getTotalrows();
	}

	/**
	 * 企业刷卡上传明细--上传企业明细
	 * 
	 * @return
	 * @throws Exception
	 */

	public String querylistsktjscqy() throws Exception {
	    Wscqy setWscqy = new Wscqy();
	    setWscqy = (Wscqy)setClass(setWscqy, null);
	    Map map = new HashMap();
	    map.put("dsjgdm", setWscqy.getDsjgdm());
	    map.put("fxjdm", setWscqy.getFxjdm());
	    map.put("gxdwdm", setWscqy.getGxdwdm());
	    map.put("hylbdm", setWscqy.getHylbdm());
	    map.put("jlscbz", "1");
	    map.put("qyzflbm", setWscqy.getQyzflbm());
	    if ((setWscqy.getTjrqString() != null) && 
	      (!setWscqy.getTjrqString().equals("")) && 
	      (!setWscqy.getTjrqString().equals("总计"))) {
	      map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	    } else {
	      map.put("qssj", setWscqy.getQsrq());
	      map.put("jzsj", setWscqy.getJzrq());
	    }

	    Page page = this.wscqyService.getSkwscmxListForPage(map, this.pagesize, this.pagerow, 
	      this.sort, this.dir);
	    this.totalpage = page.getTotalPages();
	    this.totalrows = page.getTotalRows();
	    this.lWscqy = page.getData();

	    setTabledatasktj_scqy(this.lWscqy, map);
	    this.result = "success";
	    return "success";
	}

	// 导出
	public String querylistsktjscqyExcelTemp() {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpSession session = request.getSession();
	        Globalpar glo = getCacheGlobalpar("exportmaxrows");
	        String maxRows = glo.getGlobalparvalue();

	        Wscqy setWscqy = new Wscqy();
	        setWscqy = (Wscqy)setClass(setWscqy, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setWscqy.getDsjgdm());
	        map.put("fxjdm", setWscqy.getFxjdm());
	        map.put("gxdwdm", setWscqy.getGxdwdm());
	        map.put("hylbdm", setWscqy.getHylbdm());
	        map.put("jlscbz", "1");
		    map.put("qyzflbm", setWscqy.getQyzflbm());
		    if ((setWscqy.getTjrqString() != null) && 
	          (!setWscqy.getTjrqString().equals("")) && 
	          (!setWscqy.getTjrqString().equals("总计"))) {
	          map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	        } else {
	          map.put("qssj", setWscqy.getQsrq());
	          map.put("jzsj", setWscqy.getJzrq());
	        }

	        Page page = this.wscqyService.getSkwscmxListForPage(map, 1, 
	          Integer.parseInt(maxRows), null, null);

	        session.setAttribute("querylistsktjscqy", page.getData());
	      }
	      catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	        return "success";
	      }
	      this.result = "success";
	      return "success";

	}

	public void querylistsktjscqyExcel() throws Exception {
		   try {
			      HttpServletRequest request = ServletActionContext.getRequest();
			      HttpServletResponse response = ServletActionContext.getResponse();
			      HttpSession session = request.getSession();
			      Wscqy setWscqy = new Wscqy();

			      String bbmc = request.getParameter("bbmc");
			      String tabletitle = request.getParameter("tabletitle");
			      List lResult = new ArrayList();

			      List lColumn = getExcelColumn(tabletitle);
			      lResult.add(bbmc);
			      lResult.add(lColumn);
			      lResult.add(response);
			      lResult.add((List)session.getAttribute("querylistsktjscqy"));
			      lResult.add(setWscqy);
			      setExcelCreate("Skscqy", lResult);
			    } catch (Exception e) {
			      e.printStackTrace();
			      this.result = "";
			    }
			    this.result = "success";
	}
	
	
	/**
	 * 企业刷卡上传明细--未上传企业明细
	 * 
	 * @return
	 * @throws Exception
	 */

	public String querylistsktjwscqy() throws Exception {
	    Wscqy setWscqy = new Wscqy();
	    setWscqy = (Wscqy)setClass(setWscqy, null);
	    Map map = new HashMap();
	    map.put("dsjgdm", setWscqy.getDsjgdm());
	    map.put("fxjdm", setWscqy.getFxjdm());
	    map.put("gxdwdm", setWscqy.getGxdwdm());
	    map.put("hylbdm", setWscqy.getHylbdm());
	    map.put("jlscbz", "0");
	    map.put("qyzflbm", setWscqy.getQyzflbm());
	    if ((setWscqy.getTjrqString() != null) && 
	      (!setWscqy.getTjrqString().equals("")) && 
	      (!setWscqy.getTjrqString().equals("总计"))) {
	      map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	    } else {
	      map.put("qssj", setWscqy.getQsrq());
	      map.put("jzsj", setWscqy.getJzrq());
	    }

	    Page page = this.wscqyService.getSkwscmxListForPage(map, this.pagesize, this.pagerow, 
	      this.sort, this.dir);
	    this.totalpage = page.getTotalPages();
	    this.totalrows = page.getTotalRows();
	    this.lWscqy = page.getData();

	    setTabledatasktj_scqy(this.lWscqy, map);
	    this.result = "success";
	    return "success";

	}

	// 导出
	public String querylistsktjwscqyExcelTemp() {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpSession session = request.getSession();
	        Globalpar glo = getCacheGlobalpar("exportmaxrows");
	        String maxRows = glo.getGlobalparvalue();

	        Wscqy setWscqy = new Wscqy();
	        setWscqy = (Wscqy)setClass(setWscqy, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setWscqy.getDsjgdm());
	        map.put("fxjdm", setWscqy.getFxjdm());
	        map.put("gxdwdm", setWscqy.getGxdwdm());
	        map.put("hylbdm", setWscqy.getHylbdm());
	        map.put("jlscbz", "0");
		    map.put("qyzflbm", setWscqy.getQyzflbm());
		    if ((setWscqy.getTjrqString() != null) && 
	          (!setWscqy.getTjrqString().equals("")) && 
	          (!setWscqy.getTjrqString().equals("总计"))) {
	          map.put("tjrq", DateToString.toDate(setWscqy.getTjrqString()));
	        } else {
	          map.put("qssj", setWscqy.getQsrq());
	          map.put("jzsj", setWscqy.getJzrq());
	        }

	        Page page = this.wscqyService.getSkwscmxListForPage(map, 1, 
	          Integer.parseInt(maxRows), null, null);
	        session.setAttribute("querylistsktjscqy", page.getData());
	      }
	      catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	        return "success";
	      }
	      this.result = "success";
	      return "success";

	}

	public void querylistsktjwscqyExcel() throws Exception {
	    try {
	        HttpServletRequest request = ServletActionContext.getRequest();
	        HttpServletResponse response = ServletActionContext.getResponse();
	        HttpSession session = request.getSession();
	        Wscqy setWscqy = new Wscqy();

	        String bbmc = request.getParameter("bbmc");
	        String tabletitle = request.getParameter("tabletitle");
	        List lResult = new ArrayList();

	        List lColumn = getExcelColumn(tabletitle);
	        lResult.add(bbmc);
	        lResult.add(lColumn);
	        lResult.add(response);
	        lResult.add((List)session.getAttribute("querylistsktjscqy"));
	        lResult.add(setWscqy);
	        setExcelCreate("Skscqy", lResult);
	      } catch (Exception e) {
	        e.printStackTrace();
	        this.result = "";
	      }
	      this.result = "success";

	}
}