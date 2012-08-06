package com.aisino2.basicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.basicsystem.domain.DoublePY;
import com.aisino2.basicsystem.domain.Xctb;

public interface IDpyService {
	
	/**
	 * 获得名字的双拼
	 * @return
	 */
	String getDoublepy(DoublePY doublePY);

	
}
