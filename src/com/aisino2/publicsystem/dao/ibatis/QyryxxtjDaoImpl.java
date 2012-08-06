package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.publicsystem.dao.IQyryxxtjDao;
import com.aisino2.publicsystem.domain.Qyryxxtj;

public class QyryxxtjDaoImpl extends BaseDao implements IQyryxxtjDao {
	/** @param 企业人员信息统计表(t_qyryxxtj) 增加 */
	public Qyryxxtj insertQyryxxtj(Qyryxxtj qyryxxtj){
		// TODO: implement
		qyryxxtj.setQyryxxtj(getNextID("Qyryxxtj"));
		return (Qyryxxtj)insert("insertQyryxxtj", qyryxxtj);
	}

	/** @param 企业人员信息统计表(t_qyryxxtj) 删除 */
	public int deleteQyryxxtj(Qyryxxtj qyryxxtj){
		// TODO: implement
		return delete("deleteQyryxxtj", qyryxxtj);
	}

	/** @param 企业人员信息统计表(t_qyryxxtj) 修改 */
	public int updateQyryxxtj(Qyryxxtj qyryxxtj){
		// TODO: implement
		return update("updateQyryxxtj", qyryxxtj);
	}

	/** @param 企业人员信息统计表(t_qyryxxtj) 查询单条 */
	public Qyryxxtj getQyryxxtj(Qyryxxtj qyryxxtj){
		// TODO: implement
		return (Qyryxxtj)queryForObject("getQyryxxtj", qyryxxtj);
	}

	/** @param 企业人员信息统计表(t_qyryxxtj) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Qyryxxtj desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getQyryxxtjList", map, pageNo,pageSize);
	}

	/** @param 企业人员信息统计表(t_qyryxxtj) 多条查询 */
	public List getListQyryxxtj(Qyryxxtj qyryxxtj){
		// TODO: implement
		return queryForList("getQyryxxtjListNoPage", qyryxxtj);
	}
	
	/** @param 人员状态信息统计-分页查询 */
	public Page getQyryxxtjGList(Map map, int pageNo,int pageSize,String sort,String desc){
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " dept.departcode "+ desc;
			else if(sort.equals("1"))
				sCol = " zrs "+ desc;
			else if(sort.equals("2"))
				sCol = " dqzzrs "+ desc;
			else if(sort.equals("3"))
				sCol = " ggrs "+ desc;
			else if(sort.equals("4"))
				sCol = " xzrs "+ desc;
			else if(sort.equals("5"))
				sCol = " zxrs "+ desc;
			else
				sCol = "dept.departcode";
		}else{
			sCol = "dept.departcode";
		}
		map.put("pageSort", sCol);
		return queryForPage("getQyryxxtjGList", map, pageNo,pageSize);
	}
	
}
