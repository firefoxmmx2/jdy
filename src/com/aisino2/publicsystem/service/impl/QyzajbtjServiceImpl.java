package com.aisino2.publicsystem.service.impl;

import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IQyzajbtjDao;
import com.aisino2.publicsystem.service.IQyzajbtjService;

public class QyzajbtjServiceImpl extends BaseService implements IQyzajbtjService{
	private IQyzajbtjDao qyzajbtjDao;
	public Page getQyzajbtjList(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		getConditions(map);
		return qyzajbtjDao.getQyzajbtjList(map, pageNo, pageSize, sort, desc);
	}
	private void getConditions(Map map) {
		boolean dsjgbz = ((String) map.get("dsjgbz")).equalsIgnoreCase("1");
		boolean fxjbz = ((String) map.get("fxjbz")).equalsIgnoreCase("1");
		boolean gxdwbz = ((String) map.get("gxdwbz")).equalsIgnoreCase("1");
		boolean csbz = ((String) map.get("csbz")).equalsIgnoreCase("1");
		String groupBy = "";
		String selectConditon = "";
		if (csbz) {
			groupBy = "dsjgdm,dsjgmc" + ",fxjdm,fxjmc" + ",gxdwdm,t.gxdwmc"
					+ ",t.qybm,t.qymc" +",t.hylbdm";
			selectConditon = groupBy;
		} else if (gxdwbz) {

			groupBy = "dsjgdm,dsjgmc" + ",fxjdm,fxjmc" + ",gxdwdm,t.gxdwmc"+",t.hylbdm";
			selectConditon = groupBy + ",'' as qybm,'' as qymc";
		} else if (fxjbz) {
			groupBy = "dsjgdm,dsjgmc" + ",fxjdm,fxjmc"+",t.hylbdm";
			selectConditon = groupBy + ",'' as gxdwdm,'' as gxdwmc"
					+ ",'' as qybm,'' as qymc";
		} else if (dsjgbz) {
			groupBy = "dsjgdm,dsjgmc"+",t.hylbdm";
			selectConditon = groupBy + ",'' as fxjdm,'' as fxjmc"
					+ ",'' as gxdwdm,'' as gxdwmc" + ",'' as qybm,'' as qymc";
		} else {
			groupBy = "t.hylbdm";
			selectConditon = "'' as dsjgdm,'' as dsjgmc"
					+ ",'' as fxjdm,'' as fxjmc" + ",'' as gxdwdm,'' as gxdwmc"
					+ ",'' as qybm,'' as qymc,t.hylbdm";
		}
		map.put("groupBy", groupBy);
		map.put("selectConditon", selectConditon);
	}
	public Page getQyzajbbgtjList(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		getConditions(map);
		return qyzajbtjDao.getQyzajbbgtjList(map, pageNo, pageSize, sort, desc);
	}
	public IQyzajbtjDao getQyzajbtjDao() {
		return qyzajbtjDao;
	}
	public void setQyzajbtjDao(IQyzajbtjDao qyzajbtjDao) {
		this.qyzajbtjDao = qyzajbtjDao;
	}
	public Page getQyzabgListForPage(Map map, int pageNo, int pageSize,
			String sort, String desc) {
		// TODO Auto-generated method stub
		return qyzajbtjDao.getQyzabgListForPage(map, pageNo, pageSize, sort, desc);
	}
	public Page getListForPageQyjbxx(Map map, int pageNo, int pageSize,
			String sort, String desc) {
		// TODO Auto-generated method stub
		return qyzajbtjDao.getListForPageQyjbxx(map, pageNo, pageSize, sort, desc);
	}
	
}
