package com.aisino2.publicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.publicsystem.domain.Wscqy;
public interface IWscqyDao {
	/** @param 未上传企业(t_wscqy) 增加 */
	Wscqy insertWscqy(Wscqy wscqy);

	/** @param 未上传企业(t_wscqy) 删除 */
	int deleteWscqy(Wscqy wscqy);

	/** @param 未上传企业(t_wscqy) 修改 */
	int updateWscqy(Wscqy wscqy);

	/** @param 未上传企业(t_wscqy) 查询单条 */
	Wscqy getWscqy(Wscqy wscqy);

	/** @param 未上传企业(t_wscqy) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	/** @param 未上传企业(t_wscqy) 分页查询 */
	Page getXxListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 未上传企业(t_wscqy) 多条查询 */
	List getListWscqy(Wscqy wscqy);
	
	/** @param 未上传企业(t_wscqy) 分页查询 采集点台账用*/
	Page getWscqyListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 未上传企业(t_wscqy) 分页查询 采集点台账用*/
	Page getSkcstjListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 未上传企业(t_wscqy) 分页查询 企业刷卡未上传明细*/
	Page getSkwscmxListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	/** @param 未上传企业(t_wscqy) 企业刷卡统计*/
	Page getSkcstjListForPage_New(Map map, int pageNo,int pageSize,String sort,String desc);
	/** @param 未上传企业(t_wscqy) 企业刷卡统计 详细*/
	Page getSkcstjListForPage_Newxx(Map map, int pageNo,int pageSize,String sort,String desc);
	/** @param 刷卡统计(t_wscqy) 分页查询 企业查询*/
	Page getlistsktj_qyzs(Map map, int pageNo,int pageSize,String sort,String desc);
}
