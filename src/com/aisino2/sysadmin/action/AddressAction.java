package com.aisino2.sysadmin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.sysadmin.domain.Address;
import com.aisino2.sysadmin.service.IAddressService;
import com.aisino2.sysadmin.service.ISystemService;

public class AddressAction extends PageAction {

	private IAddressService addressService;
	private ISystemService systemService;
	private List<Address> lAddress=new ArrayList<Address>();
	private Address address=new Address();
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

	public Address getAddress() {
		return address;
	}
	
	public List getLAddress() {
		return lAddress;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}
	
	public void setSystemService(ISystemService systemService) {
		this.systemService = systemService;
	}
	public String insert() throws Exception{
		try {
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			address=addressService.insertAddress(address);
	        this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	/**
	 * 修改节点信息
	 * @return
	 * @throws Exception
	 */
	public String modify() throws Exception{
		try {
//			boolean bz = true;
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			if(null == address.getAddresscode() || "".equals(address.getAddresscode())){
				address.setAddresscode(String.valueOf(address.getAddressid()));
			}
			addressService.updateAddress(address);
	        this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	/**
	 * 删除节点
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		try {
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			Address adr = addressService.getAddress(address);
			int parentid = adr.getParentaddressid();
			if(parentid != 0){
				addressService.deleteAddress(address);
				address.setAddressid(parentid);
				lAddress = addressService.createTree(address);
				if(lAddress != null && lAddress.size() == 1){
					address = lAddress.get(0);
					address.setIsleaf("Y");
					addressService.updateAddress(address);	
				}
				this.result="success";
			}else
	        this.result="fail";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	/**
	 * 根据地址ID查询出包括该ID在内的所有下级记录
	 * @return
	 */
	public String querylist(){
		try{
			Address setAddr=new Address();
	        address=(Address)this.setClass(setAddr, null);
	        Map map = new HashMap();
	        map.put("addressid", address.getAddressid());
	        map.put("addresscode", address.getAddresscode());
	        map.put("addressname", address.getAddressname());
	        
	        Page page = addressService.getListForPage(map, pagesize, pagerow,sort,dir);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lAddress=page.getData();
	        setTabledata(lAddress); 
			this.result="success";
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		return "success";
    }
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("addressid");
		lPro.add("addresscode");
		lPro.add("addressname");
		
    	List lModify = new ArrayList();
    	lModify.add("modify");
    	lModify.add("修改");
    	
    	List lDel = new ArrayList();
    	lDel.add("del");
    	lDel.add("删除");
    	
    	List lDetail = new ArrayList();
    	lDetail.add("detail");
    	lDetail.add("详细");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	lCol.add(lDetail);
    	
    	Address address = new Address();
    	
        this.setData(address,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	/**
	 * 查询单条地址信息
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		try {
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			address=addressService.getAddress(address);
			if(address.getParentaddressid() != 0){
				Address adr = new Address();
				adr.setAddressid(address.getParentaddressid());
				adr = addressService.getAddress(adr);
				address.setParentaddressname(adr.getAddressname());
			}else{
				address.setParentaddressname("无");
			}
	        lAddress.clear();
	        lAddress.add(address);
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	/**
	 * 查询单条地址信息
	 * @return
	 * @throws Exception
	 */
	public String queryname() throws Exception{
		try {
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			List list=addressService.queryname(address);
			String t="";
			for(int i=0;i<list.size();i++)
			{
				Address Addresstree=(Address)list.get(i);
				t+=Addresstree.getAddressname();
			}
			address.setAddressname(t);
	        lAddress.clear();
	        lAddress.add(address);
			this.result="success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
        return "success";
    }
	
	public String validateCode() throws Exception{
		try{
			Address setAddress=new Address();
			address=(Address)this.setClass(setAddress, null);
			Map map = new HashMap();
			map.put("tableName", "t_address");
			map.put("addresscode", address.getAddresscode());
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
