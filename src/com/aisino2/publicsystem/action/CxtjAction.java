package com.aisino2.publicsystem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.cache.CacheManager;
import com.aisino2.common.DepartmentUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.publicsystem.domain.Cxtj;
import com.aisino2.publicsystem.service.ICxtjService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.Globalpar;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class CxtjAction extends PageAction{
	private ICxtjService cxtjService;
	private List lCxtj=new ArrayList();
	private Cxtj cxtj=new Cxtj();
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

	public Cxtj getCxtj() {
		return cxtj;
	}
	
	public List getLCxtj() {
		return lCxtj;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void setCxtjService(ICxtjService cxtjService) {
		this.cxtjService = cxtjService;
	}
	
	public String query() throws Exception{
		try {
			Cxtj setCxtj=new Cxtj();
			cxtj=(Cxtj)this.setClass(setCxtj, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        cxtj=cxtjService.getCxtj(cxtj);
        lCxtj.clear();
        lCxtj.add(cxtj);
		this.result="success";
        return "success";
    }
	
	public void setTabledata(List lData) throws Exception{
		List lPro=new ArrayList();
		
    	
    	List lModify=new ArrayList();
    	lModify.add("setModifyQuery");
    	lModify.add("修改");
    	
    	List lDel=new ArrayList();
    	lDel.add("setDelete");
    	lDel.add("删除");
    	
    	List lCol=new ArrayList();
    	lCol.add(lModify);
    	lCol.add(lDel);
    	
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String querylist() throws Exception{
        Cxtj setCxtj=new Cxtj();
        Map map = new HashMap();
        Page page = cxtjService.getListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        setTabledata(lCxtj); 
		 this.result="success";
        return "success";
    }
	
	public void setTabledataRcjctj(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		if ("1".equals((String)map.get("gxdwbz"))) {
			lPro.add("gxdwbm");
		} else if ("1".equals((String)map.get("fxjbz"))) {
			lPro.add("ssdxjgajgdm");
		} else if ("1".equals((String)map.get("dsjgbz"))) {
			lPro.add("ssddsjgdm");
		} else {
			lPro.add("ssddsjgdm");
		}
		lPro.add("ssddsjgmc");
		lPro.add("ssdxjgajgmc");
		lPro.add("gxdwmc");
		lPro.add("qyzs");
		lPro.add("yjcqys");
		lPro.add("wjcqys");
		lPro.add("rcjccs");
		lPro.add("mjjczjccs");
    	List lCol=new ArrayList();
    	
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String queryRcjctjlist() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
        Page page = cxtjService.getRcjctjListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        setTabledataRcjctj(lCxtj,map); 
		 this.result="success";
        return "success";
    }
	//导出excel
	public String queryRcjctjlistExcelTemp() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
		String maxRows = glo.getGlobalparvalue();
		Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
		Page page = cxtjService.getRcjctjListForPage(map, 1, Integer.parseInt(maxRows),null,null);
		totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        if (lCxtj.size()>0){
			int qyzs = 0;
			int yjcqys = 0;
			int wjcqys = 0;
			int rcjccs = 0;
			int mjjczjccs = 0;
			Cxtj sumCxtj = new Cxtj();
	        for (Iterator iter = lCxtj.iterator(); iter.hasNext();) {
	        	Cxtj oneCxtj = (Cxtj) iter.next();
	        	qyzs += oneCxtj.getQyzs().intValue();
	        	yjcqys += oneCxtj.getYjcqys().intValue();
	        	wjcqys += oneCxtj.getWjcqys().intValue();
	        	rcjccs += oneCxtj.getRcjccs().intValue();
	        	mjjczjccs += oneCxtj.getMjjczjccs().intValue();
			}
	        sumCxtj.setQyzs(qyzs);
	        sumCxtj.setYjcqys(yjcqys);
	        sumCxtj.setWjcqys(wjcqys);
	        sumCxtj.setRcjccs(rcjccs);
	        sumCxtj.setMjjczjccs(mjjczjccs);
	        sumCxtj.setSsddsjgmc("合计");
	        sumCxtj.setSsdxjgajgmc("合计");
	        sumCxtj.setGxdwmc("合计");
	        if("1".equals(setCxtj.getDsjgbz())){
	        	lCxtj.add(sumCxtj);
			}
        }
		session.setAttribute("rcjctjList", page.getData());
		this.result="success";
	    return "success";
	}
	public void queryRcjctjlistExcel() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		Cxtj setCxtj=new Cxtj();
		String bbmc = request.getParameter("bbmc");
		String tabletitle = request.getParameter("tabletitle");
		List lResult = new ArrayList(); // //开头excel
		List lColumn = this.getExcelColumn(tabletitle);
		lResult.add(bbmc);
		lResult.add(lColumn);
		lResult.add(response);
		lResult.add((List)session.getAttribute("rcjctjList"));
		lResult.add(setCxtj);
		this.setExcelCreate("rcjctj",lResult);  ////默认文件名字的开头excel
		this.result="success";
    }
	
	public void setTabledataRcjctjqyxx(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("zrs");
		lPro.add("lxdh");
		lPro.add("hylb");
		lPro.add("yyztmc");
		lPro.add("zjztmc");
		lPro.add("gxdwmc");
    	List lCol=new ArrayList();
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String queryRcjctjlistqyxx() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
        Page page = cxtjService.getRcjctjlistqyxxForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        setTabledataRcjctjqyxx(lCxtj); 
		this.result="success";
        return "success";
    }
	
	public String queryRcjctjlistyjcqyxx() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
		map.put("rcjcbz", 1);
        Page page = cxtjService.getRcjctjlistqyxxForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        setTabledataRcjctjqyxx(lCxtj); 
		this.result="success";
        return "success";
    }
	
	public String queryRcjctjlistwjcqyxx() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
		map.put("rcjcbz", 0);
        Page page = cxtjService.getRcjctjlistqyxxForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        setTabledataRcjctjqyxx(lCxtj); 
		this.result="success";
        return "success";
    }
	
	public void setTabledataRcjctjrcjcxx(List lData) throws Exception{
		List lPro=new ArrayList();
		lPro.add("rcjcid");
		lPro.add("jcrq");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		lPro.add("jcfsDisplay");
		lPro.add("fxwt");
		lPro.add("cljg");
		lPro.add("mjjczbh");
		lPro.add("jcjgmc");
    	List lCol=new ArrayList();
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String queryRcjctjlistrcjcxx() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("mjjczbz", 0);
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
        Page page = cxtjService.getRcjctjlistrcjcxxForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        translateDictJcfs();
        setTabledataRcjctjrcjcxx(lCxtj); 
		this.result="success";
        return "success";
    }
	
	public String queryRcjctjlistmjkrcjcxx() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		map.put("hylbdm", setCxtj.getHylbdm());
		map.put("qsrq", setCxtj.getQsrq());
		map.put("jzrq", setCxtj.getJzrq());
		map.put("mjjczbz", 1);
		map.put("scbz", 0);
		map.put("zjztdm", 1);
		map.put("yyztdm", 1);
		map.put("zxbz", 0);
        Page page = cxtjService.getRcjctjlistrcjcxxForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        translateDictJcfs();
        setTabledataRcjctjrcjcxx(lCxtj); 
		this.result="success";
        return "success";
    }
	
	public void setTabledataCsfltj(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		if ("1".equals((String)map.get("gxdwbz"))) {
			lPro.add("gxdwdm");
			lPro.add("gxdwmc");
		} else if ("1".equals((String)map.get("fxjbz"))) {
			lPro.add("fxjdm");
			lPro.add("fxjmc");
		} else if ("1".equals((String)map.get("dsjgbz"))) {
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		} else {
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		}
		lPro.add("qyzs");
		lPro.add("zjs");
		lPro.add("zjl");
		lPro.add("gwyl");
		lPro.add("yysdzyxt");
		lPro.add("qtylcs");
		lPro.add("snxyam");
		lPro.add("mrmfzy");
		lPro.add("qtfwcs");
		lPro.add("ggcs");
		
    	List lCol=new ArrayList();
    	
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String queryCsfltjlist() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		if (!"1".equals(setCxtj.getSfcxqb())){
			map.put("qsrq", setCxtj.getQsrq());
			map.put("jzrq", setCxtj.getJzrq());
		}
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session= request.getSession();
		User user= (User)session.getAttribute(Constants.userKey);
		String departTemp = user.getDepartment().getDepartcode();
		if (DepartmentUtil.departIsZxs(departTemp)) map.put("iszxs","1");
		String DeptCode=null;
		if (!DepartmentUtil.departIsZxs(departTemp)){
			if (!setCxtj.getGxdwdm().equals("")) {
				DeptCode=setCxtj.getGxdwdm().substring(0, 8);
			} else if(!setCxtj.getFxjdm().equals("")) {
				DeptCode=setCxtj.getFxjdm().substring(0, 6);
			} else if(!setCxtj.getDsjgdm().equals("")) {
				DeptCode=setCxtj.getDsjgdm().substring(0, 4);
			} else {
				DeptCode=departTemp.substring(0, 2);;
			}
		} else {
			if (!setCxtj.getGxdwdm().equals("")) {
				DeptCode=setCxtj.getGxdwdm().substring(0, 8);
			} else if(!setCxtj.getFxjdm().equals("")) {
				DeptCode=setCxtj.getFxjdm().substring(0, 6);
			} else if(!setCxtj.getDsjgdm().equals("")) {
				DeptCode=setCxtj.getDsjgdm().substring(0, 2);
			} else {
				DeptCode=departTemp.substring(0, 2);;
			}
		}
		map.put("deptcode",DeptCode);
		
		Integer deptlevel=null;
		Integer mindeptlevel=null;
		if (!DepartmentUtil.departIsZxs(departTemp)){
			if("1".equals(setCxtj.getGxdwbz())){
				deptlevel=5;
				mindeptlevel=3;
			}else if("1".equals(setCxtj.getFxjbz())){
				deptlevel=4;
				mindeptlevel=3;
			}else if("1".equals(setCxtj.getDsjgbz())){
				deptlevel=3;
				mindeptlevel=3;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}  else{
			if("1".equals(setCxtj.getGxdwbz())){
				deptlevel=4;
				mindeptlevel=2;
			}else if("1".equals(setCxtj.getFxjbz())){
				deptlevel=3;
				mindeptlevel=2;
			}else if("1".equals(setCxtj.getDsjgbz())){
				deptlevel=2;
				mindeptlevel=2;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}
		map.put("deptlevel",deptlevel);
		map.put("mindeptlevel",mindeptlevel);
        Page page = cxtjService.getCsfltjListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        Cxtj sumCxtj = new Cxtj();
        int qyzs=0;
		int zjs=0;
		int gwyl=0;
		int yysdzyxt=0;
        int qtylcs=0;
        int snxyam=0; 
        int mrmfzy=0; 
        int qtfwcs=0;
        int ggcs=0;
        for(int i=0;i<lCxtj.size();i++){
        	Cxtj oneCxtj = (Cxtj)lCxtj.get(i);
        	qyzs+=oneCxtj.getQyzs().intValue();
        	zjs+=oneCxtj.getZjs().intValue();
        	gwyl+=oneCxtj.getGwyl().intValue();
        	yysdzyxt+=oneCxtj.getYysdzyxt().intValue();
        	qtylcs+=oneCxtj.getQtylcs().intValue();
        	snxyam+=oneCxtj.getSnxyam().intValue(); 
        	mrmfzy+=oneCxtj.getMrmfzy().intValue(); 
        	qtfwcs+=oneCxtj.getQtfwcs().intValue();
        	ggcs+=oneCxtj.getGgcs().intValue();
		}
        sumCxtj.setQyzs(qyzs);
        sumCxtj.setZjs(zjs);
        if (qyzs==0) {
        	sumCxtj.setZjl(new Float(0.00));
		}else {
			Float zjl=new Float(Math.round(new Float(zjs)/new Float(qyzs)*10000));
			sumCxtj.setZjl(zjl/100);
		}
        sumCxtj.setGwyl(gwyl);
        sumCxtj.setYysdzyxt(yysdzyxt);
        sumCxtj.setQtylcs(qtylcs);
        sumCxtj.setSnxyam(snxyam);
        sumCxtj.setMrmfzy(mrmfzy);
        sumCxtj.setQtfwcs(qtfwcs);
        sumCxtj.setGgcs(ggcs);
        sumCxtj.setDsjgmc("合计");
        sumCxtj.setFxjmc("合计");
        sumCxtj.setGxdwmc("合计");
		if("1".equals(setCxtj.getDsjgbz())){
			lCxtj.add(sumCxtj);
		}
        setTabledataCsfltj(lCxtj,map); 
		 this.result="success";
        return "success";
    }
	
	public void setTabledataCsyyzttj(List lData,Map map) throws Exception{
		List lPro=new ArrayList();
		if ("1".equals((String)map.get("gxdwbz"))) {
			lPro.add("gxdwdm");
			lPro.add("gxdwmc");
		} else if ("1".equals((String)map.get("fxjbz"))) {
			lPro.add("fxjdm");
			lPro.add("fxjmc");
		} else if ("1".equals((String)map.get("dsjgbz"))) {
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		} else {
			lPro.add("dsjgdm");
			lPro.add("dsjgmc");
		}
		lPro.add("qyzs");
		lPro.add("yy");
		lPro.add("zjs");
		lPro.add("zzty");
		lPro.add("llty");
		lPro.add("xy");
		lPro.add("zx");
		lPro.add("qt");
    	List lCol=new ArrayList();
    	Cxtj getCxtj=new Cxtj();
    	
        this.setData(getCxtj,lData,lPro,lCol);
        this.tabledata=this.getData();
        totalrows=this.getTotalrows();
	}
	
	public String queryCsyyzttjlist() throws Exception{
        Cxtj setCxtj=new Cxtj();
        setCxtj = (Cxtj) this.setClass(setCxtj, null);
        Map map = new HashMap();
        //将前台传入的参数与数据表对应
        map.put("ssddsjgdm", setCxtj.getDsjgdm());
		map.put("ssdxjgajgdm", setCxtj.getFxjdm());
		map.put("gxdwbm", setCxtj.getGxdwdm());
		map.put("dsjgbz", setCxtj.getDsjgbz());
		map.put("fxjbz", setCxtj.getFxjbz());
		map.put("gxdwbz", setCxtj.getGxdwbz());
		if (!"1".equals(setCxtj.getSfcxqb())){
			map.put("qsrq", setCxtj.getQsrq());
			map.put("jzrq", setCxtj.getJzrq());
		}
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session= request.getSession();
		User user= (User)session.getAttribute(Constants.userKey);
		String departTemp = user.getDepartment().getDepartcode();
		if (DepartmentUtil.departIsZxs(departTemp)) map.put("iszxs","1");
		String DeptCode=null;
		if (!DepartmentUtil.departIsZxs(departTemp)){
			if (!setCxtj.getGxdwdm().equals("")) {
				DeptCode=setCxtj.getGxdwdm().substring(0, 8);
			} else if(!setCxtj.getFxjdm().equals("")) {
				DeptCode=setCxtj.getFxjdm().substring(0, 6);
			} else if(!setCxtj.getDsjgdm().equals("")) {
				DeptCode=setCxtj.getDsjgdm().substring(0, 4);
			} else {
				DeptCode=departTemp.substring(0, 2);;
			}
		} else {
			if (!setCxtj.getGxdwdm().equals("")) {
				DeptCode=setCxtj.getGxdwdm().substring(0, 8);
			} else if(!setCxtj.getFxjdm().equals("")) {
				DeptCode=setCxtj.getFxjdm().substring(0, 6);
			} else if(!setCxtj.getDsjgdm().equals("")) {
				DeptCode=setCxtj.getDsjgdm().substring(0, 2);
			} else {
				DeptCode=departTemp.substring(0, 2);;
			}
		}
		map.put("deptcode",DeptCode);
		
		Integer deptlevel=null;
		Integer mindeptlevel=null;
		if (!DepartmentUtil.departIsZxs(departTemp)){
			if("1".equals(setCxtj.getGxdwbz())){
				deptlevel=5;
				mindeptlevel=3;
			}else if("1".equals(setCxtj.getFxjbz())){
				deptlevel=4;
				mindeptlevel=3;
			}else if("1".equals(setCxtj.getDsjgbz())){
				deptlevel=3;
				mindeptlevel=3;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}  else{
			if("1".equals(setCxtj.getGxdwbz())){
				deptlevel=4;
				mindeptlevel=2;
			}else if("1".equals(setCxtj.getFxjbz())){
				deptlevel=3;
				mindeptlevel=2;
			}else if("1".equals(setCxtj.getDsjgbz())){
				deptlevel=2;
				mindeptlevel=2;
			}else {
				deptlevel=2;
				mindeptlevel=2;
			}
		}
		map.put("deptlevel",deptlevel);
		map.put("mindeptlevel",mindeptlevel);

		Page page = cxtjService.getCsyyzttjListForPage(map, pagesize, pagerow,sort,dir);
        totalpage=page.getTotalPages();
        totalrows=page.getTotalRows();
        lCxtj=page.getData();
        Cxtj sumCxtj = new Cxtj();
        int qyzs=0;
		int yy=0;
		int zjs=0;
		int zzty=0;
        int llty=0;
        int xy=0; 
        int zx=0; 
        int qt=0;
        for(int i=0;i<lCxtj.size();i++){
        	Cxtj oneCxtj = (Cxtj)lCxtj.get(i);
        	qyzs+=oneCxtj.getQyzs().intValue();
        	yy+=oneCxtj.getYy().intValue();
        	zjs+=oneCxtj.getZjs().intValue();
        	zzty+=oneCxtj.getZzty().intValue();
        	llty+=oneCxtj.getLlty().intValue();
        	xy+=oneCxtj.getXy().intValue(); 
        	zx+=oneCxtj.getZx().intValue(); 
        	qt+=oneCxtj.getQt().intValue();
		}
        sumCxtj.setQyzs(qyzs);
        sumCxtj.setYy(yy);
        sumCxtj.setZjs(zjs);
        sumCxtj.setZzty(zzty);
        sumCxtj.setLlty(llty);
        sumCxtj.setXy(xy);
        sumCxtj.setZx(zx);
        sumCxtj.setQt(qt);
        sumCxtj.setDsjgmc("合计");
        sumCxtj.setFxjmc("合计");
        sumCxtj.setGxdwmc("合计");
		if("1".equals(setCxtj.getDsjgbz())){
			lCxtj.add(sumCxtj);
		}
        setTabledataCsyyzttj(lCxtj,map); 
		this.result="success";
        return "success";
    }
	
	
	/**
	 * 翻译字典项

	 */
	public void translateDictJcfs() {
		if (lCxtj != null && lCxtj.size() > 0) {
			for (int index = 0, max = lCxtj.size(); index < max; index++) {
				Cxtj tempCxtj = (Cxtj) lCxtj.get(index);
				Dict_item dict_item = CacheManager.getCacheDictitemOne(
						"dm_jcfs", tempCxtj.getJcfs());
				if (dict_item != null) {
					tempCxtj.setJcfsDisplay(dict_item.getDisplay_name());
					lCxtj.set(index, tempCxtj);
				}
			}
		}
	}
	
}