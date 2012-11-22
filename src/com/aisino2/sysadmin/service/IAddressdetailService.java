package com.aisino2.sysadmin.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.sysadmin.domain.Addressdetail;

public interface IAddressdetailService {
	/** @param 地址详址(T_ADDRESSDETAIL) 增加 */
	Addressdetail insertAddressdetail(Addressdetail ADDRESSDETAIL);

	/** @param 地址详址(T_ADDRESSDETAIL) 删除 */
	boolean deleteAddressdetail(Addressdetail ADDRESSDETAIL);

	/** @param 地址详址(T_ADDRESSDETAIL) 修改 */
	boolean updateAddressdetail(Addressdetail ADDRESSDETAIL);

	/** @param 地址详址(T_ADDRESSDETAIL) 查询单条 */
	Addressdetail getAddressdetail(Addressdetail ADDRESSDETAIL);
	
	public List query(Addressdetail addressdetail);
	
  Page getListtreeForPage(Map map, int pageNo,int pageSize,String sort,String desc);	

	/** @param 地址详址(T_ADDRESSDETAIL) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 地址详址(T_ADDRESSDETAIL) 多条查询 */
	List getListAddressdetail(Addressdetail ADDRESSDETAIL);
}
