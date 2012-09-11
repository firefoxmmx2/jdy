package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import javax.swing.JDialog;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.dao.IKyjdwpxxDao;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Kyjdwpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.IJdpxxService;
import com.aisino2.jdy.service.IKyjdwpxxService;
import com.aisino2.publicsystem.service.IKyqkService;

public class KyjdwpxxServiceImpl implements IKyjdwpxxService {
	private IKyjdwpxxDao kyjdwpxxDao;
	private ILjjbxxDao ljjbxxDao;
	private IJdpxxDao  jdpxxDao;
	
	public void setKyjdwpxxDao(IKyjdwpxxDao kyjdwpxxDao) {
		this.kyjdwpxxDao = kyjdwpxxDao;
	}
	public void setLjjbxxDao(ILjjbxxDao ljjbxxDao) {
		this.ljjbxxDao = ljjbxxDao;
	}
	public void setJdpxxDao(IJdpxxDao jdpxxDao) {
		this.jdpxxDao = jdpxxDao;
	}
	

	
	
	
	public Kyjdwpxx insertKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		/*
		 * 修改寄递品信息的可疑标志
		 */
		kyjdwpxx.getJdpxx().setKybz("Y");
		jdpxxDao.update(kyjdwpxx.getJdpxx());
		/*
		 * 修改揽件信息的可以标志
		 */
		kyjdwpxx.getLjjbxx().setKybz("Y");
		ljjbxxDao.update(kyjdwpxx.getLjjbxx());
		/*
		 * 插入可疑寄递物品信息表
		 */
		return kyjdwpxxDao.insert(kyjdwpxx);
	}

	public void updateKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		
		if(kyjdwpxx.getKyywdjxh() == null)
			throw new RuntimeException("需要修改的寄递品ID不能为空");
		kyjdwpxxDao.update(kyjdwpxx);
	}

	public void deleteKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		/*
		 * 修改该条寄递品信息的：可疑值
		 */
		Jdpxx setJdpxx = new Jdpxx();
		setJdpxx.setKybz("N");
		setJdpxx.setId(kyjdwpxx.getLjjbxx_id());//寄递品信息ID
		jdpxxDao.update(setJdpxx);
		/*
		 * 查询该登记序号的寄递品信息是否还有为：可疑
		 */
		kyjdwpxx.setJdpxx(jdpxxDao.get(setJdpxx));
		
		//Jdpxx setJdpxx1 = new Jdpxx();
		//setJdpxx1.getLjjbxx().setDjxh(kyjdwpxx.getJdpxx().getLjjbxx().getDjxh());
		//传入揽件信息登记序号，查询该揽件信息是否还存在有可以的寄递物品
		if(jdpxxDao.getkyjdwp(kyjdwpxx.getJdpxx())==null){
			Ljjbxx setLjjbxx = new Ljjbxx();
			setLjjbxx.setKybz("N");
			setLjjbxx.setDjxh(kyjdwpxx.getJdpxx().getLjjbxx().getDjxh());
			ljjbxxDao.update(setLjjbxx);
		}
		
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
