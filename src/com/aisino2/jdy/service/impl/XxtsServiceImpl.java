package com.aisino2.jdy.service.impl;

import java.util.List;

import com.aisino2.jdy.dao.IXxtsDao;
import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;
import com.aisino2.jdy.service.IXxtsService;

public class XxtsServiceImpl implements IXxtsService {
	private IXxtsDao xxtsDao;

	public IXxtsDao getXxtsDao() {
		return xxtsDao;
	}

	public void setXxtsDao(IXxtsDao xxtsDao) {
		this.xxtsDao = xxtsDao;
	}
	
	/**
	 * 查询当前用户显示的消息
	 */
	public List<Xxts> queryMsgs(Xxts xxts){
		return xxtsDao.queryMsgs(xxts);
	}
	
	/**
	 *  插入消息（T_xxts t_t_xxyhys 表中）
	 */
	public void insertMsg(Xxts xxts){
		xxts=xxtsDao.insertXxts(xxts);
		for(Xxyh xxyh : xxts.getXxyh_list()){
		   xxyh.setXx_id(xxts.getId());
		   xxtsDao.insertXxyh(xxyh);
		}
		
	}
	
	/**
	 * 删除消息
	 */
	public void deleteMsg(Xxts xxts){
		for(Xxyh xxyh : xxts.getXxyh_list()){
			xxtsDao.deleteXxts(xxyh);
			xxtsDao.deleteXxyh(xxyh);
		}
	}
}
