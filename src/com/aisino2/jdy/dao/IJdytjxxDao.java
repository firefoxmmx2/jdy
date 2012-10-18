package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Jdytjxx;

public interface IJdytjxxDao {
	/**
	 * 个人寄件统计
	 * 
	 * @param map
	 * @return
	 */
	List<Jdytjxx> getJjltj(Map<String, Object> map);

	/**
	 * 个人收件统计
	 * 
	 * @param map
	 * @return
	 */
	List<Jdytjxx> getSjltj(Map<String, Object> map);

	/**
	 * 企业揽件统计
	 * 
	 * @param map
	 * @return
	 */
	List<Jdytjxx> getQyljltj(Map<String, Object> map);

	/**
	 * 企业派件数统计
	 * 
	 * @param map
	 * @return
	 */
	List<Jdytjxx> getQypjltj(Map<String, Object> map);

	/**
	 * 数据关联度统计查询
	 * 
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page getSjgltj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort);

	/**
	 * 寄递运行情况统计
	 * 
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page getYxqktj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort);

	/**
	 * 寄递业企业揽件派件情况统计　（昨日）
	 * 
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page getQyljpjqktj(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort);

	/**
	 * 未上传企业列表查询
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page getWscqycx(Map<String, Object> paras, int pageno, int pagesize,
			String dir, String sort);
	
	/**
	 * 台帐用的弹出式窗口的企业信息
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page getJdyQyjbxxList(Map<String,Object> paras, int pageno, int pagesize,
			String dir, String sort);
	
	/**
	 * 获取历史数据轨迹信息
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findLssjForPage(Map<String, Object> map, int pageno, int pagesize,	String sort, String dir);
	
	/**
	 * 物品分类统计
	 * @param map
	 * @return
	 */
	List<Jdytjxx> getWpfltj(Map<String, Object> map);
}
