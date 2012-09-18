package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Jdytjxx;

public interface IJdytjxxService {
	List<Jdytjxx> getJjltj(Map<String, Object> map);
	List<Jdytjxx> getSjltj(Map<String, Object> map);
	List<Jdytjxx> getQyljltj(Map<String, Object> map);
	List<Jdytjxx> getQypjltj(Map<String, Object> map);
	
	Page getSlgjtj(Map<String,Object> paras,int pageno,int pagesize,String dir,String sort);
}
