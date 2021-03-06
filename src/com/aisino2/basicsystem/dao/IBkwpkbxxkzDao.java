package com.aisino2.basicsystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.basicsystem.domain.Bkwpkbxxkz;
import com.aisino2.core.dao.Page;
public interface IBkwpkbxxkzDao {
	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 增加 */
	Bkwpkbxxkz insertBkwpkbxxkz(Bkwpkbxxkz bkwpkbxxkz);

	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 删除 */
	int deleteBkwpkbxxkz(Bkwpkbxxkz bkwpkbxxkz);

	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 修改 */
	int updateBkwpkbxxkz(Bkwpkbxxkz bkwpkbxxkz);

	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 查询单条 */
	Bkwpkbxxkz getBkwpkbxxkz(Bkwpkbxxkz bkwpkbxxkz);
	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 查询单条照片 */
	Bkwpkbxxkz getBkwpkbxxkzZP(Bkwpkbxxkz bkwpkbxxkz);

	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 布控物品基本信息快照(t_bkwpkbxxkz) 多条查询 */
	List getListBkwpkbxxkz(Bkwpkbxxkz bkwpkbxxkz);
}
