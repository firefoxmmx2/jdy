package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.publicsystem.dao.IQywywxxDao;
import com.aisino2.publicsystem.domain.Qywywxx;

public class QywywxxDaoImpl extends BaseDao implements IQywywxxDao {
	/** @param 企业无业务信息(t_qywywxx) 增加 */
	public Qywywxx insertQywywxx(Qywywxx qywywxx){
		// TODO: implement
		qywywxx.setQywywxxid(getNextID("Qywywxxid"));
		return (Qywywxx)insert("insertQywywxx", qywywxx);
	}

	/** @param 企业无业务信息(t_qywywxx) 删除 */
	public int deleteQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return delete("deleteQywywxx", qywywxx);
	}

	/** @param 企业无业务信息(t_qywywxx) 修改 */
	public int updateQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return update("updateQywywxx", qywywxx);
	}

	/** @param 企业无业务信息(t_qywywxx) 查询单条 */
	public Qywywxx getQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return (Qywywxx)queryForObject("getQywywxx", qywywxx);
	}

	/** @param 企业无业务信息(t_qywywxx) 企业端分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.djrq "+ desc;
			else if(sort.equals("1"))
				sCol = " a.ksyysj "+ desc;
			else if(sort.equals("2"))
				sCol = " a.jsyysj "+ desc;
			else if(sort.equals("3"))
				sCol = " a.csfe "+ desc;
			else if(sort.equals("4"))
				sCol = " a.sffsaj "+ desc;
			else if(sort.equals("5"))
				sCol = " a.sfglbmjc "+ desc;
		}else{
			sCol="a.djrq desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getQywywxxList", map, pageNo,pageSize);
	}

	/** @param 企业无业务信息(t_qywywxx) 多条查询 */
	public List getListQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return queryForList("getQywywxxListNoPage", qywywxx);
	}
	//判断当天是否已经上传
	public int getExist(Map map){
		return ((Integer)queryForObject("getExist",map)).intValue();
	}
	
	/** @param 公安端企业无业务信息(t_qywywxx) 多条查询 */
	public Page getgadListQywywxx(Map map, int pageNo,int pageSize,String sort,String desc){
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.djrq "+ desc;
			else if(sort.equals("1"))
				sCol = " a.ksyysj "+ desc;
			else if(sort.equals("2"))
				sCol = " a.jsyysj "+ desc;
			else if(sort.equals("3"))
				sCol = " b.gxdwmc "+ desc;
			else if(sort.equals("4"))
				sCol = " b.qymc "+ desc;
			else if(sort.equals("5"))
				sCol = " b.hylb "+ desc;
			else if(sort.equals("6"))
				sCol = " a.sffsaj "+ desc;
		}else{
			sCol="a.djrq desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getgadQywywxxList", map, pageNo,pageSize);
	}
}
