package com.aisino2.publicsystem.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Zzcl;





public interface IZzclDao {
	/** @param 纸质材料(t_Zzcl) 增加 */
	Zzcl insertZzcl(Zzcl zzcl);

	/** @param 纸质材料(t_Zzcl) 删除 */
	int deleteZzcl(Zzcl zzcl);

	/** @param 纸质材料(t_Zzcl) 修改 */
	int updateZzcl(Zzcl zzcl);

	/** @param 纸质材料(t_Zzcl) 查询单条 */
	Zzcl getZzcl(Zzcl zzcl);

	/** @param 纸质材料(t_Zzcl) 查询单条 不查询BLOB*/
	Zzcl getZzclNoBlob(Zzcl zzcl);
	
	/** @param 纸质材料(t_Zzcl) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 纸质材料(t_Zzcl) 多条查询 */
	List getListZzcl(Zzcl zzcl);
}
