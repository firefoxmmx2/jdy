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
			Rdrjbxx setRddrjbxx = new Rdrjbxx();
			setRddrjbxx.setZjhm(ljjbxx.getJjr().getZjhm());
			setRddrjbxx=rdrjbxxDao.get(setRddrjbxx);
			Rdrjbxx Rdrjbxxjjr = new Rdrjbxx();//存放寄件人ID
			Rdrjbxx Rdrjbxxsjr = new Rdrjbxx();//存放收件人ID
			if(setRddrjbxx==null){//判断证件号码，表中是否存在，若不存在则插入
				/***向寄递对象--人员信息表插入数据***/
				setRddrjbxx=rdrjbxxDao.insert(ljjbxx.getJjr());
				Rdrjbxxjjr.setId(setRddrjbxx.getId());
			}
			setRddrjbxx.setZjhm(ljjbxx.getSjr().getZjhm());
			setRddrjbxx=rdrjbxxDao.get(setRddrjbxx);
			if(setRddrjbxx==null){//判断证件号码，表中是否存在，若不存在则插入
				/***向寄递对象--人员信息表插入数据***/
				setRddrjbxx=rdrjbxxDao.insert(ljjbxx.getSjr());
				Rdrjbxxsjr.setId(setRddrjbxx.getId());
			}
			/***向揽件信息表打入揽件数据***/
			ljjbxx.setJjr(Rdrjbxxjjr);
			ljjbxx.setSjr(Rdrjbxxsjr);
			ljjbxxDao.insert(ljjbxx);
			/***向寄递物品表插入数据***/
			if(ljjbxx.getJdp_list()!=null && ljjbxx.getJdp_list().size()>0){
				for(int i=0;i<ljjbxx.getJdp_list().size();i++){
					jdpxxDao.insert(ljjbxx.getJdp_list().get(i));
				}
			}
		return setLjjbxx;
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
