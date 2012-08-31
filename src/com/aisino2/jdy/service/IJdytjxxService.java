package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.jdy.domain.Jdytjxx;

public interface IJdytjxxService {
	List<Jdytjxx> getJjltj(Map<String, Object> map);
	List<Jdytjxx> getSjltj(Map<String, Object> map);
	List<Jdytjxx> getQyljltj(Map<String, Object> map);
	List<Jdytjxx> getQypjltj(Map<String, Object> map);
}
