package com.aisino2.publicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Ggbdsj;
import com.aisino2.publicsystem.service.IGgbdsjService;

public class GgbdsjAction extends PageAction{
	private IGgbdsjService ggbdsjService;
	private List lGgbdsj=new ArrayList();
	private Ggbdsj ggbdsj=new Ggbdsj();
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

	public Ggbdsj getGgbdsj() {
		return ggbdsj;
	}
	
	public List getLGgbdsj() {
		return lGgbdsj;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setGgbdsjService(IGgbdsjService ggbdsjService) {
		this.ggbdsjService = ggbdsjService;
	}
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("bdsjid");
		lPro.add("xm");
		lPro.add("zjhm");
		lPro.add("qymc");
		lPro.add("qydz");
		lPro.add("gxdwbm");
		lPro.add("gxdwmc");
		lPro.add("hylbdm");
		lPro.add("hylb");
		lPro.add("ywbm");
		lPro.add("ywbzj");
		lPro.add("xrsj");
		lPro.add("gxsj");
		lPro.add("biduiflag");

    	
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("setDelete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Ggbdsj getGgbdsj=new Ggbdsj();
    	
        this.setData(getGgbdsj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
        Ggbdsj setGgbdsj=new Ggbdsj();
        Map map = new HashMap();
        Page page = ggbdsjService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lGgbdsj=page.getData();
        setTabledata(lGgbdsj); 
		 this.result="success";
        return "success";
    }
	
	public String query() throws Exception{
		try {
			Ggbdsj setGgbdsj=new Ggbdsj();
			ggbdsj=(Ggbdsj)this.setClass(setGgbdsj, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ggbdsj=ggbdsjService.getGgbdsj(ggbdsj);
        lGgbdsj.clear();
        lGgbdsj.add(ggbdsj);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Ggbdsj setGgbdsj=new Ggbdsj();
			ggbdsj=(Ggbdsj)this.setClass(setGgbdsj, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ggbdsj=ggbdsjService.insertGgbdsj(ggbdsj);
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Ggbdsj setGgbdsj=new Ggbdsj();
			ggbdsj=(Ggbdsj)this.setClass(setGgbdsj, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ggbdsjService.updateGgbdsj(ggbdsj);
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Ggbdsj setGgbdsj=new Ggbdsj();
			ggbdsj=(Ggbdsj)this.setClass(setGgbdsj, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ggbdsjService.deleteGgbdsj(ggbdsj);
        this.result="success";
        return "success";
    }
}