package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Grpfghjjdw_yjcl;
import com.aisino2.jdy.domain.Rdrjbxx;

public interface IRdrjbxxDao {
	Rdrjbxx insert(Rdrjbxx rdrjbxx);
	void update(Rdrjbxx rdrjbxx);
	void delete(Rdrjbxx rdrjbxx);
	Rdrjbxx get(Rdrjbxx rdrjbxx);
	
	List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx);
	List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx,String dir,String sort);
	Page findRdrjbxxsForPage(Map<String, Object> map,int pageno, int pagesize,String dir,String sort);
	/***
	 * 公安端--个人频繁更换寄件单位统计查询
	 */
	Page grpfghjjdwtjcxForPage(Map<String, Object> map,int pageno, int pagesize,String dir,String sort);
	/***
	 * 公安端--个人频繁更换寄件单位统计查询----详细信息列表
	 */
	Page grpfghjjdwtjcxdalForPage(Map<String, Object> map,int pageno, int pagesize,String dir,String sort);
	/**
	 * 个人频繁更换基建单位  处理方法
	 */
	void grpfghdwclcz(Grpfghjjdw_yjcl grpfghjjdw_yjcl);
}
