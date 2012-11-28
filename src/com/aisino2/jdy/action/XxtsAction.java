package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;



import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.service.IXxtsService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * 消息提示action
 * 
 * @author jjqueen
 */
public class XxtsAction extends PageAction {
	private Xxts xxts;
	public Xxts getXxts() {
		return xxts;
	}
	public void setXxts(Xxts xxts) {
		this.xxts = xxts;
	}
	public String getTabledata() {
		return tabledata;
	}
	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
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
	public List<Xxts> getLxxts() {
		return lxxts;
	}
	public void setLxxts(List<Xxts> lxxts) {
		this.lxxts = lxxts;
	}
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List<Xxts> lxxts = new ArrayList<Xxts>();
	private IXxtsService xxtsService;
	public IXxtsService getXxtsService() {
		return xxtsService;
	}
	public void setXxtsService(IXxtsService xxtsService) {
		this.xxtsService = xxtsService;
	}
	
	public void queryMsg() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.userKey);
        xxts.setJsyh(user);
        lxxts=xxtsService.queryMsgs(xxts);
		for(Xxts oneXx : lxxts){
			tabledata=tabledata+"<li><a onclick=eval("+oneXx.getClhs()+") title='"+oneXx.getXxnr()+"'>"+oneXx.getXxbt()+":"+oneXx.getXxnr()+"</a></li>";
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(tabledata);
	}


}
