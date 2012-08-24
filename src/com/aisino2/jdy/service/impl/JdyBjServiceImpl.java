package com.aisino2.jdy.service.impl;

import java.util.Calendar;
import java.util.Date;

import com.aisino2.common.StringUtil;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.service.IJdyBjService;
import com.aisino2.publicsystem.service.IGgbdsjService;

public class JdyBjServiceImpl implements IJdyBjService {
	private IGgbdsjService ggbdsjService;

	public void setGgbdsjService(IGgbdsjService ggbdsjService) {
		this.ggbdsjService = ggbdsjService;
	}

	public void insertJdyBjxx(Ljjbxx ljjbxx) {
		Date wxsj = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(wxsj);
		cal.add(Calendar.MONDAY, 3);
		wxsj = cal.getTime();

		// 寄件人
		ggbdsjService.insertGgbdsj(ljjbxx.getJjr().getXm(), ljjbxx.getJjr()
				.getZjhm(), ljjbxx.getQyjbxx().getQymc(), ljjbxx.getQyjbxx()
				.getJydz(), ljjbxx.getQyjbxx().getGxdwbm(), ljjbxx.getQyjbxx()
				.getGxdwmc(), ljjbxx.getQyjbxx().getHylbdm(), ljjbxx
				.getQyjbxx().getHylb(), "t_rdrjbxx", ljjbxx.getJjr().getId()
				.toString(), ljjbxx.getDjxh(), wxsj);
		// 收件人
		ggbdsjService.insertGgbdsj(ljjbxx.getSjr().getXm(), ljjbxx.getSjr()
				.getZjhm(), ljjbxx.getQyjbxx().getQymc(), ljjbxx.getQyjbxx()
				.getJydz(), ljjbxx.getQyjbxx().getGxdwbm(), ljjbxx.getQyjbxx()
				.getGxdwmc(), ljjbxx.getQyjbxx().getHylbdm(), ljjbxx
				.getQyjbxx().getHylb(), "t_rdrjbxx", ljjbxx.getSjr().getId()
				.toString(), ljjbxx.getDjxh(), wxsj);
	}

	public void insertJdyBjxx(Pjjbxx pjjbxx) {
		Date wxsj = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(wxsj);
		cal.add(Calendar.MONDAY, 3);
		wxsj = cal.getTime();

		// 揽件信息
		if (pjjbxx.getLjjbxx() != null
				&& (pjjbxx.getLjjbxx().getJjr() != null && pjjbxx.getLjjbxx()
						.getSjr() != null)) {
			insertJdyBjxx(pjjbxx.getLjjbxx());
		}
		
		//代收人
		if(pjjbxx.getDsr()!=null && pjjbxx.getDsr().getId()!=null){
			ggbdsjService.insertGgbdsj(pjjbxx.getDsr().getXm(), pjjbxx.getDsr()
					.getZjhm(), pjjbxx.getLjjbxx().getQyjbxx().getQymc(), pjjbxx.getLjjbxx().getQyjbxx()
					.getJydz(), pjjbxx.getLjjbxx().getQyjbxx().getGxdwbm(), pjjbxx.getLjjbxx().getQyjbxx()
					.getGxdwmc(), pjjbxx.getLjjbxx().getQyjbxx().getHylbdm(), pjjbxx.getLjjbxx()
					.getQyjbxx().getHylb(), "t_rdrjbxx", pjjbxx.getDsr().getId()
					.toString(), pjjbxx.getId().toString(), wxsj);

		}
	}

	public void closeFanBjbd(Ljjbxx ljjbxx) {
		if(ljjbxx==null || StringUtil.isNotEmpty(ljjbxx.getDjxh()))
			throw new RuntimeException("需要终止的公共比对的揽件登记序号为空");
		
		ggbdsjService.updateGgbdsjSfyxGroup("t_rdrjbxx", ljjbxx.getDjxh());
	}

	public void closeFanBjbd(Pjjbxx pjjbxx) {
		if(pjjbxx==null || pjjbxx.getId()==null)
			throw new RuntimeException("需要终止的公共比对的派件主键为空");
		
		ggbdsjService.updateGgbdsjSfyxGroup("t_rdrjbxx", pjjbxx.getId().toString());
	}

}
