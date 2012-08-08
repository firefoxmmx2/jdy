package com.aisino2.basicsystem.dao;

import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.basicsystem.domain.Xctbjsdw;
public interface IXctbjsdwDao {
	/** @param 协查通报接收单位(t_xctbjsdw) 增加 */
	Xctbjsdw insertXctbjsdw(Xctbjsdw xctbjsdw);

	/** @param 协查通报接收单位(t_xctbjsdw) 删除 */
	int deleteXctbjsdw(Xctbjsdw xctbjsdw);

	/** @param 协查通报接收单位(t_xctbjsdw) 修改 */
	int updateXctbjsdw(Xctbjsdw xctbjsdw);

	/** @param 协查通报接收单位(t_xctbjsdw) 查询单条 */
	Xctbjsdw getXctbjsdw(Xctbjsdw xctbjsdw);

	/** @param 协查通报接收单位(t_xctbjsdw) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 协查通报接收单位(t_xctbjsdw) 多条查询 */
	List getListXctbjsdw(Xctbjsdw xctbjsdw);
	
	
	/** @param 协查通报接收单位(t_xctbjsdw) 分页查询 */
	Page getListForPageHf(Map map, int pageNo,int pageSize,String sort,String desc);
}