package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.IJdytjxxDao;
import com.aisino2.jdy.domain.Jdytjxx;
import com.aisino2.jdy.service.IJdytjxxService;

/**
 * 寄递业统计服务
 * @author hooxin
 *
 */
public class JdytjxxServiceImpl extends BaseService implements IJdytjxxService {
	private IJdytjxxDao jdytjxxDao;
	
	
	
	public void setJdytjxxDao(IJdytjxxDao jdytjxxDao) {
		this.jdytjxxDao = jdytjxxDao;
	}


	/**
	 * 个人寄件量统计
	 * */
	public List<Jdytjxx> getJjltj(Map<String, Object> map) {
		if(map.isEmpty())
			throw new RuntimeException("个人寄件量统计参数不能为空");
		if(!map.containsKey("show_number") || map.get("show_number") == null)
			throw new RuntimeException("个人寄件量统计显示条目不能为空");
		
		return jdytjxxDao.getJjltj(map);
	}

	/**
	 * 个人收件量统计
	 * */
	public List<Jdytjxx> getSjltj(Map<String, Object> map) {
		if(map.isEmpty())
			throw new RuntimeException("个人收件量统计参数不能为空");
		if(!map.containsKey("show_number") || map.get("show_number") == null)
			throw new RuntimeException("个人收件量统计显示条目不能为空");
		return jdytjxxDao.getSjltj(map);
	}

	/**
	 * 企业揽件量统计
	 * */
	public List<Jdytjxx> getQyljltj(Map<String, Object> map) {
		if(map.isEmpty())
			throw new RuntimeException("企业揽件量统计参数不能为空");
		if(!map.containsKey("show_number") || map.get("show_number") == null)
			throw new RuntimeException("企业揽件量统计显示条目不能为空");
		return jdytjxxDao.getQyljltj(map);
	}

	/**
	 * 企业派件量统计
	 * */
	public List<Jdytjxx> getQypjltj(Map<String, Object> map) {
		if(map.isEmpty())
			throw new RuntimeException("企业派件量统计参数不能为空");
		if(!map.containsKey("show_number") || map.get("show_number") == null)
			throw new RuntimeException("企业派件量统计显示条目不能为空");
		return jdytjxxDao.getQypjltj(map);
	}

	/***
	 * 数据关联度分析统计查询
	 * */
	public Page getSjgltj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		if(paras.isEmpty())
			throw new RuntimeException("数据关联度分析查询参数不能为空");
//		if(!(paras.containsKey("xm") 
//				|| paras.containsKey("lxdh")
//				|| paras.containsKey("xxdz")))
		return jdytjxxDao.getSjgltj(paras,pageno,pagesize,dir,sort);
	}

	/***
	 * 寄递业运行情况统计
	 */
	public Page getYxqktj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		return jdytjxxDao.getYxqktj(paras,pageno,pagesize,dir,sort);
	}


	public Page getQyljpjqktj(Map<String, Object> paras, int pageno,
			int pagesize, String dir, String sort) {
		return jdytjxxDao.getQyljpjqktj(paras, pageno, pagesize, dir, sort);
	}


	public Page getWscqycx(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort) {
		return jdytjxxDao.getWscqycx(paras, pageno, pagesize, dir, sort);
	}


	public Page getJdyQyjbxxList(Map<String, Object> paras, int pageno,
			int pagesize, String dir, String sort) {
		return jdytjxxDao.getJdyQyjbxxList(paras, pageno, pagesize, dir, sort);
	}


	/**
	 * 物品分类统计查询
	 * @param map
	 * @return
	 */
	public List<Jdytjxx> getWpfltj(Map<String, Object> map) {
		return jdytjxxDao.getWpfltj(map);
	}


	public Page findLssjForPage(Map<String, Object> params, int pageno,
			int pagesize, String sort, String dir) {
		return jdytjxxDao.findLssjForPage(params, pageno, pagesize, sort, dir);
	}


	public Page findZdryForPage(Map<String, Object> params, int pageno,
			int pagesize, String sort, String dir) {
		return null;
	}

}
