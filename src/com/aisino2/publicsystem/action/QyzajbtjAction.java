package com.aisino2.publicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Qyzajbtj;
import com.aisino2.publicsystem.service.IQyzajbtjService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class QyzajbtjAction extends PageAction{
	private IQyzajbtjService qyzajbtjService;
	private List lQyzajbtj = new ArrayList();
	private int totalrows = 0;
	private String result = "success";
	private String tabledata = "";
	public List getLQyzajbtj() {
		return lQyzajbtj;
	}
	public void setLQyzajbtj(List qyzajbtj) {
		lQyzajbtj = qyzajbtj;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public void setQyzajbtjService(IQyzajbtjService qyzajbtjService) {
		this.qyzajbtjService = qyzajbtjService;
	}
	
	
	public int getTotalrows() {
		return totalrows;
	}
	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	public String getTabledata() {
		return tabledata;
	}
	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
	}
	//企业治安级别统计查询
	public String querylist() throws Exception{
		try{
			Qyzajbtj setQyzajbtj = new Qyzajbtj();
			setQyzajbtj =(Qyzajbtj)this.setClass(setQyzajbtj, null);
			Map map = new HashMap();
			map.put("dsjgbz", setQyzajbtj.getDsjgbz());
			map.put("fxjbz", setQyzajbtj.getFxjbz());
			map.put("gxdwbz", setQyzajbtj.getGxdwbz());
			map.put("csbz", setQyzajbtj.getCsbz());
			map.put("dsjgdm", setQyzajbtj.getDsjgdm());
			map.put("fxjdm", setQyzajbtj.getFxjdm());
			map.put("gxdwdm", setQyzajbtj.getGxdwdm());
			map.put("qybm", setQyzajbtj.getCsbm());
			map.put("qssj", setQyzajbtj.getQssj());
			map.put("jzsj", setQyzajbtj.getJzsj());
			map.put("hylbdm", setQyzajbtj.getHylbdm());
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			String departTemp = user.getDepartment().getDepartcode();
			String sjName = "";// 市局名称(直辖市)
			String cityFlag="1";
			if(departTemp.substring(0,2).equals("11")){
				sjName = "北京市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("12")){
				sjName = "天津市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("31")){
				sjName = "上海市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("50")){
				sjName = "重庆市公安局";
				map.put("cityFlag", "1");
			}else{
				cityFlag="2";
			}
			Page page = qyzajbtjService.getQyzajbtjList(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyzajbtj=page.getData();
	        zuQyzajbtj(lQyzajbtj,setQyzajbtj,cityFlag);
			this.result = "success";
		}catch(Exception e){
			this.result="查询列表失败";
			e.printStackTrace();
		}
		return "success";
	}
	private void zuQyzajbtj(List lQyzajbtj,Qyzajbtj qyzajbtj,String cityFlag){
		String zagxjgdm="";
		String qybm="";
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session= request.getSession();
		User user= (User)session.getAttribute(Constants.userKey);
		String departTemp = user.getDepartment().getDepartcode();
	
		if(lQyzajbtj!=null&&lQyzajbtj.size()>0){
        	for(int i=0;i<lQyzajbtj.size();i++){
        		Qyzajbtj getQyzajbtj = (Qyzajbtj)lQyzajbtj.get(i);
        		if(getQyzajbtj.getQybm()!=null){
        			qybm = getQyzajbtj.getQybm();
        		}
        		if(getQyzajbtj.getGxdwdm()!=null){
        			zagxjgdm = getQyzajbtj.getGxdwdm();
        		}else if(getQyzajbtj.getFxjdm()!=null){
        			zagxjgdm = getQyzajbtj.getFxjdm();
        		}else if(getQyzajbtj.getDsjgdm()!=null){
        			zagxjgdm = getQyzajbtj.getDsjgdm();
        		}else{
        			zagxjgdm = departTemp;
        		}
        		if("1".equals(qyzajbtj.getGxdwbz())){
        			zagxjgdm = zagxjgdm.substring(0,8);
        		}else if("1".equals(qyzajbtj.getFxjbz())){
        			zagxjgdm = zagxjgdm.substring(0,6);
        		}else if("1".equals(qyzajbtj.getDsjgbz())&&"2".equals(cityFlag)){
        			zagxjgdm = zagxjgdm.substring(0,4);
        		}else{
        			zagxjgdm = zagxjgdm.substring(0,2);
        		}
        		getQyzajbtj.setAjc("<a href='#' class='hyperlink' onClick=query_qyjbxxlist('1','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getAjc()+"</a>");
        		getQyzajbtj.setBjc("<a href='#' class='hyperlink' onClick=query_qyjbxxlist('2','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getBjc()+"</a>");
        		getQyzajbtj.setCjc("<a href='#' class='hyperlink' onClick=query_qyjbxxlist('3','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getCjc()+"</a>");
        		getQyzajbtj.setQtc("<a href='#' class='hyperlink' onClick=query_qyjbxxlist('4','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getQtc()+"</a>");
        	}
        	}
	}
	
	public String qyjbxxlist() throws Exception{
		try{
			Qyzajbtj setQyzajbtj = new Qyzajbtj();
			setQyzajbtj =(Qyzajbtj)this.setClass(setQyzajbtj, null);
			Map map = new HashMap();
			map.put("qybm", setQyzajbtj.getQybm());
			map.put("gxdwdm", setQyzajbtj.getGxdwdm());
			map.put("hylbdm", setQyzajbtj.getHylbdm());
			map.put("zabdm", setQyzajbtj.getZabdm());
			map.put("qssj", setQyzajbtj.getQssj());
			map.put("jzsj", setQyzajbtj.getJzsj());
			Page page =	qyzajbtjService.getListForPageQyjbxx(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyzajbtj=page.getData();
	        setTabledata(lQyzajbtj); 
			this.result="success";
		}catch(Exception e){
			this.result="查询企业基本信息列表失败";
			e.printStackTrace();
			
		}
		return "success";
	}
	public void setTabledata(List lData) throws Exception{
		List lPro = new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		
		Qyzajbtj getQyzajbtj = new Qyzajbtj();
		this.setData(getQyzajbtj,lData,lPro,null);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	//企业治安级别变更统计查询
	public String querylistZajbbg() throws Exception{
		try{
			Qyzajbtj setQyzajbtj = new Qyzajbtj();
			setQyzajbtj =(Qyzajbtj)this.setClass(setQyzajbtj, null);
			Map map = new HashMap();
			map.put("dsjgbz", setQyzajbtj.getDsjgbz());
			map.put("fxjbz", setQyzajbtj.getFxjbz());
			map.put("gxdwbz", setQyzajbtj.getGxdwbz());
			map.put("csbz", setQyzajbtj.getCsbz());
			map.put("dsjgdm", setQyzajbtj.getDsjgdm());
			map.put("fxjdm", setQyzajbtj.getFxjdm());
			map.put("gxdwdm", setQyzajbtj.getGxdwdm());
			map.put("qybm", setQyzajbtj.getCsbm());
			map.put("qssj", setQyzajbtj.getQssj());
			map.put("jzsj", setQyzajbtj.getJzsj());
			map.put("hylbdm", setQyzajbtj.getHylbdm());
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			String departTemp = user.getDepartment().getDepartcode();
			String sjName = "";// 市局名称(直辖市)
			String cityFlag="1";
			if(departTemp.substring(0,2).equals("11")){
				sjName = "北京市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("12")){
				sjName = "天津市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("31")){
				sjName = "上海市公安局";
				map.put("cityFlag", "1");
			}else if(departTemp.substring(0,2).equals("50")){
				sjName = "重庆市公安局";
				map.put("cityFlag", "1");
			}else{
				cityFlag="2";
			}
			Page page = qyzajbtjService.getQyzajbbgtjList(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyzajbtj=page.getData();
	        zuQyzajbbgtj(lQyzajbtj,setQyzajbtj,cityFlag);
			this.result = "success";
		}catch(Exception e){
			this.result="查询列表失败";
			e.printStackTrace();
		}
		return "success";
	}
	private void zuQyzajbbgtj(List lQyzajbtj,Qyzajbtj qyzajbtj,String cityFlag){
		String zagxjgdm="";
		String qybm="";
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session= request.getSession();
		User user= (User)session.getAttribute(Constants.userKey);
		String departTemp = user.getDepartment().getDepartcode();
	
		if(lQyzajbtj!=null&&lQyzajbtj.size()>0){
        	for(int i=0;i<lQyzajbtj.size();i++){
        		Qyzajbtj getQyzajbtj = (Qyzajbtj)lQyzajbtj.get(i);
        		if(getQyzajbtj.getQybm()!=null){
        			qybm = getQyzajbtj.getQybm();
        		}
        		if(getQyzajbtj.getGxdwdm()!=null){
        			zagxjgdm = getQyzajbtj.getGxdwdm();
        		}else if(getQyzajbtj.getFxjdm()!=null){
        			zagxjgdm = getQyzajbtj.getFxjdm();
        		}else if(getQyzajbtj.getDsjgdm()!=null){
        			zagxjgdm = getQyzajbtj.getDsjgdm();
        		}else{
        			zagxjgdm = departTemp;
        		}
        		if("1".equals(qyzajbtj.getGxdwbz())){
        			zagxjgdm = zagxjgdm.substring(0,8);
        		}else if("1".equals(qyzajbtj.getFxjbz())){
        			zagxjgdm = zagxjgdm.substring(0,6);
        		}else if("1".equals(qyzajbtj.getDsjgbz())&&"2".equals(cityFlag)){
        			zagxjgdm = zagxjgdm.substring(0,4);
        		}else{
        			zagxjgdm = zagxjgdm.substring(0,2);
        		}
        		getQyzajbtj.setYgdd("<a href='#' class='hyperlink' onClick=queryzajbbg_qyjbxxlist('1','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getYgdd()+"</a>");
        		getQyzajbtj.setYddg("<a href='#' class='hyperlink' onClick=queryzajbbg_qyjbxxlist('2','"+getQyzajbtj.getHylbdm()+"','"+zagxjgdm+"','"+qybm+"');>"+getQyzajbtj.getYddg()+"</a>");
        	}
        	}
	}
	public String querylistQyzabg()throws Exception{
		try{
			Qyzajbtj setQyzajbtj = new Qyzajbtj();
			setQyzajbtj = (Qyzajbtj)this.setClass(setQyzajbtj, null);
			Map map =new HashMap();
			map.put("qybm",setQyzajbtj.getQybm());
			map.put("gxdwdm",setQyzajbtj.getGxdwdm() );
			map.put("hylbdm",setQyzajbtj.getHylbdm() );
			map.put("qssj", setQyzajbtj.getQssj());
			map.put("jzsj", setQyzajbtj.getJzsj());
			map.put("relation", setQyzajbtj.getRelation());
			Page page = qyzajbtjService.getQyzabgListForPage(map, pagesize, pagerow,sort,dir);
			totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyzajbtj=page.getData();
	        setTabledataQyzabg(lQyzajbtj);
	        this.result="success";
		}catch(Exception e){
			this.result="查询列表失败";
			e.printStackTrace();
		}
		return "success";
	}
	private void setTabledataQyzabg(List lData) throws Exception{
		List lPro = new ArrayList();
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		lPro.add("yzajbmc");
		lPro.add("zajbmc");
		lPro.add("bgsj");
		
		Qyzajbtj getQyzajbtj = new Qyzajbtj();
		this.setData(getQyzajbtj,lData,lPro,null);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
}
