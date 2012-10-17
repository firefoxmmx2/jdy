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


	public Page getYxqktj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " gxdwmc "+ sort;
			else if("1".equals(dir))
				sCol = " qyzs "+ sort;
			else if("2".equals(dir))
				sCol = " zjs "+ sort;
			else if("3".equals(dir))
				sCol = " cyrys "+ sort;
			else if("4".equals(dir))
				sCol = " ljs "+ sort;
			else if("5".equals(dir))
				sCol = " pjs "+ sort;
			else if("6".equals(dir))
				sCol = " wscqys "+ sort;
			else 
				sCol=" gxdwmc ";
		}else{
			sCol=" gxdwmc ";
		}
		paras.put("pageSort", sCol);
		
		return queryForPage("Jdytjxx.yxqktj", paras, pageno,pagesize);
	}


	public Page getQyljpjqktj(Map<String, Object> paras, int pageno,
			int pagesize, String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " qybm "+ sort;
			else if("1".equals(dir))
				sCol = " qymc "+ sort;
			else if("2".equals(dir))
				sCol = " gxdwbm "+ sort;
			else if("3".equals(dir))
				sCol = " ljs "+ sort;
			else if("4".equals(dir))
				sCol = " pjs "+ sort;
			else if("5".equals(dir))
				sCol = " lxdh "+ sort;
			else if("6".equals(dir))
				sCol = " zt "+ sort;
			else 
				sCol=" qybm ";
		}else{
			sCol=" qybm ";
		}
		paras.put("pageSort", sCol);
		
		return queryForPage("Jdytjxx.qyljpjqktj", paras, pageno, pagesize);
	}


	public Page getWscqycx(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " a.qybm "+ sort;
			else if("1".equals(dir))
				sCol = " a.qymc "+ sort;
			else if("2".equals(dir))
				sCol = " a.gxdwbm "+ sort;
			else if("3".equals(dir))
				sCol = " a.jjlxbm "+ sort;
			else if("4".equals(dir))
				sCol = " a.zrs "+ sort;
			else if("5".equals(dir))
				sCol = " a.yyztdm "+ sort;
			else if("6".equals(dir))
				sCol = " a.zjztdm "+ sort;
			else if("7".equals(dir))
				sCol = " a.lxdh "+ sort;
			else if("8".equals(dir))
				sCol = " a.zt "+ sort;
			else 
				sCol=" a.qybm ";
		}else{
			sCol=" a.qybm ";
		}
		paras.put("pageSort", sCol);
		return queryForPage("Jdytjxx.wscqycx", paras, pageno, pagesize);
	}


	public Page getJdyQyjbxxList(Map<String, Object> paras, int pageno,
			int pagesize, String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " a.qybm "+ sort;
			else if("1".equals(dir))
				sCol = " a.qymc "+ sort;
			else if("2".equals(dir))
				sCol = " a.gxdwbm "+ sort;
			else if("3".equals(dir))
				sCol = " a.jjlxbm "+ sort;
			else if("4".equals(dir))
				sCol = " a.zrs "+ sort;
			else if("5".equals(dir))
				sCol = " a.yyztdm "+ sort;
			else if("6".equals(dir))
				sCol = " a.zjztdm "+ sort;
			else if("7".equals(dir))
				sCol = " a.lxdh "+ sort;
			else if("8".equals(dir))
				sCol = " a.zt "+ sort;
			else 
				sCol=" a.qybm ";
		}else{
			sCol=" a.qybm ";
		}
		paras.put("pageSort", sCol);
		return queryForPage("getQyjbxxList", paras, pageno, pagesize);
	}

	/**
	 * 物品分类统计
	 */
	public List<Jdytjxx> getWpfltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.wpfltj", map);
	}

}
