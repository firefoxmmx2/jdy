package com.aisino2.publicsystem.service;

import java.util.Date;
import java.util.List;

import com.aisino2.publicsystem.domain.Ggbdsjsj;

public interface IGgbdsjsjService {
	
	 /** @param 公共比对手机数据表(T_GGBDSJSJ) 增加 
	 *  @param wpmc 物品名称
	 *  @param sjch  手机串号
	 *  @param qymc 企业 名称
	 *  @param qydz 企业地址
	 *  @param gxdwbm 管辖单位编码
	 *  @param gxdwmc 管辖单位名称
	 *  @param hylbdm 行业类别代码
	 *  @param hylb 行业类别
	 *  @param ywbm 业务表名
	 *  @param ywbzj 业务表主键
	 * */
	Ggbdsjsj insertGgbdsjsj(String wpmc,String sjch,String qymc,String qydz,String gxdwbm,
			String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * 通过历史表主键单个修改无效标志
	 * */
	boolean updateGgbdclsjSfyxOnly(String ywbm,String ywbzj);
	
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * 通过业务表主键多个修改无效标志
	 * */
	boolean updateGgbdclsjSfyxGroup(String ywbm,String ywbyzj);
	
	/** @param 公共比对手机数据表(T_GGBDSJSJ) 查询单条
	 *  只显示有效数据
	 * */
	Ggbdsjsj getGgbdsjsj(Ggbdsjsj ggbdsjsj);

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 多条查询
	 * 只显示有效数据
	 * */
	List getListGgbdsjsj(Ggbdsjsj ggbdsjsj);
}
