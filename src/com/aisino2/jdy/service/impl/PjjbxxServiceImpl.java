package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IPjjbxxDao;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.jdy.service.IPjjbxxService;
import com.aisino2.jdy.service.IRdrjbxxService;

public class PjjbxxServiceImpl implements IPjjbxxService {

	private IPjjbxxDao pjjbxxDao;
	private ILjjbxxService ljjbxxService;
	private IRdrjbxxService rdrjbxxService;
	
	
	public void setRdrjbxxService(IRdrjbxxService rdrjbxxService) {
		this.rdrjbxxService = rdrjbxxService;
	}

	public void setLjjbxxService(ILjjbxxService ljjbxxService) {
		this.ljjbxxService = ljjbxxService;
	}

	public void setPjjbxxDao(IPjjbxxDao pjjbxxDao) {
		this.pjjbxxDao = pjjbxxDao;
	}

	public Pjjbxx insertPjjbxx(Pjjbxx pjjbxx) {
		// 当揽件信息ID不存在的，或者说是揽件信息不存在的时候自动生成一个揽件信息
		if (pjjbxx.getLjjbxx().getDjxh() == null
				|| pjjbxx.getLjjbxx().getDjxh().trim().length() == 0) {
			pjjbxx.setLjjbxx(ljjbxxService.insertLjjbxx(pjjbxx.getLjjbxx()));
		}
		
//		如果在修改派件信息的时候修改的代收人信息，当身份证 和 以前的身份证不一样的时候，
//		新添加一个人员对象为新的代收人。
		if(pjjbxx.getDsr() != null){
//			以前存在的代收人
			Rdrjbxx old_dsr = new Rdrjbxx();
			old_dsr.setZjhm(pjjbxx.getDsr().getZjhm());
			old_dsr = rdrjbxxService.getRdrjbxx(old_dsr);
			
			if(pjjbxx.getDsr().getZjhm().equals(old_dsr.getZjhm())){
				pjjbxx.getDsr().setId(old_dsr.getId());
				rdrjbxxService.updateRdrjbxx(pjjbxx.getDsr());
			}
			else
			{
				pjjbxx.setDsr(rdrjbxxService.insertRdrjbxx(pjjbxx.getDsr()));
			}
			
		}
		
		pjjbxx = pjjbxxDao.insert(pjjbxx);

		return pjjbxx;
	}

	public void deletePjjbxx(Pjjbxx pjjbxx) {
		if (pjjbxx.getId() == null)
			throw new RuntimeException("需要删除的派件ID不能为空");
		pjjbxxDao.delete(pjjbxx);
	}

	public void updatePjjbxx(Pjjbxx pjjbxx) {
		if (pjjbxx.getId() == null)
			throw new RuntimeException("需要修改的派件ID不能为空");
		//原始的派件
		Pjjbxx old_pj = pjjbxxDao.get(pjjbxx);
		
//		如果该派件的揽件信息不存在，需要自动创建，并且设置揽件信息的状态为 补件状态。
		if (pjjbxx.getLjjbxx().getDjxh() != null
				&& pjjbxx.getLjjbxx().getDjxh().trim().length() == 0) {
			ljjbxxService.updateLjjbxx(pjjbxx.getLjjbxx());
		}
		else{
			pjjbxx.getLjjbxx().setSfbj("Y");
			ljjbxxService.insertLjjbxx(pjjbxx.getLjjbxx());
		}

//		如果在修改派件信息的时候修改的代收人信息，当身份证 和 以前的身份证不一样的时候，
//		新添加一个人员对象为新的代收人。
		if(pjjbxx.getDsr() != null){
			if(pjjbxx.getDsr().getZjhm().equals(old_pj.getDsr().getZjhm())){
				rdrjbxxService.updateRdrjbxx(pjjbxx.getDsr());
			}
			else
			{
				pjjbxx.setDsr(rdrjbxxService.insertRdrjbxx(pjjbxx.getDsr()));
			}
			
		}
		
		pjjbxxDao.update(pjjbxx);
		
	}

	public List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx) {

		return pjjbxxDao.findPjjbxxs(pjjbxx);
	}

	public List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx, String dir, String sort) {
		
		return null;
	}

	public Page findPjjbxxsForPage(Map<String, Object> map, int pageno,
			int pagesize, String dir, String sort) {
		return pjjbxxDao.findPjjbxxsForPage(map, pageno, pagesize, dir, sort);
	}

	@Override
	public Pjjbxx getPjjbxx(Pjjbxx pjjbxx) {
		if(pjjbxx == null || pjjbxx.getId() == null)
			throw new RuntimeException("获取单个派件信息ID不能为空");
		return pjjbxxDao.get(pjjbxx);
	}

}
