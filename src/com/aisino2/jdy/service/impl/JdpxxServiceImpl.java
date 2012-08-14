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
		
		return null;
	}

	
	public void updateJdpxx(Jdpxx jdpxx) {
		// TODO Auto-generated method stub

	}

	
	public void deleteJdpxx(Jdpxx jdpxx) {
		// TODO Auto-generated method stub

	}

	
	public List<Jdpxx> findJdpxxs(Jdpxx jdpxx) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public Page findJdpxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

}
