package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IRdrjbxxDao;
import com.aisino2.jdy.domain.Rdrjbxx;

public class RdrjbxxDaoImpl extends BaseDao implements IRdrjbxxDao {

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
				sCol = " Rdrjbxx.id "+ sort;
			else if("1".equals(sort))
				sCol = " Rdrjbxx.xm "+ sort;
			else if("2".equals(sort))
				sCol = " Rdrjbxx.zjhm "+ sort;
			else if("3".equals(sort))
				sCol = " Rdrjbxx.zjlx "+ sort;
			else 
				sCol=" Rdrjbxx.id ";
		}else{
			sCol=" Rdrjbxx.id ";
		}
		map.put("pageSort", sCol);
		return queryForPage("Rdrjbxx.getListPage", map, pageno,pagesize);
	}
    /**
     * 公安端--个人频繁更换寄件单位统计查询
     */
	public Page grpfghjjdwtjcxForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol=" xm ";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " xm "+ sort;
			else if("1".equals(dir))
				sCol = " kssj "+ sort;
			else if("2".equals(dir))
				sCol = " jssj "+ sort;
			else if("3".equals(dir))
				sCol = " gxdwmc "+ sort;
			else if("4".equals(dir))
				sCol = " ghjjdwcs "+ sort;
			else 
				sCol=" xm ";
		}
		map.put("pageSort", sCol);
		return queryForPage("grpfghjjdwtjcxgad.getListPage", map, pageno,pagesize);
	}
	/**
     * 公安端--个人频繁更换寄件单位统计查询----详细信息列表
     */
	public Page grpfghjjdwtjcxdalForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol=" xh ";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " djxh "+ sort;
			else if("1".equals(dir))
				sCol = " xh "+ sort;
			else if("2".equals(dir))
				sCol = " jjrxm "+ sort;
			else if("3".equals(dir))
				sCol = " jjsj "+ sort;
			else if("4".equals(dir))
				sCol = " cjqy "+ sort;
			else if("5".equals(dir))
				sCol = " wldh "+ sort;
			else if("6".equals(dir))
				sCol = " sjrxm "+ sort;
			else if("7".equals(dir))
				sCol = " sjrdh "+ sort;
			else if("8".equals(dir))
				sCol = " sjrxxdz "+ sort;
			else 
				sCol=" xh ";
		}
		map.put("pageSort", sCol);
		return queryForPage("fghjjdwtjcxdal.getListPage", map, pageno,pagesize);
	}

}
