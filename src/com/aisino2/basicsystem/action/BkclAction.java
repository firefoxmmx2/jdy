package com.aisino2.basicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.basicsystem.domain.Bkcl;
import com.aisino2.basicsystem.service.IBkclService;

public class BkclAction extends PageAction{
	private IBkclService bkclService;
	private List lBkcl=new ArrayList();
	private Bkcl bkcl=new Bkcl();
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

	public Bkcl getBkcl() {
		return bkcl;
	}
	
	public List getLBkcl() {
		return lBkcl;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setBkclService(IBkclService bkclService) {
		this.bkclService = bkclService;
	}
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("bkwpjbxxid");
		lPro.add("bkclid");
		lPro.add("cllxdm");
		lPro.add("cllx");
		lPro.add("clpp");
		lPro.add("clxh");
		lPro.add("hpzldm");
		lPro.add("hpzl");
		lPro.add("hphm");
		lPro.add("csys");
		lPro.add("syr");
		lPro.add("ccdjrq");
		lPro.add("fdjh");
		lPro.add("clsbdh");
		lPro.add("cjh");

    	
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("setDelete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Bkcl getBkcl=new Bkcl();
    	
        this.setData(getBkcl,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
        Bkcl setBkcl=new Bkcl();
        Map map = new HashMap();
        Page page = bkclService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lBkcl=page.getData();
        setTabledata(lBkcl); 
		 this.result="success";
        return "success";
    }
	
	public String query() throws Exception{
		try {
			Bkcl setBkcl=new Bkcl();
			bkcl=(Bkcl)this.setClass(setBkcl, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        bkcl=bkclService.getBkcl(bkcl);
        lBkcl.clear();
        lBkcl.add(bkcl);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Bkcl setBkcl=new Bkcl();
			bkcl=(Bkcl)this.setClass(setBkcl, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        bkcl=bkclService.insertBkcl(bkcl);
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Bkcl setBkcl=new Bkcl();
			bkcl=(Bkcl)this.setClass(setBkcl, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        bkclService.updateBkcl(bkcl);
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Bkcl setBkcl=new Bkcl();
			bkcl=(Bkcl)this.setClass(setBkcl, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        bkclService.deleteBkcl(bkcl);
        this.result="success";
        return "success";
    }
}