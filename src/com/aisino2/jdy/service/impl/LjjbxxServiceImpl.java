package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.dao.IKyjdwpxxDao;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.ILjjbxxService;

public class LjjbxxServiceImpl extends BaseService implements ILjjbxxService{
	/**注入揽件基本信息**/
	private ILjjbxxDao ljjbxxDao;
	/**注入揽件物品信息**/
	private IJdpxxDao jdpxxDao;
	/**注入可疑寄递物品信息对象**/
	private IKyjdwpxxDao kyjdwpxxDao;
	
	public void setKyjdwpxxDao(IKyjdwpxxDao kyjdwpxxDao) {
		this.kyjdwpxxDao = kyjdwpxxDao;
	}
	public void setJdpxxDao(IJdpxxDao jdpxxDao) {
		this.jdpxxDao = jdpxxDao;
	}
	public void setLjjbxxDao(ILjjbxxDao ljjbxxDao) {
		this.ljjbxxDao = ljjbxxDao;
	}

	
	

	
	public Ljjbxx insertLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
		ljjbxx.getLjr();
		
		ljjbxxDao.insert(ljjbxx);
		return null;
	}

	public void updateLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
		
	}

	public void deleteLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
		
	}

	public List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx, String dir, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page findLjjbxxForPage(Map<String, Object> para, int pageno,
			int pagesize, String dir, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	public String generateLjdjxh(String qybm) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 添加揽件信息
	 * @param ljjbxx
	 * @return
	 */

}
