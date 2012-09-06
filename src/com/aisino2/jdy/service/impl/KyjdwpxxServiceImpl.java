package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import javax.swing.JDialog;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IKyjdwpxxDao;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Kyjdwpxx;
import com.aisino2.jdy.service.IJdpxxService;
import com.aisino2.jdy.service.IKyjdwpxxService;
import com.aisino2.publicsystem.service.IKyqkService;

public class KyjdwpxxServiceImpl implements IKyjdwpxxService {
	private IKyjdwpxxDao kyjdwpxxDao;

	public void setKyjdwpxxDao(IKyjdwpxxDao kyjdwpxxDao) {
		this.kyjdwpxxDao = kyjdwpxxDao;
	}

	public Kyjdwpxx insertKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		
		
		return kyjdwpxxDao.insert(kyjdwpxx);
	}

	public void updateKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		
		if(kyjdwpxx.getKyywdjxh() == null)
			throw new RuntimeException("需要修改的寄递品ID不能为空");
		kyjdwpxxDao.update(kyjdwpxx);
	}

	public void deleteKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		
		kyjdwpxxDao.delete(kyjdwpxx);
		
	}

	public Kyjdwpxx getKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Kyjdwpxx> findKyjdwpxxs(Kyjdwpxx kyjdwpxx, String dir,
			String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page findKyjdwpxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		
		return kyjdwpxxDao.findKyjdwpxxsForPage(map, pageno, pagesize, dir, sort);
	}

	public String generateKyywdjxh(String qybm) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
