package com.aisino2.icksystem.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.icksystem.domain.Icksltj;
import com.aisino2.icksystem.domain.SendIckInfoWs;
public interface IIckSendDaoWS {
	/**
	 * 取得放送ick信息
	 * @return
	 */
		List getSendIckInfoList();
		/**
		 * 更新放送成功ick信息
		 * @return
		 */
		int getUpdateSendIckInfo(SendIckInfoWs sendIckInfoWs);
}
