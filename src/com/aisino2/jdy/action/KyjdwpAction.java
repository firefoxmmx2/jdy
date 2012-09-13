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
import com.aisino2.jdy.domain.Kyjdwpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.service.IKyjdwpxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.User;
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
		if(kyjdwpxx.getKyjdwpxxcxbz()!=null){
			params.put("kyjdwpxxcxbz", kyjdwpxx.getKyjdwpxxcxbz());
		}
		Page pageinfo = kyjdwpxxService.findKyjdwpxxsForPage(params, pagesize, pagerow, dir, sort);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lKyjdwpxx = pageinfo.getData();
		
		if(kyjdwpxx.getKyjdwpxxcxbz().equals("gadcxbz")){
			setTableDategad_ljjbxx(pageinfo.getData());
		}else{
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
		}
		Kyjdwpxx setkyjdwpxx = new Kyjdwpxx();
		this.setData(setkyjdwpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	/***揽件基本信息主页面公安端setable方法***/
	private void setTableDategad_ljjbxx(List<Kyjdwpxx> lData) {
		// TODO Auto-generated method stub
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
		}
		Kyjdwpxx setkyjdwpxx = new Kyjdwpxx();
		this.setData(setkyjdwpxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
	
}
