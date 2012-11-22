package com.aisino2.icksystem.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.common.DepartmentUtil;
import com.aisino2.common.QjblUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.icksystem.domain.Csryzhtj;
import com.aisino2.icksystem.service.ICsryzhtjService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class CsryzhtjAction extends PageAction{
	private ICsryzhtjService csryzhtjService;
	private List lCsryzhtj=new ArrayList();
	private String result="";
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public List getLCsryzhtj() {
		return lCsryzhtj;
	}
	
	public void setCsryzhtjService(ICsryzhtjService csryzhtjService) {
		this.csryzhtjService = csryzhtjService;
	}
	public String querylistCsryzhtj() throws Exception{
		try{
			int css=0;
			int xzcss=0;
			int zjcss=0;
			int xzzjcss=0;
            int rcjccs=0;
            int cfcss=0; 
            int jlcss=0; 
            int facss=0;
            int cyrys=0; 
            int xzrys=0;  
            int zxrys=0;
            int cfrs=0;
            int jlrs=0;
            int yxbjs=0;
            int hfs=0;
            int sccss=0;
            int yyrzsccss=0;
            int skrs=0;
            int zhztrs=0;
            Csryzhtj sumCsryzhtj = new Csryzhtj();
			Csryzhtj setCsryzhtj = new Csryzhtj();
			setCsryzhtj = (Csryzhtj)this.setClass(setCsryzhtj, null);
			Map map = new HashMap();
			//将前台传入的参数与数据表对应
	        map.put("dsjgdm", setCsryzhtj.getDsjgdm());
	        map.put("dsjgbz", setCsryzhtj.getDsjgbz());
	        map.put("fxjdm", setCsryzhtj.getFxjdm());
	        map.put("fxjbz", setCsryzhtj.getFxjbz());
			map.put("gxdwbm", setCsryzhtj.getGxdwdm());
			map.put("gxdwbz", setCsryzhtj.getGxdwbz());
			if ("1".equals(setCsryzhtj.getSfcxqb())){
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE,-1);
				map.put("jzrq", cal.getTime());
			}else{
				map.put("qsrq", setCsryzhtj.getQsrq());
				map.put("jzrq", setCsryzhtj.getJzrq());
			}
			String tjjzsj=QjblUtil.queryQjblVal("tjjzsj");
			if (!"".equals(tjjzsj)){
				map.put("tjjzsj", new Float(tjjzsj));
			}else{
				map.put("tjjzsj", new Float(6));
			}
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			String departTemp = user.getDepartment().getDepartcode();
			if (DepartmentUtil.departIsZxs(departTemp)) map.put("iszxs","1");
			
			String DeptCode=null;
			if (!DepartmentUtil.departIsZxs(departTemp)){
				if (!setCsryzhtj.getGxdwdm().equals("")) {
					DeptCode=setCsryzhtj.getGxdwdm().substring(0, 8);
				} else if(!setCsryzhtj.getFxjdm().equals("")) {
					DeptCode=setCsryzhtj.getFxjdm().substring(0, 6);
				} else if(!setCsryzhtj.getDsjgdm().equals("")) {
					DeptCode=setCsryzhtj.getDsjgdm().substring(0, 4);
				} else {
					DeptCode=departTemp.substring(0, 2);;
				}
			} else {
				if (!setCsryzhtj.getGxdwdm().equals("")) {
					DeptCode=setCsryzhtj.getGxdwdm().substring(0, 8);
				} else if(!setCsryzhtj.getFxjdm().equals("")) {
					DeptCode=setCsryzhtj.getFxjdm().substring(0, 6);
				} else if(!setCsryzhtj.getDsjgdm().equals("")) {
					DeptCode=setCsryzhtj.getDsjgdm().substring(0, 2);
				} else {
					DeptCode=departTemp.substring(0, 2);;
				}
			}
			map.put("deptcode",DeptCode);
			
			Integer deptlevel=null;
			Integer mindeptlevel=null;
			if (!DepartmentUtil.departIsZxs(departTemp)){
				if("1".equals(setCsryzhtj.getGxdwbz())){
					deptlevel=5;
					mindeptlevel=3;
				}else if("1".equals(setCsryzhtj.getFxjbz())){
					deptlevel=4;
					mindeptlevel=3;
				}else if("1".equals(setCsryzhtj.getDsjgbz())){
					deptlevel=3;
					mindeptlevel=3;
				}else {
					deptlevel=2;
					mindeptlevel=2;
				}
			}  else{
				if("1".equals(setCsryzhtj.getGxdwbz())){
					deptlevel=4;
					mindeptlevel=2;
				}else if("1".equals(setCsryzhtj.getFxjbz())){
					deptlevel=3;
					mindeptlevel=2;
				}else if("1".equals(setCsryzhtj.getDsjgbz())){
					deptlevel=2;
					mindeptlevel=2;
				}else {
					deptlevel=2;
					mindeptlevel=2;
				}
			}
			map.put("deptlevel",deptlevel);
			map.put("mindeptlevel",mindeptlevel);
			Page page = csryzhtjService.getListForPage(map, pagesize, pagerow,sort,dir);
			lCsryzhtj = page.getData();
			for(int i=0;i<lCsryzhtj.size();i++){
				Csryzhtj oneCsryzhtj = (Csryzhtj)lCsryzhtj.get(i);
				if (oneCsryzhtj.getGxdwdm()!=null&&!oneCsryzhtj.getGxdwdm().equals("")){
					//do nothing
	        	} else if (oneCsryzhtj.getFxjdm()!=null&&!oneCsryzhtj.getFxjdm().equals("")){
	        		oneCsryzhtj.setFxjmc("<a href='#' class='fontbutton' onclick=setXxQuery('"+oneCsryzhtj.getFxjdm()+"')>"+oneCsryzhtj.getFxjmc()+"</a>");
	        	} else if (oneCsryzhtj.getDsjgdm()!=null&&!oneCsryzhtj.getDsjgdm().equals("")){
	        		oneCsryzhtj.setDsjgmc("<a href='#' class='fontbutton' onclick=setXxQuery('"+oneCsryzhtj.getDsjgdm()+"')>"+oneCsryzhtj.getDsjgmc()+"</a>");
	        	}
				css+=oneCsryzhtj.getCss().intValue();
				xzcss+=oneCsryzhtj.getXzcss().intValue();
				zjcss+=oneCsryzhtj.getZjcss().intValue();
				xzzjcss+=oneCsryzhtj.getXzzjcss().intValue();
	            rcjccs+=oneCsryzhtj.getRcjccs().intValue();
	            cfcss+=oneCsryzhtj.getCfcss().intValue(); 
	            jlcss+=oneCsryzhtj.getJlcss().intValue(); 
	            facss+=oneCsryzhtj.getFacss().intValue();
	            cyrys+=oneCsryzhtj.getCyrys().intValue();
	            xzrys+=oneCsryzhtj.getXzrys().intValue();
	            zxrys+=oneCsryzhtj.getZxrys().intValue();
	            cfrs+=oneCsryzhtj.getCfrs().intValue();
	            jlrs+=oneCsryzhtj.getJlrs().intValue();
	            zhztrs+=oneCsryzhtj.getZhztrs().intValue();
	            yxbjs+=oneCsryzhtj.getYxbjs().intValue();
	            hfs+=oneCsryzhtj.getHfs().intValue();
	            sccss+=oneCsryzhtj.getSccss().intValue();
	            yyrzsccss+=oneCsryzhtj.getYyrzsccss().intValue();
	            skrs+=oneCsryzhtj.getSkrs().intValue();
			}
			sumCsryzhtj.setCss(css);
			sumCsryzhtj.setZjcss(zjcss);
			sumCsryzhtj.setXzcss(xzcss);
			sumCsryzhtj.setXzzjcss(xzzjcss);
			sumCsryzhtj.setRcjccs(rcjccs);
			sumCsryzhtj.setCfcss(cfcss);
			sumCsryzhtj.setJlcss(jlcss);
			sumCsryzhtj.setFacss(facss);
			sumCsryzhtj.setCyrys(cyrys);
			sumCsryzhtj.setXzrys(xzrys);
			sumCsryzhtj.setZxrys(zxrys);
			sumCsryzhtj.setCfrs(cfrs);
			sumCsryzhtj.setJlrs(jlrs);
			sumCsryzhtj.setZhztrs(zhztrs);
			sumCsryzhtj.setSccss(sccss);
			sumCsryzhtj.setYyrzsccss(yyrzsccss);
			sumCsryzhtj.setSkrs(skrs);
			
			if (xzcss==0) {
				sumCsryzhtj.setXzzjl(new Float(0.00));
			}else {
				Float xzzjl=new Float(Math.round(new Float(xzzjcss)/new Float(xzcss)*10000));
				sumCsryzhtj.setXzzjl(xzzjl/100);
			}
			if (yxbjs==0) {
				sumCsryzhtj.setBjhfl(new Float(0.00));
			}else {
				Float bjhfl=new Float(Math.round(new Float(hfs)/new Float(yxbjs)*10000));
				sumCsryzhtj.setBjhfl(bjhfl/100);
			}
			if (zjcss==0) {
				sumCsryzhtj.setCsskscl(new Float(0.00));
			}else {
				Float csskscl=new Float(Math.round(new Float(sccss)/new Float(zjcss)*10000));
				sumCsryzhtj.setCsskscl(csskscl/100);
			}
			if (cyrys==0) {
				sumCsryzhtj.setRyskscl(new Float(0.00));
			}else {
				Float ryskscl=new Float(Math.round(new Float(skrs)/new Float(cyrys)*10000));
				sumCsryzhtj.setRyskscl(ryskscl/100);
			}
	
			sumCsryzhtj.setDsjgmc("合计");
			if("1".equals(setCsryzhtj.getDsjgbz())){
				lCsryzhtj.add(sumCsryzhtj);
			}
			this.result="success";
		}catch(Exception e){
			this.result="查询场所人员综合信息失败";
			e.printStackTrace();
		}
		return "success";
	}
	
	public String querylistCsryzhtjxx() throws Exception{
		try{
			int css=0;
			int xzcss=0;
			int zjcss=0;
			int xzzjcss=0;
            int rcjccs=0;
            int cfcss=0; 
            int jlcss=0; 
            int facss=0;
            int cyrys=0; 
            int xzrys=0;  
            int zxrys=0;
            int cfrs=0;
            int jlrs=0;
            int yxbjs=0;
            int hfs=0;
            int sccss=0;
            int yyrzsccss=0;
            int skrs=0;
            int zhztrs=0;
            Csryzhtj sumCsryzhtj = new Csryzhtj();
			Csryzhtj setCsryzhtj = new Csryzhtj();
			setCsryzhtj = (Csryzhtj)this.setClass(setCsryzhtj, null);
			Map map = new HashMap();
			//将前台传入的参数与数据表对应
	        map.put("dsjgdm", setCsryzhtj.getDsjgdm());
	        map.put("dsjgbz", setCsryzhtj.getDsjgbz());
	        map.put("fxjdm", setCsryzhtj.getFxjdm());
	        map.put("fxjbz", setCsryzhtj.getFxjbz());
			map.put("gxdwbm", setCsryzhtj.getGxdwdm());
			map.put("gxdwbz", setCsryzhtj.getGxdwbz());
			if ("1".equals(setCsryzhtj.getSfcxqb())){
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE,-1);
				map.put("jzrq", cal.getTime());
			}else{
				map.put("qsrq", setCsryzhtj.getQsrq());
				map.put("jzrq", setCsryzhtj.getJzrq());
			}
			String tjjzsj=QjblUtil.queryQjblVal("tjjzsj");
			if (!"".equals(tjjzsj)){
				map.put("tjjzsj", new Float(tjjzsj));
			}else{
				map.put("tjjzsj", new Float(6));
			}
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			String departTemp = user.getDepartment().getDepartcode();
			if (DepartmentUtil.departIsZxs(departTemp)) map.put("iszxs","1");
			
			String DeptCode=null;
			if (!DepartmentUtil.departIsZxs(departTemp)){
				if (!setCsryzhtj.getGxdwdm().equals("")) {
					DeptCode=setCsryzhtj.getGxdwdm().substring(0, 8);
				} else if(!setCsryzhtj.getFxjdm().equals("")) {
					DeptCode=setCsryzhtj.getFxjdm().substring(0, 6);
				} else if(!setCsryzhtj.getDsjgdm().equals("")) {
					DeptCode=setCsryzhtj.getDsjgdm().substring(0, 4);
				} else {
					DeptCode=departTemp.substring(0, 2);;
				}
			} else {
				if (!setCsryzhtj.getGxdwdm().equals("")) {
					DeptCode=setCsryzhtj.getGxdwdm().substring(0, 8);
				} else if(!setCsryzhtj.getFxjdm().equals("")) {
					DeptCode=setCsryzhtj.getFxjdm().substring(0, 6);
				} else if(!setCsryzhtj.getDsjgdm().equals("")) {
					DeptCode=setCsryzhtj.getDsjgdm().substring(0, 2);
				} else {
					DeptCode=departTemp.substring(0, 2);;
				}
			}
			map.put("deptcode",DeptCode);
			
			Integer deptlevel=null;
			Integer mindeptlevel=null;
			if (!DepartmentUtil.departIsZxs(departTemp)){
				if("1".equals(setCsryzhtj.getGxdwbz())){
					deptlevel=5;
					mindeptlevel=3;
				}else if("1".equals(setCsryzhtj.getFxjbz())){
					deptlevel=4;
					mindeptlevel=3;
				}else if("1".equals(setCsryzhtj.getDsjgbz())){
					deptlevel=3;
					mindeptlevel=3;
				}else {
					deptlevel=2;
					mindeptlevel=2;
				}
			}  else{
				if("1".equals(setCsryzhtj.getGxdwbz())){
					deptlevel=4;
					mindeptlevel=2;
				}else if("1".equals(setCsryzhtj.getFxjbz())){
					deptlevel=3;
					mindeptlevel=2;
				}else if("1".equals(setCsryzhtj.getDsjgbz())){
					deptlevel=2;
					mindeptlevel=2;
				}else {
					deptlevel=2;
					mindeptlevel=2;
				}
			}
			map.put("deptlevel",deptlevel);
			map.put("mindeptlevel",mindeptlevel);
			Page page = csryzhtjService.getListForPage(map, pagesize, pagerow,sort,dir);
			lCsryzhtj = page.getData();
			for(int i=0;i<lCsryzhtj.size();i++){
				Csryzhtj oneCsryzhtj = (Csryzhtj)lCsryzhtj.get(i);
				if (oneCsryzhtj.getGxdwdm()!=null&&!oneCsryzhtj.getGxdwdm().equals("")){
					//do nothing
	        	} else if (oneCsryzhtj.getFxjdm()!=null&&!oneCsryzhtj.getFxjdm().equals("")){
	        		oneCsryzhtj.setFxjmc("<a href='#' class='fontbutton' onclick=setXxQueryxx('"+oneCsryzhtj.getFxjdm()+"')>"+oneCsryzhtj.getFxjmc()+"</a>");
	        	} else if (oneCsryzhtj.getDsjgdm()!=null&&!oneCsryzhtj.getDsjgdm().equals("")){
	        		oneCsryzhtj.setDsjgmc("<a href='#' class='fontbutton' onclick=setXxQueryxx('"+oneCsryzhtj.getDsjgdm()+"')>"+oneCsryzhtj.getDsjgmc()+"</a>");
	        	}
				css+=oneCsryzhtj.getCss().intValue();
				xzcss+=oneCsryzhtj.getXzcss().intValue();
				zjcss+=oneCsryzhtj.getZjcss().intValue();
				xzzjcss+=oneCsryzhtj.getXzzjcss().intValue();
	            rcjccs+=oneCsryzhtj.getRcjccs().intValue();
	            cfcss+=oneCsryzhtj.getCfcss().intValue(); 
	            jlcss+=oneCsryzhtj.getJlcss().intValue(); 
	            facss+=oneCsryzhtj.getFacss().intValue();
	            cyrys+=oneCsryzhtj.getCyrys().intValue();
	            xzrys+=oneCsryzhtj.getXzrys().intValue();
	            zxrys+=oneCsryzhtj.getZxrys().intValue();
	            cfrs+=oneCsryzhtj.getCfrs().intValue();
	            jlrs+=oneCsryzhtj.getJlrs().intValue();
	            zhztrs+=oneCsryzhtj.getZhztrs().intValue();
	            yxbjs+=oneCsryzhtj.getYxbjs().intValue();
	            hfs+=oneCsryzhtj.getHfs().intValue();
	            sccss+=oneCsryzhtj.getSccss().intValue();
	            yyrzsccss+=oneCsryzhtj.getYyrzsccss().intValue();
	            skrs+=oneCsryzhtj.getSkrs().intValue();
			}
			sumCsryzhtj.setCss(css);
			sumCsryzhtj.setZjcss(zjcss);
			sumCsryzhtj.setXzcss(xzcss);
			sumCsryzhtj.setXzzjcss(xzzjcss);
			sumCsryzhtj.setRcjccs(rcjccs);
			sumCsryzhtj.setCfcss(cfcss);
			sumCsryzhtj.setJlcss(jlcss);
			sumCsryzhtj.setFacss(facss);
			sumCsryzhtj.setCyrys(cyrys);
			sumCsryzhtj.setXzrys(xzrys);
			sumCsryzhtj.setZxrys(zxrys);
			sumCsryzhtj.setCfrs(cfrs);
			sumCsryzhtj.setJlrs(jlrs);
			sumCsryzhtj.setZhztrs(zhztrs);
			sumCsryzhtj.setSccss(sccss);
			sumCsryzhtj.setYyrzsccss(yyrzsccss);
			sumCsryzhtj.setSkrs(skrs);
			
			if (xzcss==0) {
				sumCsryzhtj.setXzzjl(new Float(0.00));
			}else {
				Float xzzjl=new Float(Math.round(new Float(xzzjcss)/new Float(xzcss)*10000));
				sumCsryzhtj.setXzzjl(xzzjl/100);
			}
			if (yxbjs==0) {
				sumCsryzhtj.setBjhfl(new Float(0.00));
			}else {
				Float bjhfl=new Float(Math.round(new Float(hfs)/new Float(yxbjs)*10000));
				sumCsryzhtj.setBjhfl(bjhfl/100);
			}
			if (zjcss==0) {
				sumCsryzhtj.setCsskscl(new Float(0.00));
			}else {
				Float csskscl=new Float(Math.round(new Float(sccss)/new Float(zjcss)*10000));
				sumCsryzhtj.setCsskscl(csskscl/100);
			}
			if (cyrys==0) {
				sumCsryzhtj.setRyskscl(new Float(0.00));
			}else {
				Float ryskscl=new Float(Math.round(new Float(skrs)/new Float(cyrys)*10000));
				sumCsryzhtj.setRyskscl(ryskscl/100);
			}
			sumCsryzhtj.setDsjgmc("合计");
			if("1".equals(setCsryzhtj.getDsjgbz())){
				lCsryzhtj.add(sumCsryzhtj);
			}
			this.result="success";
		}catch(Exception e){
			this.result="查询场所人员综合信息失败";
			e.printStackTrace();
		}
		return "success";
	}
}
