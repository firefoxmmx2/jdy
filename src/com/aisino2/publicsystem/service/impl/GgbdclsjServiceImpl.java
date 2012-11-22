package com.aisino2.publicsystem.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IGgbdclsjDao;
import com.aisino2.publicsystem.domain.Ggbdclsj;
import com.aisino2.publicsystem.service.IGgbdclsjService;

public class GgbdclsjServiceImpl extends BaseService implements IGgbdclsjService {

	private IGgbdclsjDao GGBDCLSJDao;

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 增加 */
	/*
	public Ggbdclsj insertGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return (Ggbdclsj)GGBDCLSJDao.insertGgbdclsj(GGBDCLSJ);
	}
	*/
	
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
	 *  @param ywbyzj 业务表原主键
	 * */
	public Ggbdclsj insertGgbdclsj(String wpmc,String cph,String fdjh,String cjh,String qymc,String qydz,
			String gxdwbm,String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj){
		// TODO: implement
		Ggbdclsj ggbdclsj=new Ggbdclsj();
		ggbdclsj.setWpmc(wpmc);
		ggbdclsj.setCph(cph);
		ggbdclsj.setFdjh(fdjh);
		ggbdclsj.setCjh(cjh);
		ggbdclsj.setQymc(qymc);
		ggbdclsj.setQydz(qydz);
		ggbdclsj.setGxdwbm(gxdwbm);
		ggbdclsj.setGxdwmc(gxdwmc);
		ggbdclsj.setHylbdm(hylbdm);
		ggbdclsj.setHylb(hylb);
		ggbdclsj.setYwbm(ywbm);
		ggbdclsj.setYwbzj(ywbzj);
		ggbdclsj.setYwbyzj(ywbyzj);
		ggbdclsj.setWxsj(wxsj);
		ggbdclsj.setXrsj(new Date());
		ggbdclsj.setBiduiflag("0");
		ggbdclsj.setSfyx("1");
		return (Ggbdclsj)GGBDCLSJDao.insertGgbdclsj(ggbdclsj);
	}
	
	//将数据状态改为无效
	public boolean updateGgbdclsjSfyxOnly(String ywbm,String ywbzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdclsj ggbdclsj=new Ggbdclsj();
		ggbdclsj.setYwbm(ywbm);
		ggbdclsj.setYwbzj(ywbzj);
		ggbdclsj.setGxsj(new Date());
		ggbdclsj.setSfyx("0");
		return GGBDCLSJDao.updateGgbdclsj(ggbdclsj)>0;
	}
	
	//将数据状态改为无效
	public boolean updateGgbdclsjSfyxGroup(String ywbm,String ywbyzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdclsj ggbdclsj=new Ggbdclsj();
		ggbdclsj.setYwbm(ywbm);
		ggbdclsj.setYwbyzj(ywbyzj);
		ggbdclsj.setGxsj(new Date());
		ggbdclsj.setSfyx("0");
		return GGBDCLSJDao.updateGgbdclsj(ggbdclsj)>0;
	}
	
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 删除 */
	public boolean deleteGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return GGBDCLSJDao.deleteGgbdclsj(GGBDCLSJ)>0;
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 查询单条 */
	public Ggbdclsj getGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		GGBDCLSJ.setSfyx("1");
		return (Ggbdclsj)GGBDCLSJDao.getGgbdclsj(GGBDCLSJ);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return GGBDCLSJDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 多条查询 */
	public List getListGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		GGBDCLSJ.setSfyx("1");
		return GGBDCLSJDao.getListGgbdclsj(GGBDCLSJ);
	}

	public IGgbdclsjDao getGgbdclsjDao() {
		return GGBDCLSJDao;
	}

	public void setGgbdclsjDao(IGgbdclsjDao GGBDCLSJDao) {
		this.GGBDCLSJDao = GGBDCLSJDao;
	}
}
