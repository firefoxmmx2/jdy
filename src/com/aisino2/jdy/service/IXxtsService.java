package com.aisino2.jdy.service;

import java.util.List;

import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;



/**
 * 消息提示
 * @author jjqueen
 *
 */
public interface IXxtsService {
	List<Xxts> queryMsgs(Xxts xxts);
	void insertMsg(Xxts xxts);
	void deleteMsg(Xxts xxts);
}
