package com.aisino2.publicsystem.service;

import java.util.Date;
import java.util.List;

import com.aisino2.publicsystem.domain.Ggbdclsj;

public interface IGgbdclsjService {
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 增加 
	 *  @param wpmc 物品名称
	 *  @param cph  车牌号
	 *  @param fdjh 发动机号
	 *  @param cjh  车架号
	 *  @param qymc 企业 名称
	 *  @param qydz 企业地址
	 *  @param gxdwbm 管辖单位编码
	 *  @param gxdwmc 管辖单位名称
	 *  @param hylbdm 行业类别代码
	 *  @param hylb 行业类别
	 *  @param ywbm 业务表名
	 *  @param ywbzj 业务表主键
	 * */
	Ggbdclsj insertGgbdclsj(String wpmc,String cph,String fdjh,String cjh,String qymc,String qydz,
			String gxdwbm,String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj);

	
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * */
	boolean updateGgbdclsjSfyxOnly(String ywbm,String ywbzj);
	
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 
	 * 修改状态为无效，不进行比对 
	 * */
	boolean updateGgbdclsjSfyxGroup(String ywbm,String ywbyzj);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 查询单条 
	 * 只显示有效数据
	 * */
	Ggbdclsj getGgbdclsj(Ggbdclsj GGBDCLSJ);

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 多条查询
	 * 只显示有效数据
	 *  */
	List getListGgbdclsj(Ggbdclsj GGBDCLSJ);
}
