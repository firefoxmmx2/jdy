package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.domain.Jdpxx;

public class JdpxxDaoImpl extends BaseDao implements IJdpxxDao {

	
	public Jdpxx insert(Jdpxx jdpxx) {
		jdpxx.setId(this.getNextID("jdpxx_id"));
		insert("jdpxx.insert",jdpxx);
		return jdpxx;
	}

	
	public void update(Jdpxx jdpxx) {
		update("jdpxx.update", jdpxx);
	}

	
	public void delete(Jdpxx jdpxx) {
		delete("jdpxx.delete",jdpxx);
	}

	
	public Jdpxx get(Jdpxx jdpxx) {
		return (Jdpxx) queryForObject("jdpxx.get", jdpxx);
	}

	
	public List<Jdpxx> findJdpxxs(Jdpxx jdpxx) {
		return queryForList("jdpxx.getList", jdpxx);
	}

	
	public Page findJdpxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " jdpxx.id "+ sort;
			else if("1".equals(sort))
				sCol = " jdpxx.jdpmc "+ sort;
			else if("2".equals(sort))
				sCol = " jdpxx.jdplx "+ sort;
			else if("3".equals(sort))
				sCol = " jdpxx.jdpsm "+ sort;
			else 
				sCol=" jdpxx.id ";
		}else{
			sCol=" jdpxx.id ";
		}
		map.put("pageSort", sCol);
		return queryForPage("jdpxx.getListPage", map, pageno,pagesize);
	}

	/*
	 * 根据ljjbxx_id号查询该揽件信息是否还存在可以寄递物品
	 */
	public Jdpxx getkyjdwp(Jdpxx jdpxx) {
		return (Jdpxx) queryForObject("jdpxx.getkyjdwp", jdpxx);
	}
	/**
	 * 查询预警寄递物品
	 * @param map
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	public Page findYjwpForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		return queryForPage("jdpxx.getYjwpListPage", map, pageno,pagesize);
	}
	/**
	 * 查询预警寄递物品处理信息
	 * @param map
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	public Page findYjwuclList(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort){
		String sCol="";
		if(dir == null)
			dir = "";
		else if(!dir.equals("asc") && !dir.equals("desc"))
			dir = " asc ";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " q.Qymc "+ dir;
			else if("1".equals(sort))
				sCol = " t.Wldh "+ dir;
			else if("2".equals(sort))
				sCol = " j.Xm "+ dir;
			else if("3".equals(sort))
				sCol = " j.Zjhm "+ dir;
			else if("4".equals(sort))
				sCol = " s.Xm "+ dir;
			else if("5".equals(sort))
				sCol = " d.Display_Name "+ dir;
			else if("6".equals(sort))
				sCol = " x.Display_Name "+ dir;
			else if("7".equals(sort))
				sCol = " t.Ljtbsj "+ dir;
		}else
			sCol = " t.Ljtbsj "+ dir;
		map.put("pageSort", sCol);
		return queryForPage("jdpxx.findYjwuclList", map, pageno,pagesize);
	}
	/**
	 * 添加预警寄递物品
	 */
	public void setYjwp(Map map){
		update("jdpxx.setYjwp", map);
	}
}
