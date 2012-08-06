package com.aisino2.icksystem.test;

import java.util.List;
import java.util.LinkedList;
import java.util.Date;

import com.aisino2.core.test.BaseTestCase;
import com.aisino2.icksystem.domain.Icktjrb;
import com.aisino2.icksystem.service.IIcktjrbService;

public class IcktjrbTest extends BaseTestCase {

	//定义服务，名称与bean id一致，利用spring注入模式实例化
	private IIcktjrbService icktjrbService;

	/** @param IC卡统计日报(t_icktjrb) */

	public void test() {
		Icktjrb icktjrb = new Icktjrb();

	/** @ IC卡统计日报ID(icktjrbid) */
	icktjrb.setIcktjrbid(0);

	/** @ 统计日期(tjrq) */
	icktjrb.setTjrq(new Date());

	/** @ 企业ID(qyid) */
	icktjrb.setQyid(0);

	/** @ 行业类别代码(hylbdm) */
	icktjrb.setHylbdm("test");

	/** @ 行业类别(hylb) */
	icktjrb.setHylb("test");

	/** @ 企业编码(qybm) */
	icktjrb.setQybm("test");

	/** @ 企业名称(qymc) */
	icktjrb.setQymc("test");

	/** @ 管辖单位代码(gxdwbm) */
	icktjrb.setGxdwbm("test");

	/** @ 管辖单位名称(gxdwmc) */
	icktjrb.setGxdwmc("test");

	/** @ 所属地县级公安机关代码(ssdxjgajgdm) */
	icktjrb.setSsdxjgajgdm("test");

	/** @ 所属地县级公安机关名称(ssdxjgajgmc) */
	icktjrb.setSsdxjgajgmc("test");

	/** @ 所属地地市机构代码(ssddsjgdm) */
	icktjrb.setSsddsjgdm("test");

	/** @ 所属地地市机构名称(ssddsjgmc) */
	icktjrb.setSsddsjgmc("test");

	/** @ 已录入从业人员数(lrcyrys) */
	icktjrb.setLrcyrys(0);

	/** @ 受理IC卡数(slicks) */
	icktjrb.setSlicks(0);

	/** @ 发放IC卡数(fficks) */
	icktjrb.setFficks(0);

	/** @ 刷卡次数(skcs) */
	icktjrb.setSkcs(0);

	/** @ 刷卡IC卡数(skicks) */
	icktjrb.setSkicks(0);

		/*
		//插入对象
		icktjrbService.insertIcktjrb(icktjrb);

		//读取对象比较
		BaseObject bo = icktjrbService.getIcktjrb(icktjrb);
		//保证能获取刚才保存的对象
		assertNotNull(bo);
		Icktjrb icktjrbNew = (Icktjrb)(bo);
		// 保证获取对象的属性值与保存时相同
		assertEquals(icktjrbNew.getIcktjrbid(), icktjrb.getIcktjrbid());
		assertEquals(icktjrbNew.getTjrq(), icktjrb.getTjrq());
		assertEquals(icktjrbNew.getQyid(), icktjrb.getQyid());
		assertEquals(icktjrbNew.getHylbdm(), icktjrb.getHylbdm());
		assertEquals(icktjrbNew.getHylb(), icktjrb.getHylb());
		assertEquals(icktjrbNew.getQybm(), icktjrb.getQybm());
		assertEquals(icktjrbNew.getQymc(), icktjrb.getQymc());
		assertEquals(icktjrbNew.getGxdwbm(), icktjrb.getGxdwbm());
		assertEquals(icktjrbNew.getGxdwmc(), icktjrb.getGxdwmc());
		assertEquals(icktjrbNew.getSsdxjgajgdm(), icktjrb.getSsdxjgajgdm());
		assertEquals(icktjrbNew.getSsdxjgajgmc(), icktjrb.getSsdxjgajgmc());
		assertEquals(icktjrbNew.getSsddsjgdm(), icktjrb.getSsddsjgdm());
		assertEquals(icktjrbNew.getSsddsjgmc(), icktjrb.getSsddsjgmc());
		assertEquals(icktjrbNew.getLrcyrys(), icktjrb.getLrcyrys());
		assertEquals(icktjrbNew.getSlicks(), icktjrb.getSlicks());
		assertEquals(icktjrbNew.getFficks(), icktjrb.getFficks());
		assertEquals(icktjrbNew.getSkcs(), icktjrb.getSkcs());
		assertEquals(icktjrbNew.getSkicks(), icktjrb.getSkicks());

		//删除对象
		// @ IC卡统计日报ID(icktjrbid) 
		icktjrb.setIcktjrbid(1)

		icktjrbService.deleteIcktjrb(icktjrb);

		//修改对象
		// @ IC卡统计日报ID(icktjrbid) 
		icktjrb.setIcktjrbid(1)

		icktjrbService.updateIcktjrb(icktjrb);

		//查询单条
		// @ IC卡统计日报ID(icktjrbid) 
		icktjrb.setIcktjrbid(1)

		icktjrbService.getIcktjrb(icktjrb);

		//查询多条
		// @ IC卡统计日报ID(icktjrbid) 
		icktjrb.setIcktjrbid(1)

		icktjrbService.getListIcktjrb(icktjrb);

		//翻页查询
		// @ IC卡统计日报ID(icktjrbid) 
		icktjrb.setIcktjrbid(1)

		icktjrbService.getListForPage(map,pageNo,pageSize,sort,desc);
		*/

		//插入对象
		icktjrbService.insertIcktjrb(icktjrb);
		//保存到数据库，如不想保存到数据库，可注释此句
		this.setComplete();
	}

	public void setIcktjrbService(IIcktjrbService icktjrbService) {
		this.icktjrbService = icktjrbService;
	}
}
