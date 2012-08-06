package com.aisino2.basicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.basicsystem.domain.Bdqclxxkz;
public interface IBdqclxxkzDao {
	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 增加 */
	Bdqclxxkz insertBdqclxxkz(Bdqclxxkz bdqclxxkz);

	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 删除 */
	int deleteBdqclxxkz(Bdqclxxkz bdqclxxkz);

	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 修改 */
	int updateBdqclxxkz(Bdqclxxkz bdqclxxkz);

	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 查询单条 */
	Bdqclxxkz getBdqclxxkz(Bdqclxxkz bdqclxxkz);

	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 被盗抢车辆信息_快照(t_bdqclxxkz) 多条查询 */
	List getListBdqclxxkz(Bdqclxxkz bdqclxxkz);
}
