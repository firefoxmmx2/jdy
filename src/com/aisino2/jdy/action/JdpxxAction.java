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
		if(jdpxx.getLjjbxx().getJjr().getZjlx()!=null){
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("11")){
					jdpxx.getLjjbxx().getJjr().setZjlx("身份证");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("13")){
					jdpxx.getLjjbxx().getJjr().setZjlx("户口薄");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("90")){
					jdpxx.getLjjbxx().getJjr().setZjlx("军官证");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("91")){
					jdpxx.getLjjbxx().getJjr().setZjlx("警官证");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("92")){
					jdpxx.getLjjbxx().getJjr().setZjlx("士兵证");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("93")){
					jdpxx.getLjjbxx().getJjr().setZjlx("护照");
				}
				if(jdpxx.getLjjbxx().getJjr().getZjlx().equals("99")){
					jdpxx.getLjjbxx().getJjr().setZjlx("其他");
				}
		}
		if(jdpxx.getLjjbxx().getSjr().getZjlx()!=null){
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("11")){
					jdpxx.getLjjbxx().getSjr().setZjlx("身份证");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("13")){
					jdpxx.getLjjbxx().getSjr().setZjlx("户口薄");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("90")){
					jdpxx.getLjjbxx().getSjr().setZjlx("军官证");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("91")){
					jdpxx.getLjjbxx().getSjr().setZjlx("警官证");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("92")){
					jdpxx.getLjjbxx().getSjr().setZjlx("士兵证");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("93")){
					jdpxx.getLjjbxx().getSjr().setZjlx("护照");
				}
				if(jdpxx.getLjjbxx().getSjr().getZjlx().equals("99")){
					jdpxx.getLjjbxx().getSjr().setZjlx("其他");
				}
		}
		if(jdpxx.getPjjbxx()!=null){
			if(jdpxx.getPjjbxx().getDsr()!=null){
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("11")){
					jdpxx.getPjjbxx().getDsr().setZjlx("身份证");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("13")){
					jdpxx.getPjjbxx().getDsr().setZjlx("户口薄");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("90")){
					jdpxx.getPjjbxx().getDsr().setZjlx("军官证");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("91")){
					jdpxx.getPjjbxx().getDsr().setZjlx("警官证");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("92")){
					jdpxx.getPjjbxx().getDsr().setZjlx("士兵证");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("93")){
					jdpxx.getPjjbxx().getDsr().setZjlx("护照");
				}
				if(jdpxx.getPjjbxx().getDsr().getZjlx().equals("99")){
					jdpxx.getPjjbxx().getDsr().setZjlx("其他");
				}
			}
		}
		
		this.result = "success";
		return SUCCESS;
	}
}
