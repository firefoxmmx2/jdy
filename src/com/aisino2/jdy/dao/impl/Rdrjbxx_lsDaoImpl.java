package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IRdrjbxxDao;
import com.aisino2.jdy.dao.IRdrjbxx_lsDao;
import com.aisino2.jdy.domain.Rdrjbxx;

public class Rdrjbxx_lsDaoImpl extends BaseDao implements IRdrjbxx_lsDao {

	public Rdrjbxx insert(Rdrjbxx rdrjbxx) {
		rdrjbxx.setId(getNextID("rdrjbxx_id"));
		insert("Rdrjbxx.insert", rdrjbxx);
		return rdrjbxx;
	}

	public void update(Rdrjbxx rdrjbxx) {
		update("Rdrjbxx.update", rdrjbxx);
	}

	public void delete(Rdrjbxx rdrjbxx) {
		delete("Rdrjbxx.delete", rdrjbxx);
	}

	public Rdrjbxx get(Rdrjbxx rdrjbxx) {
		return (Rdrjbxx) queryForObject("Rdrjbxx.get", rdrjbxx);
	}

	public List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx) {
		
		return queryForList("Rdrjbxx.getList", rdrjbxx);
	}

	public List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx, String dir, String sort) {
		return null;
	}

	public Page findRdrjbxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " Rdrjbxx_ls.xm "+ sort;
			else if("1".equals(sort))
				sCol = " Rdrjbxx_ls.xb "+ sort;
			else if("2".equals(sort))
				sCol = " Rdrjbxx_ls.ljsjf "+ sort;
			else if("3".equals(sort))
				sCol = " Rdrjbxx_ls.ljsjt "+ sort;
			else if("3".equals(sort))
				sCol = " Rdrjbxx_ls.gxdwmc "+ sort;
			else if("3".equals(sort))
				sCol = " Rdrjbxx_ls.jjcs "+ sort;
			else 
				sCol=" Rdrjbxx_ls.xm ";
		}else{
			sCol=" Rdrjbxx_ls.xm ";
		}
		map.put("pageSort", sCol);
		return queryForPage("Rdrjbxx_ls.getListPage", map, pageno,pagesize);
	}

}
