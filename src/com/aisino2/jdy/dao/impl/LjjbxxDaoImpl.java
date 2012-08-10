package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.domain.Ljjbxx;

public class LjjbxxDaoImpl extends BaseDao implements ILjjbxxDao {

	@Override
	public Ljjbxx insert(Ljjbxx ljjbxx) {
		if(ljjbxx.getQyjbxx() != null && ljjbxx.getQyjbxx().getQybm()!=null){
			ljjbxx.setDjxh(generateDjxh(ljjbxx.getQyjbxx().getQybm()));
		}
		insert("ljjbxx.insert", ljjbxx);
		return ljjbxx;
	}

	@Override
	public void update(Ljjbxx ljjbxx) {
		update("ljjbxx.update", ljjbxx);
	}

	@Override
	public void delete(Ljjbxx ljjbxx) {
		delete("ljjbxx.delete",ljjbxx);
	}

	@Override
	public List<Ljjbxx> findLjjbxxs(Ljjbxx ljjbxx) {
		return queryForList("ljjbxx.getList", ljjbxx);
	}

	@Override
	public Page findLjjbxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {	
		
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " ljjbxx.djxh "+ sort;
			else if("1".equals(sort))
				sCol = " ljjbxx.wldh "+ sort;
			else if("2".equals(sort))
				sCol = " jjr.xm "+ sort;
			else if("3".equals(sort))
				sCol = " jjr.zjlx "+ sort;
			else if("4".equals(sort))
				sCol = " jjr.zjhm "+ sort;
			else if("5".equals(sort))
				sCol = "ljjbxx.ljsj "+ sort;
			else if("6".equals(sort))
				sCol = "ljr.xm "+ sort;
			else if("7".equals(sort))
				sCol = "ljjbxx.ljtbsj "+ sort;
			else 
				sCol=" ljjbxx.djxh ";
		}else{
			sCol=" ljjbxx.djxh ";
		}
		map.put("pageSort", sCol);
		return queryForPage("ljjbxx.getListPage", map, pageno,pagesize);
	}

	@Override
	public String generateDjxh(String qybm) {
		// TODO Auto-generated method stub
		return null;
	}

}
