package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;



import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;
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
	private Xxts xxts=new Xxts();
	public Xxts getXxts() {
		return xxts;
	}
	public void setXxts(Xxts xxts) {
		this.xxts = xxts;
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
	private String xxid;
	public String getXxid() {
		return xxid;
	}
	public void setXxid(String xxid) {
		this.xxid = xxid;
	}
	private String result = "";
	private List<Xxts> lxxts = new ArrayList<Xxts>();
	private IXxtsService xxtsService;
	
	public void setXxtsService(IXxtsService xxtsService) {
		this.xxtsService = xxtsService;
	}
	/**
	 * 获取当前用户的提示消息
	 * @return
	 * @throws Exception
	 */
	public String queryMsg() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.userKey);
        xxts.setJsyh(user);
        lxxts=xxtsService.queryMsgs(xxts);
        return this.SUCCESS;
	}

	public String setXxtsZt() throws Exception{
		try {
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.userKey);
			Xxyh xxyh=new Xxyh();
			xxyh.setJsyh(user);
			xxyh.setXx_id(Integer.parseInt(this.xxid));
			xxtsService.updateXxyhzt(xxyh);
			this.result=SUCCESS;
		} catch (Exception e) {
			this.result = e.getMessage();
		}
		return SUCCESS;
	}

}
