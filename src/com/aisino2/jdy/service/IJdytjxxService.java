package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Jdytjxx;
import com.aisino2.jdy.domain.Rdrjbxx;

public interface IJdytjxxService {
	List<Jdytjxx> getJjltj(Map<String, Object> map);
	List<Jdytjxx> getSjltj(Map<String, Object> map);
	List<Jdytjxx> getQyljltj(Map<String, Object> map);
	List<Jdytjxx> getQypjltj(Map<String, Object> map);
	
	Page getSjgltj(Map<String,Object> paras,int pageno,int pagesize,String dir,String sort);
	
	Page getYxqktj(Map<String,Object> paras,int pageno,int pagesize,String dir,String sort);
	
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
	 * 台帐用企业信息查询
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
	 * 物品分类统计查询
	 * @param map
	 * @return
	 */
	public List<Jdytjxx> getWpfltj(Map<String, Object> map);
	
	/**
	 * 历史数据轨迹查询
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findLssjForPage(Map<String, Object> params, int pageno, int pagesize,
			String sort, String dir);
	
	/**
	 * 重点人员管控查询
	 * @param paras
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	Page findZdryForPage(Map<String, Object> params, int pagesize, int pagerow,
			String sort, String dir);
	
	/**
	 * 数据关联度分析核实
	 * @param rdrjbxx
	 */
	Rdrjbxx insertVerifySjgltj(Rdrjbxx rdrjbxx);
}
