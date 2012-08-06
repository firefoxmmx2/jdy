package com.aisino2.publicsystem.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Ggbdclsj;
import com.aisino2.publicsystem.domain.Ggbdsj;

public interface IGgbdsjService {
	/** @param 公共比对数据表(T_GGBDSJ) 增加 */
	Ggbdsj insertGgbdsj(String xm,String zjhm,String qymc,String qydz,
			String gxdwbm,String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * */
	boolean updateGgbdsjSfyxOnly(String ywbm,String ywbzj);
	
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * */
	boolean updateGgbdsjSfyxGroup(String ywbm,String ywbyzj);
	

	/** @param 公共比对数据表(T_GGBDSJ) 查询单条 */
	Ggbdsj getGgbdsj(Ggbdsj GGBDSJ);


	/** @param 公共比对数据表(T_GGBDSJ) 多条查询 */
	List getListGgbdsj(Ggbdsj GGBDSJ);
}
