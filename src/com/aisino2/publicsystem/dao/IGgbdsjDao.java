package com.aisino2.publicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Ggbdsj;
public interface IGgbdsjDao {
	/** @param 公共比对数据表(T_GGBDSJ) 增加 */
	Ggbdsj insertGgbdsj(Ggbdsj GGBDSJ);

	/** @param 公共比对数据表(T_GGBDSJ) 删除 */
	int deleteGgbdsj(Ggbdsj GGBDSJ);

	/** @param 公共比对数据表(T_GGBDSJ) 修改 */
	int updateGgbdsj(Ggbdsj GGBDSJ);

	/** @param 公共比对数据表(T_GGBDSJ) 查询单条 */
	Ggbdsj getGgbdsj(Ggbdsj GGBDSJ);

	/** @param 公共比对数据表(T_GGBDSJ) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 公共比对数据表(T_GGBDSJ) 多条查询 */
	List getListGgbdsj(Ggbdsj GGBDSJ);
}
