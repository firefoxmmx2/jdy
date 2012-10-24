package com.aisino2.jdy.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.cache.CacheManager;
import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Kyjdwpxx;
import com.aisino2.jdy.service.IKyjdwpxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;
/**
 * 可疑寄递物品信息action
 * @author renhao
 */
public class KyjdwpAction extends PageAction{
    
	private IKyjdwpxxService kyjdwpxxService;
	private Kyjdwpxx kyjdwpxx;
	private String tabledata = "";
	private int totalrows = 0;
	private String result = "";
	private List<Kyjdwpxx> lKyjdwpxx = new ArrayList();
	/**
	 * 是否是禁寄物品查询
	 */
	private String isJjwpcx="0";
	/**
	 * 禁寄物品类型翻译字典
	 */
	private Map<String, String> jjwplxDict;
	
	public Map<String,String> getJjwplxDict(){
		if(jjwplxDict==null){
			jjwplxDict = new HashMap<String, String>();
			Dict_item dict_item = new Dict_item();
			dict_item.setDict_code("dm_jdyjjwplx");
			List<Dict_item> itemlist = CacheManager.getCacheDictitem(dict_item);
			for(Dict_item item : itemlist)
				jjwplxDict.put(item.getFact_value(), item.getDisplay_name());
		}
		return jjwplxDict;
	};
	public String getIsJjwpcx() {
		return isJjwpcx;
	}
	public void setIsJjwpcx(String isJjwpcx) {
		this.isJjwpcx = isJjwpcx;
	}
	public List<Kyjdwpxx> getlKyjdwpxx() {
		return lKyjdwpxx;
	}
	public void setlKyjdwpxx(List<Kyjdwpxx> lKyjdwpxx) {
		this.lKyjdwpxx = lKyjdwpxx;
	}
	public String getTabledata() {
		return tabledata;
	}
	public Kyjdwpxx getKyjdwpxx() {
		return kyjdwpxx;
	}
	public void setKyjdwpxx(Kyjdwpxx kyjdwpxx) {
		this.kyjdwpxx = kyjdwpxx;
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
	public void setKyjdwpxxService(IKyjdwpxxService kyjdwpxxService) {
		this.kyjdwpxxService = kyjdwpxxService;
	}
	


	/**
     *可疑寄递物品信息插入action
     * @author renhao
     */
	public String insert() throws Exception{
	    HttpSession session = this.getRequest().getSession();
		User user = (User)session.getAttribute(Constants.userKey);
		
		kyjdwpxx.setDjsj(new Date());
		
		kyjdwpxxService.insertKyjdwpxx(kyjdwpxx);
		
		this.result="success";
		return SUCCESS;
    }

	/**
	 * 更改揽件信息
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		if(kyjdwpxx == null)
			throw new RuntimeException("需要修改的派件信息参数不能为空");
		kyjdwpxxService.updateKyjdwpxx(kyjdwpxx);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	
	/**
	 * 删除揽件信息
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		if(kyjdwpxx == null)
			throw new RuntimeException("需要删除的派件信息参数不能为空");
		
		kyjdwpxxService.deleteKyjdwpxx(kyjdwpxx);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	public String queryList() throws Exception{
			
       //如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		
		if(kyjdwpxx.getLjjbxx()!=null){//物流单号
			params.put("ljjbxx", kyjdwpxx.getLjjbxx());
			
			if(kyjdwpxx.getLjjbxx().getQyjbxx()!=null){//企业基本信息
				if(kyjdwpxx.getLjjbxx().getQyjbxx().getGxdwbm()!=null){
					kyjdwpxx.getLjjbxx().getQyjbxx().setGxdwbm(StringUtil.trimEven0(kyjdwpxx.getLjjbxx().getQyjbxx().getGxdwbm()));
				}
				params.put("qyjbxx", kyjdwpxx.getLjjbxx().getQyjbxx());
			}
		}
		if(kyjdwpxx.getKywplb()!=null){//可疑物品类别
			params.put("kywplb", kyjdwpxx.getKywplb());
		}
		if(kyjdwpxx.getSbsjf()!=null){//上报开始时间
			params.put("sbsjf", kyjdwpxx.getSbsjf());
		}
		if(kyjdwpxx.getSbsjt()!=null){//上报截止时间
			params.put("sbsjt", kyjdwpxx.getSbsjt());
		}
		
		params.put("kyjdwpxxcxbz", kyjdwpxx.getKyjdwpxxcxbz());//可疑寄递物品企业端、公安端查询标志
		//////////////@fixed 添加禁寄物品类型////////////
		//是否是禁寄物品查询
		params.put("isJjwpcx", isJjwpcx);
//		禁寄物品类型条件
		params.put("jjwplx", kyjdwpxx.getJjwplx());
		///////////////添加禁寄物品类型////////////////
		Page pageinfo = kyjdwpxxService.findKyjdwpxxsForPage(params, pagesize, pagerow, sort, dir);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lKyjdwpxx = pageinfo.getData();
		
		if("gadcxbz".equals(kyjdwpxx.getKyjdwpxxcxbz())){
			setTableDategad_ljjbxx(pageinfo.getData());
		}
//////////////@fixed 添加禁寄物品类型////////////
		else if("1".equals(isJjwpcx)){
			setTableDateJjwpGad_ljjbxx(pageinfo.getData());
		}
///////////////添加禁寄物品类型////////////////
		else{
			setTableDate_ljjbxx(pageinfo.getData());
		}
		
		this.result = "success";
		return SUCCESS;
	}
	/***揽件基本信息主页面企业端setable方法***/
	private void setTableDate_ljjbxx(List<Kyjdwpxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("ljjbxx_id");
		lPro.add("wldhlb");
		lPro.add("jdpmc");
		lPro.add("jjrxm");
		lPro.add("jjrzjlx");
		lPro.add("jjrzjhm");
		lPro.add("jdpdlxmc");
		lPro.add("jdplxmc");
		lPro.add("bgrxm");
		lPro.add("bgsj");
		lPro.add("kywplb");
		lPro.add("djsjbz");
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setKyjdwpxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		
		List lUpdate = new ArrayList();
		lUpdate.add("setKyjdwpxxUpdate");
		lUpdate.add("修改");
		lCol.add(lUpdate);
		

		List lDelete=new ArrayList();
		lDelete.add("setKyjdwpxxDelete");
		lDelete.add("删除");
		lCol.add(lDelete);
		
		for(Kyjdwpxx kyjdwpxx : lData){
			//kyjdwp.setLjjbxx_id(kyjdwpxx.getLjjbxx_id());//可疑物品信息ID
			kyjdwpxx.setWldhlb(kyjdwpxx.getLjjbxx().getWldh());//物流单号
			kyjdwpxx.setJdpmc(kyjdwpxx.getJdpxx().getJdpmc());//寄递品名称
			kyjdwpxx.setJjrxm(kyjdwpxx.getJjr().getXm());//寄件人姓名
			//kyjdwpxx.setJjrzjlx(kyjdwpxx.getJjr().getZjlx());//寄件人证件类型
			if(kyjdwpxx.getJjr().getZjlx().equals("11")){
				kyjdwpxx.setJjrzjlx("身份证");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("13")){
				kyjdwpxx.setJjrzjlx("户口薄");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("90")){
				kyjdwpxx.setJjrzjlx("军官证");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("91")){
				kyjdwpxx.setJjrzjlx("警官证");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("92")){
				kyjdwpxx.setJjrzjlx("士兵证");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("93")){
				kyjdwpxx.setJjrzjlx("护照");//寄件人证件类型
			}
			if(kyjdwpxx.getJjr().getZjlx().equals("99")){
				kyjdwpxx.setJjrzjlx("其他");//寄件人证件类型
			}
			kyjdwpxx.setJjrzjhm(kyjdwpxx.getJjr().getZjhm());//寄件人证件号码
			kyjdwpxx.setJdpdlxmc(kyjdwpxx.getJdpxx().getJdpdlxmc());//寄递品大类名称
			kyjdwpxx.setJdplxmc(kyjdwpxx.getJdpxx().getJdplxmc());//寄递品小类名称
			if(kyjdwpxx.getKywplb().equals("1")){//可疑物品类别
				kyjdwpxx.setKywplb("丢失");
			}
			if(kyjdwpxx.getKywplb().equals("2")){//可疑物品类别
				kyjdwpxx.setKywplb("禁寄品");
			}
			if(kyjdwpxx.getKywplb().equals("3")){//可疑物品类别
				kyjdwpxx.setKywplb("其他");
			}
			kyjdwpxx.setBgrxm(kyjdwpxx.getBgr().getXm());//报告人姓名
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender =  Calendar.getInstance();
			try {
				updateOverTimeCalender.setTime(sdf.parse(sdf.format(kyjdwpxx.getDjsj())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar=Calendar.getInstance();
			nowCalendar.setTime(now);
			if((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				kyjdwpxx.setDjsjbz("Y");
			else
				kyjdwpxx.setDjsjbz("N");
			
		}
		Kyjdwpxx setkyjdwpxx = new Kyjdwpxx();
		this.setData(setkyjdwpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	/***揽件基本信息主页面公安端setable方法***/
	private void setTableDategad_ljjbxx(List<Kyjdwpxx> lData) {
		List lPro = new ArrayList();
		lPro.add("ljjbxx_id");
		lPro.add("jdpmc");//
		lPro.add("qymc");//
		lPro.add("wldhlb");
		lPro.add("kywplb");
		lPro.add("bgrxm");
		lPro.add("bgsj");
		lPro.add("jjrxm");
		lPro.add("sjrxm");//
		lPro.add("jdpdlxmc");
		lPro.add("jdplxmc");
		lPro.add("ljtbsj");//
		lPro.add("qyid");//
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setKyjdwpxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		for(Kyjdwpxx kyjdwpxx : lData){
			//kyjdwp.setLjjbxx_id(kyjdwpxx.getLjjbxx_id());//可疑物品信息ID
			kyjdwpxx.setWldhlb(kyjdwpxx.getLjjbxx().getWldh());//物流单号
			kyjdwpxx.setJdpmc(kyjdwpxx.getJdpxx().getJdpmc());//寄递品名称
			kyjdwpxx.setJjrxm(kyjdwpxx.getJjr().getXm());//寄件人姓名
			kyjdwpxx.setSjrxm(kyjdwpxx.getSjr().getXm());//收件人姓名==
			kyjdwpxx.setJdpdlxmc(kyjdwpxx.getJdpxx().getJdpdlxmc());//寄递品大类名称
			kyjdwpxx.setJdplxmc(kyjdwpxx.getJdpxx().getJdplxmc());//寄递品小类名称
			if(kyjdwpxx.getKywplb().equals("1")){//可疑物品类别
				kyjdwpxx.setKywplb("丢失");
			}
			if(kyjdwpxx.getKywplb().equals("2")){//可疑物品类别
				kyjdwpxx.setKywplb("禁寄品");
			}
			if(kyjdwpxx.getKywplb().equals("3")){//可疑物品类别
				kyjdwpxx.setKywplb("其他");
			}
			kyjdwpxx.setBgrxm(kyjdwpxx.getBgr().getXm());//报告人姓名
			kyjdwpxx.setLjtbsj(kyjdwpxx.getLjjbxx().getLjtbsj());//揽件填报时间
			kyjdwpxx.setQymc(kyjdwpxx.getLjjbxx().getQyjbxx().getQymc());//企业名称
			kyjdwpxx.setQyid(kyjdwpxx.getLjjbxx().getQyjbxx().getQyid());//企业ID
		}
		Kyjdwpxx setkyjdwpxx = new Kyjdwpxx();
		this.setData(setkyjdwpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
//////////////@fixed 添加禁寄物品类型////////////
	public void setTableDateJjwpGad_ljjbxx(List<Kyjdwpxx> lData) throws Exception{
		List lPro = new ArrayList();
		lPro.add("ljjbxx_id");
		lPro.add("jjrxm");
		lPro.add("jjwplx");
		lPro.add("ljtbsj");//
		lPro.add("gxdwmc");
		lPro.add("xxdz");
		lPro.add("sjrxm");//
		lPro.add("qyid");//
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setKyjdwpxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		for(Kyjdwpxx kyjdwpxx : lData){
			//kyjdwp.setLjjbxx_id(kyjdwpxx.getLjjbxx_id());//可疑物品信息ID
			kyjdwpxx.setWldhlb(kyjdwpxx.getLjjbxx().getWldh());//物流单号
			kyjdwpxx.setJdpmc(kyjdwpxx.getJdpxx().getJdpmc());//寄递品名称
			kyjdwpxx.setJjrxm(kyjdwpxx.getJjr().getXm());//寄件人姓名
			kyjdwpxx.setSjrxm(kyjdwpxx.getSjr().getXm());//收件人姓名==
			kyjdwpxx.setJdpdlxmc(kyjdwpxx.getJdpxx().getJdpdlxmc());//寄递品大类名称
			kyjdwpxx.setJdplxmc(kyjdwpxx.getJdpxx().getJdplxmc());//寄递品小类名称
			kyjdwpxx.setBgrxm(kyjdwpxx.getBgr().getXm());//报告人姓名
			kyjdwpxx.setLjtbsj(kyjdwpxx.getLjjbxx().getLjtbsj());//揽件填报时间
			kyjdwpxx.setQymc(kyjdwpxx.getLjjbxx().getQyjbxx().getQymc());//企业名称
			kyjdwpxx.setQyid(kyjdwpxx.getLjjbxx().getQyjbxx().getQyid());//企业ID
			//禁寄物品类型名称
			kyjdwpxx.setJjwplx(getJjwplxDict().get(kyjdwpxx.getJjwplx()));
			kyjdwpxx.setSjrxxdz(kyjdwpxx.getSjr().getXxdz());
			kyjdwpxx.setGxdwmc(kyjdwpxx.getLjjbxx().getQyjbxx().getGxdwmc());
		}
		Kyjdwpxx setkyjdwpxx = new Kyjdwpxx();
		this.setData(setkyjdwpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
///////////////添加禁寄物品类型////////////////
	/***
	 * 可疑寄递物品信息导出时的查询，公安端
	 * @return
	 * @throws Exception
	 */
		public String querycxForExportgad() throws Exception{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.removeAttribute("Kyjdwpxxdaoc");// 清除session中的导出结果
			String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
			if(maxRows == null || "".equals(maxRows)){
				maxRows = "0";
			}
			try {
				//如果派件查询参数不为空的话，配置数据库的查询参数
				Map<String, Object> params = new HashMap<String, Object>();
				
				if(kyjdwpxx.getLjjbxx()!=null){//物流单号
					params.put("ljjbxx", kyjdwpxx.getLjjbxx());
					
					if(kyjdwpxx.getLjjbxx().getQyjbxx()!=null){//企业基本信息
						if(kyjdwpxx.getLjjbxx().getQyjbxx().getGxdwbm()!=null){
							kyjdwpxx.getLjjbxx().getQyjbxx().setGxdwbm(StringUtil.trimEven0(kyjdwpxx.getLjjbxx().getQyjbxx().getGxdwbm()));
						}
						params.put("qyjbxx", kyjdwpxx.getLjjbxx().getQyjbxx());
					}
				}
				if(kyjdwpxx.getKywplb()!=null){//可疑物品类别
					params.put("kywplb", kyjdwpxx.getKywplb());
				}
				if(kyjdwpxx.getSbsjf()!=null){//上报开始时间
					params.put("sbsjf", kyjdwpxx.getSbsjf());
				}
				if(kyjdwpxx.getSbsjt()!=null){//上报截止时间
					params.put("sbsjt", kyjdwpxx.getSbsjt());
				}
				if(kyjdwpxx.getKyjdwpxxcxbz()!=null){
					params.put("kyjdwpxxcxbz", kyjdwpxx.getKyjdwpxxcxbz());
				}
				//isJjwpcx属于禁忌品查询界面的导出；jjwplx表示禁忌品类型怕以后要加
				params.put("isJjwpcx", isJjwpcx);
				params.put("jjwplx", kyjdwpxx.getJjwplx());
				Page pageinfo = kyjdwpxxService.findKyjdwpxxsForPage(params, 1, Integer.parseInt(maxRows), dir, sort);
				totalpage = pageinfo.getTotalPages();
				totalrows = pageinfo.getTotalRows();
				lKyjdwpxx = pageinfo.getData();
				for(Kyjdwpxx kyjdwpxx : lKyjdwpxx){
					//kyjdwp.setLjjbxx_id(kyjdwpxx.getLjjbxx_id());//可疑物品信息ID
					kyjdwpxx.setWldhlb(kyjdwpxx.getLjjbxx().getWldh());//物流单号
					kyjdwpxx.setJdpmc(kyjdwpxx.getJdpxx().getJdpmc());//寄递品名称
					kyjdwpxx.setJjrxm(kyjdwpxx.getJjr().getXm());//寄件人姓名
					kyjdwpxx.setSjrxm(kyjdwpxx.getSjr().getXm());//收件人姓名==
					kyjdwpxx.setJdpdlxmc(kyjdwpxx.getJdpxx().getJdpdlxmc());//寄递品大类名称
					kyjdwpxx.setJdplxmc(kyjdwpxx.getJdpxx().getJdplxmc());//寄递品小类名称
					if(kyjdwpxx.getKywplb().equals("1")){//可疑物品类别
						kyjdwpxx.setKywplb("丢失");
					}
					if(kyjdwpxx.getKywplb().equals("2")){//可疑物品类别
						kyjdwpxx.setKywplb("禁寄品");
					}
					if(kyjdwpxx.getKywplb().equals("3")){//可疑物品类别
						kyjdwpxx.setKywplb("其他");
					}
					kyjdwpxx.setBgrxm(kyjdwpxx.getBgr().getXm());//报告人姓名
					kyjdwpxx.setLjtbsj(kyjdwpxx.getLjjbxx().getLjtbsj());//揽件填报时间
					kyjdwpxx.setQymc(kyjdwpxx.getLjjbxx().getQyjbxx().getQymc());//企业名称
					kyjdwpxx.setQyid(kyjdwpxx.getLjjbxx().getQyjbxx().getQyid());//企业ID
				}
		    	session.setAttribute("Kyjdwpxxdaoc", lKyjdwpxx);
				this.result = "success";
			} catch (Exception e) {
				e.printStackTrace();
				this.result = e.getMessage();
			}
			return "success";
	    }
	/***
	 * 可疑寄递物品信息导出，公安端
	 */
		public void exportExcelgad() throws Exception {
			ActionContext ctx = ActionContext.getContext();
			HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.userKey);
			try {
				String bbmc = request.getParameter("bbmc");
				String tabletitle = request.getParameter("tabletitle");
				// Excel输出
				List lResult = new ArrayList(); // //开头excel
				List qyryList = (List) session.getAttribute("Kyjdwpxxdaoc");
				Kyjdwpxx setKyjdwpxx=new Kyjdwpxx();
				List lColumn = this.getExcelColumn(tabletitle);
				lResult.add(bbmc);
				lResult.add(lColumn);
				lResult.add(response);
				lResult.add(qyryList);
				lResult.add(setKyjdwpxx);
				this.setExcelCreate("Ljxx", lResult);
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
	
}
