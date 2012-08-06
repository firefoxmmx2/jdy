package com.aisino2.publicsystem.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.common.DateUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IQywywxxDao;
import com.aisino2.publicsystem.domain.Qywywxx;
import com.aisino2.publicsystem.service.IQywywxxService;

public class QywywxxServiceImpl extends BaseService implements IQywywxxService {

	private IQywywxxDao qywywxxDao;

	/** @param 企业无业务信息(t_qywywxx) 增加 */
	public Qywywxx insertQywywxx(Qywywxx qywywxx){
		// TODO: implement
		Date sksj=qywywxx.getKsyysj();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		String ksyysj=sdf2.format(sksj);
		
		Map map = new HashMap();
		map.put("qyid", qywywxx.getQyid());
		map.put("ksyysj",ksyysj);
		int flag=qywywxxDao.getExist(map);
		if(flag==0){//不存在
			qywywxxDao.insertQywywxx(qywywxx);
			return qywywxx;
		}else{
			return null;
		}
	}

	/** @param 企业无业务信息(t_qywywxx) 删除 */
	public boolean deleteQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return qywywxxDao.deleteQywywxx(qywywxx)>0;
	}

	/** @param 企业无业务信息(t_qywywxx) 修改 */
	public boolean updateQywywxx(Qywywxx qywywxx){
		// TODO: implement
		Date sksj=qywywxx.getKsyysj();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		String ksyysj=sdf2.format(sksj);
		
		Map map = new HashMap();
		map.put("qyid", qywywxx.getQyid());
		map.put("ksyysj",ksyysj);
		map.put("qywywxxid", qywywxx.getQywywxxid());
		int flag=qywywxxDao.getExist(map);
		if(flag==0){
			qywywxxDao.updateQywywxx(qywywxx);
			return true;
		}else{
			return false;
		}
	}

	/** @param 企业无业务信息(t_qywywxx) 查询单条 */
	public Qywywxx getQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return (Qywywxx)qywywxxDao.getQywywxx(qywywxx);
	}

	/** @param 企业无业务信息(t_qywywxx) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return qywywxxDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 企业无业务信息(t_qywywxx) 多条查询 */
	public List getListQywywxx(Qywywxx qywywxx){
		// TODO: implement
		return qywywxxDao.getListQywywxx(qywywxx);
	}

	public IQywywxxDao getQywywxxDao() {
		return qywywxxDao;
	}

	public void setQywywxxDao(IQywywxxDao qywywxxDao) {
		this.qywywxxDao = qywywxxDao;
	}
	
	/** @param 公安端企业无业务信息(t_qywywxx) 多条查询 */
	public Page getgadListQywywxx(Map map, int pageNo,int pageSize,String sort,String desc){
		return qywywxxDao.getgadListQywywxx(map, pageNo, pageSize, sort, desc);
	}
}
