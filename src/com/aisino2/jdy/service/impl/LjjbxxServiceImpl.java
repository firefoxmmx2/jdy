package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.impl.LjjbxxDaoImpl;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.ILjjbxxService;

public class LjjbxxServiceImpl extends BaseService implements ILjjbxxService{
	
	private LjjbxxDaoImpl ljjbxxdao;
	
	public LjjbxxDaoImpl getLjjbxxdao() {
		return ljjbxxdao;
	}

	public void setLjjbxxdao(LjjbxxDaoImpl ljjbxxdao) {
		this.ljjbxxdao = ljjbxxdao;
	}

	/**
	 * 添加揽件信息
	 * @param ljjbxx
	 * @return
	 */
	public Ljjbxx insertLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
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

}
