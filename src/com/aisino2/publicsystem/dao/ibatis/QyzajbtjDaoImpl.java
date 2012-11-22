package com.aisino2.publicsystem.dao.ibatis;

import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.IQyzajbtjDao;

public class QyzajbtjDaoImpl extends BaseDao implements IQyzajbtjDao {
	public Page getQyzajbtjList(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		String sCol = "dsjgdm,fxjdm,gxdwdm,qybm ";
		
		map.put("pageSort", sCol);
		return queryForPage("getQyzajbtjList", map, pageNo,pageSize);
	}

	public Page getQyzajbbgtjList(Map map, int pageNo, int pageSize,
			String sort, String desc) {
		String sCol = "dsjgdm,fxjdm,gxdwdm,qybm ";
		map.put("pageSort", sCol);
		return queryForPage("getQyzajbbgtjList", map, pageNo,pageSize);
	}

	public Page getQyzabgListForPage(Map map, int pageNo, int pageSize,
			String sort, String desc) {
		// TODO Auto-generated method stub
		String sCol = " qybm ";
		map.put("pageSort", sCol);
		return queryForPage("getQyjbxxbgtjList",map,pageNo,pageSize);
	}

	public Page getListForPageQyjbxx(Map map, int pageNo, int pageSize,
			String sort, String desc) {
		// TODO Auto-generated method stub
		String sCol = " qybm ";
		map.put("pageSort", sCol);
		return queryForPage("getQyzaxxList",map,pageNo,pageSize);
	}
}
