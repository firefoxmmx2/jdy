package com.aisino2.sysadmin.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.sysadmin.domain.Address;

public interface IAddressService {

	/** @param 地址      增加 */
	Address insertAddress(Address address); 
	
	/** @param 地址      删除 */
	int deleteAddress(Address address);
	
	/** @param 地址      修改 */
	int updateAddress(Address address);
	
	/** @param 地址      根据ID创建地址树 */
	List<Address> createTree(Address address);
	
	/** @param 地址(T_ADDRESS) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 地址(T_ADDRESS) 查询单条 */
	Address getAddress(Address address);
	
	/** @param 地址(T_ADDRESS) 查询单条name */
	List queryname(Address address);
	
	/** @param  地址(T_ADDRESS) 分页查询
	 *  @author LL
	 *	@date Sep 9, 2011
	*/
	Page getAddressListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
}
