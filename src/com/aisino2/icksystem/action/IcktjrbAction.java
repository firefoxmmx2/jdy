package com.aisino2.icksystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.icksystem.domain.Icktjrb;
import com.aisino2.icksystem.service.IIcktjrbService;
import com.aisino2.sysadmin.domain.Globalpar;

public class IcktjrbAction extends PageAction{
	private IIcktjrbService icktjrbService;
	private List lIcktjrb=new ArrayList();
	private Icktjrb icktjrb=new Icktjrb();
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

	public Icktjrb getIcktjrb() {
		return icktjrb;
	}
	
	public List getLIcktjrb() {
		return lIcktjrb;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setIcktjrbService(IIcktjrbService icktjrbService) {
		this.icktjrbService = icktjrbService;
	}
	
	public void setTabledata(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		if ("1".equals((String)map.get("gxdwbz"))) {
			lPro.add("gxdwbm");
		} else if ("1".equals((String)map.get("fxjbz"))) {
			lPro.add("ssdxjgajgdm");
		} else if ("1".equals((String)map.get("dsjgbz"))) {
			lPro.add("ssddsjgdm");
		} else {
			lPro.add("ssddsjgdm");
		}
		lPro.add("ssddsjgmc");
		lPro.add("ssdxjgajgmc");
		lPro.add("gxdwmc");
		lPro.add("lrcss");
		lPro.add("lrcyrys");
		lPro.add("slicks");
		lPro.add("fficks");
		lPro.add("skicks");
		lPro.add("drskicks");
		List lCol=new ArrayList();    	
    	Icktjrb getIcktjrb=new Icktjrb();
        this.setData(getIcktjrb,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
        Icktjrb setIcktjrb=new Icktjrb();
        setIcktjrb = (Icktjrb) this.setClass(setIcktjrb, null);
        Map map = new HashMap();
        //将通用控件中各字段对应到数据表各字段
        map.put("ssddsjgdm", setIcktjrb.getDsjgdm());
		map.put("ssdxjgajgdm", setIcktjrb.getFxjdm());
		map.put("gxdwbm", setIcktjrb.getGxdwdm());
		map.put("dsjgbz", setIcktjrb.getDsjgbz());
		map.put("fxjbz", setIcktjrb.getFxjbz());
		map.put("gxdwbz", setIcktjrb.getGxdwbz());
		map.put("hylbdm", setIcktjrb.getHylbdm());
		map.put("tjrq", setIcktjrb.getTjrq());
        Page page = icktjrbService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lIcktjrb=page.getData();
        setTabledata(lIcktjrb,map); 
		 this.result="success";
        return "success";
    }
	//导出
	public String querylistExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			
			Icktjrb setIcktjrb=new Icktjrb();
	        setIcktjrb = (Icktjrb) this.setClass(setIcktjrb, null);
	        Map map = new HashMap();
	        //将通用控件中各字段对应到数据表各字段
	        map.put("ssddsjgdm", setIcktjrb.getDsjgdm());
			map.put("ssdxjgajgdm", setIcktjrb.getFxjdm());
			map.put("gxdwbm", setIcktjrb.getGxdwdm());
			map.put("dsjgbz", setIcktjrb.getDsjgbz());
			map.put("fxjbz", setIcktjrb.getFxjbz());
			map.put("gxdwbz", setIcktjrb.getGxdwbz());
			map.put("hylbdm", setIcktjrb.getHylbdm());
			map.put("tjrq", setIcktjrb.getTjrq());
		    Page page = icktjrbService.getListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("icktjList", page.getData());
			
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
			Icktjrb setIcktjrb=new Icktjrb();
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("icktjList"));
			lResult.add(setIcktjrb);
			this.setExcelCreate("icktj",lResult);  ////默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	//各场所统计明细
	public void setTabledatacsmx(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("zjztmc");
		lPro.add("gxdwmc");
		lPro.add("lrcyrys");
		lPro.add("slicks");
		lPro.add("fficks");
		lPro.add("skicks");
		lPro.add("drskicks");
		List lCol=new ArrayList();    	
    	Icktjrb getIcktjrb=new Icktjrb();
        this.setData(getIcktjrb,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylistcsmx() throws Exception{
        Icktjrb setIcktjrb=new Icktjrb();
        setIcktjrb = (Icktjrb) this.setClass(setIcktjrb, null);
        Map map = new HashMap();
        //将通用控件中各字段对应到数据表各字段
        map.put("ssddsjgdm", setIcktjrb.getDsjgdm());
		map.put("ssdxjgajgdm", setIcktjrb.getFxjdm());
		map.put("gxdwbm", setIcktjrb.getGxdwdm());
		map.put("dsjgbz", setIcktjrb.getDsjgbz());
		map.put("fxjbz", setIcktjrb.getFxjbz());
		map.put("gxdwbz", setIcktjrb.getGxdwbz());
		map.put("hylbdm", setIcktjrb.getHylbdm());
		map.put("tjrq", setIcktjrb.getTjrq());
        Page page = icktjrbService.getcsmxListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lIcktjrb=page.getData();
        setTabledatacsmx(lIcktjrb); 
		 this.result="success";
        return "success";
    }
	
	//导出
	public String querylistcsmxExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			Icktjrb setIcktjrb=new Icktjrb();
	        setIcktjrb = (Icktjrb) this.setClass(setIcktjrb, null);
	        Map map = new HashMap();
	        //将通用控件中各字段对应到数据表各字段
	        map.put("ssddsjgdm", setIcktjrb.getDsjgdm());
			map.put("ssdxjgajgdm", setIcktjrb.getFxjdm());
			map.put("gxdwbm", setIcktjrb.getGxdwdm());
			map.put("dsjgbz", setIcktjrb.getDsjgbz());
			map.put("fxjbz", setIcktjrb.getFxjbz());
			map.put("gxdwbz", setIcktjrb.getGxdwbz());
			map.put("hylbdm", setIcktjrb.getHylbdm());
			map.put("tjrq", setIcktjrb.getTjrq());
		    Page page = icktjrbService.getcsmxListForPage(map, 1, Integer.parseInt(maxRows),null,null);
			session.setAttribute("icktjcsmxList", page.getData());
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querylistcsmxExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Icktjrb setIcktjrb=new Icktjrb();
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("icktjcsmxList"));
			lResult.add(setIcktjrb);
			this.setExcelCreate("icktjcsmx",lResult);  ////默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	public String query() throws Exception{
		try {
			Icktjrb setIcktjrb=new Icktjrb();
			icktjrb=(Icktjrb)this.setClass(setIcktjrb, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        icktjrb=icktjrbService.getIcktjrb(icktjrb);
        lIcktjrb.clear();
        lIcktjrb.add(icktjrb);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Icktjrb setIcktjrb=new Icktjrb();
			icktjrb=(Icktjrb)this.setClass(setIcktjrb, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        icktjrb=icktjrbService.insertIcktjrb(icktjrb);
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Icktjrb setIcktjrb=new Icktjrb();
			icktjrb=(Icktjrb)this.setClass(setIcktjrb, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        icktjrbService.updateIcktjrb(icktjrb);
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Icktjrb setIcktjrb=new Icktjrb();
			icktjrb=(Icktjrb)this.setClass(setIcktjrb, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        icktjrbService.deleteIcktjrb(icktjrb);
        this.result="success";
        return "success";
    }
}