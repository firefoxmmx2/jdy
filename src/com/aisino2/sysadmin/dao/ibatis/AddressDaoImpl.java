package com.aisino2.sysadmin.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.sysadmin.dao.IAddressDao;
import com.aisino2.sysadmin.domain.Address;

public class AddressDaoImpl extends BaseDao implements IAddressDao {

	/** @param 地址      增加 */
	public Address insertAddress(Address address){
		address.setAddressid(getNextID("Addressid"));
		if(null == address.getAddresscode() || "".equals(address.getAddresscode())){
			address.setAddresscode(String.valueOf(address.getAddressid()));
		}
		insert("insertAddress", address);
		Address ress = new Address();
		ress.setAddressid(address.getParentaddressid());
		Address parentAddress = getAddress(ress);
		if(parentAddress != null){
			address.setAddressfullcode(parentAddress.getAddressfullcode()+","+address.getAddressid());
			updateAddress(address);
		}
		return address;
	}
	
	/** @param 地址      删除 */
	public int deleteAddress(Address address){
		return delete("deleteAddress",address);
	}
	
	/** @param 地址      修改 */
	public int updateAddress(Address address){
		return update("updateAddress",address);
	}
	
	/** @param 地址      根据ID创建地址树 */
	public List<Address> createTree(Address address){
		return queryForList("createTree",address);
	}
	
	public List selectparentTree(Address address){
		return queryForList("getselectparenttree",address);
	}
	
	/** @param 地址(T_ADDRESS) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " addresscode "+ desc;
			else if("1".equals(sort))
				sCol = " addressname "+ desc;
		}else{
			sCol="a.addressid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getAddressListforPage", map, pageNo,pageSize);
	}
	
	/** @param 地址(T_ADDRESS) 查询单条 */
	public Address getAddress(Address address){
		return (Address)queryForObject("getAddressSinge", address);
	}
	
	/** @param 地址(T_ADDRESS) 查询列表 */
	public Page getAddressForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		return queryForPage("getListforPage", map, pageNo,pageSize);
	}
}
