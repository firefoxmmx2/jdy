package com.aisino2.icksystem.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.icksystem.dao.IIcktjrbDao;
import com.aisino2.icksystem.domain.Icktjrb;
import com.aisino2.icksystem.service.IIcktjrbService;

public class IcktjrbServiceImpl extends BaseService implements IIcktjrbService {

	private IIcktjrbDao icktjrbDao;

	/** @param IC卡统计日报(t_icktjrb) 增加 */
	public Icktjrb insertIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return (Icktjrb)icktjrbDao.insertIcktjrb(icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 删除 */
	public boolean deleteIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return icktjrbDao.deleteIcktjrb(icktjrb)>0;
	}

	/** @param IC卡统计日报(t_icktjrb) 修改 */
	public boolean updateIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return icktjrbDao.updateIcktjrb(icktjrb)>0;
	}

	/** @param IC卡统计日报(t_icktjrb) 查询单条 */
	public Icktjrb getIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return (Icktjrb)icktjrbDao.getIcktjrb(icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String groupBy = "";
		String selectTab="";
		if(((String)map.get("gxdwbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc,a.gxdwbm,a.gxdwmc";
			selectTab = groupBy;
		}else if(((String)map.get("fxjbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc";
			selectTab = groupBy + ",'' as gxdwbm,'' as gxdwmc";
		}else if(((String)map.get("dsjgbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc";
			selectTab = groupBy + ",'' as ssdxjgajgdm,'' as ssdxjgajgmc,'' as gxdwbm,'' as gxdwmc";
		}else{
			groupBy="";
			selectTab="'' as ssddsjgdm,'' as ssddsjgmc,'' as ssdxjgajgdm,'' as ssdxjgajgmc,'' as gxdwbm,'' as gxdwmc";
		}
		map.put("groupBy", groupBy);
		map.put("selectTab", selectTab);
		return icktjrbDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}
	
	public Page getcsmxListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		return icktjrbDao.getcsmxListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param IC卡统计日报(t_icktjrb) 多条查询 */
	public List getListIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return icktjrbDao.getListIcktjrb(icktjrb);
	}

	public IIcktjrbDao getIcktjrbDao() {
		return icktjrbDao;
	}

	public void setIcktjrbDao(IIcktjrbDao icktjrbDao) {
		this.icktjrbDao = icktjrbDao;
	}
}
