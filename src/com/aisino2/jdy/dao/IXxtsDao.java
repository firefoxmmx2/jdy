package com.aisino2.jdy.dao;

import java.util.List;

import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;


public interface IXxtsDao {
	List<Xxts> queryMsgs(Xxts xxts);
	Xxts insertXxts(Xxts xxts);
	Xxyh insertXxyh(Xxyh xxyh);
	void deleteXxts(Xxyh xxyh);
	void deleteXxyh(Xxyh xxyh);
}
