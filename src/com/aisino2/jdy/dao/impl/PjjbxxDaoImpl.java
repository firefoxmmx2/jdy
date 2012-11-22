package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IPjjbxxDao;
import com.aisino2.jdy.domain.Pjjbxx;

public class PjjbxxDaoImpl extends BaseDao implements IPjjbxxDao {
	
	public Pjjbxx insert(Pjjbxx pjjbxx) {
		pjjbxx.setId(this.getNextID("pjjbxx_id"));
		insert("pjjbxx.insert",pjjbxx);
		return pjjbxx;
	}

	
	public void update(Pjjbxx pjjbxx) {
		update("pjjbxx.update",pjjbxx);
	}

	
	public void delete(Pjjbxx pjjbxx) {
		delete("pjjbxx.delete", pjjbxx);
	}

	
	public Pjjbxx get(Pjjbxx pjjbxx) {
		return (Pjjbxx) queryForObject("pjjbxx.get", pjjbxx);
	}

	
	public List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx) {
		return queryForList("pjjbxx.getList", pjjbxx);
	}

	
	public Page findPjjbxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol=" ljjbxx.djxh ";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " ljjbxx.djxh "+ sort;
			else if("1".equals(dir))
				sCol = " ljjbxx.wldh "+ sort;
			else if("2".equals(dir))
				sCol = " sjr.xm "+ sort;
			else if("3".equals(dir))
				sCol = " sjr.zjlx "+ sort;
			else if("4".equals(dir))
				sCol = " sjr.zjhm "+ sort;
			else if("5".equals(dir))
				sCol = "pjjbxx.pjsj "+ sort;
			else if("6".equals(dir))
				sCol = "pjr.xm "+ sort;
			else if("7".equals(dir))
				sCol = "pjjbxx.pjtbsj "+ sort;
			else 
				sCol=" ljjbxx.djxh ";
		}
		
		map.put("pageSort", sCol);
		return queryForPage("pjjbxx.getListPage", map, pageno,pagesize);
	}


}
