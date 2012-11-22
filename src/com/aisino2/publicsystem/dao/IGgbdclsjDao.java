package com.aisino2.publicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Ggbdclsj;
public interface IGgbdclsjDao {
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 增加 */
	Ggbdclsj insertGgbdclsj(Ggbdclsj ggbdclsj);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 删除 */
	int deleteGgbdclsj(Ggbdclsj GGBDCLSJ);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 修改 */
	int updateGgbdclsj(Ggbdclsj GGBDCLSJ);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 查询单条 */
	Ggbdclsj getGgbdclsj(Ggbdclsj GGBDCLSJ);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 多条查询 */
	List getListGgbdclsj(Ggbdclsj GGBDCLSJ);
}
