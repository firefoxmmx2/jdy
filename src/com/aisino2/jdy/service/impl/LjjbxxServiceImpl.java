package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.dao.IKyjdwpxxDao;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.dao.IRdrjbxxDao;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.ILjjbxxService;

public class LjjbxxServiceImpl extends BaseService implements ILjjbxxService{
	/**注入揽件基本信息**/
	private ILjjbxxDao ljjbxxDao;
	/**注入揽件物品信息**/
	private IJdpxxDao jdpxxDao;
	/**寄递物品信息**/
	private IRdrjbxxDao rdrjbxxDao;
	
	private Ljjbxx setLjjbxx;
	
	public Ljjbxx getSetLjjbxx() {
		return setLjjbxx;
	}
	public void setSetLjjbxx(Ljjbxx setLjjbxx) {
		this.setLjjbxx = setLjjbxx;
	}
	public void setRdrjbxxDao(IRdrjbxxDao rdrjbxxDao) {
		this.rdrjbxxDao = rdrjbxxDao;
	}
	public void setJdpxxDao(IJdpxxDao jdpxxDao) {
		this.jdpxxDao = jdpxxDao;
	}
	public void setLjjbxxDao(ILjjbxxDao ljjbxxDao) {
		this.ljjbxxDao = ljjbxxDao;
	}

	
	

	
	public Ljjbxx insertLjjbxx(Ljjbxx ljjbxx) {
		
			/***向寄递对象表打入人员信息的数据--得到人员信息ID后再插入到揽件表中去***/
			//首先判断证件号码，表中是否存在，若不存在则插入
			Rdrjbxx setRddrjbxx = new Rdrjbxx();
			setRddrjbxx.setZjhm(ljjbxx.getJjr().getZjhm());
			setRddrjbxx=rdrjbxxDao.get(setRddrjbxx);
			if(setRddrjbxx!=null){
				Rdrjbxx rddrjbxx = new Rdrjbxx();
				/***向寄递对象--人员信息表插入数据***/
				rdrjbxxDao.insert(rddrjbxx);
			}
			setRddrjbxx.setZjhm(ljjbxx.getSjr().getZjhm());
			setRddrjbxx=rdrjbxxDao.get(setRddrjbxx);
			if(setRddrjbxx!=null){
				Rdrjbxx rddrjbxx = new Rdrjbxx();
				/***向寄递对象--人员信息表插入数据***/
				rdrjbxxDao.insert(rddrjbxx);
			}
			Ljjbxx setljjbxx = new Ljjbxx();
			/***向揽件信息表打入揽件数据***/
			ljjbxxDao.insert(setljjbxx);
			/***向寄递物品表插入数据***/
			Jdpxx setjbpxx = new Jdpxx();
			jdpxxDao.insert(setjbpxx);
			
			
		return setLjjbxx;
	}

	public void updateLjjbxx(Ljjbxx ljjbxx) {
		// TODO Auto-generated method stub
		
	}

	public void deleteLjjbxx(Ljjbxx ljjbxx) {
		if(ljjbxx==null || ljjbxx.getDjxh()==null || ljjbxx.getDjxh().trim().length()==0)
			throw new RuntimeException("需要删除的揽件登记序号为空");
		ljjbxxDao.delete(ljjbxx);
	}

	public List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx) {
		return ljjbxxDao.findLjjbxxs(ljjbxx);
	}

	public List<Ljjbxx> findLjjbxx(Ljjbxx ljjbxx, String dir, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page findLjjbxxForPage(Map<String, Object> para, int pageno,
			int pagesize, String dir, String sort) {
		return ljjbxxDao.findLjjbxxsForPage(para, pageno, pagesize, dir, sort);
	}

	public String generateLjdjxh(String qybm) {
		if(qybm == null || qybm.trim().length()==0)
			throw new RuntimeException("需要生成的揽件登记序号的企业编码为空");
		return ljjbxxDao.generateDjxh(qybm);
	}
	
	public Ljjbxx getLjjbxx(Ljjbxx ljjbxx) {
		if(ljjbxx == null || ljjbxx.getDjxh() == null || ljjbxx.getDjxh().trim().length()==0)
			throw new RuntimeException("要获取的揽件信息的登记序号为空");
		ljjbxx = ljjbxxDao.get(ljjbxx);
		return ljjbxx;
	}

}
