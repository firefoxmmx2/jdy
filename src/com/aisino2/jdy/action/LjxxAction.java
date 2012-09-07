package com.aisino2.jdy.action;

import java.util.ArrayList;
import java.util.Date;
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
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.service.IJdpxxService;
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
	private List<Ljjbxx> lLjjbxx = new ArrayList();
	private Date djsjf;//登记开始时间
	private Date djsjt;//登记截止时间
	private Date ljsjf;//揽件开始时间
	private Date ljsjt;//揽件结束时间
	private String wldh;
	
	
	public Date getLjsjf() {
		return ljsjf;
	}
	public void setLjsjf(Date ljsjf) {
		this.ljsjf = ljsjf;
	}
	public Date getLjsjt() {
		return ljsjt;
	}
	public void setLjsjt(Date ljsjt) {
		this.ljsjt = ljsjt;
	}
	public String getWldh() {
		return wldh;
	}

	public void setWldh(String wldh) {
		this.wldh = wldh;
	}

	public Date getDjsjf() {
		return djsjf;
	}

	public void setDjsjf(Date djsjf) {
		this.djsjf = djsjf;
	}

	public Date getDjsjt() {
		return djsjt;
	}

	public void setDjsjt(Date djsjt) {
		this.djsjt = djsjt;
	}

	public List<Ljjbxx> getlLjjbxx() {
		return lLjjbxx;
	}

	public void setlLjjbxx(List<Ljjbxx> lLjjbxx) {
		this.lLjjbxx = lLjjbxx;
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
		//删除时修改scbzw
		lj.setScbzw("1");
		ljjbxxService.deleteLjjbxx(lj);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	public String queryListlj() throws Exception{
		
//		如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		if(lj.getWldh()!=null){//物流单号
			params.put("wldh", lj.getWldh());
		}
		if(lj.getJjr()!=null){//寄件人信息
			params.put("jjr", lj.getJjr());
		}
		if(lj.getJdpxx()!=null){//寄递品信息
			params.put("jdpxx", lj.getJdpxx());
		}
		if(lj.getLjr()!=null){//揽件人信息
			params.put("ljr", lj.getLjr());
		}
		if(ljsjf!=null){//揽件登记时间开始
			params.put("djsjf", djsjf);
		}
		if(ljsjt!=null){//揽件登记时间结束
			params.put("djsjf", djsjt);
		}
	
		Page pageinfo = ljjbxxService.findLjjbxxForPage(params, pagesize, pagerow, dir, sort);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lLjjbxx = pageinfo.getData();
		
		setTableDate_ljjbxx(pageinfo.getData());
		
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
	private void setTableDate_ljjbxx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("djxh");
		lPro.add("djxh");
		lPro.add("wldh");
		lPro.add("jjrxm");
		lPro.add("jjrzjlx");
		lPro.add("jjrzjhm");
		lPro.add("ljyxm");
		lPro.add("ljtbsj");
		
		List lCol = new ArrayList();
		
		List lky = new ArrayList();
		lky.add("setLjxxKy");
		lky.add("可疑");
		lCol.add(lky);
		
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
		for(Ljjbxx lj : lData){
			lj.setJjrxm(lj.getJjr().getXm());//寄件人姓名
			if(lj.getJjr().getZjlx().equals("11")){
				lj.setJjrzjlx("身份证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("13")){
				lj.setJjrzjlx("户口薄");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("90")){
				lj.setJjrzjlx("军官证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("91")){
				lj.setJjrzjlx("警官证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("92")){
				lj.setJjrzjlx("士兵证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("93")){
				lj.setJjrzjlx("护照");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("99")){
				lj.setJjrzjlx("其他");//寄件人证件类型
			}
			lj.setJjrzjhm(lj.getJjr().getZjhm());//寄件人证件号码
			lj.setLjyxm(lj.getLjr().getXm());//揽件人姓名
		}
		
		Ljjbxx setLjxx = new Ljjbxx();
		//this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
//========================================公安端寄递品信息查询==========================================================================================
	public String jdywxxquerylist() throws Exception{
			
			//如果派件查询参数不为空的话，配置数据库的查询参数
			Map<String, Object> params = new HashMap<String, Object>();
			
			//管辖单位编码、企业名称
			if(lj.getQyjbxx()!=null){
				params.put("gxdwbm", lj.getQyjbxx());
			}
			//揽件基本信息   物流单号
			if(lj.getWldh()!=null){
				params.put("wldh", lj.getWldh());
			}
			//寄件人
			if(lj.getJjr()!=null){
				params.put("jjr", lj.getJjr());
			}
			//收件人
			if(lj.getSjr()!=null){
				params.put("sjr", lj.getSjr());
			}
			//寄递品信息
			if(lj.getJdpxx()!=null){
				params.put("jdpxx", lj.getJdpxx());
			}
			//登记时间
			if(djsjf!=null){
				params.put("djsjf", djsjf);
			}
			if(djsjt!=null){
				params.put("djsjt", djsjt);
			}
			Page pageinfo = ljjbxxService.gadjdpxxForPage(params, pagesize, pagerow, dir, sort);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lLjjbxx = pageinfo.getData();
			
			
			if(lj.getYwcxbz().equals("qydjdywxxcx")){
				setTableDate_qydjdpxxcx(pageinfo.getData());
			}else if(lj.getYwcxbz().equals("gadjdywxxcx")){
				setTableDate_gadjdpxxcx(pageinfo.getData());
			}
			
			
			this.result = "success";
			return SUCCESS;
		}
	/***揽件基本信息主页面setable方法***/
	private void setTableDate_gadjdpxxcx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("djxh");
		lPro.add("qymc");//--
		lPro.add("wldh");
		lPro.add("jjrxm");//--
		lPro.add("jjrzjhm");//--
		lPro.add("sjrxm");//--
		lPro.add("jdpdlxmc");//--
		lPro.add("jdplxmc");//--
		lPro.add("ljtbsj");
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		
		for(Ljjbxx lj : lData){
			lj.setQymc(lj.getQyjbxx().getQymc());//企业名称
			lj.setJjrxm(lj.getJjr().getXm());//寄件人姓名
			lj.setJjrzjhm(lj.getJjr().getZjhm());//寄件人证件号码
			lj.setSjrxm(lj.getSjr().getXm());//收件人姓名
			lj.setJdpdlxmc(lj.getJdpxx().getJdpdlxmc());//寄递品大类型名称
			lj.setJdplxmc(lj.getJdpxx().getJdplxmc());//寄递品小类型名称
		}
		
		Ljjbxx setLjxx = new Ljjbxx();
		//this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	/***企业端 可疑寄递物品信息查询 setable方法***/
	private void setTableDate_qydjdpxxcx(List<Ljjbxx> lData) {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("jdpxxid");
		lPro.add("jdpxxid");//--
		lPro.add("djxh");
		lPro.add("jdpmc");//--
		lPro.add("wldh");
		lPro.add("jjrxm");//--
		lPro.add("jjrzjlx");//--
		lPro.add("jjrzjhm");//--
		lPro.add("ljyxm");//--
		lPro.add("ljtbsj");
		
		
		List lCol = new ArrayList();
		
		List lky = new ArrayList();
		lky.add("setLjxxKy");
		lky.add("可疑");
		lCol.add(lky);
		
		List lDetail = new ArrayList();
		lDetail.add("setLjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);
		
		for(Ljjbxx lj : lData){
			lj.setJdpxxid(lj.getJdpxx().getId());//寄递品信息ID
			lj.setJdpmc(lj.getJdpxx().getJdpmc());//寄递品名称
			lj.setJjrxm(lj.getJjr().getXm());//寄件人姓名
			if(lj.getJjr().getZjlx().equals("11")){
				lj.setJjrzjlx("身份证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("13")){
				lj.setJjrzjlx("户口薄");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("90")){
				lj.setJjrzjlx("军官证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("91")){
				lj.setJjrzjlx("警官证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("92")){
				lj.setJjrzjlx("士兵证");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("93")){
				lj.setJjrzjlx("护照");//寄件人证件类型
			}
			if(lj.getJjr().getZjlx().equals("99")){		
				lj.setJjrzjlx("其他");//寄件人证件类型
			}
			lj.setJjrzjhm(lj.getJjr().getZjhm());//寄件人证件号码
			lj.setLjyxm(lj.getLjr().getXm());//揽件人姓名
			
		}
		
		Ljjbxx setLjxx = new Ljjbxx();
		//this.setDataCustomer(setLjxx, lData, lPro, null, lCol);
		this.setData(setLjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	/**
	 * 验证物流单号是否重复
	 */
	public String wldhsfcf() throws Exception{
		Ljjbxx setLjjbxx = new Ljjbxx();
		setLjjbxx.setWldh(wldh);
		lj = ljjbxxService.getLjjbxx(setLjjbxx);
		
		this.result = "success";
		return SUCCESS;
	}
	
}
