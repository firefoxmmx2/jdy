package com.aisino2.jdy.service;

import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Rdrjbxx;

/**
 * 寄递对象服务
 * @author hooxin
 *
 */
public interface IRdrjbxxService {
	/**
	 * 添加寄递对象
	 * @param rdrjbxx
	 * @return
	 */
	Rdrjbxx insertRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 更新寄递对象
	 * @param rdrjbxx
	 */
	void updateRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 删除寄递对象
	 * @param rdrjbxx
	 */
	void deleteRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 获取单个寄递对象
	 * @param rdrjbxx
	 * @return
	 */
	Rdrjbxx getRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 公安端 公安端--个人频繁更换寄件单位统计查询
	 * @param para 
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page grpfghjjdwtjcxForPage(Map<String, Object> para,int pagesize, int pageno,String dir,String sort);
	/**
	 * 公安端 公安端--个人频繁更换寄件单位统计查询--详细信息列表
	 * @param para 
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page grpfghjjdwtjcxdalForPage(Map<String, Object> para,int pagesize, int pageno,String dir,String sort);
}
