package com.aisino2.jdy.service;

import com.aisino2.jdy.domain.Jddxzpxx;


/**
 * 寄递品信息服务
 * @author hooxin
 *
 */
public interface IJddxzpxxService {
	/**
	 * 寄递品新增
	 * @param jddxzpxx
	 * @return
	 */
	Jddxzpxx insert(Jddxzpxx jddxzpxx);
	
	/**
	 * 删除
	 * @param jddxzpxx
	 */
	void delete(Jddxzpxx jddxzpxx);
	
	/**
	 * 获取单一的寄递品信息
	 * @param jddxzpxx
	 * @return
	 */
	Jddxzpxx get(Jddxzpxx jddxzpxx);
}
