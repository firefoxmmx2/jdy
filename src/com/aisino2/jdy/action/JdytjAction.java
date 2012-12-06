package com.aisino2.jdy.action;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.aisino2.common.DateToString;
import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdytjxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.IJdytjxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.service.IDict_itemService;
import com.opensymphony.xwork2.ActionContext;

public class JdytjAction extends PageAction {
	private IJdytjxxService jdytjxx_service;
	private IDict_itemService dict_itemService;

	private String tabledata;

	private int totalrows;

	private String result;

	private List<Jdytjxx> jdytjxx_list;

	/**
	 * 数据关联度分析人员列表
	 */
	private List<Rdrjbxx> rdrjbxx_list;

	/**
	 * 数据关联度分析人员实体，参数传递
	 */
	private Rdrjbxx rdrjbxx;

	/**
	 * 统计时间开始
	 */
	private Date tjsjf;
	/**
	 * 统计时间结束
	 */
	private Date tjsjt;
	/**
	 * 管辖单位编码
	 */
	private String gxdwbm;
	/**
	 * 显示数
	 */
	private Integer show_number;

	/**
	 * 机构级别
	 */
	private String departlevel;

	/**
	 * 企业基本信息参数
	 */
	private Qyjbxx qyjbxx;

	/**
	 * 企业基本信息列表结果用
	 */
	private List<Qyjbxx> qyjbxxlist;

	/**
	 * 揽件信息
	 */
	private Ljjbxx ljjbxx;
	/**
	 * 数据关联查询条件,不包含已处理过的数据关联结果 
	 */
	private String nosjjgdone;
	
	/**
	 * 预警参数字段 
	 */
	private String yjcs_cl;
	/**
	 * 超过次数
	 */
	private String cgcs;
	/**
	 * 关联预警未处理标识
	 */
	private String tcwcl;
	
	
	public String getYjcs_cl() {
		return yjcs_cl;
	}

	public void setYjcs_cl(String yjcs_cl) {
		this.yjcs_cl = yjcs_cl;
	}

	public String getCgcs() {
		return cgcs;
	}

	public void setCgcs(String cgcs) {
		this.cgcs = cgcs;
	}

	public String getTcwcl() {
		return tcwcl;
	}

	public void setTcwcl(String tcwcl) {
		this.tcwcl = tcwcl;
	}

	public String getNosjjgdone() {
		return nosjjgdone;
	}

	public void setNosjjgdone(String nosjjgdone) {
		this.nosjjgdone = nosjjgdone;
	}

	public Ljjbxx getLjjbxx() {
		return ljjbxx;
	}

	public void setLjjbxx(Ljjbxx ljjbxx) {
		this.ljjbxx = ljjbxx;
	}

	public List<Qyjbxx> getQyjbxxlist() {
		return qyjbxxlist;
	}

	public void setQyjbxxlist(List<Qyjbxx> qyjbxxlist) {
		this.qyjbxxlist = qyjbxxlist;
	}

	public Qyjbxx getQyjbxx() {
		return qyjbxx;
	}

	public void setQyjbxx(Qyjbxx qyjbxx) {
		this.qyjbxx = qyjbxx;
	}

	public String getDepartlevel() {
		return departlevel;
	}

	public void setDepartlevel(String departlevel) {
		this.departlevel = departlevel;
	}

	public List<Rdrjbxx> getRdrjbxx_list() {
		return rdrjbxx_list;
	}

	public void setRdrjbxx_list(List<Rdrjbxx> rdrjbxx_list) {
		this.rdrjbxx_list = rdrjbxx_list;
	}

	public Rdrjbxx getRdrjbxx() {
		return rdrjbxx;
	}

	public void setRdrjbxx(Rdrjbxx rdrjbxx) {
		this.rdrjbxx = rdrjbxx;
	}

	public void setDict_itemService(IDict_itemService dict_itemService) {
		this.dict_itemService = dict_itemService;
	}

	public Integer getShow_number() {
		return show_number;
	}

	public void setShow_number(Integer show_number) {
		this.show_number = show_number;
	}

	public Date getTjsjf() {
		return tjsjf;
	}

	public void setTjsjf(Date tjsjf) {
		this.tjsjf = tjsjf;
	}

	public Date getTjsjt() {
		return tjsjt;
	}

	public void setTjsjt(Date tjsjt) {
		this.tjsjt = tjsjt;
	}

	public String getGxdwbm() {
		return gxdwbm;
	}

	public void setGxdwbm(String gxdwbm) {
		this.gxdwbm = gxdwbm;
	}

	public List<Jdytjxx> getJdytjxx_list() {
		return jdytjxx_list;
	}

	public void setJdytjxx_list(List<Jdytjxx> jdytjxx_list) {
		this.jdytjxx_list = jdytjxx_list;
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

	public void setJdytjxx_service(IJdytjxxService jdytjxx_service) {
		this.jdytjxx_service = jdytjxx_service;
	}

	/**
	 * 个人寄件量统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryGrjjltj() throws Exception {

		Map<String, Object> paramap = new HashMap<String, Object>();

		if (tjsjf != null)
			paramap.put("ljsjf", tjsjf);
		if (tjsjt != null)
			paramap.put("ljsjt", tjsjt);

		if (StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if (show_number != null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getJjltj(paramap);

		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();

		setTabledataJddxtj(jdytjxx_list);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 个人收件量统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryGrsjltj() throws Exception {
		Map<String, Object> paramap = new HashMap<String, Object>();

		if (tjsjf != null)
			paramap.put("ljsjf", tjsjf);
		if (tjsjt != null)
			paramap.put("ljsjt", tjsjt);

		if (StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if (show_number != null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getSjltj(paramap);

		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();

		setTabledataJddxtj(jdytjxx_list);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 企业揽件量统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryQyljltj() throws Exception {
		Map<String, Object> paramap = new HashMap<String, Object>();

		if (tjsjf != null)
			paramap.put("ljsjf", tjsjf);
		if (tjsjt != null)
			paramap.put("ljsjt", tjsjt);

		if (StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if (show_number != null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getQyljltj(paramap);

		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();

		setTabledataQyxxtj(jdytjxx_list);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 企业派件量统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryQypjltj() throws Exception {
		Map<String, Object> paramap = new HashMap<String, Object>();

		if (tjsjf != null)
			paramap.put("pjsjf", tjsjf);
		if (tjsjt != null)
			paramap.put("pjsjt", tjsjt);

		if (StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		if (show_number != null)
			paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getQypjltj(paramap);

		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();

		setTabledataQyxxtj(jdytjxx_list);

		this.result = SUCCESS;

		return SUCCESS;
	}

	/**
	 * 个人寄件量统计 和 个人收件量统计 用表格数据设置器
	 * 
	 * @param ldata
	 */
	private void setTabledataJddxtj(List<Jdytjxx> ldata) {
		List lPro = new ArrayList();
		lPro.add("seqnum");
		lPro.add("seqnum");
		lPro.add("xm");
		lPro.add("cs");
		lPro.add("xxdz");
		lPro.add("lxdh");
		lPro.add("zjhm");

		List lCol = new ArrayList();

		for (int i = 0; i < ldata.size(); i++) {
			ldata.get(i).setSeqnum(i + 1);
		}

		Jdytjxx setJdytjxx = new Jdytjxx();
		this.setData(setJdytjxx, ldata, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/**
	 * 企业揽件量统计 和 企业派件量统计 用表格数据设置器
	 * 
	 * @param ldata
	 */
	private void setTabledataQyxxtj(List<Jdytjxx> ldata) {
		List lPro = new ArrayList();
		lPro.add("qyid");
		lPro.add("seqnum");
		lPro.add("qymc");
		lPro.add("cs");
		lPro.add("xxdz");
		lPro.add("lxdh");
		lPro.add("gxdwmc");

		List lCol = new ArrayList();
		// 详情
		List lDetail = new ArrayList();
		lDetail.add("setQyDetail");
		lDetail.add("详情");

		lCol.add(lDetail);
		// 设置排序号
		for (int i = 0; i < ldata.size(); i++) {
			ldata.get(i).setSeqnum(i + 1);
		}

		Jdytjxx setJdytjxx = new Jdytjxx();
		this.setData(setJdytjxx, ldata, lPro, lCol);

		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/**
	 * 数据关联度分析核实
	 * @return
	 * @throws Exception
	 */
	public String verifySlgjtj() throws Exception{
		try{
			if(rdrjbxx == null)
				throw new RuntimeException("数据关联度分析核实参数传递错误");
			jdytjxx_service.insertVerifySjgltj(rdrjbxx);
			this.result = SUCCESS;
		}catch(RuntimeException e){
			log.error(e);
			log.debug(e,e.fillInStackTrace());
			this.result = e.getMessage();
		}
		return SUCCESS;
	}
	/**
	 * 数据关联度分析查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String slgjtjQuerylist() throws Exception {
		try {
			if (rdrjbxx == null)
				throw new RuntimeException("数据关联度分析查询参数传递错误");
			Map<String, Object> paras = new HashMap<String, Object>();

				paras.put("xm", rdrjbxx.getXm());
				paras.put("xxdz", rdrjbxx.getXxdz());
				paras.put("lxdh", rdrjbxx.getLxdh());
				paras.put("ssx", rdrjbxx.getSsx());
				//添加证件号码
				paras.put("zjhm", rdrjbxx.getZjhm());
				if(StringUtil.isNotEmpty(rdrjbxx.getZjhm()))
					//设置证件类型为身份证号码
					paras.put("zjlx", "11");
				//添加揽件时间筛选
				if(ljjbxx != null && ((ljjbxx.getLjsjf() != null || ljjbxx.getLjsjt() != null)
					|| (ljjbxx.getQyjbxx() != null &&  (ljjbxx.getQyjbxx().getGxdwbm() != null))))
					paras.put("ljjbxx", ljjbxx);
				paras.put("nosjjgdone", nosjjgdone);
				paras.put("yjcs_cl", yjcs_cl);
				paras.put("tcwcl", tcwcl);
				paras.put("cgcs", cgcs);
			Page page = jdytjxx_service.getSjgltj(paras, pagesize, pagerow,
					sort, dir);

			this.totalpage = page.getTotalPages();
			this.totalrows = page.getTotalRows();
			rdrjbxx_list = page.getData();
			setTabledataSjgltj(rdrjbxx_list);

			this.result = SUCCESS;
		} catch (RuntimeException e) {
			this.result = e.getMessage();
			e.printStackTrace();
			log.debug(e, e.fillInStackTrace());
			throw e;
		}

		return SUCCESS;
	}

	/**
	 * 数据关联度分析查询，设置INGRID列表结果函数
	 * 
	 * @param lData
	 */
	private void setTabledataSjgltj(List<Rdrjbxx> lData) {
		List lPro = new ArrayList();
		// 随便设置的一个，详情查询用的列表查询。
		lPro.add("xm");
		lPro.add("xm");
		lPro.add("lxdh");
		lPro.add("xxdz");
		lPro.add("jdrylxmc");
		lPro.add("jdrylx");
		lPro.add("zt");
		
		List lCols = new ArrayList();
		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");

		lCols.add(lDetail);

		// 设置寄递人员类型名称
		Dict_item item = new Dict_item();
		item.setDict_code("dm_jdy_rylx");
		List<Dict_item> dictitemList = dict_itemService.getListDict_item(item);
		Map<String, String> jdrylxDict = new HashMap<String, String>();

		for (Dict_item it : dictitemList) {
			jdrylxDict.put(it.getFact_value(), it.getDisplay_name());
		}

		for (Rdrjbxx r : lData) {
			r.setJdrylxmc(jdrylxDict.get(r.getJdrylx()));
		}

		Rdrjbxx setRdrjbxx = new Rdrjbxx();
		this.setData(setRdrjbxx, lData, lPro, lCols);
		this.tabledata = this.getData();
		this.totalrows = this.getTotalrows();
	}

	/**
	 * 导出数据关联度分析结果
	 * 
	 * @throws Exception
	 */
	public void exportSjgltj() throws Exception {
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		slgjtjQuerylist();
		
        for(Rdrjbxx rdrjbxx : rdrjbxx_list){
            if("1".equals(rdrjbxx.getZt()))
                rdrjbxx.setZt("已核实");
            else if ("0".equals(rdrjbxx.getZt()))
                rdrjbxx.setZt("未核实");
        }
		String[][] tabletitle = { { "姓名", "xm" }, { "电话", "lxdh" },
				{ "地址", "xxdz" }, { "业务类型", "jdrylxmc" },{"预警核实情况","zt"}};
		exportGun(tabletitle,rdrjbxx_list);
		this.result = "success";

	}

	/**
	 * 寄递业运行情况统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querylistYxqk() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!StringUtil.isNotEmpty(gxdwbm))
			gxdwbm = "";
		map.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		map.put("departlevel", departlevel);
		Page page = jdytjxx_service.getYxqktj(map, pagesize, pagerow,
				this.sort, this.dir);
		jdytjxx_list = page.getData();
		this.totalrows = page.getTotalRows();
		this.totalpage = page.getTotalPages();

		setTabledataForYxqk(jdytjxx_list);
		this.result = SUCCESS;

		return SUCCESS;
	}

	private void setTabledataForYxqk(List<Jdytjxx> datalist) {
		List lPro = new ArrayList();
		lPro.add("gxdwbm");
		lPro.add("gxdwmc");
		lPro.add("qyzs");
		lPro.add("zjs");
		lPro.add("cyrys");
		lPro.add("ljs");
		lPro.add("pjs");
		lPro.add("wscqys");

		List lCol = new ArrayList();

		Jdytjxx setJdytjxx = new Jdytjxx();
		this.setData(setJdytjxx, datalist, lPro, lCol);

		this.tabledata = this.getData();
		totalrows = this.getTotalrows();

	}

	/**
	 * 昨日企业揽件派件情况统计
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querylistQyljpjqk() throws Exception {

		Map<String, Object> paras = new HashMap<String, Object>();
		if (!StringUtil.isNotEmpty(gxdwbm))
			gxdwbm = "";

		paras.put("gxdwbm", gxdwbm);
		paras.put("departlevel", departlevel);
		Page page = jdytjxx_service.getQyljpjqktj(paras, pagesize, pagerow,
				sort, dir);
		jdytjxx_list = page.getData();

		this.totalrows = page.getTotalRows();
		this.totalpage = page.getTotalPages();

		setTabledataForQyljpjqk(jdytjxx_list);
		this.result = SUCCESS;
		return SUCCESS;
	}

	private void setTabledataForQyljpjqk(List<Jdytjxx> datalist) {
		List lPro = new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		lPro.add("ljs");
		lPro.add("pjs");
		lPro.add("lxdh");
		lPro.add("zt");

		List lCol = new ArrayList();

		Dict_item item = new Dict_item();
		item.setDict_code("dm_csjlzt");
		List<Dict_item> dictitemList = dict_itemService.getListDict_item(item);
		Map<String, String> csjlztDict = new HashMap<String, String>();

		for (Dict_item it : dictitemList) {
			csjlztDict.put(it.getFact_value(), it.getDisplay_name());
		}
		for (Jdytjxx tj : datalist) {
			tj.setZt(csjlztDict.get(tj.getZt()));
		}

		Jdytjxx setJdytjxx = new Jdytjxx();
		this.setData(setJdytjxx, datalist, lPro, lCol);

		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/**
	 * 台帐弹出用的企业信息查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querylistQyjbxx() throws Exception {
		try {
			if (qyjbxx == null)
				throw new RuntimeException("台帐企业基本信息参数传递错误");
			Map<String, Object> paras = new HashMap<String, Object>();
			paras.put("scbz", qyjbxx.getScbz());
			paras.put("gxdwbm", qyjbxx.getGxdwbm());
			paras.put("hylbdm", qyjbxx.getHylbdm());
			paras.put("zjztdm", qyjbxx.getZjztdm());
			Page page = jdytjxx_service.getJdyQyjbxxList(paras, pagesize,
					pagerow, sort, dir);
			qyjbxxlist = page.getData();

			this.totalrows = page.getTotalRows();
			this.totalpage = page.getTotalPages();

			setTabledataForQyjbxx(qyjbxxlist);
		} catch (RuntimeException e) {
			e.printStackTrace();
			log.debug(e, e.fillInStackTrace());
			this.result = e.getMessage();
			throw e;
		}

		this.result = SUCCESS;
		return SUCCESS;
	}

	private void setTabledataForQyjbxx(List<Qyjbxx> datalist) {
		List lPro = new ArrayList();
		lPro.add("qyid");
		lPro.add("qybm");
		lPro.add("qymc");
		lPro.add("gxdwmc");
		lPro.add("jjlxmc");
		lPro.add("zrs");
		lPro.add("yyztmc");
		lPro.add("zjztmc");
		lPro.add("lxdh");
		lPro.add("zt");

		List lCol = new ArrayList();

		// 翻译状态
		Dict_item item = new Dict_item();
		item.setDict_code("dm_csjlzt");
		List<Dict_item> dictitemList = dict_itemService.getListDict_item(item);
		Map<String, String> csjlztDict = new HashMap<String, String>();

		for (Dict_item it : dictitemList) {
			csjlztDict.put(it.getFact_value(), it.getDisplay_name());
		}
		for (Qyjbxx qy : datalist) {
			qy.setZt(csjlztDict.get(qy.getZt()));
		}

		Qyjbxx setQyjbxx = new Qyjbxx();
		this.setData(setQyjbxx, datalist, lPro, null);

		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/**
	 * 昨日未上传企业情况查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querylistWscqycx() throws Exception {

		try {
			if (qyjbxx == null)
				throw new RuntimeException("未上传企业信息参数传递错误");
			Map<String, Object> paras = new HashMap<String, Object>();
			paras.put("scbz", qyjbxx.getScbz());
			paras.put("gxdwbm", qyjbxx.getGxdwbm());
			paras.put("hylbdm", qyjbxx.getHylbdm());
			paras.put("zjztdm", qyjbxx.getZjztdm());

			Page page = jdytjxx_service.getWscqycx(paras, pagesize, pagerow,
					sort, dir);
			qyjbxxlist = page.getData();

			this.totalrows = page.getTotalRows();
			this.totalpage = page.getTotalPages();

			setTabledataForQyjbxx(qyjbxxlist);
		} catch (RuntimeException e) {
			e.printStackTrace();
			log.debug(e, e.fillInStackTrace());
			this.result = e.getMessage();
			throw e;
		}

		this.result = SUCCESS;
		return SUCCESS;
	}

	public void exportExcelYxqk() throws Exception {
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		querylistYxqk();
		String[][] tabletitle = { { "公安机关", "gxdwmc" }, { "企业总数", "qyzs" },
				{ "装机总数", "zjs" }, { "从业人员数", "cyrys" }, { "昨日揽件数", "ljs" },
				{ "昨日派件数", "pjs" }, { "昨日未上传企业数", "wscqys" } };
		exportGun(tabletitle,jdytjxx_list);
	}
	
	private void exportGun(String[][] tabletitle,List datalist) throws Exception{
		exportGun(tabletitle,datalist,null);
	}
	private void exportGun(String[][] tabletitle,List datalist,String title) throws Exception{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		String sFileName = (new StringBuilder(
				DateToString.getDateTimeNoFormat14(new Date()))).append(".xls")
				.toString();
		String excelExportPath = ServletActionContext.getRequest().getRealPath(
				"Excel");
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
		HttpSession session = request.getSession();

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();
		HSSFRow row = null;
		if (sheet.getRow(0) == null) {
			row = sheet.createRow(0);
			for (int i = 0; i <= tabletitle.length - 1; i++) {
				row.createCell(i);
				row.getCell(i).setCellValue(tabletitle[i][0]);
			}
		}

		Object data = null;
		for (int i = 0; i < datalist.size(); i++) {
			int rownum = i+1;
			if (sheet.getRow(rownum) == null) {
				row = sheet.createRow(rownum);
				
				data = datalist.get(i);
				
				for (int j = 0; j <= tabletitle.length - 1; j++) {
					row.createCell(j);
					
					String value = "";
					Method getmethod = data.getClass().getMethod("get"+tabletitle[j][1].substring(0,1).toUpperCase()+tabletitle[j][1].substring(1));
					value = getmethod.invoke(data) == null ? "" : String.valueOf(getmethod.invoke(data));
					
					row.getCell(j).setCellValue(value);
				}
			}
			
		}
		if (!(new File(excelExportPath)).isDirectory())
			(new File(excelExportPath)).mkdir();
		String sExcelName = (new StringBuilder(String.valueOf(excelExportPath)))
				.append("/").append(sFileName).toString();
		excelExportPath = sExcelName;
		File excleFile = new File(sExcelName);
		if (!excleFile.exists()) {
			excleFile.createNewFile();
		}

		FileOutputStream fOut = new FileOutputStream(excleFile);
		workbook.write(fOut);
		fOut.flush();
		fOut.close();

		excelFilePath = (new StringBuilder("Excel/")).append(sFileName)
				.toString();
		response.setContentType("text/html; charset=UTF-8");
		response.sendRedirect((new StringBuilder(String.valueOf(request
				.getContextPath()))).append("/Excel/").append(sFileName)
				.toString());
		this.result = "success";
	}
	
	/**
	 * 导出昨日未上传企业情况
	 * @throws Exception
	 */
	public void exportExcelWscqy() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		querylistWscqycx();
		
		String[][] tabletitle = {{"企业编码","qybm"},{"企业名称","qymc"},
				{"管辖单位","gxdwmc"},{"经济类型","jjlxmc"},{"总人数","zrs"},
				{"营业状态","yyztmc"},{"装机状态","zjztmc"},{"联系电话","lxdh"},
				{"状态","zt"}};
		exportGun(tabletitle,qyjbxxlist);
	}
	
	/**
	 * 导出昨日企业揽件派件情况
	 * @throws Exception
	 */
	public void exportExcelQyljpjqk() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		querylistQyljpjqk();
		String[][] tabletitle = { { "企业编码", "qybm" }, { "企业名称", "qymc" },
				{ "管辖单位", "gxdwmc" },  { "昨日揽件数", "ljs" },
				{ "昨日派件数", "pjs" },{ "联系电话", "lxdh" }, { "状态", "zt" } };
		exportGun(tabletitle,jdytjxx_list);
	}
	
	/**
	 * 寄递业物品分类统计查询
	 * @return
	 * @throws Exception
	 */
	public String queryJdyWpfltj() throws Exception{
		Map<String, Object> paramap = new HashMap<String, Object>();

		if (tjsjf != null)
			paramap.put("ljsjf", tjsjf);
		if (tjsjt != null)
			paramap.put("ljsjt", tjsjt);

		if (StringUtil.isNotEmpty(gxdwbm))
			paramap.put("gxdwbm", StringUtil.trimEven0(gxdwbm));
		paramap.put("show_number", show_number);
		jdytjxx_list = jdytjxx_service.getWpfltj(paramap);

		this.totalpage = 1;
		this.totalrows = jdytjxx_list.size();

		setTabledataForWpfltj(jdytjxx_list);
		
		this.result = "success";
		return SUCCESS;
	}
	
	private void setTabledataForWpfltj(List<Jdytjxx> datalist){
		List lPro = new ArrayList();
		lPro.add("jdplx");
		lPro.add("jdplx");
		lPro.add("cs");
		
		List lCol = new ArrayList();

		Jdytjxx setJdytjxx = new Jdytjxx();
		this.setData(setJdytjxx, datalist, lPro, lCol);

		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
	public void exportJdyWpfltj() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		queryJdyWpfltj();
		
		String[][] tabletitle = { { "物品分类", "jdplx" }, { "数目", "cs" } };
		exportGun(tabletitle,jdytjxx_list);
	}
	
	public void exportGrsjltj() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		queryGrsjltj();
		String[][] tabletitle = { { "序号", "seqnum" }, 
				{ "姓名", "xm" },
				{"数目","cs"},
				{"详细地址","xxdz"},
				{"联系电话","lxdh"},
				{"证件号码","zjhm"}};
		exportGun(tabletitle,jdytjxx_list);
	}
	
	public void exportQypjltj() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		queryQypjltj();
		String[][] tabletitle = { { "序号", "seqnum" }, 
				{ "企业名称", "qymc" },
				{"数目","cs"},
				{"详细地址","xxdz"},
				{"联系电话","lxdh"},
				{"管辖单位","gxdwmc"}};
		exportGun(tabletitle,jdytjxx_list);
	}
	
	public void exportGrjjltj() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		queryGrjjltj();
		String[][] tabletitle = { { "序号", "seqnum" }, 
				{ "姓名", "xm" },
				{"数目","cs"},
				{"详细地址","xxdz"},
				{"联系电话","lxdh"},
				{"证件号码","zjhm"}};
		exportGun(tabletitle,jdytjxx_list);
	}
	
	public void exportQyljltj() throws Exception{
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "9999999999999";
		}
		this.pagesize = 1;
		this.pagerow = Integer.parseInt(maxRows);
		queryQyljltj();
		String[][] tabletitle = { { "序号", "seqnum" }, 
				{ "企业名称", "qymc" },
				{"数目","cs"},
				{"详细地址","xxdz"},
				{"联系电话","lxdh"},
				{"管辖单位","gxdwmc"}};
		exportGun(tabletitle,jdytjxx_list);
	}
}
