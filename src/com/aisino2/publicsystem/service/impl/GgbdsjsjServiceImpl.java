package com.aisino2.publicsystem.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IGgbdsjsjDao;
import com.aisino2.publicsystem.domain.Ggbdsjsj;
import com.aisino2.publicsystem.service.IGgbdsjsjService;

public class GgbdsjsjServiceImpl extends BaseService implements IGgbdsjsjService {

	private IGgbdsjsjDao GGBDSJSJDao;

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
	public Ggbdsjsj insertGgbdsjsj(String wpmc,String sjch,String qymc,String qydz,String gxdwbm,
			String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj){
		// TODO: implement
		Ggbdsjsj ggbdsjsj=new Ggbdsjsj();
		ggbdsjsj.setWpmc(wpmc);
		ggbdsjsj.setSjch(sjch);
		ggbdsjsj.setQymc(qymc);
		ggbdsjsj.setQydz(qydz);
		ggbdsjsj.setGxdwbm(gxdwbm);
		ggbdsjsj.setGxdwmc(gxdwmc);
		ggbdsjsj.setHylbdm(hylbdm);
		ggbdsjsj.setHylb(hylb);
		ggbdsjsj.setYwbm(ywbm);
		ggbdsjsj.setYwbzj(ywbzj);
		ggbdsjsj.setYwbyzj(ywbyzj);
		ggbdsjsj.setWxsj(wxsj);
		ggbdsjsj.setXrsj(new Date());
		ggbdsjsj.setBiduiflag("0");
		ggbdsjsj.setSfyx("1");
		return (Ggbdsjsj)GGBDSJSJDao.insertGgbdsjsj(ggbdsjsj);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 删除 */
	public boolean deleteGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		return GGBDSJSJDao.deleteGgbdsjsj(GGBDSJSJ)>0;
	}

	//将数据状态改为无效
	public boolean updateGgbdclsjSfyxOnly(String ywbm,String ywbzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdsjsj ggbdsjsj=new Ggbdsjsj();
		ggbdsjsj.setYwbm(ywbm);
		ggbdsjsj.setYwbzj(ywbzj);
		ggbdsjsj.setGxsj(new Date());
		ggbdsjsj.setSfyx("0");
		return GGBDSJSJDao.updateGgbdsjsj(ggbdsjsj)>0;
	}
	
	//将数据状态改为无效
	public boolean updateGgbdclsjSfyxGroup(String ywbm,String ywbyzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdsjsj ggbdsjsj=new Ggbdsjsj();
		ggbdsjsj.setYwbm(ywbm);
		ggbdsjsj.setYwbyzj(ywbyzj);
		ggbdsjsj.setGxsj(new Date());
		ggbdsjsj.setSfyx("0");
		return GGBDSJSJDao.updateGgbdsjsj(ggbdsjsj)>0;
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 查询单条 */
	public Ggbdsjsj getGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		GGBDSJSJ.setSfyx("1");
		return (Ggbdsjsj)GGBDSJSJDao.getGgbdsjsj(GGBDSJSJ);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return GGBDSJSJDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 多条查询 */
	public List getListGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		GGBDSJSJ.setSfyx("1");
		return GGBDSJSJDao.getListGgbdsjsj(GGBDSJSJ);
	}

	public IGgbdsjsjDao getGgbdsjsjDao() {
		return GGBDSJSJDao;
	}

	public void setGgbdsjsjDao(IGgbdsjsjDao GGBDSJSJDao) {
		this.GGBDSJSJDao = GGBDSJSJDao;
	}
}
