package com.aisino2.basicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.basicsystem.domain.Xctb;
import com.aisino2.core.dao.Page;

public interface IXctbService {
	/** @param 协查通报(t_xctb) 增加 */
	Xctb insertXctb(Xctb xctb);

	/** @param 协查通报(t_xctb) 删除 */
	boolean deleteXctb(Xctb xctb);

	/** @param 协查通报(t_xctb) 修改 */
	boolean updateXctb(Xctb xctb);

	/** @param 协查通报(t_xctb) 查询单条 */
	Xctb getXctb(Xctb xctb);

	/** @param 协查通报(t_xctb) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 协查通报(t_xctb) 分页查询-查询条件选择了公安机关 */
	Page getListGajg(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 内保单位 协查通报(t_xctb) 分页查询 */
	Page getListForPageNbdw(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 协查通报(t_xctb) 多条查询 */
	List getListXctb(Xctb xctb);
	
	List getXctbListForBt(Map map);
	
	/** @param 协查通报(t_xctb) 多条查询 查询未阅读的协查通报*/
	List getXctbWydList(Xctb xctb);
	
	/** @param 协查通报场所(t_xctb) 分页查询 */
	Page getcsListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 协查通报企业(t_xctb) 分页查询 */
	Page getQydwListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
	
	/** @param 协查通报企业(t_xctb) 列表查询 */
	List getQydwList(Map map);
	
	/** @param 公安通知通报(webService专用)多条查询 */
	List getXctbListForBm(Map map);
	
	/** 企业端弹出提示框提示未回复的通知通报条数 */
	int getNoReplyNum(Map map);
	
	/**点击右下角链接，弹出未回复的通知通报内容 */
	Page getListWhf(Map map, int pageNo,int pageSize,String sort,String desc);
}
