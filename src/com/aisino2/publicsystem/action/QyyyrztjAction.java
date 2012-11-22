package com.aisino2.publicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.cache.CacheManager;
import com.aisino2.common.DateToString;
import com.aisino2.common.DepartmentUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Qyyyrztj;
import com.aisino2.publicsystem.service.IQyyyrzService;
import com.aisino2.publicsystem.service.IQyyyrztjService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.Globalpar;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class QyyyrztjAction extends PageAction{
	private IQyyyrztjService qyyyrztjService;
	private IQyyyrzService qyyyrzService;
	private List lQyyyrztj=new ArrayList();
	private Qyyyrztj qyyyrztj=new Qyyyrztj();
	private String tabledata="";
	private int totalrows=0;
	private String result="";
	
	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public String getTabledata() {
		return tabledata;
	}

	public Qyyyrztj getQyyyrztj() {
		return qyyyrztj;
	}
	
	public List getLQyyyrztj() {
		return lQyyyrztj;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setQyyyrztjService(IQyyyrztjService qyyyrztjService) {
		this.qyyyrztjService = qyyyrztjService;
	}
	
	public void setQyyyrzService(IQyyyrzService qyyyrzService) {
		this.qyyyrzService = qyyyrzService;
	}
	
	public Map querylistmap(Map map, Qyyyrztj setQyyyrztj) throws Exception {
		map.put("dsjgdm", setQyyyrztj.getDsjgdm());
		map.put("fxjdm", setQyyyrztj.getFxjdm());
		map.put("gxdwdm", setQyyyrztj.getGxdwdm());
		map.put("dsjgbz", setQyyyrztj.getDsjgbz());
		map.put("fxjbz", setQyyyrztj.getFxjbz());
		map.put("gxdwbz", setQyyyrztj.getGxdwbz());
		map.put("hylbdm", setQyyyrztj.getHylbdm());
		map.put("qyzflbm", setQyyyrztj.getQyzflbm());
		map.put("qsrq", setQyyyrztj.getQsrq());
		map.put("jzrq", setQyyyrztj.getJzrq());
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.userKey);
		String departTemp = user.getDepartment().getDepartcode();
		String DeptCode = departTemp;
		if (!setQyyyrztj.getDsjgdm().equals(""))
			DeptCode = setQyyyrztj.getDsjgdm();
		if (!setQyyyrztj.getFxjdm().equals(""))
			DeptCode = setQyyyrztj.getFxjdm();
		if (!setQyyyrztj.getGxdwdm().equals(""))
			DeptCode = setQyyyrztj.getGxdwdm();
		map.put("deptcode", StringUtil.trimEven0(DeptCode));
		if (DepartmentUtil.departIsZxs(departTemp))
			map.put("iszxs", "1");
		Integer deptlevel=null;
		Integer mindeptlevel=null;
		if (!DepartmentUtil.departIsZxs(departTemp)){
			if("1".equals(setQyyyrztj.getGxdwbz())){
				deptlevel=5;
				mindeptlevel=3;
			}else if("1".equals(setQyyyrztj.getFxjbz())){
				deptlevel=4;
				mindeptlevel=3;
			}else if("1".equals(setQyyyrztj.getDsjgbz())){
				deptlevel=3;
				mindeptlevel=3;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}  else{
			if("1".equals(setQyyyrztj.getGxdwbz())){
				deptlevel=4;
				mindeptlevel=2;
			}else if("1".equals(setQyyyrztj.getFxjbz())){
				deptlevel=3;
				mindeptlevel=2;
			}else if("1".equals(setQyyyrztj.getDsjgbz())){
				deptlevel=2;
				mindeptlevel=2;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}
		map.put("deptlevel",deptlevel);
		map.put("mindeptlevel",mindeptlevel);
		
		
//		Integer deptlevel = 2;
//		if (!DepartmentUtil.departIsZxs(departTemp)) {
//			if ("1".equals(setQyyyrztj.getGxdwbz())) {
//				deptlevel = 5;
//			} else if ("1".equals(setQyyyrztj.getFxjbz())) {
//				deptlevel = 4;
//			} else if ("1".equals(setQyyyrztj.getDsjgbz())) {
//				deptlevel = 3;
//			}
//		} else {
//			if ("1".equals(setQyyyrztj.getGxdwbz())) {
//				deptlevel = 4;
//			} else if ("1".equals(setQyyyrztj.getFxjbz())) {
//				deptlevel = 3;
//			} else if ("1".equals(setQyyyrztj.getDsjgbz())) {
//				deptlevel = 2;
//			}
//		}
//		map.put("deptlevel", deptlevel);
		
		return map;
	}
	
	public String querylist() throws Exception {
		Qyyyrztj setQyyyrztj = new Qyyyrztj();
		setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
		Map map = new HashMap();
		querylistmap(map, setQyyyrztj);
		Page page = qyyyrztjService.getListForPagetj(map, pagesize, pagerow,
				sort, dir);
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lQyyyrztj = page.getData();
		int qyzs = 0;
		int sccss = 0;
		int wsccss = 0;
		int cyrys = 0;
		int sbrs = 0;
		int xzrys = 0;
		int lzrys = 0;
		Qyyyrztj sumQyyyrztj = new Qyyyrztj();
		for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
			Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
			qyzs += oneQyyyrztj.getQyzs().intValue();
			sccss += oneQyyyrztj.getSccss().intValue();
			wsccss += oneQyyyrztj.getWsccss().intValue();
			cyrys += oneQyyyrztj.getCyrys().intValue();
			sbrs += oneQyyyrztj.getSbrs().intValue();
			xzrys += oneQyyyrztj.getXzrys().intValue();
			lzrys += oneQyyyrztj.getLzrys().intValue();
			if (oneQyyyrztj.getGxdwdm() != null
					&& !oneQyyyrztj.getGxdwdm().equals("")) {
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('"
								+ oneQyyyrztj.getGxdwdm() + "')>详细</a>");
			} else if (oneQyyyrztj.getFxjdm() != null
					&& !oneQyyyrztj.getFxjdm().equals("")) {
				oneQyyyrztj
						.setFxjmc("<a href='#' class='fontbutton' onclick=setDsQuery('"
								+ oneQyyyrztj.getFxjdm()
								+ "')>"
								+ oneQyyyrztj.getFxjmc() + "</a>");
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('"
								+ oneQyyyrztj.getFxjdm() + "')>详细</a>");
			} else if (oneQyyyrztj.getDsjgdm() != null
					&& !oneQyyyrztj.getDsjgdm().equals("")) {
				oneQyyyrztj
						.setDsjgmc("<a href='#' class='fontbutton' onclick=setDsQuery('"
								+ oneQyyyrztj.getDsjgdm()
								+ "')>"
								+ oneQyyyrztj.getDsjgmc() + "</a>");
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQuery('"
								+ oneQyyyrztj.getDsjgdm() + "')>详细</a>");
			}
		}
		sumQyyyrztj.setQyzs(qyzs);
		sumQyyyrztj.setSccss(sccss);

		sumQyyyrztj.setWsccss(wsccss);
		sumQyyyrztj.setCyrys(cyrys);
		sumQyyyrztj.setSbrs(sbrs);
		sumQyyyrztj.setXzrys(xzrys);
		sumQyyyrztj.setLzrys(lzrys);

		if (qyzs == 0) {
			sumQyyyrztj.setScl(new Float(0.00));
		} else {
			Float xzzjl = new Float(Math.round(new Float(sccss)
					/ new Float(qyzs) * 10000));
			sumQyyyrztj.setScl(xzzjl / 100);
		}
		// sumQyyyrztj.setMxlj("");
		sumQyyyrztj.setDsjgmc("总计");
		if ("1".equals(setQyyyrztj.getDsjgbz())) {
			lQyyyrztj.add(sumQyyyrztj);
		}
		this.result = "success";
		return "success";
	}
	
	public String querylistx() throws Exception {
		Qyyyrztj setQyyyrztj = new Qyyyrztj();
		setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
		Map map = new HashMap();
		querylistmap(map, setQyyyrztj);
		Page page = qyyyrztjService.getListForPagetj(map, pagesize, pagerow,
				sort, dir);
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lQyyyrztj = page.getData();
		int qyzs = 0;
		int sccss = 0;
		int wsccss = 0;
		int cyrys = 0;
		int sbrs = 0;
		int xzrys = 0;
		int lzrys = 0;
		Qyyyrztj sumQyyyrztj = new Qyyyrztj();
		for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
			Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
			qyzs += oneQyyyrztj.getQyzs().intValue();
			sccss += oneQyyyrztj.getSccss().intValue();
			wsccss += oneQyyyrztj.getWsccss().intValue();
			cyrys += oneQyyyrztj.getCyrys().intValue();
			sbrs += oneQyyyrztj.getSbrs().intValue();
			xzrys += oneQyyyrztj.getXzrys().intValue();
			lzrys += oneQyyyrztj.getLzrys().intValue();
			if (oneQyyyrztj.getGxdwdm() != null
					&& !oneQyyyrztj.getGxdwdm().equals("")) {
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQueryx('"
								+ oneQyyyrztj.getGxdwdm() + "')>详细</a>");
			} else if (oneQyyyrztj.getFxjdm() != null
					&& !oneQyyyrztj.getFxjdm().equals("")) {
				oneQyyyrztj
						.setFxjmc("<a href='#' class='fontbutton' onclick=setDsQueryx('"
								+ oneQyyyrztj.getFxjdm()
								+ "')>"
								+ oneQyyyrztj.getFxjmc() + "</a>");
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQueryx('"
								+ oneQyyyrztj.getFxjdm() + "')>详细</a>");
			} else if (oneQyyyrztj.getDsjgdm() != null
					&& !oneQyyyrztj.getDsjgdm().equals("")) {
				oneQyyyrztj
						.setDsjgmc("<a href='#' class='fontbutton' onclick=setDsQueryx('"
								+ oneQyyyrztj.getDsjgdm()
								+ "')>"
								+ oneQyyyrztj.getDsjgmc() + "</a>");
				oneQyyyrztj
						.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQueryx('"
								+ oneQyyyrztj.getDsjgdm() + "')>详细</a>");
			}
		}
		sumQyyyrztj.setQyzs(qyzs);
		sumQyyyrztj.setSccss(sccss);

		sumQyyyrztj.setWsccss(wsccss);
		sumQyyyrztj.setCyrys(cyrys);
		sumQyyyrztj.setSbrs(sbrs);
		sumQyyyrztj.setXzrys(xzrys);
		sumQyyyrztj.setLzrys(lzrys);

		if (qyzs == 0) {
			sumQyyyrztj.setScl(new Float(0.00));
		} else {
			Float xzzjl = new Float(Math.round(new Float(sccss)
					/ new Float(qyzs) * 10000));
			sumQyyyrztj.setScl(xzzjl / 100);
		}
		// sumQyyyrztj.setMxlj("");
		sumQyyyrztj.setDsjgmc("总计");
		if ("1".equals(setQyyyrztj.getDsjgbz())) {
			lQyyyrztj.add(sumQyyyrztj);
		}
		this.result = "success";
		return "success";
	}
	
	
	public String querylistps() throws Exception {
		Qyyyrztj setQyyyrztj = new Qyyyrztj();
		setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
		Map map = new HashMap();
		querylistmap(map, setQyyyrztj);
		Page page = qyyyrztjService.getListForPagetj(map, pagesize, pagerow,
				sort, dir);
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lQyyyrztj = page.getData();
		int qyzs = 0;
		int sccss = 0;
		int wsccss = 0;
		int cyrys = 0;
		int sbrs = 0;
		int xzrys = 0;
		int lzrys = 0;
		Qyyyrztj sumQyyyrztj = new Qyyyrztj();
		for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
			Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
			qyzs += oneQyyyrztj.getQyzs().intValue();
			sccss += oneQyyyrztj.getSccss().intValue();
			wsccss += oneQyyyrztj.getWsccss().intValue();
			cyrys += oneQyyyrztj.getCyrys().intValue();
			sbrs += oneQyyyrztj.getSbrs().intValue();
			xzrys += oneQyyyrztj.getXzrys().intValue();
			lzrys += oneQyyyrztj.getLzrys().intValue();
				oneQyyyrztj.setMxlj("<a href='#' class='fontbutton' title='详细' onclick=setXxQueryxx('"+ oneQyyyrztj.getGxdwdm() + "')>详细</a>");
		}
		sumQyyyrztj.setQyzs(qyzs);
		sumQyyyrztj.setSccss(sccss);
		sumQyyyrztj.setWsccss(wsccss);
		sumQyyyrztj.setCyrys(cyrys);
		sumQyyyrztj.setSbrs(sbrs);
		sumQyyyrztj.setXzrys(xzrys);
		sumQyyyrztj.setLzrys(lzrys);

		if (qyzs == 0) {
			sumQyyyrztj.setScl(new Float(0.00));
		} else {
			Float xzzjl = new Float(Math.round(new Float(sccss)
					/ new Float(qyzs) * 10000));
			sumQyyyrztj.setScl(xzzjl / 100);
		}
		sumQyyyrztj.setDsjgmc("总计");
		if ("1".equals(setQyyyrztj.getDsjgbz())) {
			lQyyyrztj.add(sumQyyyrztj);
		}
		this.result = "success";
		return "success";
	}
	
	public void setTabledatatjmx(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		if(((String)map.get("gxdwbz")).equals("1")){
			lPro.add("gxdwdm");
		} else if(((String)map.get("fxjbz")).equals("1")){
			lPro.add("fxjdm");
		} else if(((String)map.get("dsjgbz")).equals("1")){
			lPro.add("dsjgdm");
		}  else {
			lPro.add("dsjgdm");
		}
		lPro.add("tjrq");
		lPro.add("qyzs");
		lPro.add("sccss");
		lPro.add("wsccss");
		lPro.add("cyrys");
		lPro.add("sbrs");
		lPro.add("xzrys");
		lPro.add("lzrys");
		List lCol=new ArrayList();
    	Qyyyrztj getQyyyrztj=new Qyyyrztj();
        this.setData(getQyyyrztj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylisttjmx() throws Exception{
        Qyyyrztj setQyyyrztj=new Qyyyrztj();
        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
        Map map = new HashMap();
        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
		map.put("fxjdm", setQyyyrztj.getFxjdm());
		map.put("gxdwdm", setQyyyrztj.getGxdwdm());
		map.put("dsjgbz", setQyyyrztj.getDsjgbz());
		map.put("fxjbz", setQyyyrztj.getFxjbz());
		map.put("gxdwbz", setQyyyrztj.getGxdwbz());
		map.put("hylbdm", setQyyyrztj.getHylbdm());
		map.put("qyzflbm", setQyyyrztj.getQyzflbm());
		map.put("qsrq", setQyyyrztj.getQsrq());
		map.put("jzrq", setQyyyrztj.getJzrq());
        Page page = qyyyrztjService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQyyyrztj=page.getData();
        if (lQyyyrztj.size()>0){
			int qyzs = 0;
			int sccss = 0;
			int wsccss = 0;
			int cyrys = 0;
			int sbrs = 0;
			int xzrys = 0;
			int lzrys = 0;
			Qyyyrztj sumQyyyrztj = new Qyyyrztj();
	        for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
	        	Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
	        	qyzs += oneQyyyrztj.getQyzs().intValue();
	        	sccss += oneQyyyrztj.getSccss().intValue();
	        	wsccss += oneQyyyrztj.getWsccss().intValue();
	        	cyrys += oneQyyyrztj.getCyrys().intValue();
	        	sbrs += oneQyyyrztj.getSbrs().intValue();
	        	xzrys += oneQyyyrztj.getXzrys().intValue();
	        	lzrys += oneQyyyrztj.getLzrys().intValue();
			}
			sumQyyyrztj.setQyzs(qyzs);
			sumQyyyrztj.setSccss(sccss);
			sumQyyyrztj.setWsccss(wsccss);
			sumQyyyrztj.setCyrys(cyrys);
			sumQyyyrztj.setSbrs(sbrs);
			sumQyyyrztj.setXzrys(xzrys);
			sumQyyyrztj.setLzrys(lzrys);
			if("1".equals(setQyyyrztj.getDsjgbz())){
				lQyyyrztj.add(sumQyyyrztj);
			}
        }
        setTabledatatjmx(lQyyyrztj,map); 
		this.result="success";
        return "success";
    }
	
	//导出
	public String querylisttjmxExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
	        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
			map.put("fxjdm", setQyyyrztj.getFxjdm());
			map.put("gxdwdm", setQyyyrztj.getGxdwdm());
			map.put("dsjgbz", setQyyyrztj.getDsjgbz());
			map.put("fxjbz", setQyyyrztj.getFxjbz());
			map.put("gxdwbz", setQyyyrztj.getGxdwbz());
			map.put("hylbdm", setQyyyrztj.getHylbdm());
			map.put("qyzflbm", setQyyyrztj.getQyzflbm());
			map.put("qsrq", setQyyyrztj.getQsrq());
			map.put("jzrq", setQyyyrztj.getJzrq());
	        Page page = qyyyrztjService.getListForPage(map, 1, Integer.parseInt(maxRows),null,null);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyyyrztj=page.getData();
	        if (lQyyyrztj.size()>0){
				int qyzs = 0;
				int sccss = 0;
				int wsccss = 0;
				int cyrys = 0;
				int sbrs = 0;
				int xzrys = 0;
				int lzrys = 0;
				Qyyyrztj sumQyyyrztj = new Qyyyrztj();
		        for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
		        	Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
		        	qyzs += oneQyyyrztj.getQyzs().intValue();
		        	sccss += oneQyyyrztj.getSccss().intValue();
		        	wsccss += oneQyyyrztj.getWsccss().intValue();
		        	cyrys += oneQyyyrztj.getCyrys().intValue();
		        	sbrs += oneQyyyrztj.getSbrs().intValue();
		        	xzrys += oneQyyyrztj.getXzrys().intValue();
		        	lzrys += oneQyyyrztj.getLzrys().intValue();
				}
				sumQyyyrztj.setQyzs(qyzs);
				sumQyyyrztj.setSccss(sccss);
				sumQyyyrztj.setWsccss(wsccss);
				sumQyyyrztj.setCyrys(cyrys);
				sumQyyyrztj.setSbrs(sbrs);
				sumQyyyrztj.setXzrys(xzrys);
				sumQyyyrztj.setLzrys(lzrys);
				sumQyyyrztj.setTjrqString("总计");
				if("1".equals(setQyyyrztj.getDsjgbz())){
					lQyyyrztj.add(sumQyyyrztj);
				}
	        }
			session.setAttribute("qyyyrztjxxList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querylisttjmxExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("qyyyrztjxxList"));
			lResult.add(setQyyyrztj);
			this.setExcelCreate("qyyyrztjmx",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	public void setTabledatarzmx(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		lPro.add("yyrzid");
		lPro.add("tjrq");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("ksyysj");
		lPro.add("jsyysj");
		lPro.add("csfe");
		lPro.add("sffsaj");
		lPro.add("sfglbmjc");
		lPro.add("cyryzs");
		lPro.add("dtsbrs");
		lPro.add("dtxzrys");
		lPro.add("dtlzrs");
		List lCol=new ArrayList();
    	Qyyyrztj getQyyyrztj=new Qyyyrztj();
        this.setData(getQyyyrztj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylistrzmx() throws Exception{
        Qyyyrztj setQyyyrztj=new Qyyyrztj();
        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
        Map map = new HashMap();
        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
		map.put("fxjdm", setQyyyrztj.getFxjdm());
		map.put("gxdwdm", setQyyyrztj.getGxdwdm());
		map.put("hylbdm", setQyyyrztj.getHylbdm());
		map.put("qyzflbm", setQyyyrztj.getQyzflbm());
		if(setQyyyrztj.getTjrqString()!=null&&!setQyyyrztj.getTjrqString().equals("")
				&&!setQyyyrztj.getTjrqString().equals("总计")){
			   map.put("tjrq", DateToString.toDate(setQyyyrztj.getTjrqString())); 
		   }else{
			   map.put("qsrq", setQyyyrztj.getQsrq());
			   map.put("jzrq", setQyyyrztj.getJzrq());
		   }
		map.put("rzscbs", "1");
        Page page = qyyyrztjService.getrzmxList(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQyyyrztj=page.getData();
        translateDictZT();
        if (lQyyyrztj.size()>0){
			int cyryzs = 0;
			int dtsbrs = 0;
			int dtxzrys = 0;
			int dtlzrs = 0;
			Qyyyrztj sumQyyyrztj = new Qyyyrztj();
	        for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
	        	Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
	        	cyryzs += oneQyyyrztj.getCyryzs().intValue();
	        	dtsbrs += oneQyyyrztj.getDtsbrs().intValue();
	        	dtxzrys += oneQyyyrztj.getDtxzrys().intValue();
	        	dtlzrs += oneQyyyrztj.getDtlzrs().intValue();
			}
			sumQyyyrztj.setCyryzs(cyryzs);
			sumQyyyrztj.setDtsbrs(dtsbrs);
			sumQyyyrztj.setDtxzrys(dtxzrys);
			sumQyyyrztj.setDtlzrs(dtlzrs);
			if("1".equals(setQyyyrztj.getDsjgbz())){
				lQyyyrztj.add(sumQyyyrztj);
			}
        }
		setTabledatarzmx(lQyyyrztj,map); 	
		this.result="success";
        return "success";
    }
	
	//导出上传场所
	public String querylistrzmxExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
	        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
			map.put("fxjdm", setQyyyrztj.getFxjdm());
			map.put("gxdwdm", setQyyyrztj.getGxdwdm());
			map.put("hylbdm", setQyyyrztj.getHylbdm());
			map.put("qyzflbm", setQyyyrztj.getQyzflbm());
			if(setQyyyrztj.getTjrqString()!=null&&!setQyyyrztj.getTjrqString().equals("")
					&&!setQyyyrztj.getTjrqString().equals("总计")){
				   map.put("tjrq", DateToString.toDate(setQyyyrztj.getTjrqString())); 
			   }else{
				   map.put("qsrq", setQyyyrztj.getQsrq());
				   map.put("jzrq", setQyyyrztj.getJzrq());
			   }
			map.put("rzscbs", "1");
	        Page page = qyyyrztjService.getrzmxList(map, 1, Integer.parseInt(maxRows),null,null);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyyyrztj=page.getData();
	        translateDictZT();
	        if (lQyyyrztj.size()>0){
				int cyryzs = 0;
				int dtsbrs = 0;
				int dtxzrys = 0;
				int dtlzrs = 0;
				Qyyyrztj sumQyyyrztj = new Qyyyrztj();
		        for (java.util.Iterator iter = lQyyyrztj.iterator(); iter.hasNext();) {
		        	Qyyyrztj oneQyyyrztj = (Qyyyrztj) iter.next();
		        	cyryzs += oneQyyyrztj.getCyryzs().intValue();
		        	dtsbrs += oneQyyyrztj.getDtsbrs().intValue();
		        	dtxzrys += oneQyyyrztj.getDtxzrys().intValue();
		        	dtlzrs += oneQyyyrztj.getDtlzrs().intValue();
				}
				sumQyyyrztj.setCyryzs(cyryzs);
				sumQyyyrztj.setDtsbrs(dtsbrs);
				sumQyyyrztj.setDtxzrys(dtxzrys);
				sumQyyyrztj.setDtlzrs(dtlzrs);
				sumQyyyrztj.setTjrqString("总计");
				if("1".equals(setQyyyrztj.getDsjgbz())){
					lQyyyrztj.add(sumQyyyrztj);
				}
	        }
			session.setAttribute("qyyyrztjscList", page.getData());
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querylistrzmxExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("qyyyrztjscList"));
			lResult.add(setQyyyrztj);
			this.setExcelCreate("qyyyrzsc",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	public void setTabledatarzwsc(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		lPro.add("yyrzid");
		lPro.add("tjrq");
		lPro.add("qymc");
		lPro.add("qybm");
		lPro.add("zrs");
		lPro.add("lxdh");
		lPro.add("qyzflmc");
		lPro.add("yyztmc");
		lPro.add("zajbmc");

		List lCol=new ArrayList();
    	Qyyyrztj getQyyyrztj=new Qyyyrztj();
        this.setData(getQyyyrztj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylistrzwsc() throws Exception{
        Qyyyrztj setQyyyrztj=new Qyyyrztj();
        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
        Map map = new HashMap();
        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
		map.put("fxjdm", setQyyyrztj.getFxjdm());
		map.put("gxdwdm", setQyyyrztj.getGxdwdm());
		map.put("hylbdm", setQyyyrztj.getHylbdm());
		map.put("qyzflbm", setQyyyrztj.getQyzflbm());
		if(setQyyyrztj.getTjrqString()!=null&&!setQyyyrztj.getTjrqString().equals("")
				&&!setQyyyrztj.getTjrqString().equals("总计")){
			   map.put("tjrq", DateToString.toDate(setQyyyrztj.getTjrqString())); 
		   }else{
			   map.put("qsrq", setQyyyrztj.getQsrq());
			   map.put("jzrq", setQyyyrztj.getJzrq());
		   }
		map.put("rzscbs", "0");
        Page page = qyyyrztjService.getrzmxList(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lQyyyrztj=page.getData();
        translateDictZT();
        setTabledatarzwsc(lQyyyrztj,map); 	
		this.result="success";
        return "success";
    }
	
	//导出未上传场所
	public String querylistrzwscExcelTemp(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
			String maxRows = glo.getGlobalparvalue();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
	        setQyyyrztj = (Qyyyrztj) this.setClass(setQyyyrztj, null);
	        Map map = new HashMap();
	        map.put("dsjgdm", setQyyyrztj.getDsjgdm());
			map.put("fxjdm", setQyyyrztj.getFxjdm());
			map.put("gxdwdm", setQyyyrztj.getGxdwdm());
			map.put("hylbdm", setQyyyrztj.getHylbdm());
			map.put("qyzflbm", setQyyyrztj.getQyzflbm());
			if(setQyyyrztj.getTjrqString()!=null&&!setQyyyrztj.getTjrqString().equals("")
					&&!setQyyyrztj.getTjrqString().equals("总计")){
				   map.put("tjrq", DateToString.toDate(setQyyyrztj.getTjrqString())); 
			   }else{
				   map.put("qsrq", setQyyyrztj.getQsrq());
				   map.put("jzrq", setQyyyrztj.getJzrq());
			   }
			map.put("rzscbs", "0");
	        Page page = qyyyrztjService.getrzmxList(map, 1, Integer.parseInt(maxRows),null,null);
	        totalpage=page.getTotalPages();
	        totalrows=page.getTotalRows();
	        lQyyyrztj=page.getData();
	        translateDictZT();
			session.setAttribute("qyyyrztjwscList", page.getData());
			
		}catch (Exception e) {
			e.printStackTrace();
			this.result="";
	        return "success";
		}
		this.result="success";
        return "success";
		
	}
	public void querylistrzwscExcel() throws Exception{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			Qyyyrztj setQyyyrztj=new Qyyyrztj();
			
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			List lResult = new ArrayList(); // //开头excel
			
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add((List)session.getAttribute("qyyyrztjwscList"));
			lResult.add(setQyyyrztj);
			this.setExcelCreate("qyyyrzwsc",lResult);  ////ztxx 默认文件名字的开头excel
		} catch (Exception e) {
			e.printStackTrace();
			this.result="";
		}
		this.result="success";
    }
	
	/*
	 * 字典项转化
	 */
	public void translateDictZT(){
		if(lQyyyrztj!=null&&lQyyyrztj.size()>0){
			for(int index=0,max=lQyyyrztj.size();index<max;index++){
				Qyyyrztj tempQy = (Qyyyrztj)lQyyyrztj.get(index);
				Dict_item dict_item1=CacheManager.getCacheDictitemOne("dm_bez", tempQy.getSffsaj());
				Dict_item dict_item2=CacheManager.getCacheDictitemOne("dm_bez", tempQy.getSfglbmjc());
				if (dict_item1!= null){
					tempQy.setSffsaj(dict_item1.getDisplay_name());
				}
				if (dict_item2!=null){
					tempQy.setSfglbmjc(dict_item2.getDisplay_name());
				}
				lQyyyrztj.set(index, tempQy);
			}
		}
	}
	
	
}