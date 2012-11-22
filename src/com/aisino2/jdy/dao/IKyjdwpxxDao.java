package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Kyjdwpxx;

/**
 * 危险寄递物品信息
 * @author hooxin
 *
 */
public interface IKyjdwpxxDao {
	/**
	 * 插入
	 * @param kyjdwpxx
	 * @return
	 */
	Kyjdwpxx insert(Kyjdwpxx kyjdwpxx);
	/**
	 * 删除
	 * @param kyjdwpxx
	 */
	void delete(Kyjdwpxx kyjdwpxx);
	/**
	 * 删除
	 * @param kyjdwpxx
	 */
	void update(Kyjdwpxx kyjdwpxx);
	
	/**
	 * 单一获取
	 * @param kyjdwpxx
	 * @return
	 */
	Kyjdwpxx get(Kyjdwpxx kyjdwpxx);
	/**
	 * 获取列表
	 * @param kyjdwpxx
	 * @return
	 */
	List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx);
	/**
	 * 获取列表 分页
	 * @param map 参数
	 * @param pageno 页数
	 * @param pagesize 每页数目
	 * @param dir 排序列数
	 * @param sort 升降序
	 * @return
	 */
	Page findKyjdwpxxsForPage(Map<String, Object> map, int pageno,int pagesize,String dir, String sort);
	/**
	 * 生成登记序号
	 * @param qybm 企业编码
	 * @return
	 */
	String generateDjxh(String qybm);
}
