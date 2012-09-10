package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Ljjbxx;

/**
 * 揽件服务
 * @author hooxin
 *
 */
public interface ILjjbxxService {
	/**
	 * 添加揽件信息
	 * @param ljjbxx
	 * @return
	 */
	Ljjbxx insertLjjbxx(Ljjbxx ljjbxx);
	/**
	 * 更新揽件信息
	 * @param ljjbxx
	 * @return
	 */
	void updateLjjbxx(Ljjbxx ljjbxx);
	/**
	 * 删除揽件信息
	 * @param ljjbxx
	 */
	void deleteLjjbxx(Ljjbxx ljjbxx);
	
	/**
	 * 获取揽件信息列表
	 * @param ljjbxx
	 * @return
	 */
	List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx);
	/**
	 * 获取揽件信息列表 带排序
	 * @param ljjbxx
	 * @param dir
	 * @param sort
	 * @return
	 */
	List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx,String dir, String sort);
	
	/**
	 * 获取揽件信息列表 分页排序
	 * @param para 
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findLjjbxxForPage(Map<String, Object> para,int pageno, int pagesize,String dir,String sort );
	/**
	 * 公安端 寄递品信息关联   分页查询
	 * @param para 
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page gadjdpxxForPage(Map<String, Object> para,int pageno, int pagesize,String dir,String sort );
	
	/**
	 * 生成揽件信息的登记序号
	 * @param qybm 企业编码
	 * @return
	 */
	String generateLjdjxh(String qybm);
	
	/**
	 * 获取单一的揽件信息
	 * @param ljjbxx
	 * @return
	 */
	Ljjbxx getLjjbxx(Ljjbxx ljjbxx);
	
	/**
	 * 验证物流单号是否可用
	 * @param qybm 企业编码
	 * @param wldh 物流单号
	 * @return
	 */
	boolean isAvailableWldh(String qybm,String wldh);
}
