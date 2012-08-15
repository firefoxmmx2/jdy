package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Pjjbxx;

/**
 * 派件信息服务器
 * @author hooxin
 *
 */
public interface IPjjbxxService {
	/**
	 * 添加派件基本信息
	 * @param pjjbxx
	 * @return
	 */
	Pjjbxx insertPjjbxx(Pjjbxx pjjbxx);
	/**
	 * 删除派件信息
	 * @param pjjbxx
	 */
	void deletePjjbxx(Pjjbxx pjjbxx);
	/**
	 * 更新派件信息
	 * @param pjjbxx
	 */
	void updatePjjbxx(Pjjbxx pjjbxx);
	
	/**
	 * 获取派件信息
	 * @param pjjbxx
	 * @return
	 */
	List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx);
	/**
	 * 获取派件信息 带排序
	 * @param pjjbxx
	 * @param dir
	 * @param sort
	 * @return
	 */
	List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx,String dir,String sort);
	
	/**
	 * 获取派件信息 分页排序
	 * @param map
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findPjjbxxsForPage(Map<String, Object> map,int pageno,int pagesize,String dir,String sort);
	
	/**
	 * 获取单个派件信息
	 * @param pjjbxx
	 * @return
	 */
	Pjjbxx getPjjbxx(Pjjbxx pjjbxx);
}
