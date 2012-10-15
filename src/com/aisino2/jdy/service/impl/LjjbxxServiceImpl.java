package com.aisino2.jdy.service.impl;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aisino.commons.beanutils.BeanUtils;

import com.aisino2.common.ImageUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.jdy.dao.IJddxzpxxDao;
import com.aisino2.jdy.dao.IJdpxxDao;
import com.aisino2.jdy.dao.ILjjbxxDao;
import com.aisino2.jdy.dao.IRdrjbxxDao;
import com.aisino2.jdy.dao.IRdrjbxx_lsDao;
import com.aisino2.jdy.domain.Jddxzpxx;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.domain.Rdrjbxx_ls;
import com.aisino2.jdy.service.IJdyBjService;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.service.IQyjbxxService;

public class LjjbxxServiceImpl extends BaseService implements ILjjbxxService{
	/**注入揽件基本信息**/
	private ILjjbxxDao ljjbxxDao;
	/**注入揽件物品信息**/
	private IJdpxxDao jdpxxDao;
	/**寄递物品信息**/
	private IRdrjbxxDao rdrjbxxDao;
	/**人员照片信息**/
	private IJddxzpxxDao jddxzpxxDao;
	/**人员历史信息表**/
	private IRdrjbxx_lsDao rdrjbxx_lsDao;
	

	private Ljjbxx setLjjbxx;
	private IQyjbxxService qyjbxxService;
	private IJdyBjService jdyBjService;


	public void setJdyBjService(IJdyBjService jdyBjService) {
		this.jdyBjService = jdyBjService;
	}

	public void setQyjbxxService(IQyjbxxService qyjbxxService) {
		this.qyjbxxService = qyjbxxService;
	}
	
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
	public void setJddxzpxxDao(IJddxzpxxDao jddxzpxxDao) {
		this.jddxzpxxDao = jddxzpxxDao;
	}
	public void setRdrjbxx_lsDao(IRdrjbxx_lsDao rdrjbxx_lsDao) {
		this.rdrjbxx_lsDao = rdrjbxx_lsDao;
	}
	

	
	public Ljjbxx insertLjjbxx(Ljjbxx ljjbxx) throws Exception {
	
			/***向寄递对象--人员信息表插入数据***/
			ljjbxx.getJjr().setJdrylx("10"); //设置寄递人员类型 寄件
			ljjbxx.setJjr(rdrjbxxDao.insert(ljjbxx.getJjr()));
			/****插入人员照片信息*****/
			Jddxzpxx setJddxzpxx = new Jddxzpxx();
			if(ljjbxx.getJjrzpxx()!=null){
				setJddxzpxx.setRdrjbxx_id(ljjbxx.getJjr().getId());//寄件人ID
				setJddxzpxx.setScsj(new Date());//上传时间
				byte[] jjrzp;
				jjrzp = ImageUtil.getImageByte(ljjbxx.getJjrzpxx());
				setJddxzpxx.setZpnr(jjrzp);//寄件人照片内容
				jddxzpxxDao.insert(setJddxzpxx);
				
			}
//			/***向基地对象--寄件人--人员信息历史表插入数据***/
//			Rdrjbxx_ls setRdrjbxx_ls = new Rdrjbxx_ls();
//			BeanUtils.copyProperties(setRdrjbxx_ls, ljjbxx.getJjr());//将人员实体中的属性相同的数据设置到人员历史实体中
//			//setRdrjbxx_ls.setLjjbxx_id(ljjbxx.getDjxh());//登记序号这里不好得到所以暂时不打入，查询时要用到再做关联
//			setRdrjbxx_ls.setRyid(ljjbxx.getJjr().getId());//寄件人ID
//			setRdrjbxx_ls.setGxdwbm(ljjbxx.getQyjbxx().getGxdwbm());//管辖单位编码
//			setRdrjbxx_ls.setGxdwmc(ljjbxx.getQyjbxx().getGxdwmc());//管辖单位名称
////			Method m = setRdrjbxx_ls.getClass().getDeclaredMethod("getXm");反射的例子
////			Method[] ms = setRdrjbxx_ls.getClass().getDeclaredMethods();
////			System.out.println(m.invoke(setRdrjbxx_ls));
//			rdrjbxx_lsDao.insert(setRdrjbxx_ls);
			/***向寄递对象--人员信息表插入数据***/  
			ljjbxx.getSjr().setJdrylx("20"); //设置寄递人员类型 收件
			ljjbxx.setSjr(rdrjbxxDao.insert(ljjbxx.getSjr()));
			if(ljjbxx.getSjrzpxx()!=null && StringUtil.isNotEmpty(ljjbxx.getSjrzpxx())){
				/****插入人员照片信息*****/
				setJddxzpxx.setRdrjbxx_id(ljjbxx.getSjr().getId());//寄件人ID
				setJddxzpxx.setScsj(new Date());//上传时间
				byte[] sjrzp;
				sjrzp = ImageUtil.getImageByte(ljjbxx.getSjrzpxx());
				setJddxzpxx.setZpnr(sjrzp);//收件人照片内容
				jddxzpxxDao.insert(setJddxzpxx);
			}
//			/***向基地对象--收件人--人员信息历史表插入数据***/
//			BeanUtils.copyProperties(setRdrjbxx_ls, ljjbxx.getSjr());//将人员实体中的属性相同的数据设置到人员历史实体中
//			//setRdrjbxx_ls.setLjjbxx_id(ljjbxx.getDjxh());//登记序号这里不好得到所以暂时不打入，查询时要用到再做关联
//			setRdrjbxx_ls.setRyid(ljjbxx.getSjr().getId());//寄件人ID
//			setRdrjbxx_ls.setGxdwbm(ljjbxx.getQyjbxx().getGxdwbm());//管辖单位编码
//			setRdrjbxx_ls.setGxdwmc(ljjbxx.getQyjbxx().getGxdwmc());//管辖单位名称
//			rdrjbxx_lsDao.insert(setRdrjbxx_ls);
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
			ljjbxx.setQyjbxx(
					qyjbxxService.getQyjbxx(ljjbxx.getQyjbxx()));
			// 寄递业公共比对插入
			jdyBjService.insertJdyBjxx(ljjbxx);
		return ljjbxx;
	}

	public void updateLjjbxx(Ljjbxx ljjbxx) throws Exception {
		if(ljjbxx==null || !StringUtil.isNotEmpty(ljjbxx.getDjxh()))
			throw new RuntimeException("需要修改的揽件信息登记序号为空");
		//修改寄件人
		if(ljjbxx.getJjr()!=null && StringUtil.isNotEmpty(ljjbxx.getJjr().getZjhm())){
			Rdrjbxx setJjrtemp = new Rdrjbxx();
			setJjrtemp=rdrjbxxDao.get(ljjbxx.getJjr());
			//寄件人不存在的时候，需要将该人员添加到比对报警表去
			if(setJjrtemp == null){
				ljjbxx.setQyjbxx(
						qyjbxxService.getQyjbxx(ljjbxx.getQyjbxx()));
				// 寄递业公共比对插入
				jdyBjService.insertJdyBjxx(ljjbxx);
			}
		    rdrjbxxDao.update(ljjbxx.getJjr());
		}
		//删除照片信息
		Jddxzpxx setJddxzpxx = new Jddxzpxx();
		if(ljjbxx.getJjr().getZpxx().getId()!=null){
			jddxzpxxDao.delete(ljjbxx.getJjr().getZpxx());
		}
		if(ljjbxx.getSjr().getZpxx().getId()!=null){
			jddxzpxxDao.delete(ljjbxx.getSjr().getZpxx());
		}
		//从新获取照片信息数据插入数据库
		if(ljjbxx.getJjrzpxx()!=null && ljjbxx.getJjrzpxx().trim().length()!=0){
			setJddxzpxx.setRdrjbxx_id(ljjbxx.getJjr().getId());//寄件人ID
			setJddxzpxx.setScsj(new Date());//上传时间
			byte[] jjrzp;
			jjrzp = ImageUtil.getImageByte(ljjbxx.getJjrzpxx());
			setJddxzpxx.setZpnr(jjrzp);//寄件人照片内容
			jddxzpxxDao.insert(setJddxzpxx);
			
		}
		//修改收件人
		if(ljjbxx.getSjr()!=null && StringUtil.isNotEmpty(ljjbxx.getSjr().getZjhm())){
			Rdrjbxx setJjrtemp1 = new Rdrjbxx();
			setJjrtemp1=rdrjbxxDao.get(ljjbxx.getSjr());
			//收件人不存在的时候，需要将该人员添加到比对报警表去
			if(setJjrtemp1==null){
				ljjbxx.setQyjbxx(
						qyjbxxService.getQyjbxx(ljjbxx.getQyjbxx()));
				// 寄递业公共比对插入
				jdyBjService.insertJdyBjxx(ljjbxx);
			}
			rdrjbxxDao.update(ljjbxx.getSjr());
		}
		//从新获取照片信息数据插入数据库
		if(ljjbxx.getSjrzpxx()!=null && ljjbxx.getSjrzpxx().trim().length()!=0){
			/****插入人员照片信息*****/
			setJddxzpxx.setRdrjbxx_id(ljjbxx.getSjr().getId());//寄件人ID
			setJddxzpxx.setScsj(new Date());//上传时间
			byte[] sjrzp;
			try {
				sjrzp = ImageUtil.getImageByte(ljjbxx.getSjrzpxx());
				setJddxzpxx.setZpnr(sjrzp);//收件人照片内容
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			jddxzpxxDao.insert(setJddxzpxx);
		}
		//修改寄递品信息
		if(ljjbxx.getJdp_list()!=null && ljjbxx.getJdp_list().size()>0){
			for(Jdpxx jdp : ljjbxx.getJdp_list()){
				if(jdp==null)
					continue;
				//删除标志，当他为Y的时候，出数据库中删除这个寄递品
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
	
	public Page gadjdpxxForPage(Map<String, Object> para, int pageno,
			int pagesize, String dir, String sort) {
		return ljjbxxDao.gadjdpxxForPage(para, pageno, pagesize, dir, sort);
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

	public boolean isAvailableWldh(String qybm, String wldh) {
		if(!StringUtil.isNotEmpty(qybm))
			throw new RuntimeException("需要确认唯一性的物流单号的企业编码为空");
		if(!StringUtil.isNotEmpty(wldh))
			throw new RuntimeException("需要确认唯一性的物流单号的物流单号为空");
		
		boolean result = false;
		Integer count = 0;
		
//		查询参数
		Map<String,Object> map=new HashMap<String, Object>();
		Qyjbxx qyjbxx=new Qyjbxx();
		qyjbxx.setQybm(qybm);
		map.put("qyjbxx", qyjbxx);
		map.put("wldh", wldh);
		map.put("scbzw", "y");
		
		count=ljjbxxDao.count(map);
		if(count>0)
			result=false;
		else
			result=true;
		return result;
	}

}
