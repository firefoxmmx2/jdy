package com.aisino2.jdy.action;

import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.IJdpxxService;



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
		if(null!=jdpxx.getLjjbxx().getJjr().getZjlx()){
				if("11".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("身份证");
				}
				if("13".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("户口薄");
				}
				if("90".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("军官证");
				}
				if("91".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("警官证");
				}
				if("92".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("士兵证");
				}
				if("93".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("护照");
				}
				if("99".equals(jdpxx.getLjjbxx().getJjr().getZjlx())){
					jdpxx.getLjjbxx().getJjr().setZjlx("其他");
				}
		}
		if(null!=jdpxx.getLjjbxx().getSjr().getZjlx()){
				if("11".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("身份证");
				}
				if("13".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("户口薄");
				}
				if("90".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("军官证");
				}
				if("91".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("警官证");
				}
				if("92".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("士兵证");
				}
				if("93".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("护照");
				}
				if("99".equals(jdpxx.getLjjbxx().getSjr().getZjlx())){
					jdpxx.getLjjbxx().getSjr().setZjlx("其他");
				}
		}
		if(null!=jdpxx.getPjjbxx()){
			if(null!=jdpxx.getPjjbxx().getDsr()){
				if("11".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("身份证");
				}
				if("13".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("户口薄");
				}
				if("90".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("军官证");
				}
				if("91".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("警官证");
				}
				if("92".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("士兵证");
				}
				if("93".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("护照");
				}
				if("99".equals(jdpxx.getPjjbxx().getDsr().getZjlx())){
					jdpxx.getPjjbxx().getDsr().setZjlx("其他");
				}
			}
		}
		
		this.result = "success";
		return SUCCESS;
	}
}
