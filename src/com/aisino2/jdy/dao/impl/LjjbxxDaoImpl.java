package com.aisino2.jdy.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.domain.Ljjbxx;

public class LjjbxxDaoImpl extends BaseDao implements ILjjbxxDao {


	public Ljjbxx insert(Ljjbxx ljjbxx) {
		if(!StringUtil.isNotEmpty(ljjbxx.getDjxh())){
			if(ljjbxx.getQyjbxx() != null && StringUtil.isNotEmpty(ljjbxx.getQyjbxx().getQybm())){
				ljjbxx.setDjxh(generateDjxh(ljjbxx.getQyjbxx().getQybm()));
			}
			else {
				throw new RuntimeException("要么外部传入登记序号，要么传入企业编码，不可同时为空");
			}
		}
		insert("ljjbxx.insert", ljjbxx);
		return ljjbxx;
	}


	public void update(Ljjbxx ljjbxx) {
		update("ljjbxx.update", ljjbxx);
	}


	public void delete(Ljjbxx ljjbxx) {
		//delete("ljjbxx.delete",ljjbxx);
		/*
		 * 这里不做物理删除，只修改其标志位：scbzw
		 */
		update("ljjbxx.update", ljjbxx);
	}


	public List<Ljjbxx> findLjjbxxs(Ljjbxx ljjbxx) {
		return queryForList("ljjbxx.getList", ljjbxx);
	}


	public Page findLjjbxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {	
		
		String sCol=" ljjbxx.djxh ";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if("0".equals(dir))
				sCol = " ljjbxx.djxh "+ sort;
			else if("1".equals(dir))
				sCol = " ljjbxx.wldh "+ sort;
			else if("2".equals(dir))
				sCol = " jjr.xm "+ sort;
			else if("3".equals(dir))
				sCol = " jjr.zjlx "+ sort;
			else if("4".equals(dir))
				sCol = " jjr.zjhm "+ sort;
			else if("5".equals(dir))
				sCol = " ljr.xm "+ sort;
			else if("6".equals(dir))
				sCol = "ljjbxx.ljtbsj "+ sort;
			else 
				sCol=" ljjbxx.djxh ";
		}
		
		map.put("pageSort", sCol);
		return queryForPage("ljjbxx.getListPage", map, pageno,pagesize);
	}
	
	public Page gadjdpxxForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {	
		
		String sCol=" ljjbxx.djxh ";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (dir!=null){
			if(null!=map.get("gadqydcxqbbz")){
				if("gadkywpcx".equals(map.get("gadqydcxqbbz").toString())){
					if("0".equals(dir))
						sCol = " qyjbxx.qymc "+ sort;
					else if("1".equals(dir))
						sCol = " ljjbxx.wldh "+ sort;
					else if("2".equals(dir))
						sCol = " jjr.xm "+ sort;
					else if("3".equals(dir))
						sCol = " jjr.zjhm "+ sort;
					else if("4".equals(dir))
						sCol = " sjr.xm "+ sort;
					else if("5".equals(dir))
						sCol = " jdpxx.jdpdlx "+ sort;
					else if("6".equals(dir))
						sCol = " jdpxx.jdplx "+ sort;
					else if("7".equals(dir))
						sCol = "ljjbxx.ljtbsj "+ sort;
					else
						sCol=" ljjbxx.wldh ";
				}else if("qydkywpcx".equals(map.get("gadqydcxqbbz").toString())){
					if("0".equals(dir))
						sCol = " jdpxx.id "+ sort;
					else if("1".equals(dir))
						sCol = "ljjbxx.djxh "+ sort;//寄递品名称
					else if("2".equals(dir))
						sCol = "jdpxx.jdpmc "+ sort;//寄递品名称
					else if("3".equals(dir))
						sCol = " ljjbxx.wldh "+ sort;
					else if("4".equals(dir))
						sCol = " jjr.xm "+ sort;
					else if("5".equals(dir))
						sCol = "jjr.zjlx "+ sort;//寄递品名称
					else if("6".equals(dir))
						sCol = " jjr.zjhm "+ sort;
					else if("7".equals(dir))
						sCol = " ljr.cyrybh "+ sort;
					else if("8".equals(dir))
						sCol = "ljjbxx.ljtbsj "+ sort;
					else 
						sCol=" ljjbxx.wldh ";
				}
			}
			
		}
		map.put("pageSort", sCol);
		if(null!=map.get("gadqydcxqbbz")){
			if("gadkywpcx".equals(map.get("gadqydcxqbbz").toString())){
				return queryForPage("jdpxxgadcx.getListPage", map, pageno,pagesize);
			}
			else if("qydkywpcx".equals(map.get("gadqydcxqbbz").toString())){
				return queryForPage("jdpxxqydkyaddcx.getListPage", map, pageno,pagesize);
			}
		}
		return null;
	}

	public String generateDjxh(String qybm) {
		 String djxh = (String) queryForObject("ljjbxx.getForGenerateDjxh", qybm);
		 if(djxh==null){
			 djxh=qybm + new SimpleDateFormat("yyyyMMdd").format(new Date()) + "001"; 
		 }
		 else{
			 Integer xh = Integer.parseInt(djxh.substring(20,djxh.length())) + 1;
			 djxh = djxh.substring(0,20) + String.format("%03d", xh);
		 }
			  
		 return djxh;
	}


	public Ljjbxx get(Ljjbxx ljjbxx) {
		
		return (Ljjbxx) queryForObject("ljjbxx.get", ljjbxx);
	}


	public Integer count(Map<String, Object> map) {
		
		return (Integer) queryForObject("ljjbxx.getListPageCount", map);
	}

}
