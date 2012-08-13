package com.aisino2.publicsystem.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IGgbdsjDao;
import com.aisino2.publicsystem.domain.Ggbdsj;
import com.aisino2.publicsystem.service.IGgbdsjService;

public class GgbdsjServiceImpl extends BaseService implements IGgbdsjService {

	private IGgbdsjDao GGBDSJDao;

	/** @param 公共比对数据表(T_GGBDSJ) 增加 */
	/*public Ggbdsj insertGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return (Ggbdsj)GGBDSJDao.insertGgbdsj(GGBDSJ);
	}*/
	
	/** @param 公共比对数据表(T_GGBDSJ) 增加 */
	public Ggbdsj insertGgbdsj(String xm,String zjhm,String qymc,String qydz,
			String gxdwbm,String gxdwmc,String hylbdm,String hylb,String ywbm,String ywbzj,String ywbyzj,Date wxsj) {
		Ggbdsj ggbdsj=new Ggbdsj();
		ggbdsj.setXm(xm);
		ggbdsj.setZjhm(zjhm);
		ggbdsj.setQymc(qymc);
		ggbdsj.setQydz(qydz);
		ggbdsj.setGxdwbm(gxdwbm);
		ggbdsj.setGxdwmc(gxdwmc);
		ggbdsj.setHylbdm(hylbdm);
		ggbdsj.setHylb(hylb);
		ggbdsj.setYwbm(ywbm);
		ggbdsj.setYwbzj(ywbzj);
		ggbdsj.setYwbyzj(ywbyzj);
		ggbdsj.setWxsj(wxsj);
		ggbdsj.setXrsj(new Date());
		ggbdsj.setBiduiflag("0");
		ggbdsj.setSfyx("1");
		return (Ggbdsj)GGBDSJDao.insertGgbdsj(ggbdsj);
	}
	
	//将数据状态改为无效
	public boolean updateGgbdsjSfyxOnly(String ywbm,String ywbzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdsj ggbdsj=new Ggbdsj();
		ggbdsj.setYwbm(ywbm);
		ggbdsj.setYwbzj(ywbzj);
		ggbdsj.setGxsj(new Date());
		ggbdsj.setSfyx("0");
		return GGBDSJDao.updateGgbdsj(ggbdsj)>0;
	}
	
	//将数据状态改为无效
	public boolean updateGgbdsjSfyxGroup(String ywbm,String ywbyzj){
		// TODO: implement
		//获取原比对表中数据
		Ggbdsj ggbdsj=new Ggbdsj();
		ggbdsj.setYwbm(ywbm);
		ggbdsj.setYwbyzj(ywbyzj);
		ggbdsj.setGxsj(new Date());
		ggbdsj.setSfyx("0");
		return GGBDSJDao.updateGgbdsj(ggbdsj)>0;
	}

	/** @param 公共比对数据表(T_GGBDSJ) 删除 */
	public boolean deleteGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return GGBDSJDao.deleteGgbdsj(GGBDSJ)>0;
	}

	/** @param 公共比对数据表(T_GGBDSJ) 修改 */
	public boolean updateGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return GGBDSJDao.updateGgbdsj(GGBDSJ)>0;
	}

	/** @param 公共比对数据表(T_GGBDSJ) 查询单条 */
	public Ggbdsj getGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return (Ggbdsj)GGBDSJDao.getGgbdsj(GGBDSJ);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return GGBDSJDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 多条查询 */
	public List getListGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return GGBDSJDao.getListGgbdsj(GGBDSJ);
	}

	public IGgbdsjDao getGgbdsjDao() {
		return GGBDSJDao;
	}

	public void setGgbdsjDao(IGgbdsjDao GGBDSJDao) {
		this.GGBDSJDao = GGBDSJDao;
	}
}
