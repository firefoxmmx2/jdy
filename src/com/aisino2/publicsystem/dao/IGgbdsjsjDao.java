package com.aisino2.publicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Ggbdsjsj;
public interface IGgbdsjsjDao {
	/** @param 公共比对手机数据表(T_GGBDSJSJ) 增加 */
	Ggbdsjsj insertGgbdsjsj(Ggbdsjsj GGBDSJSJ);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 删除 */
	int deleteGgbdsjsj(Ggbdsjsj GGBDSJSJ);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 修改 */
	int updateGgbdsjsj(Ggbdsjsj GGBDSJSJ);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 查询单条 */
	Ggbdsjsj getGgbdsjsj(Ggbdsjsj GGBDSJSJ);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 多条查询 */
	List getListGgbdsjsj(Ggbdsjsj GGBDSJSJ);
}
