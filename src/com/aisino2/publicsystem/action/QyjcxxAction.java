package com.aisino2.publicsystem.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyjcxx;
import com.aisino2.publicsystem.service.IKyqkService;
import com.aisino2.publicsystem.service.IQyjbxxService;
import com.aisino2.publicsystem.service.IQyjcxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class QyjcxxAction extends PageAction{
	private IQyjcxxService qyjcxxService;
	private IQyjbxxService qyjbxxService;
	private IKyqkService kyqkService;
	private List lQyjcxx=new ArrayList();
	private Qyjcxx qyjcxx=new Qyjcxx();
	private String tabledata="";
	private int totalrows=0;
	private String result="";
	private String nwwsftsbs="";
	private String nwwbz="";
	
	public String getNwwsftsbs() {
		return nwwsftsbs;
	}

	public void setNwwsftsbs(String nwwsftsbs) {
		this.nwwsftsbs = nwwsftsbs;
	}

	public String getNwwbz() {
		return nwwbz;
	}

	public void setNwwbz(String nwwbz) {
		this.nwwbz = nwwbz;
	}

	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getTabledata() {
		return tabledata;
	}

	public Qyjcxx getQyjcxx() {
		return qyjcxx;
	}
	
	public List getLQyjcxx() {
		return lQyjcxx;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setQyjcxxService(IQyjcxxService qyjcxxService) {
		this.qyjcxxService = qyjcxxService;
	}
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qycfid");
		lPro.add("cfdjxh");
		lPro.add("gxdwmc");
		lPro.add("qymc");
		lPro.add("qyzflmc");
		lPro.add("cflb");
		lPro.add("jcmxlb");
		lPro.add("pzjg");
		lPro.add("qyjcrq");
		lPro.add("bjcr");
		
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	if(!"1".equals(nwwsftsbs)||!"0".equals(nwwbz)){
    		lModify.add("修改");
    		}else{
    		lModify.add(" ");
    		}
    	
    	List lDel=new ArrayList();
    	lDel.add("setDelete");
    	if(!"1".equals(nwwsftsbs)||!"0".equals(nwwbz)){
    		lDel.add("删除");
    	}else{
    		lDel.add(" ");
    	}
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Qyjcxx getQyjcxx=new Qyjcxx();
    	
        this.setData(getQyjcxx,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
        Qyjcxx setQyjcxx=new Qyjcxx();
        setQyjcxx=(Qyjcxx)this.setClass(setQyjcxx, null);
        Map map = new HashMap();
        map.put("hylbdm", setQyjcxx.getHylbdm());
        map.put("allhylbdm", setQyjcxx.getAllhylbdm());
        map.put("qyjcrq", setQyjcxx.getQyjcrq());
        map.put("qyjcrqzhi", setQyjcxx.getQyjcrqzhi());
        map.put("qymc", setQyjcxx.getQymc());
        map.put("qyzflbm",setQyjcxx.getQyzflbm());
        map.put("qyid", setQyjcxx.getQyid());
        map.put("cflbbm", setQyjcxx.getCflbbm());
        map.put("jcmxlbdm", setQyjcxx.getJcmxlbdm());
        HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(Constants.userKey);
		String gxdwbm = user.getDepartment().getDepartcode();
		map.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		String gxdwbmjm = StringUtil.trimEven0(setQyjcxx.getGxdwbm());
		if(setQyjcxx.getGxdwbm()!=null)
		{
			map.put("gxdwbm", gxdwbmjm);
		}
        map.put("pzjgdm", StringUtil.trimEven0(setQyjcxx.getPzjgdm()));
        map.put("cfdjxh", setQyjcxx.getCfdjxh());
        map.put("xzcfpzwh", setQyjcxx.getXzcfpzwh());
        map.put("zxbz", "0");
        nwwsftsbs = QjblUtil.queryQjblVal("nwwsftsbs");//内外网是否同时部署 1、同时部署   0、不同时部署
		nwwbz = QjblUtil.queryQjblVal("nwwbz");//区分内外网  1、外网   0、内网
        Page page = qyjcxxService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQyjcxx=page.getData();
        setTabledata(lQyjcxx); 
		 this.result="success";
        return "success";
    }
	
	/**
	 * 公安端，企业奖惩管理，导出查询
	 * @return
	 * @throws Exception
	 */
	public String queryqyjcxxForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("SpjkxxExportResult");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			Qyjcxx setQyjcxx = new Qyjcxx();
			setQyjcxx = (Qyjcxx) this.setClass(setQyjcxx, null);
			Map map = new HashMap();
			map.put("hylbdm", setQyjcxx.getHylbdm());
			map.put("allhylbdm", setQyjcxx.getAllhylbdm());
			map.put("qyjcrq", setQyjcxx.getQyjcrq());
			map.put("qyjcrqzhi", setQyjcxx.getQyjcrqzhi());
			map.put("qymc", setQyjcxx.getQymc());
			map.put("qyzflbm", setQyjcxx.getQyzflbm());
			map.put("qyid", setQyjcxx.getQyid());
			map.put("cflbbm", setQyjcxx.getCflbbm());
			map.put("jcmxlbdm", setQyjcxx.getJcmxlbdm());
			User user = (User) session.getAttribute(Constants.userKey);
			String gxdwbm = user.getDepartment().getDepartcode();
			map.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
			map.put("pzjgdm", StringUtil.trimEven0(setQyjcxx.getPzjgdm()));
			map.put("cfdjxh", setQyjcxx.getCfdjxh());
			map.put("xzcfpzwh", setQyjcxx.getXzcfpzwh());
			map.put("zxbz", "0");
			Page page = qyjcxxService.getListForPage(map, 1, Integer
					.parseInt(maxRows), sort, dir);
			session.setAttribute("QyjcxxExportResult", page.getData());
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}
	
	/**
	 * 奖惩导出Execl
	 * 
	 * @return
	 * @throws Exception
	 */
	public void exportqyjcxxExcel() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		Qyjcxx setQyjcxx = new Qyjcxx();
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList();
			List spjkxxList = (List) session.getAttribute("QyjcxxExportResult");
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(spjkxxList);
			lResult.add(setQyjcxx);
			this.setExcelCreate("Qyjcxx", lResult);
			this.result = "ok";
		} catch (IOException e) {
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
	}
	
	public String query() throws Exception{
		try {
			Qyjcxx setQyjcxx=new Qyjcxx();
			qyjcxx=(Qyjcxx)this.setClass(setQyjcxx, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        qyjcxx=qyjcxxService.getQyjcxx(qyjcxx);
        lQyjcxx.clear();
        lQyjcxx.add(qyjcxx);
		this.result="success";
        return "success";
    }
	
	public String insert() throws Exception{
		try {
			Qyjcxx setQyjcxx=new Qyjcxx();
			setQyjcxx=(Qyjcxx)this.setClass(setQyjcxx, null);
			setQyjcxx=findQyjcxx(setQyjcxx);
			setQyjcxx.setScbz(0);
			setQyjcxx.setLrsj(new Date());
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpSession session= request.getSession();
			User user= (User)session.getAttribute(Constants.userKey);
			setQyjcxx.setLrr(user.getUsername());
			setQyjcxx.setLrdwbm(user.getDepartment().getDepartcode());
			setQyjcxx.setLrdwmc(user.getDepartment().getDepartname());
			setQyjcxx=qyjcxxService.insertQyjcxx(setQyjcxx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        this.result="success";
        return "success";
    }
	
	public String modify() throws Exception{
		try {
			Qyjcxx setQyjcxx=new Qyjcxx();
			setQyjcxx=(Qyjcxx)this.setClass(setQyjcxx, null);
			Qyjbxx qyjbxx =new Qyjbxx();
		    qyjbxx.setQybm(setQyjcxx.getQybm());
		    qyjbxx=qyjbxxService.getQyjbxx(qyjbxx);
		    setQyjcxx.setQyid(qyjbxx.getQyid());
		    qyjcxxService.updateQyjcxx(setQyjcxx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        this.result="success";
        return "success";
    }
	
	public String delete() throws Exception{
		try {
			Qyjcxx setQyjcxx=new Qyjcxx();
			setQyjcxx=(Qyjcxx)this.setClass(setQyjcxx, null);
			qyjcxxService.deleteQyjcxx(setQyjcxx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        this.result="success";
        return "success";
    }
	public Qyjcxx findQyjcxx(Qyjcxx setQyjcxx){//生成企业编码以及获取企业id
		Qyjbxx qyjbxx =new Qyjbxx();
	    qyjbxx.setQybm(setQyjcxx.getQybm());
	    qyjbxx=qyjbxxService.getQyjbxx(qyjbxx);
	    setQyjcxx.setQyid(qyjbxx.getQyid());
	    
	    Map map = new HashMap();
		map.put("p_bmfl", "QYJCXH");
		map.put("p_xzqh", setQyjcxx.getQybm());
		//map.put("p_xzqh", user.getUseraccount());
		//Globalpar globalpar = new Globalpar();
		//globalpar  = this.getCacheGlobalpar("sssf");
		//String sssf = globalpar.getGlobalparvalue();
		map.put("p_sssf", "hn");
		map.put("p_scgz", 2);
		String djxh = kyqkService.getScbm(map);
		setQyjcxx.setCfdjxh(djxh);
	    return setQyjcxx;
	}
	public void setKyqkService(IKyqkService kyqkService) {
		this.kyqkService = kyqkService;
	}
	public void setQyjbxxService(IQyjbxxService qyjbxxService) {
		this.qyjbxxService = qyjbxxService;
	}
}