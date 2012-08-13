package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.ICxtjDao;
import com.aisino2.publicsystem.domain.Cxtj;

public class CxtjDaoImpl extends BaseDao implements ICxtjDao {

	/** @param 查询统计(t_cxtj) 查询单条 */
	public Cxtj getCxtj(Cxtj cxtj){
		// TODO: implement
		return (Cxtj)queryForObject("getCxtj", cxtj);
	}

	/** @param 查询统计(t_cxtj) 多条查询 */
	public List getListCxtj(Cxtj cxtj){
		// TODO: implement
		return queryForList("getCxtjListNoPage", cxtj);
	}
	
	/**统计统一采用分页查询方法*/
	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Cxtjid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getCxtjList", map, pageNo,pageSize);
	}
	
	/** @param 日常检查统计-分页查询 */
	public Page getRcjctjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " ssddsjgmc "+ desc;
			else if(sort.equals("1"))
				sCol = " ssdxjgajgmc "+ desc;
			else if(sort.equals("2"))
				sCol = " gxdwmc "+ desc;
			else if(sort.equals("3"))
				sCol = " qyzs "+ desc;
			else if(sort.equals("4"))
				sCol = " yjcqys "+ desc;
			else if(sort.equals("5"))
				sCol = " wjcqys "+ desc;
			else if(sort.equals("6"))
				sCol = " rcjccs "+ desc;
			else if(sort.equals("7"))
				sCol = " mjjczjccs "+ desc;
			else
				sCol = (String)map.get("groupBy");
		}else{
			sCol = (String)map.get("groupBy");
		}
		map.put("pageSort", sCol);
		return queryForPage("getRcjctjList", map, pageNo,pageSize);
	}
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getRcjctjlistqyxxForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.qybm "+ desc;
			else if(sort.equals("1"))
				sCol = " a.qymc "+ desc;
			else if(sort.equals("2"))
				sCol = " a.zrs "+ desc;
			else if(sort.equals("3"))
				sCol = " a.lxdh "+ desc;
			else if(sort.equals("4"))
				sCol = " a.hylb "+ desc;
			else if(sort.equals("5"))
				sCol = " a.yyztmc "+ desc;
			else if(sort.equals("6"))
				sCol = " a.zjztmc "+ desc;
			else if(sort.equals("7"))
				sCol = " a.gxdwmc "+ desc;
			else
				sCol="a.qyid desc";
		}else{
			sCol="a.qyid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getRcjctjListqyxx", map, pageNo,pageSize);
	}
	
	/** @param 查询统计(t_cxtj) 分页查询 */
	public Page getRcjctjlistrcjcxxForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " a.jcrq "+ desc;
			else if(sort.equals("1"))
				sCol = " b.qymc "+ desc;
			else if(sort.equals("2"))
				sCol = " b.gxdwmc "+ desc;
			else if(sort.equals("3"))
				sCol = " a.jcfs "+ desc;
			else if(sort.equals("4"))
				sCol = " a.fxwt "+ desc;
			else if(sort.equals("5"))
				sCol = " a.cljg "+ desc;
			else if(sort.equals("6"))
				sCol = " a.mjjczbh "+ desc;
			else if(sort.equals("7"))
				sCol = " a.jcjgmc "+ desc;
			else
				sCol="a.rcjcid desc";
		}else{
			sCol="a.rcjcid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getRcjctjListrcjcxx", map, pageNo,pageSize);
	}
	
	/** @param 场所分类统计-分页查询 */
	public Page getCsfltjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " ssddsjgmc "+ desc;
			else if(sort.equals("1"))
				sCol = " ssdxjgajgmc "+ desc;
			else if(sort.equals("2"))
				sCol = " gxdwmc "+ desc;
			else if(sort.equals("3"))
				sCol = " qyzs "+ desc;
			else if(sort.equals("4"))
				sCol = " yjcqys "+ desc;
			else if(sort.equals("5"))
				sCol = " wjcqys "+ desc;
			else if(sort.equals("6"))
				sCol = " rcjccs "+ desc;
			else if(sort.equals("7"))
				sCol = " mjjczjccs "+ desc;
			else
				sCol = (String)map.get("groupBy");
		}else{
			sCol = (String)map.get("groupBy");
		}
		map.put("pageSort", sCol);
		return queryForPage("getCsfltjList", map, pageNo,pageSize);
	}
	
	/** @param 场所分类统计-分页查询 */
	public Page getCsyyzttjListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		String sCol="";
		if (sort!=null){
			if(sort.equals("0"))
				sCol = " ssddsjgmc "+ desc;
			else if(sort.equals("1"))
				sCol = " ssdxjgajgmc "+ desc;
			else if(sort.equals("2"))
				sCol = " gxdwmc "+ desc;
			else if(sort.equals("3"))
				sCol = " qyzs "+ desc;
			else if(sort.equals("4"))
				sCol = " yjcqys "+ desc;
			else if(sort.equals("5"))
				sCol = " wjcqys "+ desc;
			else if(sort.equals("6"))
				sCol = " rcjccs "+ desc;
			else if(sort.equals("7"))
				sCol = " mjjczjccs "+ desc;
			else
				sCol = (String)map.get("groupBy");
		}else{
			sCol = (String)map.get("groupBy");
		}
		map.put("pageSort", sCol);
		return queryForPage("getCsyyzttjList", map, pageNo,pageSize);
	}
	
}
