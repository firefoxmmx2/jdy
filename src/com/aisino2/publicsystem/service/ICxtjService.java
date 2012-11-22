package com.aisino2.publicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Cxtj;

public interface ICxtjService {

	/** @param 查询统计(t_cxtj) 查询单条 */
	Cxtj getCxtj(Cxtj cxtj);

	/** @param 查询统计(t_cxtj) 多条查询 */
	List getListCxtj(Cxtj cxtj);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getRcjctjListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getRcjctjlistqyxxForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getRcjctjlistrcjcxxForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getCsfltjListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	Page getCsyyzttjListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
}
