package com.aisino2.icksystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.icksystem.domain.Icktjrb;
public interface IIcktjrbDao {
	/** @param IC卡统计日报(t_icktjrb) 增加 */
	Icktjrb insertIcktjrb(Icktjrb icktjrb);

	/** @param IC卡统计日报(t_icktjrb) 删除 */
	int deleteIcktjrb(Icktjrb icktjrb);

	/** @param IC卡统计日报(t_icktjrb) 修改 */
	int updateIcktjrb(Icktjrb icktjrb);

	/** @param IC卡统计日报(t_icktjrb) 查询单条 */
	Icktjrb getIcktjrb(Icktjrb icktjrb);

	/** @param IC卡统计日报(t_icktjrb) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param IC卡统计日报(t_icktjrb) 分页查询 */
	Page getcsmxListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param IC卡统计日报(t_icktjrb) 多条查询 */
	List getListIcktjrb(Icktjrb icktjrb);
}
