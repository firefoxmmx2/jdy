package com.aisino2.publicsystem.service;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.domain.Qywywxx;

public interface IQywywxxService {
	/** @param 企业无业务信息(t_qywywxx) 增加 */
	Qywywxx insertQywywxx(Qywywxx qywywxx);

	/** @param 企业无业务信息(t_qywywxx) 删除 */
	boolean deleteQywywxx(Qywywxx qywywxx);

	/** @param 企业无业务信息(t_qywywxx) 修改 */
	boolean updateQywywxx(Qywywxx qywywxx);

	/** @param 企业无业务信息(t_qywywxx) 查询单条 */
	Qywywxx getQywywxx(Qywywxx qywywxx);

	/** @param 企业无业务信息(t_qywywxx) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 企业无业务信息(t_qywywxx) 多条查询 */
	List getListQywywxx(Qywywxx qywywxx);
	
	/** @param 公安端企业无业务信息(t_qywywxx) 多条查询 */
	Page getgadListQywywxx(Map map, int pageNo,int pageSize,String sort,String desc);
	
}
