package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.IJdpxxService;

import javax.servlet.http.HttpSession;



/**
 * 寄递品信息action
 * @author renhao
 */
public class JdpxxAction extends PageAction{
	private int totalrows = 0;
	private String result = "";
	private IJdpxxService jdpxxService;
	private Ljjbxx lj;
	private Jdpxx jdpxx;
	
	
	
	public Ljjbxx getLj() {
		return lj;
	}
	public void setLj(Ljjbxx lj) {
		this.lj = lj;
	}
	public Jdpxx getJdpxx() {
		return jdpxx;
	}
	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}
	public void setJdpxxService(IJdpxxService jdpxxService) {
		this.jdpxxService = jdpxxService;
	}
	public int getTotalrows() {
		return totalrows;
	}
	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	
	
	
	
	/*
	 * 关联查询单条寄递物品
	 */
	public String djpxxquery() throws Exception{
		
		jdpxx =jdpxxService.getJdpxx(jdpxx);
		
		this.result = "success";
		return SUCCESS;
	}
}
