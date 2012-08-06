package com.aisino2.publicsystem.test;

import java.util.List;
import java.util.LinkedList;
import java.util.Date;

import com.aisino2.core.test.BaseTestCase;
import com.aisino2.publicsystem.domain.Cxtj;
import com.aisino2.publicsystem.service.ICxtjService;

public class CxtjTest extends BaseTestCase {

	//定义服务，名称与bean id一致，利用spring注入模式实例化
	private ICxtjService cxtjService;

	/** @param 查询统计(t_cxtj) */

	public void test() {
		Cxtj cxtj = new Cxtj();

	/** @ 查询统计ID(cxtjid) */
	cxtj.setCxtjid(0);

	/** @ 统计日期(tjrq) */
	cxtj.setTjrq(new Date());

	/** @ 行业类别代码(hylbdm) */
	cxtj.setHylbdm("test");

	/** @ 行业类别(hylb) */
	cxtj.setHylb("test");

	/** @ 地市机关代码(dsjgdm) */
	cxtj.setDsjgdm("test");

	/** @ 地市机关名称(dsjgmc) */
	cxtj.setDsjgmc("test");

	/** @ 分县局代码(fxjdm) */
	cxtj.setFxjdm("test");

	/** @ 分县局名称(fxjmc) */
	cxtj.setFxjmc("test");

	/** @ 管辖单位代码(gxdwdm) */
	cxtj.setGxdwdm("test");

	/** @ 管辖单位名称(gxdwmc) */
	cxtj.setGxdwmc("test");

	/** @ 企业编码(qybm) */
	cxtj.setQybm("test");

	/** @ 企业名称(qymc) */
	cxtj.setQymc("test");

	/** @ 合计(hj) */
	cxtj.setHj(0);

		/*
		//插入对象
		cxtjService.insertCxtj(cxtj);

		//读取对象比较
		BaseObject bo = cxtjService.getCxtj(cxtj);
		//保证能获取刚才保存的对象
		assertNotNull(bo);
		Cxtj cxtjNew = (Cxtj)(bo);
		// 保证获取对象的属性值与保存时相同
		assertEquals(cxtjNew.getCxtjid(), cxtj.getCxtjid());
		assertEquals(cxtjNew.getTjrq(), cxtj.getTjrq());
		assertEquals(cxtjNew.getHylbdm(), cxtj.getHylbdm());
		assertEquals(cxtjNew.getHylb(), cxtj.getHylb());
		assertEquals(cxtjNew.getDsjgdm(), cxtj.getDsjgdm());
		assertEquals(cxtjNew.getDsjgmc(), cxtj.getDsjgmc());
		assertEquals(cxtjNew.getFxjdm(), cxtj.getFxjdm());
		assertEquals(cxtjNew.getFxjmc(), cxtj.getFxjmc());
		assertEquals(cxtjNew.getGxdwdm(), cxtj.getGxdwdm());
		assertEquals(cxtjNew.getGxdwmc(), cxtj.getGxdwmc());
		assertEquals(cxtjNew.getQybm(), cxtj.getQybm());
		assertEquals(cxtjNew.getQymc(), cxtj.getQymc());
		assertEquals(cxtjNew.getHj(), cxtj.getHj());

		//删除对象
		// @ 查询统计ID(cxtjid) 
		cxtj.setCxtjid(1)

		cxtjService.deleteCxtj(cxtj);

		//修改对象
		// @ 查询统计ID(cxtjid) 
		cxtj.setCxtjid(1)

		cxtjService.updateCxtj(cxtj);

		//查询单条
		// @ 查询统计ID(cxtjid) 
		cxtj.setCxtjid(1)

		cxtjService.getCxtj(cxtj);

		//查询多条
		// @ 查询统计ID(cxtjid) 
		cxtj.setCxtjid(1)

		cxtjService.getListCxtj(cxtj);

		//翻页查询
		// @ 查询统计ID(cxtjid) 
		cxtj.setCxtjid(1)

		cxtjService.getListForPage(map,pageNo,pageSize,sort,desc);
		*/

	
		//保存到数据库，如不想保存到数据库，可注释此句
		this.setComplete();
	}

	public void setCxtjService(ICxtjService cxtjService) {
		this.cxtjService = cxtjService;
	}
}
