package com.aisino2.publicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Zzcl;



public interface IZzclService {
	/** @param 纸质材料(t_zzcl) 多条查询 */
	public List getListZzcl(Zzcl zzcl);
	/** @param 纸质材料(t_zzcl) 单条查询*/
	public Zzcl getZzcl(Zzcl zzcl);
	/** @param 纸质材料(t_Zzcl) 删除 */
	boolean deleteZzcl(Zzcl zzcl);
	/**纸质材料，分页查询*/
	public Page getListForPage(Map map, int pageNo, int pageSize, String sort,
			String desc);
}
