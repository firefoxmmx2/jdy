package com.aisino2.jdy.service;

import com.aisino2.jdy.domain.Rdrjbxx;

/**
 * 寄递对象服务
 * @author hooxin
 *
 */
public interface IRdrjbxxService {
	/**
	 * 添加寄递对象
	 * @param rdrjbxx
	 * @return
	 */
	Rdrjbxx insertRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 更新寄递对象
	 * @param rdrjbxx
	 */
	void updateRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 删除寄递对象
	 * @param rdrjbxx
	 */
	void deleteRdrjbxx(Rdrjbxx rdrjbxx);
	/**
	 * 获取单个寄递对象
	 * @param rdrjbxx
	 * @return
	 */
	Rdrjbxx getRdrjbxx(Rdrjbxx rdrjbxx);
	
}
