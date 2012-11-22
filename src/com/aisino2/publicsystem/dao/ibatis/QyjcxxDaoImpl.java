package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.IQyjcxxDao;
import com.aisino2.publicsystem.domain.Qyjcxx;

public class QyjcxxDaoImpl extends BaseDao implements IQyjcxxDao {
	/** @param 企业奖惩信息(t_qyjcxx) 增加 */
	public Qyjcxx insertQyjcxx(Qyjcxx qyjcxx){
		// TODO: implement
		qyjcxx.setQycfid(getNextID("qycfid"));
		return (Qyjcxx)insert("insertQyjcxx", qyjcxx);
	}

	/** @param 企业奖惩信息(t_qyjcxx) 删除 */
	public int deleteQyjcxx(Qyjcxx qyjcxx){
		// TODO: implement
		return delete("deleteQyjcxx", qyjcxx);
	}

	/** @param 企业奖惩信息(t_qyjcxx) 修改 */
	public int updateQyjcxx(Qyjcxx qyjcxx){
		// TODO: implement
		return update("updateQyjcxx", qyjcxx);
	}

	/** @param 企业奖惩信息(t_qyjcxx) 查询单条 */
	public Qyjcxx getQyjcxx(Qyjcxx qyjcxx){
		// TODO: implement
		return (Qyjcxx)queryForObject("getQyjcxx", qyjcxx);
	}

	/** @param 企业奖惩信息(t_qyjcxx) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.cfdjxh "+ desc;
			else if (sort.equals("1"))
				sCol = " t.gxdwmc "+ desc;
			else if (sort.equals("2"))
				sCol = " t.qymc "+ desc;
			else if (sort.equals("3"))
				sCol = "t.qyzflmc "+ desc;
			else if (sort.equals("4"))
				sCol = " a.cflb "+ desc;
			else if (sort.equals("5"))
				sCol = " a.jcmxlb "+ desc;
			else if (sort.equals("6"))
				sCol = " a.pzjg "+ desc;
			else if (sort.equals("7"))
				sCol = " a.qyjcrq "+ desc;
			else if (sort.equals("8"))
				sCol = " a.bjcr "+ desc;
			else 
				sCol="a.qycfid desc";
		}else{
			sCol="a.qycfid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getQyjcxxList", map, pageNo,pageSize);
	}

	/** @param 企业奖惩信息(t_qyjcxx) 多条查询 */
	public List getListQyjcxx(Qyjcxx qyjcxx){
		// TODO: implement
		return queryForList("getQyjcxxListNoPage", qyjcxx);
	}
}
