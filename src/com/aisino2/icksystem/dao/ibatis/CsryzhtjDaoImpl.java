package com.aisino2.icksystem.dao.ibatis;

import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.icksystem.dao.ICsryzhtjDao;

public class CsryzhtjDaoImpl extends BaseDao implements ICsryzhtjDao {

	public Page getListForPage(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		// TODO Auto-generated method stub
		return queryForPage("getCsryzhtjList", map, pageNo,pageSize);
	}

}
