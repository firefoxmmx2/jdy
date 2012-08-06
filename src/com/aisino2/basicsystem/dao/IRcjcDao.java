package com.aisino2.basicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.basicsystem.domain.TyRcjc;
public interface IRcjcDao {
	/** @param 日常检查(t_rcjc) 增加 */
	TyRcjc insertRcjc(TyRcjc rcjc);

	/** @param 日常检查(t_rcjc) 删除 */
	int deleteRcjc(TyRcjc rcjc);

	/** @param 日常检查(t_rcjc) 修改 */
	int updateRcjc(TyRcjc rcjc);

	/** @param 日常检查(t_rcjc) 查询单条 */
	TyRcjc getRcjc(TyRcjc rcjc);

	/** @param 日常检查(t_rcjc) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 日常检查(t_rcjc) 多条查询 */
	List getListRcjc(TyRcjc rcjc);
}
