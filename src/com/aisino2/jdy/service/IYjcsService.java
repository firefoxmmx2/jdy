package com.aisino2.jdy.service;

import java.util.List;
import java.util.Map;

import com.aisino2.jdy.domain.Yjcs;

/**
 * 预警参数服务
 */
public interface IYjcsService {
	/**
	 * 新增预警
	 * @param yjcs
	 * @return
	 */
	Yjcs insertYjcs(Yjcs yjcs);
	/**删除预警
	 * @param yjcs
	 */
	void removeYjcs(Yjcs yjcs);
	/**
	 * 修改预警信息
	 * @param yjcs
	 */
	void updateYjcs(Yjcs yjcs);
	/**
	 * 查询
	 * @param param 参数map
	 * @return
	 */
	List<Yjcs> query(Map<String, Object> param);
}
