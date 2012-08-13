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

import com.aisino2.cache.CacheManager;
import com.aisino2.common.QjblUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qywywxx;
import com.aisino2.publicsystem.service.IQyjbxxService;
import com.aisino2.publicsystem.service.IQywywxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class QywywxxAction extends PageAction{
	private IQywywxxService qywywxxService;
	private IQyjbxxService qyjbxxService;
	private List lQywywxx=new ArrayList();
	private Qywywxx qywywxx=new Qywywxx();
	private String tabledata="";
	private int totalrows=0;
	private String result="";
	private int myPageSize;
	
	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getTabledata() {
		return tabledata;
	}

	public Qywywxx getQywywxx() {
		return qywywxx;
	}
	
	public List getLQywywxx() {
		return lQywywxx;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setQywywxxService(IQywywxxService qywywxxService) {
		this.qywywxxService = qywywxxService;
	}
	
	public void setQyjbxxService(IQyjbxxService qyjbxxService) {
		this.qyjbxxService = qyjbxxService;
	}
	
	public void translateDictZT(){
		if(lQywywxx!=null&&lQywywxx.size()>0){
			for(int index=0,max=lQywywxx.size();index<max;index++){
				Qywywxx tempQy = (Qywywxx)lQywywxx.get(index);
				Dict_item dict_item1=CacheManager.getCacheDictitemOne("dm_bez", tempQy.getSffsaj());
				Dict_item dict_item2=CacheManager.getCacheDictitemOne("dm_bez", tempQy.getSfglbmjc());
				if (dict_item1 != null){
					tempQy.setSffsaj(dict_item1.getDisplay_name());
				}
				if (dict_item2!=null){
					tempQy.setSfglbmjc(dict_item2.getDisplay_name());
				}
				lQywywxx.set(index, tempQy);
			}
		}
	}

	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qywywxxid");
		lPro.add("djrq");
		lPro.add("ksyysj");
		lPro.add("jsyysj");
		lPro.add("csfe");
		lPro.add("sffsaj");
		lPro.add("sfglbmjc");

    	
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	lModify.add("修改");
    	
    	List lDet=new ArrayList();
    	lDet.add("setQuery");
    	lDet.add("详情");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDet);
    	
    	Qywywxx getQywywxx=new Qywywxx();
    	
        this.setData(getQywywxx,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	//企业端查询
	public String querylist() throws Exception{
        Qywywxx setQywywxx=new Qywywxx();
        setQywywxx=(Qywywxx)this.setClass(setQywywxx, null);
        
        HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(Constants.userKey);
		
		Qyjbxx qyjbxx = new Qyjbxx();
		qyjbxx.setQybm(user.getUseraccount());
		qyjbxx=qyjbxxService.getQyjbxx(qyjbxx);
        Map map = new HashMap();
        map.put("qyid", qyjbxx.getQyid());
        map.put("ksyysj", setQywywxx.getKsyysj());
        map.put("jsyysj", setQywywxx.getJsyysj());
        map.put("zafzrxm", setQywywxx.getZafzrxm());
        Page page = qywywxxService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQywywxx=page.getData();
        translateDictZT();
        setTabledata(lQywywxx); 
		 this.result="success";
        return "success";
    }
	//公安端查询
	public String querylistgad() throws Exception{
		Qywywxx setQywywxx=new Qywywxx();
		Qyjbxx setQyjbxx= new Qyjbxx();
        setQywywxx=(Qywywxx)this.setClass(setQywywxx, null);
        
        Map map = new HashMap();
        map.put("hylbdm", setQywywxx.getHylbdm());
        map.put("qyzflbm", setQywywxx.getQyzflbm());
        map.put("gxdwbm", setQywywxx.getGxdwbm());
        map.put("qymc", setQywywxx.getQymc());
        map.put("ksyysj", setQywywxx.getKsyysj());
        map.put("jsyysj", setQywywxx.getJsyysj());
        Page page = qywywxxService.getgadListQywywxx(map, pagesize, pagerow, sort, dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQywywxx=page.getData();
        translateDictZT();
        setgadTabledata(lQywywxx);
        this.result="success";
		return "success";
	}
	
	public void setgadTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qywywxxid");
		lPro.add("djrq");
		lPro.add("ksyysj");
		lPro.add("jsyysj");
		lPro.add("gxdwmc");
		lPro.add("qymc");
		lPro.add("hylb");
		lPro.add("sffsaj");

    	Qywywxx getQywywxx=new Qywywxx();
    	
        this.setData(getQywywxx,lData,lPro,null);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	
	//企业端详情
	public String query() throws Exception{
		try {
			Qywywxx setQywywxx=new Qywywxx();
			qywywxx=(Qywywxx)this.setClass(setQywywxx, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qywywxx=qywywxxService.getQywywxx(qywywxx);
        lQywywxx.clear();
        lQywywxx.add(qywywxx);
		this.result="success";
        return "success";
    }
	
	//为添加页面中 “单位负责人”及“治安负责人”赋值
	public String queryfzry() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(Constants.userKey);
		try{
			Qyjbxx setQyjbxx = new Qyjbxx();
			setQyjbxx.setQybm(user.getUseraccount());
			setQyjbxx=qyjbxxService.getQyjbxx(setQyjbxx);
			lQywywxx.clear();
			lQywywxx.add(setQyjbxx);
		}catch(Exception e){
		    e.printStackTrace();
		}			
		this.result="success";
		return "success";
	}
	
	//添加企业无业务上报记录
	public String insert() throws Exception{
		try {
			Qywywxx setQywywxx=new Qywywxx();
			qywywxx=(Qywywxx)this.setClass(setQywywxx, null);
			qywywxx=qywywxxService.insertQywywxx(qywywxx);
	        if(qywywxx==null){
	        	this.result="该企业当日已经存在上报信息!";
	        }else{
	        	this.result="success";
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "success";
    }
	
	//修改
	public String modify() throws Exception{
		try {
			Qywywxx setQywywxx=new Qywywxx();
			qywywxx=(Qywywxx)this.setClass(setQywywxx, null);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        boolean bz=qywywxxService.updateQywywxx(qywywxx);
        if(bz==false){
        	this.result="该企业当日已经存在上报信息!";
        }else{
        	this.result="success";
        }
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Qywywxx setQywywxx=new Qywywxx();
			qywywxx=(Qywywxx)this.setClass(setQywywxx, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qywywxxService.deleteQywywxx(qywywxx);
        this.result="success";
        return "success";
    }
	
	
	public String querycxForExport() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("QywywxxExportResult");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if(maxRows == null || "".equals(maxRows)){
			maxRows = "0";
		}
		try{
			Qywywxx setQywywxx = new Qywywxx();
			qywywxx=(Qywywxx)this.setClass(setQywywxx, null);
			Map map = new HashMap();
			map.put("hylbdm", qywywxx.getHylbdm());
		    map.put("qyzflbm", qywywxx.getQyzflbm());
		    map.put("gxdwbm", qywywxx.getGxdwbm());
		    map.put("qymc", qywywxx.getQymc());
		    map.put("ksyysj", qywywxx.getKsyysj());
		    map.put("jsyysj", qywywxx.getJsyysj());
		    Page page = qywywxxService.getgadListQywywxx(map,1, Integer.parseInt(maxRows),sort,dir);
	        //myPageSize = pagesize;
	        //totalpage=page.getTotalPages();
	        //totalrows=page.getTotalRows();
	        lQywywxx=page.getData();  
	        translateDictZT();
	        
	        List lPro = new ArrayList();
	        lPro.add("djrq");
			lPro.add("ksyysj");
			lPro.add("jsyysj");
			lPro.add("gxdwmc");
			lPro.add("qymc");
			lPro.add("hylb");
			lPro.add("sffsaj");
			
			List lcache = new ArrayList();
			Qywywxx getQywywxx = new Qywywxx();
			lQywywxx = this.getResultCache(getQywywxx.getClass().getName(), lPro, lQywywxx, lcache);
	        session.setAttribute("QywywxxExportResult", lQywywxx);
	        this.result = "success";
		} catch (IOException e) {
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}
	
	//导出
	public void exportExcel() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.userKey);
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			// Excel输出
			List lResult = new ArrayList();
			List qywywxxList = (List) session.getAttribute("QywywxxExportResult");
			Qywywxx setQywywxx = new Qywywxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(qywywxxList);
			lResult.add(setQywywxx);
			this.setExcelCreate("qywywxx", lResult);
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
}