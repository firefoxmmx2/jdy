package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IJdytjxxDao;
import com.aisino2.jdy.domain.Jdytjxx;

/**
 *	寄递业统计
 * @author hooxin
 *
 */
public class JdytjxxDaoImpl extends BaseDao implements IJdytjxxDao {

	
	public List<Jdytjxx> getJjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.jjltj", map);
	}

	
	public List<Jdytjxx> getSjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.sjltj", map);
	}

	
	public List<Jdytjxx> getQyljltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.qyljltj", map);
	}

	
	public List<Jdytjxx> getQypjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.qypjltj", map);
	}

	/**
	 * 数据关联度分析统计查询
	 * */
	public Page getSjgltj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " rdrjbxx.xm "+ sort;
			else if("1".equals(dir))
				sCol = " rdrjbxx.lxdh "+ sort;
			else if("2".equals(dir))
				sCol = " rdrjbxx.xxdz "+ sort;
			else if("3".equals(dir))
				sCol = " rdrjbxx.jdrylx "+ sort;
			else 
				sCol=" rdrjbxx.xm ";
		}else{
			sCol=" rdrjbxx.xm ";
		}
		paras.put("pageSort", sCol);
		
		return queryForPage("Jdytjxx.sjgltj", paras, pageno,pagesize);
		
	}

}
