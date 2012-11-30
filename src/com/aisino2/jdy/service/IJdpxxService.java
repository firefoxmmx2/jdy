package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Jdpxx;

/**
 * 寄递品信息服务
 * @author hooxin
 *
 */
public interface IJdpxxService {
	/**
	 * 寄递品新增
	 * @param jdpxx
	 * @return
	 */
	Jdpxx insertJdpxx(Jdpxx jdpxx);
	/**
	 * 寄递品更新 （暂时永不到，一般来说不让修改，让删除在新增）
	 * @param jdpxx
	 */
	void updateJdpxx(Jdpxx jdpxx);
	/**
	 * 删除
	 * @param jdpxx
	 */
	void deleteJdpxx(Jdpxx jdpxx);
	
	/**
	 * 查询寄递品列表
	 * @param jdpxx
	 * @return
	 */
	List<Jdpxx> findJdpxxs(Jdpxx jdpxx);
	
	/**
	 * 查询寄递品信息 分页
	 * @param map 参数字典
	 * @param pageno 起始页码 
	 * @param pagesize 每页数
	 * @param dir 排序的字段位置
	 * @param sort 升降序
	 * @return
	 */
	Page findJdpxxsForPage(Map<String, Object> map, int pageno, int pagesize, String dir, String sort);
	
	/**
	 * 获取单一的寄递品信息
	 * @param ljjbxx
	 * @return
	 */
	Jdpxx getJdpxx(Jdpxx jdpxx);
	/**
	 * 查询预警寄递物品
	 * @param map
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findYjwpForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort);
	
	/**
	 * 添加预警寄递物品
	 */
	void setYjwp(Map map);
}
