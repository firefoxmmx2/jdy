package com.aisino2.publicsystem.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;

import com.aisino2.publicsystem.domain.Cxtj;
import com.aisino2.publicsystem.dao.ICxtjDao;
import com.aisino2.publicsystem.service.ICxtjService;

public class CxtjServiceImpl extends BaseService implements ICxtjService {

	private ICxtjDao cxtjDao;
	
	public ICxtjDao getCxtjDao() {
		return cxtjDao;
	}

	public void setCxtjDao(ICxtjDao cxtjDao) {
		this.cxtjDao = cxtjDao;
	}

	/** @param 查询统计(t_cxtj) 查询单条 */
	public Cxtj getCxtj(Cxtj cxtj){
		// TODO: implement
		return (Cxtj)cxtjDao.getCxtj(cxtj);
	}

	/** @param 查询统计(t_cxtj) 多条查询 */
	public List getListCxtj(Cxtj cxtj){
		// TODO: implement
		return cxtjDao.getListCxtj(cxtj);
	}

	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return cxtjDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}
	
	/** @param 日常检查-分页查询 */
	public Page getRcjctjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String groupBy = "";
		String selectTab="";
		if(((String)map.get("gxdwbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc,a.gxdwbm,a.gxdwmc";
			selectTab = groupBy;
		}else if(((String)map.get("fxjbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc";
			selectTab = groupBy + ",'' as gxdwbm,'' as gxdwmc";
		}else if(((String)map.get("dsjgbz")).equalsIgnoreCase("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc";
			selectTab = groupBy + ",'' as ssdxjgajgdm,'' as ssdxjgajgmc,'' as gxdwbm,'' as gxdwmc";
		}else{
			groupBy="";
			selectTab="'' as ssddsjgdm,'' as ssddsjgmc,'' as ssdxjgajgdm,'' as ssdxjgajgmc,'' as gxdwbm,'' as gxdwmc";
		}
		map.put("groupBy", groupBy);
		map.put("selectTab", selectTab);
		return cxtjDao.getRcjctjListForPage(map,pageNo,pageSize,sort,desc);
	}
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getRcjctjlistqyxxForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return cxtjDao.getRcjctjlistqyxxForPage(map,pageNo,pageSize,sort,desc);
	}
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getRcjctjlistrcjcxxForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return cxtjDao.getRcjctjlistrcjcxxForPage(map,pageNo,pageSize,sort,desc);
	}
	
	/** @param 场所分类统计-分页查询 */
	public Page getCsfltjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String groupBy = "";
		String selectTab="";
		String whereFlg="";
		if(((String)map.get("gxdwbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc,a.gxdwbm,a.gxdwmc";
			selectTab ="'' as dsjgdm,'' as dsjgmc,'' as fxjdm,'' as fxjmc, dept.departcode as gxdwdm,dept.departname as gxdwmc";
			whereFlg=" and dept.departcode =tj.gxdwbm(+)";
		}else if(((String)map.get("fxjbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc";
			selectTab ="'' as dsjgdm,'' as dsjgmc,dept.departcode as fxjdm,dept.departname as fxjmc,'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.ssdxjgajgdm(+)";
		}else if(((String)map.get("dsjgbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc";
			selectTab = "dept.departcode as dsjgdm,dept.departname as dsjgmc,'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.ssddsjgdm(+)";
		}else{
			groupBy="";
			selectTab = "dept.departcode as dsjgdm,dept.departname as dsjgmc,'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
		}
		map.put("groupBy", groupBy);
		map.put("selectTab", selectTab);
		map.put("whereFlg", whereFlg);
		return cxtjDao.getCsfltjListForPage(map,pageNo,pageSize,sort,desc);
	}
	/** @param 场所营业状态统计-分页查询 */
	public Page getCsyyzttjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String groupBy = "";
		String selectTab="";
		String whereFlg="";
		if(((String)map.get("gxdwbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc,a.gxdwbm,a.gxdwmc";
			selectTab ="'' as dsjgdm,'' as dsjgmc,'' as fxjdm,'' as fxjmc, dept.departcode as gxdwdm,dept.departname as gxdwmc";
			whereFlg=" and dept.departcode =tj.gxdwbm(+)";
		}else if(((String)map.get("fxjbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc,a.ssdxjgajgdm,a.ssdxjgajgmc";
			selectTab ="'' as dsjgdm,'' as dsjgmc,dept.departcode as fxjdm,dept.departname as fxjmc,'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.ssdxjgajgdm(+)";
		}else if(((String)map.get("dsjgbz")).equals("1"))
		{
			groupBy = "a.ssddsjgdm,a.ssddsjgmc";
			selectTab = "dept.departcode as dsjgdm,dept.departname as dsjgmc,'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.ssddsjgdm(+)";
		}else{
			groupBy="";
			selectTab = "dept.departcode as dsjgdm,dept.departname as dsjgmc,'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
		}
		map.put("groupBy", groupBy);
		map.put("selectTab", selectTab);
		map.put("whereFlg", whereFlg);
		return cxtjDao.getCsyyzttjListForPage(map,pageNo,pageSize,sort,desc);
	}
	
}
