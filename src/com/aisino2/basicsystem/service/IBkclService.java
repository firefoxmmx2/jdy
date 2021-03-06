package com.aisino2.basicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.basicsystem.domain.Bkcl;
import com.aisino2.core.dao.Page;

public interface IBkclService {
	/** @param 布控车辆(t_bkcl) 增加 */
	Bkcl insertBkcl(Bkcl bkcl);

	/** @param 布控车辆(t_bkcl) 删除 */
	boolean deleteBkcl(Bkcl bkcl);

	/** @param 布控车辆(t_bkcl) 修改 */
	boolean updateBkcl(Bkcl bkcl);

	/** @param 布控车辆(t_bkcl) 查询单条 */
	Bkcl getBkcl(Bkcl bkcl);

	/** @param 布控车辆(t_bkcl) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 布控车辆(t_bkcl) 多条查询 */
	List getListBkcl(Bkcl bkcl);
}
