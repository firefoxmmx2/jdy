package com.aisino2.icksystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.icksystem.dao.IIcktjrbDao;
import com.aisino2.icksystem.domain.Icktjrb;

public class IcktjrbDaoImpl extends BaseDao implements IIcktjrbDao {
	/** @param IC卡统计日报(t_icktjrb) 增加 */
	public Icktjrb insertIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		icktjrb.setIcktjrbid(getNextID("Icktjrbid"));
		return (Icktjrb)insert("insertIcktjrb", icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 删除 */
	public int deleteIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return delete("deleteIcktjrb", icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 修改 */
	public int updateIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return update("updateIcktjrb", icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 查询单条 */
	public Icktjrb getIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return (Icktjrb)queryForObject("getIcktjrb", icktjrb);
	}

	/** @param IC卡统计日报(t_icktjrb) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " ssddsjgmc "+ desc;
			else if(sort.equals("1"))
				sCol = " ssdxjgajgmc "+ desc;
			else if(sort.equals("2"))
				sCol = " gxdwmc "+ desc;
			else if(sort.equals("3"))
				sCol = " lrcss "+ desc;
			else if(sort.equals("4"))
				sCol = " lrcyrys "+ desc;
			else if(sort.equals("5"))
				sCol = " slicks "+ desc;
			else if(sort.equals("6"))
				sCol = " fficks "+ desc;
			else if(sort.equals("7"))
				sCol = " skicks "+ desc;
			else if(sort.equals("8"))
				sCol = " drskicks "+ desc;
			else
				sCol = (String)map.get("groupBy");
		}else{
			sCol = (String)map.get("groupBy");
		}
		map.put("pageSort", sCol);
		return queryForPage("getIcktjrbList", map, pageNo,pageSize);
	}
	
	/** @param IC卡统计日报(t_icktjrb) 分页查询 */
	public Page getcsmxListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.qybm "+ desc;
			else if(sort.equals("1"))
				sCol = " a.qymc "+ desc;
			else if(sort.equals("2"))
				sCol = " zjztmc "+ desc;
			else if(sort.equals("3"))
				sCol = " a.gxdwmc "+ desc;
			else if(sort.equals("4"))
				sCol = " lrcyrys "+ desc;
			else if(sort.equals("5"))
				sCol = " slicks "+ desc;
			else if(sort.equals("6"))
				sCol = " fficks "+ desc;
			else if(sort.equals("7"))
				sCol = " skicks "+ desc;
			else if(sort.equals("8"))
				sCol = " drskicks "+ desc;
			else
				sCol="a.qybm desc";
		}else{
			sCol="a.qybm desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getIcktjrbcsmxList", map, pageNo,pageSize);
	}

	/** @param IC卡统计日报(t_icktjrb) 多条查询 */
	public List getListIcktjrb(Icktjrb icktjrb){
		// TODO: implement
		return queryForList("getIcktjrbListNoPage", icktjrb);
	}
}
