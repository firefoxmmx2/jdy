package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import com.aisino2.common.PageUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
/**
 * 揽件信息action
 * @author renhao
 */
public class LjxxAction extends PageAction{
    
	private ILjjbxxService ljjbxxService;
	private Ljjbxx lj;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List lLjjbxx = new ArrayList();
	
	public List getlLjjbxx() {
		return lLjjbxx;
	}

	public String getTabledata() {
		return tabledata;
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
	
	public void setLjjbxxService(ILjjbxxService ljjbxxService) {
		this.ljjbxxService = ljjbxxService;
	}
	public Ljjbxx getLj() {
		return lj;
	}
	public void setLj(Ljjbxx lj) {
		this.lj = lj;
	}
	
	/***揽件基本信息主页面setable方法***/
	private void setTableDate_ljjbxx(List lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("baybmid");
		lPro.add("xm");
		lPro.add("xbmc");
		lPro.add("gmsfhm");
		lPro.add("hjdpcsmjhcsj");

		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setBayDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		Ljjbxx getLjjbxx = new Ljjbxx();
		this.setDataCustomer(getLjjbxx, lData, lPro, null, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
	/**
     *揽件信息插入action
     * @author renhao
     */
	public String insert() throws Exception{
		try {
			HttpSession session = this.getRequest().getSession();
			User user = (User)session.getAttribute(Constants.userKey);
			
			ljjbxxService.insertLjjbxx(lj);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return "success";
    }
	
	public String queryListlj() throws Exception {
			
		Map map = new HashMap();
		Page page =	ljjbxxService.findLjjbxxForPage(map, 1, totalrows, tabledata, result);
		
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lLjjbxx = page.getData();
		setTableDate_ljjbxx(lLjjbxx);
		
		
		this.result = "success";
		return "success";
	} 
	
	/**
	 * 单一获取
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		lj = ljjbxxService.getLjjbxx(lj);
		return SUCCESS;
	}
}