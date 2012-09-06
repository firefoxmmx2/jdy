package com.aisino2.jdy.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IKyjdwpxxDao;
import com.aisino2.jdy.domain.Kyjdwpxx;

public class KyjdwpxxDaoImpl extends BaseDao implements IKyjdwpxxDao {

	
	public Kyjdwpxx insert(Kyjdwpxx kyjdwpxx) {
		if(kyjdwpxx.getKyywdjxh()==null){
			if(kyjdwpxx.getLjjbxx() != null && kyjdwpxx.getLjjbxx().getQyjbxx()!=null
					&& kyjdwpxx.getLjjbxx().getQyjbxx().getQybm() != null){
				kyjdwpxx.setKyywdjxh(generateDjxh(kyjdwpxx.getLjjbxx().getQyjbxx().getQybm()));
			}
			else{
				throw new RuntimeException("要么外部传入登记序号，要么传入企业编码，不可同时为空");
			}
		}
		kyjdwpxx.getKyywdjxh();
		//this.insert("kyjdwpxx.insert", kyjdwpxx);
		insert("kyjdwpxx.insert", kyjdwpxx);
		return kyjdwpxx;
	}

	
	public void delete(Kyjdwpxx kyjdwpxx) {
		this.delete("kyjdwpxx.delete", kyjdwpxx);
	}

	
	public void update(Kyjdwpxx kyjdwpxx) {
		this.update("kyjdwpxx.update", kyjdwpxx);
	}

	
	public Kyjdwpxx get(Kyjdwpxx kyjdwpxx) {
		return (Kyjdwpxx) this.queryForObject("kyjdwpxx.get", kyjdwpxx);
	}

	
	public List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx) {
		return this.queryForList("kyjdwpxx.getList", kyjdwpxx);
	}

	
	public Page findKyjdwpxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		String sCol="";
		if(sort == null)
			sort = "";
		else if(!sort.equals("asc") && !sort.equals("desc"))
			sort = " asc ";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " ljjbxx.wldh "+ sort;
			else if("1".equals(sort))
				sCol = " jjr.xm "+ sort;
			else if("2".equals(sort))
				sCol = " jjr.zjlx "+ sort;
			else if("3".equals(sort))
				sCol = " jjr.zjhm "+ sort;
			else if("4".equals(sort))
				sCol = " jdpxx.jdplx "+ sort;
			else if("5".equals(sort))
				sCol = "jdpxx.jdplx "+ sort;
			else if("6".equals(sort))
				sCol = "kyjdwpxx.xm "+ sort;
			else if("7".equals(sort))
				sCol = "kyjdwpxx.bgsj "+ sort;
			//生成代码用，按照业务登记序号排序
			else if("99".equals(sort))
				sCol = "kyjdwpxx.kyywdjxh "+ sort;
			else 
				sCol=" ljjbxx.djxh ";
		}else{
			sCol=" ljjbxx.djxh ";
		}
		map.put("pageSort", sCol);
		return queryForPage("kyjdwpxx.getListPage", map, pageno,pagesize);
	}

	
	public String generateDjxh(String qybm) {
		 String djxh = (String) queryForObject("kyjdwpxx.getForGenerateDjxh", qybm);
		 if(djxh==null){
			 djxh=qybm + new SimpleDateFormat("yyyyMMdd").format(new Date()) + "001"; 
		 }
		 else{
			 Integer xh = Integer.parseInt(djxh.substring(20,djxh.length())) + 1;
			 djxh = djxh.substring(0,20) + String.format("%03d", xh);
		 }
		return djxh;
	}

}
