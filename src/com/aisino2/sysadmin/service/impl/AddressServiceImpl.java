package com.aisino2.sysadmin.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.core.util.PinYinUtil;
import com.aisino2.sysadmin.dao.IAddressDao;
import com.aisino2.sysadmin.domain.Address;
import com.aisino2.sysadmin.service.IAddressService;

public class AddressServiceImpl extends BaseService implements IAddressService {

	private IAddressDao addressDao;
	
	public IAddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(IAddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	/** @param 地址      增加 */
	public Address insertAddress(Address address) {
		Address addre = new Address();
		addre.setAddressid(address.getParentaddressid());
		Address parentAddress = addressDao.getAddress(addre);
		if (parentAddress != null) {
			if ("Y".equals(parentAddress.getIsleaf())) {
				parentAddress.setIsleaf("N");
				addressDao.updateAddress(parentAddress);
		      }
		}
		address.setIsleaf("Y");
		address.setAddressallpin(PinYinUtil.getHanyuPingYin(address.getAddressname()));
		address.setAddresssimplepin(PinYinUtil.getHanyuPingYinInitial(address.getAddressname()));
		return addressDao.insertAddress(address);
	}
	
	/** @param 地址      删除 */
	public int deleteAddress(Address address) {
		return addressDao.deleteAddress(address);
	}
	
	/** @param 地址      修改 */
	public int updateAddress(Address address) {
		return addressDao.updateAddress(address);
	}
	
	/** @param 地址      根据ID创建地址树 */
	public List<Address> createTree(Address address){
		return addressDao.createTree(address);
	}
	
	/** @param 地址(T_ADDRESS) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return addressDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 地址(T_ADDRESS) 查询单条 */
	public Address getAddress(Address address){
		return (Address)addressDao.getAddress(address);
	}
	
	/** @param 地址(T_ADDRESS) 查询单条 */
	public List queryname(Address address){
		return addressDao.selectparentTree(address);
	}
	
	/** @param 地址(T_ADDRESS) 分页查询 */
	public Page getAddressListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return addressDao.getAddressForPage(map, pageNo, pageSize, sort, desc);
	}
}
