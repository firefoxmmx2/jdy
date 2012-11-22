package com.aisino2.sysadmin.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.sysadmin.dao.IAddressdetailDao;
import com.aisino2.sysadmin.domain.Addressdetail;
import com.aisino2.sysadmin.service.IAddressdetailService;

public class AddressdetailServiceImpl extends BaseService implements IAddressdetailService {

	private IAddressdetailDao ADDRESSDETAILDao;

	/** @param 地址详址(T_ADDRESSDETAIL) 增加 */
	public Addressdetail insertAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return (Addressdetail)ADDRESSDETAILDao.insertAddressdetail(ADDRESSDETAIL);
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 删除 */
	public boolean deleteAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return ADDRESSDETAILDao.deleteAddressdetail(ADDRESSDETAIL)>0;
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 修改 */
	public boolean updateAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return ADDRESSDETAILDao.updateAddressdetail(ADDRESSDETAIL)>0;
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 查询单条 */
	public Addressdetail getAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return (Addressdetail)ADDRESSDETAILDao.getAddressdetail(ADDRESSDETAIL);
	}
  
  public List query(Addressdetail addressdetail){
		
		return ADDRESSDETAILDao.Selectaddress(addressdetail);
	}
	
	/** @param 地址详址(T_ADDRESSDETAIL) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return ADDRESSDETAILDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}
  
  public Page getListtreeForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		
		return ADDRESSDETAILDao.getListtreeForPage(map,pageNo,pageSize,sort,desc);
	}
  
	/** @param 地址详址(T_ADDRESSDETAIL) 多条查询 */
	public List getListAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return ADDRESSDETAILDao.getListAddressdetail(ADDRESSDETAIL);
	}

	public IAddressdetailDao getAddressdetailDao() {
		return ADDRESSDETAILDao;
	}

	public void setAddressdetailDao(IAddressdetailDao ADDRESSDETAILDao) {
		this.ADDRESSDETAILDao = ADDRESSDETAILDao;
	}
}
