package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

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

}