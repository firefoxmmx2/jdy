package com.aisino2.jdy.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.IJdpxxDao;
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
	
			/***向寄递对象--人员信息表插入数据***/
			ljjbxx.setJjr(rdrjbxxDao.insert(ljjbxx.getJjr()));
			/***向寄递对象--人员信息表插入数据***/
			ljjbxx.setSjr(rdrjbxxDao.insert(ljjbxx.getSjr()));
			/***向揽件信息表打入揽件数据***/
			ljjbxx.setLjtbsj(new Date());
			ljjbxx = ljjbxxDao.insert(ljjbxx);
			/***向寄递物品表插入数据***/
			if(ljjbxx.getJdp_list()!=null && ljjbxx.getJdp_list().size()>0){
				for(int i=0;i<ljjbxx.getJdp_list().size();i++){
					ljjbxx.getJdp_list().get(i).setLjjbxx(ljjbxx);
					jdpxxDao.insert(ljjbxx.getJdp_list().get(i));
				}
			}
		return ljjbxx;
	}

	public void updateLjjbxx(Ljjbxx ljjbxx) {
		if(ljjbxx==null || !StringUtil.isNotEmpty(ljjbxx.getDjxh()))
			throw new RuntimeException("需要修改的揽件信息登记序号为空");
//		修改寄件人
		if(ljjbxx.getJjr()!=null && StringUtil.isNotEmpty(ljjbxx.getJjr().getZjhm())){
//			Rdrjbxx old_jjr = rdrjbxxDao.get(ljjbxx.getJjr());
//			//在寄件人不存在的时候，添加一个新的寄件人，在存的时候，更新这个寄件人的信息。
//			if(old_jjr == null){
//				ljjbxx.setJjr(rdrjbxxDao.insert(ljjbxx.getJjr()));
//			}
//			else{
				rdrjbxxDao.update(ljjbxx.getJjr());
//			}
		}
//		修改收件人
		if(ljjbxx.getSjr()!=null && StringUtil.isNotEmpty(ljjbxx.getSjr().getZjhm())){
//			Rdrjbxx old_sjr = rdrjbxxDao.get(ljjbxx.getSjr());
//			//在收件人不存在的时候，添加一个新的收件人，在存的时候，更新这个收件人的信息。
//			if(old_sjr==null){
//				ljjbxx.setSjr(rdrjbxxDao.insert(ljjbxx.getSjr()));
//			}
//			else {
				rdrjbxxDao.update(ljjbxx.getSjr());
//			}
		}
//		修改寄递品信息
		if(ljjbxx.getJdp_list()!=null && ljjbxx.getJdp_list().size()>0){
			for(Jdpxx jdp : ljjbxx.getJdp_list()){
				if(jdp==null)
					continue;
//				删除标志，当他为Y的时候，出数据库中删除这个寄递品
				if(StringUtil.isNotEmpty(jdp.getSfscbz()) && jdp.getSfscbz().equals("Y")){
					jdpxxDao.delete(jdp);
				}
				else if( jdp.getSfscbz().equals("N")){
					jdp.setLjjbxx(ljjbxx);
					jdpxxDao.insert(jdp);
				}
			}
		}
		ljjbxxDao.update(ljjbxx);
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
		if(ljjbxx == null || 
				((ljjbxx.getDjxh() == null || ljjbxx.getDjxh().trim().length()==0) 
				&& 
				(ljjbxx.getWldh() == null || ljjbxx.getWldh().trim().length()==0)) )
			throw new RuntimeException("要获取的揽件信息的登记序号或者物流单号为空");
		ljjbxx = ljjbxxDao.get(ljjbxx);
		return ljjbxx;
	}

}
