package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.service.IJdpxxService;

public class JdpxxServiceImpl implements IJdpxxService {
	private IJdpxxDao jdpxxDao;
	
	public void setJdpxxDao(IJdpxxDao jdpxxDao) {
		this.jdpxxDao = jdpxxDao;
	}


	public Jdpxx insertJdpxx(Jdpxx jdpxx) {
		return jdpxxDao.insert(jdpxx);
	}

	
	public void updateJdpxx(Jdpxx jdpxx) {
		if(jdpxx.getId() == null)
			throw new RuntimeException("需要修改的寄递品ID不能为空");
		jdpxxDao.update(jdpxx);
	}

	
	public void deleteJdpxx(Jdpxx jdpxx) {
		if(jdpxx.getId() == null )
			throw new RuntimeException("需要删除的寄递品ID不能为空");
		jdpxxDao.delete(jdpxx);
	}

	
	public List<Jdpxx> findJdpxxs(Jdpxx jdpxx) {
		return jdpxxDao.findJdpxxs(jdpxx);
	}

	
	public Page findJdpxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		return jdpxxDao.findJdpxxsForPage(map, pageno, pagesize, dir, sort);
	}


	public Jdpxx getJdpxx(Jdpxx jdpxx) {
		if(jdpxx == null)
			throw new RuntimeException("要获取的揽件信息的登记序号或者物流单号为空");
		jdpxx = jdpxxDao.get(jdpxx);
		return jdpxx;
	}
	
	/**
	 * 查询预警寄递物品
	 * @param map
	 * @param pageno
	 * @param pagesize
	 * @param dir
	 * @param sort
	 * @return
	 */
	public Page findYjwpForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort){
		return jdpxxDao.findYjwpForPage(map, pageno, pagesize, dir, sort);
	}
	
	/**
	 * 添加预警寄递物品
	 */
	public void setYjwp(Map map){
		jdpxxDao.setYjwp(map);
	}

}
