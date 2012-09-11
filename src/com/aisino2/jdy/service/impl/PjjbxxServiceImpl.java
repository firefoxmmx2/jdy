package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.jdy.dao.IPjjbxxDao;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.IJdyBjService;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.jdy.service.IPjjbxxService;
import com.aisino2.jdy.service.IRdrjbxxService;
import com.aisino2.publicsystem.service.IQyjbxxService;

public class PjjbxxServiceImpl implements IPjjbxxService {

	private IPjjbxxDao pjjbxxDao;
	private ILjjbxxService ljjbxxService;
	private IRdrjbxxService rdrjbxxService;
	private IJdyBjService jdyBjService;
	private IQyjbxxService qyjbxxService;

	public void setQyjbxxService(IQyjbxxService qyjbxxService) {
		this.qyjbxxService = qyjbxxService;
	}

	public void setJdyBjService(IJdyBjService jdyBjService) {
		this.jdyBjService = jdyBjService;
	}

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
			pjjbxx.getLjjbxx().setSfbj("Y");
//			补加的揽件信息 揽件人和揽件填报人就是当前填报的从业人员
			pjjbxx.getLjjbxx().setLjr(pjjbxx.getPjtbr());
			pjjbxx.getLjjbxx().setLjsj(pjjbxx.getPjtbsj());
			pjjbxx.getLjjbxx().setLjtbr(pjjbxx.getPjtbr());
			pjjbxx.getLjjbxx().setLjtbsj(pjjbxx.getPjtbsj());
			pjjbxx.setLjjbxx(ljjbxxService.insertLjjbxx(pjjbxx.getLjjbxx()));
		} else {
			ljjbxxService.updateLjjbxx(pjjbxx.getLjjbxx());
		}

		// 新添加一个人员对象为新的代收人。
		if (pjjbxx.getDsr() != null && pjjbxx.getDsr().getZjhm() != null
				&& pjjbxx.getDsr().getZjhm().trim().length() > 0) {
			pjjbxx.setDsr(rdrjbxxService.insertRdrjbxx(pjjbxx.getDsr()));
		}

		pjjbxx = pjjbxxDao.insert(pjjbxx);

		pjjbxx.getLjjbxx().setQyjbxx(
				qyjbxxService.getQyjbxx(pjjbxx.getLjjbxx().getQyjbxx()));
		// 寄递业公共比对插入
		jdyBjService.insertJdyBjxx(pjjbxx);

		return pjjbxx;
	}

	public void deletePjjbxx(Pjjbxx pjjbxx) {
		if (pjjbxx.getId() == null)
			throw new RuntimeException("需要删除的派件ID不能为空");
		// pjjbxxDao.delete(pjjbxx);
		pjjbxx.setSfscbz("Y");
		pjjbxxDao.update(pjjbxx);
	}

	public void updatePjjbxx(Pjjbxx pjjbxx) {
		if (pjjbxx.getId() == null)
			throw new RuntimeException("需要修改的派件ID不能为空");

		// 如果该派件的揽件信息不存在，需要自动创建，并且设置揽件信息的状态为 补件状态。
		if (pjjbxx.getLjjbxx()!=null && StringUtil.isNotEmpty(pjjbxx.getLjjbxx().getDjxh())) {
			ljjbxxService.updateLjjbxx(pjjbxx.getLjjbxx());
		}

		// 如果在修改派件信息的时候修改的代收人信息，当身份证 和 以前的身份证不一样的时候，
		// 新添加一个人员对象为新的代收人。
		if (pjjbxx.getDsr() != null && pjjbxx.getDsr().getId() != null) {
			rdrjbxxService.updateRdrjbxx(pjjbxx.getDsr());
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

	public Pjjbxx getPjjbxx(Pjjbxx pjjbxx) {
		if (pjjbxx == null || pjjbxx.getId() == null)
			throw new RuntimeException("获取单个派件信息ID不能为空");
		return pjjbxxDao.get(pjjbxx);
	}

}
