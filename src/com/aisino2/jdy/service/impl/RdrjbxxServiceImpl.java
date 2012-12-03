package com.aisino2.jdy.service.impl;

import java.util.Date;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IJddxzpxxDao;
import com.aisino2.jdy.dao.IRdrjbxxDao;
import com.aisino2.jdy.domain.Grpfghjjdw_yjcl;
import com.aisino2.jdy.domain.Jddxzpxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.IRdrjbxxService;

public class RdrjbxxServiceImpl implements IRdrjbxxService {
	private IRdrjbxxDao rdrjbxxDao;
	private IJddxzpxxDao jddxzpxxDao;
	
	
	public void setRdrjbxxDao(IRdrjbxxDao rdrjbxxDao) {
		this.rdrjbxxDao = rdrjbxxDao;
	}


	public void setJddxzpxxDao(IJddxzpxxDao jddxzpxxDao) {
		this.jddxzpxxDao = jddxzpxxDao;
	}


	public Rdrjbxx insertRdrjbxx(Rdrjbxx rdrjbxx) {
		rdrjbxx = rdrjbxxDao.insert(rdrjbxx);
		
		if(rdrjbxx.getZpxx()!=null && rdrjbxx.getZpxx().getZpnr()!=null && rdrjbxx.getZpxx().getZpnr().length>0){
			rdrjbxx.getZpxx().setRdrjbxx_id(rdrjbxx.getId());
			rdrjbxx.getZpxx().setScsj(new Date());
			jddxzpxxDao.insert(rdrjbxx.getZpxx());
		}
		
		return rdrjbxx;
	}

	
	public void updateRdrjbxx(Rdrjbxx rdrjbxx) {
//		如果照片信息更换了，删除以前的，重新插入一个新的照片
		if(rdrjbxx.getZpxx()!=null && rdrjbxx.getZpxx().getId()!=null){
			Jddxzpxx old_zp = new Jddxzpxx();
			old_zp.setId(rdrjbxx.getZpxx().getId());
			
			if(!old_zp.getZpnr().equals(rdrjbxx.getZpxx().getZpnr())){
				rdrjbxx.setZpxx( jddxzpxxDao.insert(rdrjbxx.getZpxx()));
				jddxzpxxDao.delete(old_zp);
			}
		}
		
		rdrjbxxDao.update(rdrjbxx);
	}

	
	public void deleteRdrjbxx(Rdrjbxx rdrjbxx) {
		if(rdrjbxx.getId()==null)
			throw new RuntimeException("需要删除的寄递对象的ID不能为空");
		Jddxzpxx zp = new Jddxzpxx();
		zp.setRdrjbxx_id(rdrjbxx.getId());
		jddxzpxxDao.delete(zp);
		rdrjbxxDao.delete(rdrjbxx);
	}

	
	public Rdrjbxx getRdrjbxx(Rdrjbxx rdrjbxx) {
		
		return rdrjbxxDao.get(rdrjbxx);
	}

	/**
	 * 个人频繁更换基建单位统计查询
	 */
	public Page grpfghjjdwtjcxForPage(Map<String, Object> para, int pageno,
			int pagesize, String dir, String sort) {
		return rdrjbxxDao.grpfghjjdwtjcxForPage(para, pageno, pagesize, dir, sort);
		
	}
	
	/**
	 * 个人频繁更换基建单位统计查询--详细信息列表
	 */
	public Page grpfghjjdwtjcxdalForPage(Map<String, Object> para, int pageno,
			int pagesize, String dir, String sort) {
		return rdrjbxxDao.grpfghjjdwtjcxdalForPage(para, pageno, pagesize, dir, sort);
		
	}
	/**
	 * 个人频繁更换基建单位  处理方法
	 */
	public void grpfghdwclcz(Grpfghjjdw_yjcl grpfghjjdw_yjcl) {
		if(grpfghjjdw_yjcl==null || grpfghjjdw_yjcl.getId()==null)
			throw new RuntimeException("个人频繁更换寄件单位ID为空");
		rdrjbxxDao.grpfghdwclcz(grpfghjjdw_yjcl);
	}

}
