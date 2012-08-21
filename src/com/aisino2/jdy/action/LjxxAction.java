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
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
/**
 * 揽件信息action
 * @author renhao
 */
public class LjxxAction extends PageAction{
    
	private ILjjbxxService ljjbxxService;
	private Ljjbxx lj;
	private Jdpxx jdpxx;
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
	public Jdpxx getJdpxx() {
		return jdpxx;
	}

	public void setJdpxx(Jdpxx jdpxx) {
		this.jdpxx = jdpxx;
	}
	
	
	/**
     *揽件信息插入action
     * @author renhao
     */
	public String insert() throws Exception{
	    HttpSession session = this.getRequest().getSession();
		User user = (User)session.getAttribute(Constants.userKey);
		Qyryxx ljtbr = new Qyryxx();
		ljtbr.setCyrybh(user.getCyrybh());
		lj.setLjtbr(ljtbr);
		
		ljjbxxService.insertLjjbxx(lj);
		
		this.result="success";
		return SUCCESS;
    }
	
	/**
	 * 更改揽件信息
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		if(lj == null)
			throw new RuntimeException("需要修改的派件信息参数不能为空");
		ljjbxxService.updateLjjbxx(lj);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	
	/**
	 * 删除揽件信息
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		if(lj == null)
			throw new RuntimeException("需要删除的派件信息参数不能为空");
		ljjbxxService.deleteLjjbxx(lj);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	/**
	 * 分页查询揽件信息
	 * @return
	 * @throws Exception
	 */
	public String queryListlj() throws Exception {
			
		Map<String, Object> params = new HashMap<String, Object>();
		
		if(lj !=null){
			if(lj.getWldh()!=""){//物流单号
				params.put("wldh", lj.getWldh());
			}
			if(lj.getJjr().getXm()!=""){//寄件人姓名
				params.put("xm", lj.getJjr().getXm());
			}
			if(lj.getJjr().getZjlx()!=""){//证件类型
				params.put("zjlx", lj.getJjr().getZjlx());
			}
			if(lj.getJjr().getZjhm()!=""){//证件号码
				params.put("zjhm", lj.getJjr().getZjhm());
			}
			if(lj.getLjr().getCyrybh()!=""){//揽件员
				params.put("ljr", lj.getLjr().getCyrybh());
			}
		}

		
		Page page =	ljjbxxService.findLjjbxxForPage(params, 1, totalrows, tabledata, result);
		
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lLjjbxx = page.getData();
		setTableDate_ljjbxx(lLjjbxx);
		
		
		this.result = "success";
		return SUCCESS;
	} 
	
	/**
	 * 单一获取
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		
		lj = ljjbxxService.getLjjbxx(lj);
		
		this.result = "success";
		return SUCCESS;
	}
	
	/***揽件基本信息主页面setable方法***/
	private void setTableDate_ljjbxx(List lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("id");
		lPro.add("djxh");
		lPro.add("wldh");
		lPro.add("jjrxm");
		lPro.add("zjlx");
		lPro.add("ljy");
		lPro.add("ljtbsj");
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		
		List lUpdate = new ArrayList();
		lUpdate.add("setLjxxUpdate");
		lUpdate.add("修改");
		lCol.add(lUpdate);
		

		List lDelete=new ArrayList();
		lDelete.add("setLjxxDelete");
		lDelete.add("删除");
		lCol.add(lDelete);

		
		Ljjbxx setLjxx = new Ljjbxx();
		this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
}
