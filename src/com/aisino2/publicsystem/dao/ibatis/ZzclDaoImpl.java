package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.IZzclDao;
import com.aisino2.publicsystem.domain.Zzcl;

public class ZzclDaoImpl extends BaseDao implements IZzclDao{

	public int deleteZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return delete("deleteZzcl", zzcl);
	}

	public Page getListForPage(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		// TODO Auto-generated method stub
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Qyid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getZzclList", map, pageNo,pageSize);
	}

	public List getListZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return queryForList("getZzclListNoPage", zzcl);
	}

	public Zzcl getZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return (Zzcl)queryForObject("getZzcl", zzcl);
	}

	public Zzcl getZzclNoBlob(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return (Zzcl)queryForObject("getZzclNoBlob", zzcl);
	}

	public Zzcl insertZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		zzcl.setZzclid(getNextID("Zzclid"));
		insert("insertZzcl", zzcl);
		return zzcl;
	}

	public int updateZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return update("updateZzcl", zzcl);
	}

}
