package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Kyjdwpxx;

/**
 * 可疑寄递物品信息服务
 * @author hooxin
 *
 */
public interface IKyjdwpxxService {
	/**
	 * 插入
	 * @param kyjdwpxx
	 * @return
	 */
	Kyjdwpxx insertKyjdwpxx(Kyjdwpxx kyjdwpxx);
	void updateKyjdwpxx(Kyjdwpxx kyjdwpxx);
	void deleteKyjdwpxx(Kyjdwpxx kyjdwpxx);
	
	Kyjdwpxx getKyjdwpxx(Kyjdwpxx kyjdwpxx);
	List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx);
	List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx,String dir,String sort);
	Page findKyjdwpxxsForPage(Map<String, Object> map,int pageno,int pagesize,String dir,String sort);
	
	/**
	 * 生成可以业务登记序号
	 * @param qybm
	 * @return
	 */
	String generateKyywdjxh(String qybm);
}
