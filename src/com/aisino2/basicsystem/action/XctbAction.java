package com.aisino2.basicsystem.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import sun.misc.BASE64Decoder;

import com.aisino2.basicsystem.domain.GxdwForTree;
import com.aisino2.basicsystem.domain.HylbForTree;
import com.aisino2.basicsystem.domain.Xctb;
import com.aisino2.basicsystem.domain.Xctb_fj;
import com.aisino2.basicsystem.domain.Xctbjsdw;
import com.aisino2.basicsystem.domain.YlcsjbxxForTree;
import com.aisino2.basicsystem.service.IDepartAndQiYeService;
import com.aisino2.basicsystem.service.IXctbService;
import com.aisino2.basicsystem.service.IXctb_fjService;
import com.aisino2.basicsystem.service.IXctbhfService;
import com.aisino2.basicsystem.service.IXctbjsdwService;
import com.aisino2.common.PublicUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.util.json.JsonUtil;
import com.aisino2.core.web.PageAction;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Department;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.Globalpar;
import com.aisino2.sysadmin.domain.User;
import com.aisino2.sysadmin.service.IDepartmentService;
import com.aisino2.sysadmin.service.IDict_itemService;
import com.aisino2.sysadmin.service.IGlobalparService;
import com.opensymphony.xwork2.ActionContext;

public class XctbAction extends PageAction {
    private IXctbService xctbService;
    private IDict_itemService dict_itemService;
    private IDepartmentService departmentService;
    private IXctbhfService xctbhfService;
    private IXctbjsdwService xctbjsdwService;
    private IXctb_fjService xctb_fjService;
    private IGlobalparService globalparService;

    private IDepartAndQiYeService departAndQiYeService;
    
    private List lXctb = new ArrayList();
    private Xctb xctb = new Xctb();
    private String tabledata;
    private int totalrows;
    private String result = "";

    private User user;

    // ////////////////////////////////////////
    private String fileNamecon;
    private String base64codecon;
    private String fileTempNamecon;

    // //////////////////////////////////////////////////
    private String title;
    private File[] upload;
    private String[] uploadContentType;
    private String[] uploadFileName;

    // 接受依赖注入的属性
    private String savePath;

    // 接受依赖注入的方法
    public void setSavePath(String value) {
	this.savePath = value;
    }

    private String getSavePath() throws Exception {
	return ServletActionContext.getRequest().getRealPath(savePath);
    }

    public void setDepartAndQiYeService(
	    IDepartAndQiYeService departAndQiYeService) {
	this.departAndQiYeService = departAndQiYeService;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public void setUpload(File[] upload) {
	this.upload = upload;
    }

    public void setUploadContentType(String[] uploadContentType) {
	this.uploadContentType = uploadContentType;
    }

    public void setUploadFileName(String[] uploadFileName) {
	this.uploadFileName = uploadFileName;
    }

    public String getTitle() {
	return (this.title);
    }

    public File[] getUpload() {
	return (this.upload);
    }

    public String[] getUploadContentType() {
	return (this.uploadContentType);
    }

    public String[] getUploadFileName() {
	return (this.uploadFileName);
    }

    // /////////////////////////////

    public int getTotalrows() {
	return totalrows;
    }

    public void setTotalrows(int totalrows) {
	this.totalrows = totalrows;
    }

    public String getTabledata() {
	return tabledata;
    }

    public Xctb getXctb() {
	return xctb;
    }

    public List getLXctb() {
	return lXctb;
    }

    public String getResult() {
	return result;
    }

    public void setResult(String result) {
	this.result = result;
    }

    public void setXctbService(IXctbService xctbService) {
	this.xctbService = xctbService;
    }

    public void setTabledata(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");
	lPro.add("gqbs");
	List lModify = new ArrayList();
	lModify.add("setModifyQueryxctb");
	lModify.add("修改");
	lModify.add("gqbs");
	lModify.add("0");

	List lDel = new ArrayList();
	lDel.add("setDelete");
	lDel.add("删除");

	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");

	List lCol = new ArrayList();
	lCol.add(lModify);
	lCol.add(lDel);
	lCol.add(lXq);
	Xctb getXctb = new Xctb();

	// this.setData(getXctb,lData,lPro,lCol);
	this.setDataCustomer(getXctb, lData, lPro, null, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }
    //点击右下角链接，公安端看到未回复的通报内容
    //public String querylistgadhf()
    //公安端回复查询
    public String querylistgadhf() throws Exception{
    try{
    	Xctb setXctb = new Xctb();
 	    xctb = (Xctb) this.setClass(setXctb, null);
 	    Map map = new HashMap();
 	    
 	    map.put("bt", xctb.getBt());
 	    map.put("gqbs", "0");
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
 	    
	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    
	    map.put("jsdwbm", user.getDepartment().getDepartcode());
	    
	    if("N".equals(xctb.getHf())){
	    	Page page = xctbService.getListWhf(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	Page page = xctbService.getcsListForPage(map, pagesize, pagerow, sort, dir);
		    totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }
	    
	    setTabledatagadhf(lXctb);
    	
    }catch (Exception e){
    	e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }
    
    public void setTabledatagadhf(List lData) throws Exception {
    	List lPro = new ArrayList();
    	lPro.add("tbid");
    	lPro.add("fbsj");
    	lPro.add("fbdw");
    	lPro.add("bt");
    	lPro.add("fbr");

    	List replay = new ArrayList();
    	replay.add("set_replay");
    	replay.add("回复");
    	List replaydetail = new ArrayList();
    	replaydetail.add("replaystatus");
    	replaydetail.add("回复情况");

    	List lXq = new ArrayList();
    	lXq.add("setXiangQing");
    	lXq.add("详情");

    	List lCol = new ArrayList();
    	lCol.add(replay);
    	lCol.add(replaydetail);
    	lCol.add(lXq);

    	Xctb getXctb = new Xctb();
    	this.setData(getXctb, lData, lPro, lCol);
    	this.tabledata = this.getData();
    	totalrows = this.getTotalrows();
        }
    
    public String querylist() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();
 
	    map.put("bt", xctb.getBt());
	    map.put("fbr", xctb.getFbr());
	    map.put("gqbs", xctb.getGqbs());
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
	    map.put("sxhylbdm", xctb.getSxhylbdm());
	    
	    String[] arrl=xctb.getSxhylbdmall().split(",");
	    String sxhylbdmall=""; 
	    
	    for (int i = 0; i < arrl.length; i++) {  
    		sxhylbdmall +="  sxhylbdm like '%"+arrl[i].replaceAll("'", "")+"%' or";
        } 	    
        //判断默认查询是否包含下发给公安机关的通报
        if("Y".equals(xctb.getGajgcheck())){
    	  sxhylbdmall +="  sxhylbdm is null or";
        }	  
        map.put("sxhylbdmall", sxhylbdmall.substring(0,sxhylbdmall.length()-2));
	    
	   
	    //根据登陆用户设置查询条件 只能查询本部门和所属部门的信息
	    user = (User)  this.getRequest().getSession().getAttribute(Constants.userKey);
	    String depertCode0 = StringUtil.trimEven0(user.getDepartment().getDepartcode());
	    // 解决重庆铁路分局编码80开头的查询情况
	    
	    //登录单位默认查询
	    int dldwlevel = 0;
	    dldwlevel = user.getDepartment().getDepartlevel();
	    if (dldwlevel > 2) {
		map.put("fbdwbm", depertCode0);
	    }
	    
	    //发布单位查询条件
	    int fbdwlevel = 0;
	    if (xctb.getFbdwLevel() != null) {
		fbdwlevel  = xctb.getFbdwLevel();
	    }
	    if (fbdwlevel > 2) {
		map.put("fbdwbm2", StringUtil.trimEven0(xctb.getFbdwbm()));
	    }
        
	    if("".equals(xctb.getGajgbm())){
	    	Page page = xctbService.getListForPage(map, pagesize, pagerow, sort, dir);  
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	if(xctb.getFbdwLevel()==null){
	    		map.put("fbdwbm", "");
	    	}
	    	if(xctb.getGajgbm().equals(user.getDepartment().getDepartcode())){
	    		map.put("gajgbm", "#");
	    	}else{
	    		map.put("gajgbm", xctb.getGajgbm());
	    	}
	    	
	    	Page page = xctbService.getListGajg(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }	    
	    setTabledata(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }
    
    public String query() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    xctb = xctbService.getXctb(xctb);
	    int tbid = xctb.getTbid();

	    // //start 查询接收单位名称
	    Xctbjsdw xctbjsdw = new Xctbjsdw();
	    xctbjsdw.setTbid(tbid);
	    List xctbjsdwList = xctbjsdwService.getListXctbjsdw(xctbjsdw);
	    String xctbjsdwStr = "";
	    for (int i = 0; i < xctbjsdwList.size(); i++) {
		xctbjsdw = (Xctbjsdw) xctbjsdwList.get(i);
		if ("".equals(xctbjsdwStr)) {
		    xctbjsdwStr += xctbjsdw.getJsdwmc();
		} else {
		    xctbjsdwStr += ";" + xctbjsdw.getJsdwmc();
		}
	    }
	    // System.out.println(xctbjsdwStr);
	    // ///end
	    xctb.setJsdwmc(xctbjsdwStr); // //传输接收单位名称

	    lXctb = new ArrayList();
	    lXctb.add(xctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}

	this.result = "success";
	return "success";
    }

    public String insert() throws Exception {

	try {
	    Xctb_fj xctbfj = new Xctb_fj();
	    Object[] child = { xctbfj };// / 绑定子属性

	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, child);
	    xctb.setGqbs("0"); // /////过期标志,0未过期，1过期
	    // System.out.println(xctb.getFbdwbm());

	    // /////////////start 协查通报接受单位数据
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    List csjbxxList = (List) session.getAttribute("seesionCslist");
	    session.removeAttribute("seesionCslist");
    	List<Department> sessionDpList = (List) session.getAttribute("sessionDplist");
    	session.removeAttribute("sessionDplist");
	    
        if(csjbxxList!=null&&csjbxxList.size()>0)    //xxm
    	  xctb.setXctbjsdw(csjbxxList);
	    
	    

	    List xctbfjList = new ArrayList();
	    List fjinfoList = xctb.getLXctbfjList();
	    String serviceFile = ServletActionContext.getRequest().getRealPath(
		    "uploadTemp"); // /读取文件的目录

	    for (int i = 0; i < fjinfoList.size(); i++) {
		Xctb_fj xctb_fj = new Xctb_fj();
		xctbfj = (Xctb_fj) fjinfoList.get(i);
		String fjmc = xctbfj.getFjmc(); // 文件名称

		String[] fjlxarray = fjmc.split("\\.");
		String fjlx = fjlxarray[fjlxarray.length - 1]; // //得到附件类型

		String fjbase = xctbfj.getFjbase(); // /得到附件的临时文件名
		sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
		BufferedInputStream bis = null;
		byte[] fjnr = null; // /附件内容

		try {
		    bis = new BufferedInputStream(new FileInputStream(
			    serviceFile + "\\" + fjbase));
		    fjnr = new byte[bis.available()];
		    bis.read(fjnr);
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
			if (bis != null) {
			    bis.close();
			}
		    } catch (Exception e) {
			e.printStackTrace();
		    }
		}

		// ///////删除临时文件夹中的文件
		File file = new File(serviceFile + "\\" + fjbase);
		if (file.exists()) {
		    file.delete(); // 删除文件
		}
		// ////////////////

		xctb_fj.setFjmc(fjmc);
		xctb_fj.setFjlx(fjlx);
		xctb_fj.setFjnr(fjnr);
		xctb_fj.setFjxh(i + 1);

		xctbfjList.add(xctb_fj);

	    }
	    xctb.setXctbfj(xctbfjList);
	    // ///end

	    xctb = xctbService.insertXctb(xctb);
	    xctb = null;
	    dataxml = null;
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = e.getMessage();
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    /**
     * 上传临时文件
     * 
     * @return
     * @throws Exception
     */
    public String uptempfile() throws Exception {

	BASE64Decoder base64Decoder = new BASE64Decoder();
	RandomAccessFile os = null;
	String serviceFile = ServletActionContext.getRequest().getRealPath(
		"uploadTemp"); // /文件存放路径

	long nowtime = System.currentTimeMillis(); // ///根据时间得到文件名字
	String[] fjlxarray = fileNamecon.split("\\.");
	String fjlx = fjlxarray[fjlxarray.length - 1]; // //得到附件类型
	String fileTempName = String.valueOf(nowtime) + "." + fjlx;
	try {
	    byte[] bytetemp = base64Decoder.decodeBuffer(base64codecon);
	    os = new RandomAccessFile(serviceFile + "\\" + fileTempName, "rw");
	    os.write(bytetemp, 0, bytetemp.length);
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (os != null) {
		    os.close();
		}
	    } catch (Exception e) {
		e.printStackTrace();
	    }
	}
	fileTempNamecon = fileTempName; // ///把临时文件的名字回传给页面
	base64codecon = "";
	this.result = "success";
	return "success";

    }

    /**
     * 删除单条临时文件
     * 
     * @return
     * @throws Exception
     */
    public String deleteFile() throws Exception {

	String serviceFile = ServletActionContext.getRequest().getRealPath(
		"uploadTemp"); // /文件存放路径
	File file = new File(serviceFile + "\\" + fileTempNamecon);
	if (file.exists()) {
	    file.delete(); // 删除文件
	}

	this.result = "success";
	return "success";
    }

    /**
     * 删除 本条通报的全部临时文件
     * 
     * @return
     * @throws Exception
     */
    public String deleteAllFile() throws Exception {

	try {
	    Xctb_fj xctbfj = new Xctb_fj();
	    Object[] child = { xctbfj };// / 绑定子属性
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, child);
	    List fjinfoList = xctb.getLXctbfjList();
	    String serviceFile = ServletActionContext.getRequest().getRealPath(
		    "uploadTemp"); // /读取文件的目录
	    for (int i = 0; i < fjinfoList.size(); i++) {
		xctbfj = (Xctb_fj) fjinfoList.get(i);
		String fjbase = xctbfj.getFjbase(); // /得到附件的临时文件名
		File file = new File(serviceFile + "\\" + fjbase);
		if (file.exists()) {
		    file.delete(); // 删除文件
		}
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    /**
     * 协查通报修改
     * 
     * @return
     * @throws Exception
     */
    public String modify() throws Exception {
	try {
	    Xctb_fj xctbfj = new Xctb_fj();
	    Object[] child = { xctbfj };// / 绑定子属性

	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, child);

	    // //附件 start
	    List xctbfjList = new ArrayList();
	    List fjinfoList = xctb.getLXctbfjList();
	    String serviceFile = ServletActionContext.getRequest().getRealPath(
		    "uploadTemp"); // /读取文件的目录

	    for (int i = 0; i < fjinfoList.size(); i++) {
		Xctb_fj xctb_fj = new Xctb_fj();
		xctbfj = (Xctb_fj) fjinfoList.get(i);
		String fjmc = xctbfj.getFjmc(); // 文件名称

		String[] fjlxarray = fjmc.split("\\.");
		String fjlx = fjlxarray[fjlxarray.length - 1]; // //得到附件类型

		String fjbase = xctbfj.getFjbase(); // /文件的base64码
		sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
		BufferedInputStream bis = null;
		byte[] fjnr = null; // /附件内容

		try {
		    bis = new BufferedInputStream(new FileInputStream(
			    serviceFile + "\\" + fjbase));
		    fjnr = new byte[bis.available()];
		    bis.read(fjnr);
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
			if (bis != null) {
			    bis.close();
			}
		    } catch (Exception e) {
			e.printStackTrace();
		    }
		}

		// ///////删除临时文件夹中的文件
		File file = new File(serviceFile + "\\" + fjbase);
		if (file.exists()) {
		    file.delete(); // 删除文件
		}
		// ////////////////

		xctb_fj.setFjmc(fjmc);
		xctb_fj.setFjlx(fjlx);
		xctb_fj.setFjnr(fjnr);
		xctb_fj.setFjxh(i + 1);

		xctbfjList.add(xctb_fj);

	    }
	    xctb.setXctbfj(xctbfjList);
	    // ///附件 end

	    xctbService.updateXctb(xctb);
	    xctb = new Xctb();
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}

	this.result = "success";
	return "success";
    }

    /**
     * 协查通报撤销
     * 
     * @return
     * @throws Exception
     */
    public String cxxctb() throws Exception {
	try {

	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);

	    xctbService.updateXctb(xctb);
	    xctb = new Xctb();
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}

	this.result = "success";
	return "success";
    }

    public String delete() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);

	    /*
	     * xctb.setGqbs("1"); xctbService.updateXctb(xctb);
	     */
	    xctbService.deleteXctb(xctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    private String hylbstr;

    public String getHylbstr() {
	return hylbstr;
    }

    public void setHylbstr(String hylbstr) {
	this.hylbstr = hylbstr;
    }

    /**
     * 初始化 添加
     * 
     * @return
     * @throws Exception
     */
    public String initxctbAdd() throws Exception {

	ActionContext ctx = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	HttpSession session = request.getSession();
	user = (User) session.getAttribute(Constants.userKey);

	String userType = user.getUsertype();
	Map map = PublicUtil.translateDictZT("dm_hylb");//调用通用字典方法
	hylbstr = "";
	String[] utype = userType.split(",");
	for (int i = 0; i < utype.length; i++) {
		int type = Integer.parseInt(utype[i]);
		switch (type) {
			case 11: hylbstr += plusInput("J",map.get("J").toString());break;// 娱乐业
			case 12: hylbstr += plusInput("J",map.get("J").toString());break;// 娱乐业
			case 13: hylbstr += plusInput("J",map.get("J").toString());break;// 娱乐业
			case 14: hylbstr += plusInput("J",map.get("J").toString());break;// 娱乐业
			case 141: hylbstr += plusInput("K",map.get("K").toString());break;// 公共场所
			case 142: hylbstr += plusInput("K",map.get("K").toString());break;// 公共场所
			case 143: hylbstr += plusInput("K",map.get("K").toString());break;// 公共场所
			case 144: hylbstr += plusInput("K",map.get("K").toString());break;// 公共场所
			case 24: hylbstr += plusInput("A",map.get("A").toString());break;// 旅馆业
			case 33: hylbstr += plusInput("E03",map.get("E03").toString());break;// 典当业
			case 34: hylbstr += plusInput("E03",map.get("E03").toString());break;// 典当业
			case 44: hylbstr += plusInput("C",map.get("C").toString());break;// 机修业
			case 51: hylbstr += plusInput("B",map.get("B").toString());break;// 印章业
			case 64: hylbstr += plusInput("E01",map.get("E01").toString());break;// 二手车业
			case 74: hylbstr += plusInput("E02",map.get("E02").toString());break;// 二手机业
			case 84: hylbstr += plusInput("E04",map.get("E04").toString());break;// 废旧金属
			case 94: hylbstr += plusInput("F01",map.get("F01").toString());break;// 出租车
			case 104: hylbstr += plusInput("F02",map.get("F02").toString());break;// 汽车租赁
			case 91: hylbstr += plusInput("Z",map.get("Z").toString());break;// 出租房行业
			case 112: hylbstr += plusInput("X",map.get("X").toString());break;// 剧毒化学品
			case 113: hylbstr += plusInput("X",map.get("X").toString());break;// 剧毒化学品
			case 114: hylbstr += plusInput("X",map.get("X").toString());break;// 剧毒化学品
			case 121: hylbstr += plusInput("N",map.get("N").toString());break;// 内保单位
			case 122: hylbstr += plusInput("N",map.get("N").toString());break;// 内保单位
			case 154: hylbstr += plusInput("C01",map.get("C01").toString());break;// 机动车拆解业
			case 164: hylbstr += plusInput("E07",map.get("E07").toString());break;// 委托寄卖业
			case 201: hylbstr += plusInput("T",map.get("T").toString());break;//保安监管
			case 204: hylbstr += plusInput("RK",map.get("RK").toString());break;//流动人口
			case 233: hylbstr += plusInput("D",map.get("D").toString());break;//印刷业
			case 234: hylbstr += plusInput("D",map.get("D").toString());break;//印刷业
			case 244: hylbstr += plusInput("Y01",map.get("Y01").toString());break;//开锁业
			//寄递业
			case 252: hylbstr += plusInput("Y",map.get("Y").toString());break;
			case 253: hylbstr += plusInput("Y",map.get("Y").toString());break;
			case 254: hylbstr += plusInput("Y",map.get("Y").toString());break;
		}
	}
	this.result = "success";
	return "success";
    }
    
    public String plusInput(String factvalue,String displayname){
    	String temp = "<input type=\"checkbox\" name=\""
		    + displayname
		    + "\" id=\""
		    + factvalue
		    + "\" class=\"checkbox\" onclick=\"gethylb(this);\" />"
		    + displayname;
    	return temp;
    }

    /**
     * 初始化 修改
     * 
     * @return
     * @throws Exception
     */
    public String initxctbupdate() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    xctb = xctbService.getXctb(xctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	this.result = "success";
	return "success";
    }

    public User getUser() {
	return user;
    }

    public void setUser(User user) {
	this.user = user;
    }

    public void setDict_itemService(IDict_itemService dict_itemService) {
	this.dict_itemService = dict_itemService;
    }

    private String id;

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    // /////////////////////////////////////////////////部门树部分 start
    /**
     * 生成部门树
     * 
     * @throws Exception
     */

    private String hylbdmall;

    public String getHylbdmall() {
	return hylbdmall;
    }

    public void setHylbdmall(String hylbdmall) {
	this.hylbdmall = hylbdmall;
    }

    public void tree2() throws Exception {

	// id = null;
	List departlistshow = new ArrayList();
	List cslist = new ArrayList(); // /场所叶子节点的list
	List hylblist = new ArrayList(); // //行业类别的节点
	Map condition = new HashMap();
	Department depart = new Department();

	// ////start
	String hylbflag = ""; // ///行业类别标志 在公安机关每一级的id前加上行业类别标志的字母如Y32
	if (id != null) {
	    hylbflag = id.substring(0, 1);
	}
	// ////end

	if (id == null) {

	    String hylbauth = ""; // 权限字段
	    String[] arrHylbAuth = null;
	    if (hylbdmall != null) {
		hylbauth = hylbdmall;
		arrHylbAuth = hylbauth.split(";");
	    }
	    Dict_item dict_item = new Dict_item();
	    dict_item.setDict_code("dm_hylb");
	    List hylblistshow = dict_itemService.getListDict_item(dict_item);

	    // //只显示选择的行业
	    for (int u = 0; u < hylblistshow.size(); u++) {
		Dict_item testdict = new Dict_item();
		testdict = (Dict_item) hylblistshow.get(u);

		/************* New source modify on 2010-1-5 begin **************/
		if (arrHylbAuth != null) {
		    for (int index = 0; index < arrHylbAuth.length; index++) {
			if (arrHylbAuth[index].equals(testdict.getFact_value())) {
			    hylblist.add(testdict);
			}
		    }
		}
		/************* New source modify on 2010-1-5 end **************/
	    }
	    // //

	    if (hylblist == null) {
		hylblist = new ArrayList();
	    }
	    id = Integer.toString(0);

	    /************* New source modify on 2010-1-5 begin **************/
	} else if ("*".equals(id.substring(0, 1))) { // 行业类别根节点
	    hylbflag = id.substring(1, 2);
	    if ("E".equals(hylbflag) || "F".equals(hylbflag)) { // 行业类别为旧货业时，行业类别为E01二手车；E02二手机；E03典当
								// F01 出租车 F02
								// 汽车租赁
		hylbflag = id.substring(1, 4);
	    } else if ("C01".equals(id.substring(1))) {// 机动车拆解
		hylbflag = id.substring(1);
	    }else if("R".equals(hylbflag)){
	    	hylbflag = id.substring(1,3);
	    }

	    /************* New source modify on 2010-1-5 end **************/
	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx
		    .get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute(Constants.userKey);
	    Department userdepartment = new Department();
	    userdepartment.setDepartid(user.getDepartid());
	    userdepartment = departmentService.getDepartment(userdepartment);
	    departlistshow.add(userdepartment);

	} else { // 公安根节点
	    String departid = id.substring(1, id.length());// /部门id
	    /************* New source modify on 2010-1-5 begin **************/
	    if ("E".equals(hylbflag) || "F".equals(hylbflag)) { // 行业类别为旧货业时，行业类别为E01二手车；E02二手机；E03典当
		hylbflag = id.substring(0, 3);
		departid = id.substring(3);
	    } else if (id.indexOf("C01") != -1) {// 机动车拆解
		hylbflag = id.substring(0, 3);
		departid = id.substring(3);
	    }else if("R".equals(hylbflag)){
	    	hylbflag = id.substring(0,2);
	    	departid = id.substring(2, id.length());// /部门id
	    }

	    /************* New source modify on 2010-1-5 end **************/
	    depart.setDepartid(Integer.parseInt(departid)); // 除去第一个字母才是部门id
	    depart = departmentService.getDepartment(depart);
	    String departCode = depart.getDepartcode(); // 得到部门编码
	    String departCodetrim = StringUtil.trimEven0(departCode); // ///去掉后边0的部门编码

	    /************* New source modify on 2010-1-5 begin **************/
	    departlistshow = getdepartListall("departid", departid,
		    "departcode", departCodetrim, hylbflag); // //访问印章业的action
							     // 得到部门
	    cslist = getdataListall("gxdwbm", departCode, "isAllGxdwbm", "1",
		    hylbflag); // /访问典当业的action 得到下属的印章企业
	    /************* New source modify on 2010-1-5 begin **************/
	    if (departlistshow == null) {
		departlistshow = new ArrayList();
	    }
	    if (cslist == null) {
		cslist = new ArrayList();
	    }
	}

	String xml = "<?xml version='1.0' encoding='utf-8'?> \n";
	xml += "<tree id=\"" + id + "\"> \n";
	// ///行业类别
	for (int i = 0; i < hylblist.size(); i++) {
	    Dict_item dict_item = (Dict_item) hylblist.get(i);
	    xml += "<item text=\""
		    + dict_item.getDisplay_name()
		    + "\" id=\""
		    + "*"
		    + dict_item.getFact_value()
		    + "\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" ";
	    xml += "child=\"1\">\n";
	    xml += "</item>\n";
	}

	// /公安机关
	for (int i = 0; i < departlistshow.size(); i++) {
	    Department department = (Department) departlistshow.get(i);
	    xml += "<item text=\""
		    + department.getDepartname()
		    + "\" id=\""
		    + hylbflag
		    + Integer.toString(department.getDepartid())
		    + "\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" ";
	    xml += "child=\"1\">\n";
	    xml += "</item>\n";
	}

	// //场所节点
	for (int n = 0; n < cslist.size(); n++) {
	    YlcsjbxxForTree ylcs1 = new YlcsjbxxForTree();
	    ylcs1 = (YlcsjbxxForTree) cslist.get(n);
	    // ///userdata 字符串 场所编码||场所名称||行业类别编码||行业类别名称
	    String userdateStr = ylcs1.getHylxbm() + "||" + ylcs1.getHylxmc();
	    xml += "<item text=\""
		    + ylcs1.getCsmc()
		    + "\" id=\""
		    + "-"
		    + ylcs1.getCsbm()
		    + "\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" ";
	    xml += "child=\"0\">\n";

	    xml += "<userdata name=\"" + "-" + ylcs1.getCsbm() + "\">"
		    + userdateStr + "</userdata>\n";
	    xml += "</item>\n";
	}
	xml += "</tree>";
	// System.out.println(xml);

	HttpServletResponse response = ServletActionContext.getResponse();
	response.setContentType("application/xml;charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.print(xml);
	// 关闭流
	out.close();

	id = null;
    }

    /**
     * 访问其他工程的action方法 得到指定管辖单位及其下属管辖单位下所有企业
     * 
     * @return
     */
    public List getdataListall(String keyvalue, String para, String keyvalue2,
	    String para2, String hylxdm) {
	List dataList = new ArrayList();

	List lParam = new ArrayList();
	List lChild = new ArrayList();
	List lChildRow = new ArrayList();
	List lChildRows = new ArrayList();
	List lChilds = new ArrayList();

	List lColValue = new ArrayList();
	lColValue.add(keyvalue);
	lColValue.add(para);
	lParam.add(lColValue);
	lColValue = new ArrayList();
	lColValue.add(keyvalue2);
	lColValue.add(para2);
	lParam.add(lColValue);

	Globalpar globalpar = new Globalpar();

	/************* New source modify on 2010-1-5 begin **************/
	dataxml = JsonUtil.getXML(lParam, lChilds);
	YlcsjbxxForTree ylcsjbxxForTree = new YlcsjbxxForTree();
	try {
	    ylcsjbxxForTree = (YlcsjbxxForTree) this.setClass(ylcsjbxxForTree,
		    null);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	dataList = departAndQiYeService.QyTreeList(ylcsjbxxForTree, hylxdm);
	/************* New source modify on 2010-1-5 end **************/
	return dataList;
    }

    /**
     * 访问其他工程的action方法 获得含有企业或其下属管辖单位含有企业的管辖单位
     * 
     * @return
     */
    public List getdepartListall(String keyvalue, String para,
	    String keyvalue2, String para2, String hylxdm) {
	List dataList = new ArrayList();

	List lParam = new ArrayList();
	List lChild = new ArrayList();
	List lChildRow = new ArrayList();
	List lChildRows = new ArrayList();
	List lChilds = new ArrayList();

	List lColValue = new ArrayList();
	lColValue.add(keyvalue);
	lColValue.add(para);
	lParam.add(lColValue);
	lColValue = new ArrayList();
	lColValue.add(keyvalue2);
	lColValue.add(para2);
	lParam.add(lColValue);

	Globalpar globalpar = new Globalpar();
	/************* New source modify on 2010-1-5 begin **************/
	dataxml = JsonUtil.getXML(lParam, lChilds);
	Department department = new Department();
	try {
	    department = (Department) this.setClass(department, null);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	dataList = departAndQiYeService.ChildDepartmentForTree(department,
		hylxdm);
	/************* New source modify on 2010-1-5 end **************/
	return dataList;
    }

    /**
     * 根据部门树的选择 返回场所信息
     * 
     * @throws Exception
     */
    private String reXml;

    public String getReXml() {
	return reXml;
    }

    public void setReXml(String reXml) {
	this.reXml = reXml;
    }
    //根据部门树的选择，返回的公安机关编码
    private String codeXml;
    
	public String getCodeXml() {
		return codeXml;
	}

	public void setCodeXml(String codeXml) {
		this.codeXml = codeXml;
	}

	/************* New source modify on 2010-1-5 begin **************/
    public String treeCs() throws Exception {
	// //解析id值
	String alldepartid = id; // /返回部门节点的id 第一位是行业类型的编码 后边是公安部门的部门id
	String hylxflag = id.substring(0, 1); // //行业类型编码

	List<YlcsjbxxForTree> cslist = new ArrayList(); // /场所叶子节点的list
	Department depart = new Department();

	if ("*".equals(hylxflag)) { // 行业类别根节点
	    hylxflag = id.substring(1, 2);
	    if ("E".equals(hylxflag) || "F".equals(hylxflag)) { // 行业类别为旧货业时，行业类别为E01二手车；E02二手机；E03典当
		hylxflag = id.substring(1, 4);
	    } else if ("C01".equals(id.substring(1))) {// 机动车拆解
		hylxflag = id.substring(1);
	    }else if("R".equals(hylxflag)){
	    	hylxflag = id.substring(1,3);
	    }

	    // /树点击的是 是顶端的行业类别
	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx
		    .get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    depart = user.getDepartment();

	    cslist = getdataListall("gxdwbm", depart.getDepartcode(),
		    "isAllGxdwbm", "0", hylxflag); // /访问印章业的action
	    // 得到行业的机修业当企业(根据用户权限)
	} else {
	    String departid = id.substring(1); // /部门id
	    if ("E".equals(hylxflag) || "F".equals(hylxflag)) { // 行业类别为旧货业时，行业类别为E01二手车；E02二手机；E03典当
		hylxflag = id.substring(0, 3);
		departid = id.substring(3);
	    } else if (id.indexOf("C01") != -1) {// 机动车拆解
		hylxflag = id.substring(0, 3);
		departid = id.substring(3);
	    }else if("R".equals(hylxflag)){
	    	hylxflag = id.substring(0,2);
	    	departid = id.substring(2, id.length());// /部门id
	    }
	    depart.setDepartid(Integer.parseInt(departid));
	    depart = departmentService.getDepartment(depart);
	    String departCode = depart.getDepartcode(); // 得到部门编码

	    cslist = getdataListall("gxdwbm", departCode, "isAllGxdwbm", "0",
		    hylxflag); // 访问action 得到该部门下的全部企业
	}
	if (cslist == null) {
	    cslist = new ArrayList();
	}
	HttpSession session = ServletActionContext.getRequest().getSession();
	List<YlcsjbxxForTree> sessionCsList = (List) session.getAttribute("seesionCslist");
	// sessionCsList.remove(o)
	int listLength = 0;
	YlcsjbxxForTree ylcs1;
	if (sessionCsList != null && sessionCsList.size() > 0) {
		for(int i=0;i<cslist.size();i++)
		{
			YlcsjbxxForTree temp = (YlcsjbxxForTree)cslist.get(i);
			sessionCsList.remove(temp);
		    if (reXml != null && reXml.equals("1"))
			sessionCsList.add(temp);
		}
		session.setAttribute("seesionCslist", sessionCsList);
		listLength = sessionCsList.size();
	} else {
		session.setAttribute("seesionCslist", cslist);
		listLength = cslist.size();
	}
	
	/*int listLength = cslist.size();
	YlcsjbxxForTree ylcs1;
	if (sessionCsList != null && sessionCsList.size() > 0) {
	    int seListLength = sessionCsList.size();

	    if (listLength == seListLength) {
		cslist.clear();
	    }
	    listLength = cslist.size();
	}*/
	reXml = "";
	int firstLength = 15 > listLength ? listLength : 15;
	for (int index = 0; index < firstLength; index++) {
		if(sessionCsList!=null)
		{
			ylcs1 = (YlcsjbxxForTree) sessionCsList.get(index);
		}else{
	    ylcs1 = (YlcsjbxxForTree) cslist.get(index);
		}
	    reXml += ylcs1.getCsmc() + ";";
	}
	cslist = null;
	sessionCsList = null;
	id = null;
	return "success";

    }

    /************* New source modify on 2010-1-5 end **************/
    public String treeQiye() throws Exception {
	YlcsjbxxForTree ylcsjbxxForTree = new YlcsjbxxForTree();
	ylcsjbxxForTree = (YlcsjbxxForTree) this.setClass(ylcsjbxxForTree, null);
	Map map = new HashMap();
	map.put("hylbbm", ylcsjbxxForTree.getHylxbm());
	map.put("qybms", "'" + ylcsjbxxForTree.getCsbm() + "'");
	List<GxdwForTree> lGxdwForTree = xctbService.getQydwList(map);

	YlcsjbxxForTree temp = new YlcsjbxxForTree();
	if (lGxdwForTree != null && lGxdwForTree.size() > 0) {
	    GxdwForTree getGxdwForTree = lGxdwForTree.get(0);
	    temp.setCsmc(getGxdwForTree.getQymc());
	    temp.setCsbm(getGxdwForTree.getQybm());
	    temp.setHylxbm(getGxdwForTree.getHylbbm());
	    temp.setHylxmc(getGxdwForTree.getHylbmc());
	    temp.setGxdwbm(getGxdwForTree.getGxdwbm());
	    temp.setGxdwmc(getGxdwForTree.getGxdwmc());
	}

	HttpSession session = ServletActionContext.getRequest().getSession();
	List<YlcsjbxxForTree> sessionCsList = (List) session.getAttribute("seesionCslist");
	if (sessionCsList != null && sessionCsList.size() > 0) {
	    sessionCsList.remove(temp);
	    if (reXml != null && reXml.equals("1"))
	    		sessionCsList.add(temp);
	    
	} else {
	    sessionCsList = new ArrayList();
	    sessionCsList.add(temp);
	}
	reXml = "";
	int listLength = sessionCsList.size();
	int firstLength = 15 > listLength ? listLength : 15;
	for (int index = 0; index < firstLength; index++) {
	    ylcsjbxxForTree = (YlcsjbxxForTree) sessionCsList.get(index);
	    reXml += ylcsjbxxForTree.getCsmc() + ";";
	}
	session.setAttribute("seesionCslist", sessionCsList);
	sessionCsList = null;
	return "success";
    }
    
    //公安机关树选择,获取管辖单位名字
     public String treeGajg () throws Exception{
    	Department depart = new Department();
     	depart = (Department)this.setClass(depart,null);
     	String leaf=depart.getIsleaf();
     	List<Department> deptlist;
     	
     	HttpSession session = ServletActionContext.getRequest().getSession();
     	user = (User) session.getAttribute(Constants.userKey);
    	List<Department> sessionDpList = (List) session.getAttribute("sessionDplist");
    	
    	if(depart.getDepartcode().equals(user.getDepartment().getDepartcode())){
    		deptlist = departmentService.getAllChild(depart); 
    	}else{
    		deptlist = departmentService.getSelfandChild(depart); 
    	}
    	
    	if (sessionDpList != null && sessionDpList.size() > 0){
    		Department temp=new Department();
    		   if (reXml != null && reXml.equals("1")){
   				   for(int index=0;index<deptlist.size();index++)
   				   {
   					   temp=deptlist.get(index);
   					  //需要判断在sessiionDpList中已经存在
   					   for(int i=0;i<sessionDpList.size();i++){
   						if(sessionDpList.get(i).getDepartid().equals(temp.getDepartid())){
   							break;
   						}else if(i==sessionDpList.size()-1){
   							sessionDpList.add(temp);
   						}
   					  }
           			   //sessionDpList.add(temp);
   			       } 
    		   }else{
    			   for(int index=0;index<deptlist.size();index++){
    				   temp=deptlist.get(index);
              		   for(int i=0;i<sessionDpList.size();i++){
              			   if(sessionDpList.get(i).getDepartid().equals(temp.getDepartid()))
              			   {
              				 sessionDpList.remove(i);
              				 break;
              			   }
              		   }
    			   }
    		   }	      
    	}else {
    		 sessionDpList = deptlist;
    	}
    	reXml = "";
    	codeXml = "";
    	String deptcode="";
    	int listLength = sessionDpList.size();
    	//int firstLength = 15 > listLength ? listLength : 15;
    	for (int index = 0; index < listLength; index++) {
    	    depart = (Department) sessionDpList.get(index);
    	    reXml += depart.getDepartname()+ ";";
    	    codeXml += depart.getDepartcode()+";";
    	}
    	session.setAttribute("sessionDplist", sessionDpList);
    	sessionDpList = null;
    	return "success";
     }
    
    public String clearGajg() throws Exception{
    HttpSession session = ServletActionContext.getRequest().getSession();
    session.removeAttribute("sessionDplist");	
    return "success";
    }
     
    public String clearQiye() throws Exception {
	HttpSession session = ServletActionContext.getRequest().getSession();
	session.removeAttribute("seesionCslist");
	return "success";
    }

    // ///////////////////////////////////////////部门树部分 end

    public void setDepartmentService(IDepartmentService departmentService) {
	this.departmentService = departmentService;
    }

    public void setXctbhfService(IXctbhfService xctbhfService) {
	this.xctbhfService = xctbhfService;
    }

    public void setXctbjsdwService(IXctbjsdwService xctbjsdwService) {
	this.xctbjsdwService = xctbjsdwService;
    }

    // ////////////////////////////协查通报查询 start
    /**
     * 协查通报查询
     * 
     * @return
     * @throws Exception
     */
    public String querylistcx() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();

	    map.put("bt", xctb.getBt());
	    map.put("fbr", xctb.getFbr());
	    map.put("gqbs", xctb.getGqbs());
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
	    map.put("sxhylbdm", xctb.getSxhylbdm());
	    
	    String[] arrl=xctb.getSxhylbdmall().split(",");
	    String sxhylbdmall="";
	    for (int i = 0; i < arrl.length; i++) {  
	    		sxhylbdmall +="  sxhylbdm like '%"+arrl[i].replaceAll("'", "")+"%' or";
	         } 
	  //判断默认查询是否包含下发给公安机关的通报
        if("Y".equals(xctb.getGajgcheck())){
    	  sxhylbdmall +="  sxhylbdm is null or";
        }	  
	    map.put("sxhylbdmall", sxhylbdmall.substring(0,sxhylbdmall.length()-2));   
	

	    // ///根据登陆用户 设置查询条件 只能查询本部门和所属部门的信息
	    String fbdwbm = xctb.getFbdwbm();
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    if (fbdwbm == null || "".equals(fbdwbm)) {
		fbdwbm = user.getDepartment().getDepartcode();
	    }
	    // 解决重庆铁路分局编码80开头的查询情况
	    //登录单位默认查询
	    int dldwlevel = 0;
	    dldwlevel = user.getDepartment().getDepartlevel();
	    if (dldwlevel > 2) {
		map.put("fbdwbm",StringUtil.trimEven0(fbdwbm));
	    }	    
	    //发布单位查询条件
	    int fbdwlevel = 0;
	    if (xctb.getFbdwLevel() != null) {
		fbdwlevel  = xctb.getFbdwLevel();
	    }
	    if (fbdwlevel > 2) {
		map.put("fbdwbm2", StringUtil.trimEven0(xctb.getFbdwbm()));
	    }
	    
	    if("".equals(xctb.getGajgbm())){
	    	Page page = xctbService.getListForPage(map, pagesize, pagerow, sort, dir);  
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	if(xctb.getFbdwLevel()==null){
	    		map.put("fbdwbm", "");
	    	}
	    	map.put("gajgbm", xctb.getGajgbm());
	    	Page page = xctbService.getListGajg(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }	    
	    setTabledatacx(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledatacx(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");
	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");
	List lCol = new ArrayList();
	lCol.add(lXq);
	Xctb getXctb = new Xctb();
	this.setData(getXctb, lData, lPro, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // /////////////////////////////////end

    /*
     * 内保单位公安端首页连接使用
     */
    public String querylistCxNb() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();
	    map.put("bt", xctb.getBt());
	    map.put("fbr", xctb.getFbr());
//	    map.put("gqbs", xctb.getGqbs()); //根据需求，过期了的通报在台账仍要显示。
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
	    map.put("sxhylbdm", xctb.getSxhylbdm());
	    // ///根据登陆用户 设置查询条件 只能查询本部门和所属部门的信息
	    String fbdwbm = xctb.getFbdwbm();
	    if (fbdwbm == null || "".equals(fbdwbm)) {
		HttpSession session = ServletActionContext.getRequest()
			.getSession();
		user = (User) session.getAttribute(Constants.userKey);
		fbdwbm = user.getDepartment().getDepartcode();
	    }

	    map.put("fbdwbm", StringUtil.trimEven0(fbdwbm));
	    
	    Page page = xctbService.getListForPageNbdw(map, pagesize, pagerow,
		    sort, dir);
	    totalpage = page.getTotalPages();
	    totalrows = page.getTotalRows();
	    lXctb = page.getData();
	    setTabledatacx(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    // ////////////////////////////协查通报回复情况查看 start
    /**
     * 协查通报回复查看
     */
    public String querylistreplay() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();

	    //map.put("fbdwbm2", xctb.getFbdwbm());
	    map.put("bt", xctb.getBt());
	    map.put("fbr", xctb.getFbr());
	    map.put("gqbs", xctb.getGqbs());
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
	    map.put("sxhylbdm", xctb.getSxhylbdm());
	    
	    String[] arrl=xctb.getSxhylbdmall().split(",");
	    String sxhylbdmall="";
	    for (int i = 0; i < arrl.length; i++) {  
	    		sxhylbdmall +="  sxhylbdm like '%"+arrl[i].replaceAll("'", "")+"%' or";
	         } 
	    //判断默认查询是否包含下发给公安机关的通报
        if("Y".equals(xctb.getGajgcheck())){
    	  sxhylbdmall +="  sxhylbdm is null or";
        }	  
	    map.put("sxhylbdmall", sxhylbdmall.substring(0,sxhylbdmall.length()-2));   
	
	    // ///根据登陆用户 设置查询条件 只能查询本部门和所属部门的信息
	    String fbdwbm = xctb.getFbdwbm();
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    if (fbdwbm == null || "".equals(fbdwbm)) {
		fbdwbm = user.getDepartment().getDepartcode();
	    }
	    // 解决重庆铁路分局编码80开头的查询情况
	    //登录单位默认查询
	    int dldwlevel = 0;
	    dldwlevel = user.getDepartment().getDepartlevel();
	    if (dldwlevel > 2) {
		map.put("fbdwbm", StringUtil.trimEven0(fbdwbm));
	    }
	    
	    //发布单位查询条件
	    int fbdwlevel = 0;
	    if (xctb.getFbdwLevel() != null) {
		fbdwlevel  = xctb.getFbdwLevel();
	    }
	    if (fbdwlevel > 2) {
		map.put("fbdwbm2", StringUtil.trimEven0(xctb.getFbdwbm()));
	    }
	    
	    if("".equals(xctb.getGajgbm())){
	    	Page page = xctbService.getListForPage(map, pagesize, pagerow, sort, dir);  
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	if(xctb.getFbdwLevel()==null){
	    		map.put("fbdwbm", "");
	    	}
	    	map.put("gajgbm", xctb.getGajgbm());
	    	Page page = xctbService.getListGajg(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }	    
	    setTabledatareply(lXctb);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledatareply(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");

	List read = new ArrayList();
	read.add("readstatus");
	read.add("阅读情况");
	List replay = new ArrayList();
	replay.add("replaystatus");
	replay.add("回复情况");

	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");

	List lCol = new ArrayList();
	lCol.add(read);
	lCol.add(replay);
	lCol.add(lXq);

	Xctb getXctb = new Xctb();
	this.setData(getXctb, lData, lPro, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // /////////////////////////////////end

    // ////////////////////////////协查通报撤销 start
    /**
     * 协查通报撤销
     */
    public String querylistdis() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();

	    //map.put("fbdwbm2", xctb.getFbdwbm());
	    map.put("bt", xctb.getBt());
	    map.put("fbr", xctb.getFbr());
	    map.put("gqbs", xctb.getGqbs());
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());
	    map.put("sxhylbdm", xctb.getSxhylbdm());
	    
	    String[] arrl=xctb.getSxhylbdmall().split(",");
	    String sxhylbdmall="";
	    for (int i = 0; i < arrl.length; i++) {  
	    		sxhylbdmall +="  sxhylbdm like '%"+arrl[i].replaceAll("'", "")+"%' or";
	         } 
	   //判断默认查询是否包含下发给公安机关的通报
        if("Y".equals(xctb.getGajgcheck())){
    	  sxhylbdmall +="  sxhylbdm is null or";
        }	  
	    map.put("sxhylbdmall", sxhylbdmall.substring(0,sxhylbdmall.length()-2));   
	
	    
	    // ///根据登陆用户 设置查询条件 只能查询本部门和所属部门的信息
	    String fbdwbm = xctb.getFbdwbm();
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    if (fbdwbm == null || "".equals(fbdwbm)) {
		fbdwbm = user.getDepartment().getDepartcode();
	    }
	    // 解决重庆铁路分局编码80开头的查询情况
	    //登录单位默认查询
	    int dldwlevel = 0;
	    dldwlevel = user.getDepartment().getDepartlevel();
	    if (dldwlevel > 2) {
		map.put("fbdwbm", StringUtil.trimEven0(fbdwbm));
	    }
	    
	    //发布单位查询条件
	    int fbdwlevel = 0;
	    if (xctb.getFbdwLevel() != null) {
		fbdwlevel  = xctb.getFbdwLevel();
	    }
	    if (fbdwlevel > 2) {
		map.put("fbdwbm2", StringUtil.trimEven0(xctb.getFbdwbm()));
	    }
        
	    if("".equals(xctb.getGajgbm())){
	    	Page page = xctbService.getListForPage(map, pagesize, pagerow, sort, dir);  
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	if(xctb.getFbdwLevel()==null){
	    		map.put("fbdwbm", "");
	    	}
	    	map.put("gajgbm", xctb.getGajgbm());
	    	Page page = xctbService.getListGajg(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }	    
	    setTabledatadis(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledatadis(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");

	List lCol = new ArrayList();
	List dis = new ArrayList();
	dis.add("tbid"); // //只是一个表示
	dis.add("撤销");
	dis.add("gqbs");
	dis.add("0");
	lCol.add(dis);

	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");

	lCol.add(lXq);

	/*
	 * List lCol=new ArrayList(); List dis =new ArrayList();
	 * dis.add("disfork"); dis.add("撤销"); lCol.add(dis);
	 */

	Xctb getXctb = new Xctb();
	// this.setData(getXctb,lData,lPro,lCol);
	this.setDataCustomer(getXctb, lData, lPro, null, lCol);

	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // /////////////////////////////////end

    // ////////////////////////////场所协查通报回复 start

    /**
     * 协查通报回复查看 场所
     */
    public String querylistcs() throws Exception {

	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();

	    map.put("bt", xctb.getBt());
	    map.put("gqbs", "0");
	    map.put("fbkssj", xctb.getFbkssj());
	    map.put("fbjssj", xctb.getFbjssj());

	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);

	    /*
	     * String userType = user.getUsertype(); String useraccount =
	     * user.getUseraccount();
	     * if("B02".equals(useraccount.substring(0,3))){ map.put("jsdwbm",
	     * user.getUseraccount().substring(0,15)); }else{ map.put("jsdwbm",
	     * user.getUseraccount().substring(0,14)); }
	     */

	    map.put("jsdwbm", user.getSsdwbm());
        
	    if("N".equals(xctb.getHf())){
	    	Page page = xctbService.getListWhf(map, pagesize, pagerow, sort, dir);
	    	totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }else{
	    	Page page = xctbService.getcsListForPage(map, pagesize, pagerow, sort, dir);
		    totalpage = page.getTotalPages();
		    totalrows = page.getTotalRows();
		    lXctb = page.getData();
	    }
	    setTabledatacs(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledatacs(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");

	List replay = new ArrayList();
	replay.add("set_replay");
	replay.add("回复");
	List replaydetail = new ArrayList();
	replaydetail.add("replaystatus");
	replaydetail.add("回复情况");

	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");

	List lCol = new ArrayList();
	lCol.add(replay);
	lCol.add(replaydetail);
	lCol.add(lXq);

	Xctb getXctb = new Xctb();
	this.setData(getXctb, lData, lPro, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // //////////////////end

    /**
     * 协查通报查看首页关联
     */
    public String querylistSygl() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    Map map = new HashMap();

	    map.put("jsdwbm", xctb.getJsdwbm());

	    Page page = xctbService.getcsListForPage(map, pagesize, pagerow,
		    sort, dir);
	    totalpage = page.getTotalPages();
	    totalrows = page.getTotalRows();
	    lXctb = page.getData();
	    setTabledataSygl(lXctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledataSygl(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("fbsj");
	lPro.add("fbdw");
	lPro.add("bt");
	lPro.add("fbr");

	List lXq = new ArrayList();
	lXq.add("setXiangQing");
	lXq.add("详情");

	List lCol = new ArrayList();
	lCol.add(lXq);

	Xctb getXctb = new Xctb();
	this.setData(getXctb, lData, lPro, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // //////////////////end
    public String querylistFortitile() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx
		    .get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);
//	    String fullcode = user.getDepartment().getDepartfullcode();
//	    String[] fullcodes = fullcode.split("\\.");
//	    String fbdwbms = "";
//	    for (int i = 0; i < fullcodes.length; i++) {
//			if (i != fullcodes.length - 1) {
//			    fbdwbms += "'" + fullcodes[i] + "',";
//			} else {
//			    fbdwbms += "'" + fullcodes[i] + "'";
//			}
//	    }
	    String[] usertypes = user.getUsertype().split(",");
	    String usertype = "";
	    int len = usertypes.length;
	    String str="";
	    for (int i = 0; i < len; i++) {
	    	String tem=this.getHylbdmforYhlb(usertypes[i].toString());
	    	if (i == 0) {
	    		str+="sxhylbdm like '%"+tem+"%'";
	    	}else{
	    		str+="or sxhylbdm like '%"+tem+"%'";
	    	}
	    	
//			if (i != len - 1) {
//			    usertype += "'" + tem + "',";
//			} else {
//			    usertype += "'" + tem + "'";
//			}
	    }
	    Map setmap = new HashMap();
	    setmap.put("sxhylbdms", str);
	    String depertCode0 = StringUtil.trimEven0(user.getDepartment().getDepartcode());
	    // 解决重庆铁路分局编码80开头的查询情况
	    //登录单位默认查询
	    int dldwlevel = 0;
	    dldwlevel = user.getDepartment().getDepartlevel();
	    if (dldwlevel > 2) {
	    	setmap.put("fbdwbm", depertCode0);
	    }
	    //setmap.put("fbdwbmforIn", fbdwbms);
	    Page page = xctbService.getListForPage(setmap, 1, 1000,sort, dir);
		totalpage = page.getTotalPages();
		totalrows = page.getTotalRows();
		lXctb = page.getData();
//	    lXctb = xctbService.getXctbListForBt(setmap);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	this.result = "success";
	return "success";
    }

    private String getHylbdmforYhlb(String yhlb){
    	String hylb="";
    	if("104".equals(yhlb)){
    		hylb="F02"; //汽车租赁业
    	}else if("114".equals(yhlb)){
    		hylb="X"; //剧毒化学品
    	}else if("121".equals(yhlb)){
    		hylb="N"; //重点单位
    	}else if("14".equals(yhlb)){
    		hylb="J"; //
    	}else if("154".equals(yhlb)){
    		hylb="C01"; //机动车拆解业
    	}else if("164".equals(yhlb)){
    		hylb="E07"; //委托寄卖业
    	}else if("24".equals(yhlb)){
    		hylb="A"; //旅馆业
    	}else if("34".equals(yhlb)){
    		hylb="E03"; //典当业
    	}else if("44".equals(yhlb)){
    		hylb="C"; //机修业
    	}else if("51".equals(yhlb)){
    		hylb="B"; //印章业
    	}else if("64".equals(yhlb)){
    		hylb="E01"; //二手车交易
    	}else if("74".equals(yhlb)){
    		hylb="E02"; //旧移动电话交易业
    	}else if("84".equals(yhlb)){
    		hylb="E04"; //废旧金属收购业
    	}else if("91".equals(yhlb)){
    		hylb="Z"; //出租屋行业
    	}else if("94".equals(yhlb)){
    		hylb="F01"; //出租汽车
    	}
    	return hylb;
    }
    // ////////////////////////////场所协查通报场所端主页面 start

    /**
     * 协查通报 场所主页面
     */
    public String querylistcsMain() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);

	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) ctx
		    .get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    // map.put("jsdwbm", user.getUseraccount());
	    Xctb xctbcsman = new Xctb();
	    xctbcsman.setJsdwbm(user.getUseraccount());
	    List xctbcsList = xctbService.getListXctb(xctbcsman);

	    setTabledatacsMain(xctbcsList);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setTabledatacsMain(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("tbid");
	lPro.add("rowno");
	lPro.add("bt");
	lPro.add("fbdw");
	lPro.add("fbsj");

	Xctb getXctb = new Xctb();
	this.setData(getXctb, lData, lPro, null);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    // //////////////////end

    /**
     * 剧毒化学品协查通报 单位主页面跑马灯
     */
    public String querydwpmdlist() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);

	    ActionContext ctx = ActionContext.getContext();
	    HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession session = request.getSession();
	    user = (User) session.getAttribute(Constants.userKey);
	    Xctb xctbcsman = new Xctb();
	    xctbcsman.setJsdwbm(user.getSsdwbm());
	    lXctb = xctbService.getXctbWydList(xctbcsman);
	    this.result = "success";
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	return "success";
    }

    /**
     * 定时协查通报
     * 
     * @return
     * @throws Exception
     */
    /*
     * public String timeCxxctb() throws Exception{ try {
     * System.out.println("start!"); Xctb xctbt=new Xctb(); Xctb setXctb=new
     * Xctb(); xctb=(Xctb)this.setClass(setXctb, null); //Date jzrqauto = new
     * Date(); //xctbt.setJzrqauto(jzrqauto); xctbt.setGqbs("1");
     * xctbt.setTbid(67); xctbService.updateXctb(xctbt);
     * System.out.println("success!"); //xctb = new Xctb(); } catch (Exception
     * e) { // TODO Auto-generated catch block e.printStackTrace();
     * this.result=""; return "success"; }
     * 
     * this.result="success"; return "success"; }
     */

    /**
     * 打印功能的单条查询
     * 
     * @return
     * @throws Exception
     */
    public String queryforPrint() throws Exception {
	try {
	    Xctb setXctb = new Xctb();
	    xctb = (Xctb) this.setClass(setXctb, null);
	    xctb = xctbService.getXctb(xctb);
	    int tbid = xctb.getTbid();

	    // //start 查询接收单位名称
	    Xctbjsdw xctbjsdw = new Xctbjsdw();
	    xctbjsdw.setTbid(tbid);
	    List xctbjsdwList = xctbjsdwService.getListXctbjsdw(xctbjsdw);
	    String xctbjsdwStr = "";
	    for (int i = 0; i < xctbjsdwList.size(); i++) {
		xctbjsdw = (Xctbjsdw) xctbjsdwList.get(i);
		if ("".equals(xctbjsdwStr)) {
		    xctbjsdwStr += xctbjsdw.getJsdwmc();
		} else {
		    xctbjsdwStr += ";" + xctbjsdw.getJsdwmc();
		}
	    }
	    // System.out.println(xctbjsdwStr);
	    // ///end
	    xctb.setJsdwmc(xctbjsdwStr); // //传输接收单位名称

	    Xctb_fj xctbfj = new Xctb_fj();
	    xctbfj.setTbid(tbid);
	    List xctbfjList = xctb_fjService.getListXctb_fj(xctbfj);
	    String xctbfjstr = "";
	    for (int k = 0; k < xctbfjList.size(); k++) {
		xctbfj = (Xctb_fj) xctbfjList.get(k);
		if ("".equals(xctbfjstr)) {
		    xctbfjstr += xctbfj.getFjmc();
		} else {
		    xctbfjstr += ";" + xctbfj.getFjmc();
		}
	    }
	    xctb.setFjname(xctbfjstr);

	    lXctb = new ArrayList();
	    lXctb.add(xctb);

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}

	this.result = "success";
	return "success";
    }

    public void setXctb_fjService(IXctb_fjService xctb_fjService) {
	this.xctb_fjService = xctb_fjService;
    }

    public void setGlobalparService(IGlobalparService globalparService) {
	this.globalparService = globalparService;
    }

    public String getFileNamecon() {
	return fileNamecon;
    }

    public void setFileNamecon(String fileNamecon) {
	this.fileNamecon = fileNamecon;
    }

    public String getBase64codecon() {
	return base64codecon;
    }

    public void setBase64codecon(String base64codecon) {
	this.base64codecon = base64codecon;
    }

    public String getFileTempNamecon() {
	return fileTempNamecon;
    }

    public void setFileTempNamecon(String fileTempNamecon) {
	this.fileTempNamecon = fileTempNamecon;
    }

    /**
     * 获取行业类别下拉列表数据
     * 
     * @throws Exception
     */
    private String hylbdm;
    private static int level = 1;

    public String getHylbdm() {
	return hylbdm;
    }

    public void setHylbdm(String hylbdm) {
	this.hylbdm = hylbdm;
    }

    public void hylbTree() throws Exception {
	List hylblist = new ArrayList();
	List hylblistshow = new ArrayList();
	Dict_item dict_item = new Dict_item();
	Map condition = new HashMap();
	String hylbflag = "";
	// 显示行业类别根节点
	if (id == null) {
	    String hylbauth = "";
	    if (hylbdm != null) {
		hylbauth = hylbdm;
	    }
	    dict_item.setDict_code("dm_hylb");
	    hylblistshow = dict_itemService.getListDict_item(dict_item);
	    // 只显示选择的行业
	    if (!"".equals(hylbauth)) {
		for (int u = 0; u < hylblistshow.size(); u++) {
		    Dict_item testdict = new Dict_item();
		    testdict = (Dict_item) hylblistshow.get(u);
		    if (hylbauth.equals(testdict.getFact_value())) {
			hylblist.add(testdict);
		    }
		}
	    }
	    id = Integer.toString(0);
	    level = 1;
	    // 显示行业类别细化2级节点,
	} else if ("1".equals(id.substring(0, 1))) {
	    // 行业类别"A"旅业，"N"内保，"J"娱乐
	    hylbflag = id.substring(1, 2);
	    // 显示旅业下级子行业
	    if ("A".equals(hylbflag)) {
		dict_item.setDict_code("dm_ywlb");
		hylblist = dict_itemService.getListDict_item(dict_item);
		// 显示内保下级子行业
	    } else if ("N".equals(hylbflag)) {
		dict_item.setDict_code("dm_nbdw_hyfl");
		hylblist = dict_itemService.getListDict_item(dict_item);
		// 显示娱乐下级子行业
	    } else if ("J".equals(hylbflag)) {
		dict_item.setDict_code("dm_ylcsfl(bzh)");
		hylblist = dict_itemService.getListDict_item(dict_item);
	    }
	    // 显示行业类别细化3级节点,金融和学校行业类别细分
	} else if ("2".equals(id.substring(0, 1))) {
	    dict_item.setDict_code("dm_dwlb_nbdw");
	    dict_item.setQuery_simplepin(id.substring(1, 3));
	    hylblist = dict_itemService.getListDict_item(dict_item);
	}

	String xml = "<?xml version='1.0' encoding='utf-8'?> \n";
	xml += "<tree id=\"" + id + "\"> \n";
	// 行业类别节点
	for (int i = 0; i < hylblist.size(); i++) {
	    dict_item = (Dict_item) hylblist.get(i);
	    String userdateStr = dict_item.getFact_value();
	    xml += "<item text=\""
		    + dict_item.getDisplay_name()
		    + "\" id=\""
		    + level
		    + dict_item.getFact_value()
		    + "\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" ";
	    xml += "child=\"";
	    if (level == 1
		    || ("N".equals(hylbflag) && level == 2 && ("01"
			    .equals(userdateStr) || "02".equals(userdateStr)))) {
		xml += "1";
	    } else {
		xml += "0";
	    }
	    xml += "\">\n";
	    xml += "<userdata name=\"" + "-" + userdateStr + "\">"
		    + userdateStr + "</userdata>\n";
	    xml += "</item>\n";
	}
	xml += "</tree>";
	HttpServletResponse response = ServletActionContext.getResponse();
	response.setContentType("application/xml;charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.print(xml);
	id = null;
	hylblist.clear();
	level++;
	out.close();
    }

    // 设置选择的行业类别存入session中
    public String setHylb() throws Exception {

	HylbForTree hylbForTree = new HylbForTree();
	hylbForTree = (HylbForTree) this.setClass(hylbForTree, null);
	HttpSession session = ServletActionContext.getRequest().getSession();
	List<HylbForTree> sessionHylbList = (List) session
		.getAttribute("sessionHylbList");

	// 内保存在三级行业类别的情况
	String hylbbm = hylbForTree.getHylbbm();
	if ("01".equals(hylbbm) || "02".equals(hylbbm)) {
	    Dict_item dict_item = new Dict_item();
	    List hylblist = new ArrayList();
	    dict_item.setDict_code("dm_dwlb_nbdw");
	    dict_item.setQuery_simplepin(hylbbm);
	    hylblist = dict_itemService.getListDict_item(dict_item);
	    for (int i = 0; i < hylblist.size(); i++) {
		HylbForTree temp = new HylbForTree();
		dict_item = (Dict_item) hylblist.get(i);
		temp.setHylbbm(dict_item.getFact_value());
		temp.setHylbmc(dict_item.getDisplay_name());
		if (sessionHylbList != null && sessionHylbList.size() > 0) {
		    sessionHylbList.remove(temp);
		    if (reXml != null && reXml.equals("1"))
			sessionHylbList.add(temp);
		} else {
		    sessionHylbList = new ArrayList();
		    sessionHylbList.add(temp);
		}
	    }
	} else {
	    if (sessionHylbList != null && sessionHylbList.size() > 0) {
		sessionHylbList.remove(hylbForTree);
		if (reXml != null && reXml.equals("1"))
		    sessionHylbList.add(hylbForTree);
	    } else {
		sessionHylbList = new ArrayList();
		sessionHylbList.add(hylbForTree);
	    }
	}
	// 回显选中的行业类别
	reXml = "";
	int listLength = sessionHylbList.size();
	int firstLength = 15 > listLength ? listLength : 15;
	for (int index = 0; index < firstLength; index++) {
	    hylbForTree = (HylbForTree) sessionHylbList.get(index);
	    reXml += hylbForTree.getHylbmc() + ";";
	}
	session.setAttribute("sessionHylbList", sessionHylbList);
	sessionHylbList = null;
	return "success";
    }

    // 设置行业类别根节点下的所有行业
    public String setHylbAll() throws Exception {
	// 行业类型编码
	String hylbflag = id.substring(0, 1);
	Dict_item dict_item = new Dict_item();
	List hylbList = new ArrayList();
	List hylbListTemp = new ArrayList();
	List<HylbForTree> hylbListForTree = new ArrayList();
	// 行业类别根节点
	if ("1".equals(hylbflag)) {
	    // 行业类别"A"旅业，"N"内保，"J"娱乐
	    hylbflag = id.substring(1, 2);
	    // 显示旅业下级子行业
	    if ("A".equals(hylbflag)) {
		dict_item.setDict_code("dm_ywlb");
		hylbList = dict_itemService.getListDict_item(dict_item);
		// 显示内保下级子行业
	    } else if ("N".equals(hylbflag)) {
		// 先获取第三级行业类别
		// 银行
		Dict_item dict_itemYh = new Dict_item();
		dict_itemYh.setDict_code("dm_dwlb_nbdw");
		dict_itemYh.setQuery_simplepin("01");
		hylbListTemp = dict_itemService.getListDict_item(dict_itemYh);
		hylbList.addAll(hylbListTemp);
		// 学校
		Dict_item dict_itemXx = new Dict_item();
		dict_itemXx.setDict_code("dm_dwlb_nbdw");
		dict_itemXx.setQuery_simplepin("02");
		hylbListTemp = dict_itemService.getListDict_item(dict_itemXx);
		hylbList.addAll(hylbListTemp);

		// 再获取第二级行业类别
		dict_item.setDict_code("dm_nbdw_hyfl");
		hylbListTemp = dict_itemService.getListDict_item(dict_item);
		for (int i = 0; i < hylbListTemp.size(); i++) {
		    String hylbbm = ((Dict_item) hylbListTemp.get(i))
			    .getFact_value();
		    if (!"01".equals(hylbbm) && !"02".equals(hylbbm)) {
			hylbList.add(hylbListTemp.get(i));
		    }
		}
		// 显示娱乐下级子行业
	    } else if ("J".equals(hylbflag)) {
		dict_item.setDict_code("dm_ylcsfl(bzh)");
		hylbList = dict_itemService.getListDict_item(dict_item);
	    }
	}
	// 行业类别节点
	for (int i = 0; i < hylbList.size(); i++) {
	    dict_item = (Dict_item) hylbList.get(i);
	    HylbForTree hylbForTree = new HylbForTree();
	    hylbForTree.setHylbmc(dict_item.getDisplay_name());
	    hylbForTree.setHylbbm(dict_item.getFact_value());
	    hylbListForTree.add(hylbForTree);
	}

	HttpSession session = ServletActionContext.getRequest().getSession();
	List<HylbForTree> sessionHylbList = (List) session
		.getAttribute("sessionHylbList");
	int listLength = hylbListForTree.size();
	if (sessionHylbList != null && sessionHylbList.size() > 0) {
	    int seListLength = sessionHylbList.size();
	    if (listLength == seListLength) {
		hylbListForTree.clear();
	    }
	    listLength = hylbListForTree.size();
	}
	// 回显选中的行业类别
	reXml = "";
	int firstLength = 15 > listLength ? listLength : 15;
	for (int index = 0; index < firstLength; index++) {
	    HylbForTree hylbForTree = new HylbForTree();
	    hylbForTree = (HylbForTree) hylbListForTree.get(index);
	    reXml += hylbForTree.getHylbmc() + ";";
	}
	session.setAttribute("sessionHylbList", hylbListForTree);
	hylbListForTree = null;
	sessionHylbList = null;
	id = null;
	return "success";
    }

    // 清除行业类别session
    public String clearHylb() throws Exception {
	HttpSession session = ServletActionContext.getRequest().getSession();
	session.removeAttribute("sessionHylbList");
	return "success";
    }

    // 根据查询条件，查询企业单位
    public String queryQydwList() throws Exception {
	try {
	    GxdwForTree gxdwForTree = new GxdwForTree();
	    gxdwForTree = (GxdwForTree) this.setClass(gxdwForTree, null);
	    Map map = new HashMap();
	    map.put("gxdwbm", gxdwForTree.getGxdwbm());
	    map.put("hylbbm", gxdwForTree.getHylbbm());
	    String hylbbmNext = "";
	    HttpSession session = ServletActionContext.getRequest()
		    .getSession();
	    List<HylbForTree> sessionHylbList = (List) session
		    .getAttribute("sessionHylbList");
	    if (sessionHylbList != null && sessionHylbList.size() > 0) {
		int listLength = sessionHylbList.size();
		for (int index = 0; index < listLength; index++) {
		    HylbForTree hylbForTree = new HylbForTree();
		    hylbForTree = (HylbForTree) sessionHylbList.get(index);
		    hylbbmNext += "'" + hylbForTree.getHylbbm() + "',";
		}
		hylbbmNext = hylbbmNext.substring(0, hylbbmNext.length() - 1);
	    }
	    map.put("hylbbmNext", hylbbmNext);
	    Page page = xctbService.getQydwListForPage(map, 1, 999999999, sort,
		    dir);
	    totalpage = page.getTotalPages();
	    totalrows = page.getTotalRows();
	    List<GxdwForTree> lGxdwForTree = new ArrayList<GxdwForTree>();
	    lGxdwForTree = page.getData();
	    setQydwTabledata(lGxdwForTree);
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    this.result = "";
	    return "success";
	}
	this.result = "success";
	return "success";
    }

    public void setQydwTabledata(List lData) throws Exception {
	List lPro = new ArrayList();
	lPro.add("qybm");
	lPro.add("qybm");
	lPro.add("qymc");
	List lCol = new ArrayList();
	GxdwForTree getGxdwForTree = new GxdwForTree();
	this.setData(getGxdwForTree, lData, lPro, lCol);
	this.tabledata = this.getData();
	totalrows = this.getTotalrows();
    }

    public String addQydw() throws Exception {
	/*
	 * userData += "<Param name='csmc'>"+csString+"</Param>"; userData +=
	 * "<Param name='csbm'>"+cscode+"</Param>"; userData +=
	 * "<Param name='hylxbm'>"+hylxcode+"</Param>"; userData +=
	 * "<Param name='hylxmc'>"+hylxString+"</Param>";
	 */
	GxdwForTree gxdwForTree = new GxdwForTree();
	gxdwForTree = (GxdwForTree) this.setClass(gxdwForTree, null);
	Map map = new HashMap();
	map.put("hylbbm", gxdwForTree.getHylbbm());
	map.put("qybms", gxdwForTree.getQybms());
	List<GxdwForTree> lGxdwForTree = xctbService.getQydwList(map);

	HttpSession session = ServletActionContext.getRequest().getSession();
	List<YlcsjbxxForTree> sessionCsList = (List) session
		.getAttribute("seesionCslist");
	if (sessionCsList != null && sessionCsList.size() > 0) {
	    session.removeAttribute("seesionCslist");
	} else {
	    sessionCsList = new ArrayList();
	    for (int i = 0; i < lGxdwForTree.size(); i++) {
		GxdwForTree getGxdwForTree = lGxdwForTree.get(i);
		YlcsjbxxForTree ylcsjbxxForTree = new YlcsjbxxForTree();
		ylcsjbxxForTree.setCsmc(getGxdwForTree.getQymc());
		ylcsjbxxForTree.setCsbm(getGxdwForTree.getQybm());
		ylcsjbxxForTree.setHylxbm(getGxdwForTree.getHylbbm());
		ylcsjbxxForTree.setHylxmc(getGxdwForTree.getHylbmc());
		ylcsjbxxForTree.setGxdwbm(getGxdwForTree.getGxdwbm());
		ylcsjbxxForTree.setGxdwmc(getGxdwForTree.getGxdwmc());
		sessionCsList.add(ylcsjbxxForTree);
	    }
	}
	session.setAttribute("seesionCslist", sessionCsList);
	sessionCsList = null;
	return "success";
    }
    
    public String queryForExportXctb() {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		session.removeAttribute("xctbExportResult");
		Globalpar glo = this.getCacheGlobalpar("exportmaxrows");
		String maxRows = glo.getGlobalparvalue();
		try {
		    Xctb setXctb = new Xctb();
		    xctb = (Xctb) this.setClass(setXctb, null);
		    Map map = new HashMap();
		    map.put("bt", xctb.getBt());
		    map.put("fbr", xctb.getFbr());
		    map.put("gqbs", xctb.getGqbs());
		    map.put("fbkssj", xctb.getFbkssj());
		    map.put("fbjssj", xctb.getFbjssj());
		    map.put("sxhylbdm", xctb.getSxhylbdm());
		    String[] arrl=xctb.getSxhylbdmall().split(",");
		    String sxhylbdmall="";
		    for (int i = 0; i < arrl.length; i++) {  
		    	sxhylbdmall +="  sxhylbdm like '%"+arrl[i].replaceAll("'", "")+"%' or";
		    } 
		    
		  //判断默认查询是否包含下发给公安机关的通报
	        if("Y".equals(xctb.getGajgcheck())){
	    	  sxhylbdmall +="  sxhylbdm is null or";
	        }	  
	        map.put("sxhylbdmall", sxhylbdmall.substring(0,sxhylbdmall.length()-2));
   
		    //根据登陆用户 设置查询条件 只能查询本部门和所属部门的信息
		    user = (User)  this.getRequest().getSession().getAttribute(Constants.userKey);
		    String depertCode0 = StringUtil.trimEven0(user.getDepartment().getDepartcode());
		    // 解决重庆铁路分局编码80开头的查询情况
		    //登录单位默认查询
		    int dldwlevel = 0;
		    dldwlevel = user.getDepartment().getDepartlevel();
		    if (dldwlevel > 2) {
		    	map.put("fbdwbm", depertCode0);
		    }
		    //发布单位查询条件
		    int fbdwlevel = 0;
		    if (xctb.getFbdwLevel() != null) {
		    	fbdwlevel  = xctb.getFbdwLevel();
		    }
		    if (fbdwlevel > 2) {
		    	map.put("fbdwbm2", StringUtil.trimEven0(xctb.getFbdwbm()));
		    }
		    
		    if("".equals(xctb.getGajgbm())){
		    	Page page = xctbService.getListForPage(map, 1, Integer.parseInt(maxRows), sort, dir);  
		    	session.setAttribute("xctbExportResult", page.getData());
		    }else{
		    	if(xctb.getFbdwLevel()==null){
		    		map.put("fbdwbm", "");
		    	}
		    	if(xctb.getGajgbm().equals(user.getDepartment().getDepartcode())){
		    		map.put("gajgbm", "#");
		    	}else{
		    		map.put("gajgbm", xctb.getGajgbm());
		    	}
		    	
		    	Page page = xctbService.getListGajg(map, 1, Integer.parseInt(maxRows), sort, dir);
		    	session.setAttribute("xctbExportResult", page.getData());
		    }	    
		    
		} catch (Exception e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		    this.result = "";
		    return "success";
		}
		this.result = "success";
		return "success";	
	}
    
    public void getExcelCreateXctb() throws Exception {
    	ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			// Excel输出
			List lResult = new ArrayList(); // //开头excel
			List xctbList = (List) session.getAttribute("xctbExportResult");
			Xctb setXctb = new Xctb();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(xctbList);
			lResult.add(setXctb);
			this.setExcelCreate("xctb", lResult);
			this.result = "ok";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.result = e.getMessage();
		}
	}
    /**
     * @desc:企业端提示通知通报数
     * @author LL
     * @date Dec 12, 2011
     */
    public String tztbNotReplyNum(){
        try{
            Xctb setXctb = new Xctb();
            setXctb = (Xctb) this.setClass(setXctb, null);
            Map map = new HashMap();
            map.put("qybm", setXctb.getJsdwbm());
            int num = xctbService.getNoReplyNum(map);
            lXctb.add(num);
        }catch(Exception e){
            this.result = "";
            e.printStackTrace();
        }
        this.result = "success";
        return "success";
    }
}