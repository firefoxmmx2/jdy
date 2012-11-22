package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Ljjbxx;

public interface ILjjbxxDao {
	Ljjbxx insert(Ljjbxx ljjbxx);
	void update(Ljjbxx ljjbxx);
	void delete(Ljjbxx ljjbxx);
	
	
	List<Ljjbxx> findLjjbxxs(Ljjbxx ljjbxx);
	
	Page findLjjbxxsForPage(Map<String, Object> map,int pageno ,int pagesize,String dir, String sort);
	/*
	 *公安端 寄递品信息关联 分页查询 
	 */
	Page gadjdpxxForPage(Map<String, Object> map,int pageno ,int pagesize,String dir, String sort);
	
	String generateDjxh(String qybm);
	
	/**
	 * 获取单一的揽件信息
	 * @return
	 */
	Ljjbxx get(Ljjbxx ljjbxx);
	/**
	 * 获取符合条件的记录数
	 * @param map 
	 * @return
	 */
	Integer count(Map<String, Object> map);
}
