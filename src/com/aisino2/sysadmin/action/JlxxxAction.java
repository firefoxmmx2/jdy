package com.aisino2.sysadmin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.sysadmin.domain.Jlxxx;
import com.aisino2.sysadmin.service.IJlxxxService;
import com.aisino2.sysadmin.service.ISystemService;

public class JlxxxAction extends PageAction{
	private IJlxxxService jlxxxService;
	private ISystemService systemService;
	private List lJlxxx=new ArrayList();
	private Jlxxx jlxxx=new Jlxxx();
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

	public Jlxxx getJlxxx() {
		return jlxxx;
	}
	
	public List getLJlxxx() {
		return lJlxxx;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setJlxxxService(IJlxxxService jlxxxService) {
		this.jlxxxService = jlxxxService;
	}
	
	public void setSystemService(ISystemService systemService) {
		this.systemService = systemService;
	}

	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("jlxid");
		lPro.add("jlxdm");
		lPro.add("jlxmc");

    	
    	List lModify=new ArrayList();
    	lModify.add("jlx_modify");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("jlx_delete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Jlxxx getJlxxx=new Jlxxx();
    	
        this.setData(getJlxxx,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
		try{
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
	        Map map = new HashMap();
	        map.put("addressid", jlxxx.getAddressid());
	        map.put("jlxdm", jlxxx.getJlxdm());
	        map.put("jlxmc", jlxxx.getJlxmc());
	        Page page = jlxxxService.getListForPage(map, pagesize,pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lJlxxx=page.getData();
	        setTabledata(lJlxxx); 
			this.result="success";
		}catch (Exception e){
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String query() throws Exception{
		try {
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
			jlxxx=jlxxxService.getJlxxx(jlxxx);
	        lJlxxx.clear();
	        lJlxxx.add(jlxxx);
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
			jlxxx=jlxxxService.insertJlxxx(jlxxx);
			this.result="添加成功!";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="添加失败!";
		}
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
			jlxxxService.updateJlxxx(jlxxx);
	        this.result="修改成功!";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="修改失败!";
		}
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
			jlxxxService.deleteJlxxx(jlxxx);
	        this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	/**
	 * 街路巷弹出层
	 * @return
	 * @throws Exception
	 */
	public String queryJlxList() throws Exception{
		try{
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
	        Map map = new HashMap();
	        map.put("addressid", jlxxx.getAddressid());
	        map.put("jlxdm", jlxxx.getJlxdm());
	        map.put("jlxmc", jlxxx.getJlxmc());
	        Page page = jlxxxService.getListForPage(map, pagesize,pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lJlxxx=page.getData();
	        setJlxTabledata(lJlxxx); 
			this.result="success";
		}catch (Exception e){
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public void setJlxTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("jlxid");
		lPro.add("jlxid");
		lPro.add("jlxdm");
		lPro.add("jlxmc");

    	List lCol=null;
    	
    	Jlxxx getJlxxx=new Jlxxx();
    	
        this.setData(getJlxxx,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String validateJlxdm() throws Exception{
		try{
			Jlxxx setJlxxx=new Jlxxx();
			jlxxx=(Jlxxx)this.setClass(setJlxxx, null);
			Map map = new HashMap();
			map.put("tableName", "t_jlxxx");
			map.put("jlxdm", jlxxx.getJlxdm());
			boolean result = systemService.isExit(map);
			if(result){	
				tabledata = "1";
			}
		}catch(Exception e){
			e.printStackTrace();
			this.result="";
		}
		return "success";
	}
}