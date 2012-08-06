package com.aisino2.sysadmin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.sysadmin.domain.Addressdetail;
import com.aisino2.sysadmin.domain.Jlxxx;
import com.aisino2.sysadmin.service.IAddressdetailService;
import com.aisino2.sysadmin.service.ISystemService;

public class AddressdetailAction extends PageAction{
	private IAddressdetailService addressdetailService;
	private ISystemService systemService;
	private List lAddressdetail=new ArrayList();
	private Addressdetail addressdetail=new Addressdetail();
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

	public Addressdetail getAddressdetail() {
		return addressdetail;
	}
	
	public List getLAddressdetail() {
		return lAddressdetail;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setAddressdetailService(IAddressdetailService addressdetailService) {
		this.addressdetailService = addressdetailService;
	}
	
	public void setSystemService(ISystemService systemService) {
		this.systemService = systemService;
	}

	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("dzxzid");
		lPro.add("dzxzdm");
		lPro.add("dzxzmc");

    	
    	List lModify=new ArrayList();
    	lModify.add("dz_modify");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("dz_delete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Addressdetail getAddressdetail=new Addressdetail();
    	
        this.setData(getAddressdetail,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
		try{
			Addressdetail setAddressdetail=new Addressdetail();
	        addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
	        Map map = new HashMap();
	        map.put("addressid", addressdetail.getAddressid());
	        map.put("jlxid", addressdetail.getJlxid());
	        map.put("dzxzdm", addressdetail.getDzxzdm());
	        map.put("dzxzmc", addressdetail.getDzxzmc());
	        Page page = addressdetailService.getListForPage(map, pagesize, pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lAddressdetail=page.getData();
	        setTabledata(lAddressdetail); 
			this.result="success";
		}catch(Exception e){
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String query() throws Exception{
		try {
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			addressdetail=addressdetailService.getAddressdetail(addressdetail);
	        lAddressdetail.clear();
	        lAddressdetail.add(addressdetail);
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			addressdetail=addressdetailService.insertAddressdetail(addressdetail);
			this.result="添加成功!";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="添加失败!";
		}
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			addressdetailService.updateAddressdetail(addressdetail);
	        this.result="修改成功!";
		} catch (Exception e) {
			this.result="修改失败!";
			e.printStackTrace();
		}
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			addressdetailService.deleteAddressdetail(addressdetail);
	        this.result="success";
		} catch (Exception e) {
			this.result="";
			e.printStackTrace();
		}
        return "success";
    }
    
  public void settreeTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("dzxzid");
		lPro.add("dzxzmc");
		 
		List lDetail = new ArrayList();
    	lDetail.add("setAddressdetail");
    	lDetail.add("选中");
    	    	    
    	List lCol=new ArrayList();
    	lCol.add(lDetail);

    	Addressdetail getAddressdetail=new Addressdetail();
    	
    	this.setDataCustomer(getAddressdetail,lData,lPro,null,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querytreelist() throws Exception{
        Addressdetail setAddressdetail=new Addressdetail();
        Map map = new HashMap();
        setAddressdetail = (Addressdetail)this.setClass(setAddressdetail,null);
        map.put("addressid", setAddressdetail.getAddressid());
        map.put("dzxzmc", setAddressdetail.getDzxzmc());  
        map.put("jlxmc",setAddressdetail.getJlxmc());
        Page page = addressdetailService.getListtreeForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lAddressdetail=page.getData();
        settreeTabledata(lAddressdetail); 
		    this.result="success";
        return "success";
    }
	
	public String queryname() throws Exception{
		try {
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			List list=addressdetailService.query(addressdetail);
			String t="";
			for(int i=0;i<list.size();i++)
			{
				Addressdetail Addressdetailtree=(Addressdetail)list.get(i);
				t+=Addressdetailtree.getDzxzmc();
			}
			addressdetail.setDzxzmc(t);
			lAddressdetail.clear();
			lAddressdetail.add(addressdetail);
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    } 
	
	public String valadateDzxzdm() throws Exception{
		try{
			Addressdetail setAddressdetail=new Addressdetail();
			addressdetail=(Addressdetail)this.setClass(setAddressdetail, null);
			Map map = new HashMap();
			map.put("tableName", "t_addressdetail");
			map.put("dzxzdm", addressdetail.getDzxzdm());
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