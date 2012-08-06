package com.aisino2.sysadmin.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.sysadmin.dao.IAddressdetailDao;
import com.aisino2.sysadmin.domain.Addressdetail;

public class AddressdetailDaoImpl extends BaseDao implements IAddressdetailDao {
	/** @param 地址详址(T_ADDRESSDETAIL) 增加 */
	public Addressdetail insertAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		ADDRESSDETAIL.setDzxzid(getNextID("Dzxzid"));
		return (Addressdetail)insert("insertAddressdetail", ADDRESSDETAIL);
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 删除 */
	public int deleteAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return delete("deleteAddressdetail", ADDRESSDETAIL);
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 修改 */
	public int updateAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return update("updateAddressdetail", ADDRESSDETAIL);
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 查询单条 */
	public Addressdetail getAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return (Addressdetail)queryForObject("getAddressdetail", ADDRESSDETAIL);
	}
  
  public List Selectaddress(Addressdetail ADDRESSDETAIL){
		return queryForList("getSelectaddressdetail",ADDRESSDETAIL);
		}
	
	//地址树分页查询
	public Page getListtreeForPage(Map map, int pageNo,int pageSize,String sort,String desc){
	    
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.dzxzid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getAddressdetailtreeList", map, pageNo,pageSize);
	}
	
	/** @param 地址详址(T_ADDRESSDETAIL) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Dzxzid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getAddressdetailList", map, pageNo,pageSize);
	}

	/** @param 地址详址(T_ADDRESSDETAIL) 多条查询 */
	public List getListAddressdetail(Addressdetail ADDRESSDETAIL){
		// TODO: implement
		return queryForList("getAddressdetailListNoPage", ADDRESSDETAIL);
	}
}
