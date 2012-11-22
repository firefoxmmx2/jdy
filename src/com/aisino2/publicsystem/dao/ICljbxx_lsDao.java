package com.aisino2.publicsystem.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Cljbxx;

public interface ICljbxx_lsDao {
	/** @param 车辆基本信息(t_cljbxx) 增加 */
	Cljbxx insertCljbxx_ls(Cljbxx cljbxx);

	/** @param 车辆基本信息(t_cljbxx) 删除 */
	int deleteCljbxx_ls(Cljbxx cljbxx);

	/** @param 车辆基本信息(t_cljbxx) 修改 */
	int updateCljbxx_ls(Cljbxx cljbxx);

	/** @param 车辆基本信息(t_cljbxx) 查询单条 */
	Cljbxx getCljbxx_ls(Cljbxx cljbxx);

	/** @param 车辆基本信息(t_cljbxx) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 车辆基本信息(t_cljbxx) 多条查询 */
	List getListCljbxx_ls(Cljbxx cljbxx);

}
