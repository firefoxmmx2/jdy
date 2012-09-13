package com.aisino2.jdy.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aisino2.cache.CacheManager;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.service.IPjjbxxService;
import com.aisino2.publicsystem.domain.Qyryxx;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;

/**
 * 派件信息
 * @author hooxin
 *
 */
public class PjxxAction extends PageAction {
	private IPjjbxxService pjjbxxService;
	/**
	 * 派件信息参数
	 */
	private Pjjbxx pjxx;
	/**
	 * 派件登记时间开始
	 */
	private Date pjtbsjf;
	/**
	 * 派件登记时间结束
	 */
	private Date pjtbsjt;
	
	/**
	 * 派件时间开始 
	 */
	private Date pjsjf;
	/**
	 * 派件时间结束
	 */
	private Date pjsjt;
	
	private String tabledata;
	
	private int totalrows;
	
	private String result;
	
	private List<Pjjbxx> lPjjbxxList;
	
	private boolean overUpdateTime;
	
	
	
	
	public boolean isOverUpdateTime() {
		return overUpdateTime;
	}

	public void setOverUpdateTime(boolean overUpdateTime) {
		this.overUpdateTime = overUpdateTime;
	}

	public int getTotalrows() {
		return totalrows;
	}

	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}

	public List<Pjjbxx> getlPjjbxxList() {
		return lPjjbxxList;
	}

	public void setlPjjbxxList(List<Pjjbxx> lPjjbxxList) {
		this.lPjjbxxList = lPjjbxxList;
	}

	public String getTabledata() {
		return tabledata;
	}

	public void setTabledata(String tabledata) {
		this.tabledata = tabledata;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Date getPjsjf() {
		return pjsjf;
	}

	public void setPjsjf(Date pjsjf) {
		this.pjsjf = pjsjf;
	}

	public Date getPjsjt() {
		return pjsjt;
	}

	public void setPjsjt(Date pjsjt) {
		this.pjsjt = pjsjt;
	}

	public Date getPjtbsjf() {
		return pjtbsjf;
	}

	public void setPjtbsjf(Date pjtbsjf) {
		this.pjtbsjf = pjtbsjf;
	}

	public Date getPjtbsjt() {
		return pjtbsjt;
	}

	public void setPjtbsjt(Date pjtbsjt) {
		this.pjtbsjt = pjtbsjt;
	}

	public Pjjbxx getPjxx() {
		return pjxx;
	}

	public void setPjxx(Pjjbxx pjxx) {
		this.pjxx = pjxx;
	}

	public void setPjjbxxService(IPjjbxxService pjjbxxService) {
		this.pjjbxxService = pjjbxxService;
	}
	
	/**
	 * 添加派件信息
	 * @return
	 * @throws Exception
	 */
	public String insert() throws Exception{
		if(pjxx == null)
			throw new RuntimeException("需要添加的派件信息参数不能为空");
		User curr_user = (User) this.getRequest().getSession().getAttribute(Constants.userKey);
		
		Qyryxx pjtbr = new Qyryxx();
		pjtbr.setCyrybh(curr_user.getUseraccount());
		pjxx.setPjtbr(pjtbr); // 修正 没有派件填报人的问题。
		pjxx.setPjtbsj(new Date());
		pjjbxxService.insertPjjbxx(pjxx);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	
	/**
	 * 删除一个派件信息
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		if(pjxx == null)
			throw new RuntimeException("需要删除的派件信息参数不能为空");
		pjjbxxService.deletePjjbxx(pjxx);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	
	/**
	 * 更改一个派件信息
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception{
		if(pjxx == null)
			throw new RuntimeException("需要修改的派件信息参数不能为空");
		
		pjjbxxService.updatePjjbxx(pjxx);
		
		this.result=SUCCESS;
		return SUCCESS;
	}
	
	/**
	 * 查询派件信息分页列表
	 * @return
	 * @throws Exception
	 */
	public String querylist() throws Exception{
		
//		如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		if(pjxx != null){
//			揽件信息查询
			if(pjxx.getLjjbxx()!=null){
				params.put("ljjbxx", pjxx.getLjjbxx());
			}
//			代收人
			if(pjxx.getDsr()!=null){
				params.put("dsr", pjxx.getDsr());
			}
			
			
		}
//		登记时间
		if(pjtbsjf!=null){
			params.put("pjtbsjf", pjtbsjf);
		}
		if(pjtbsjt!=null){
			params.put("pjtbsjt", pjtbsjt);
		}
//		派件时间
		if(pjsjf!=null){
			params.put("pjsjf", pjsjf);
		}
		if(pjsjt!=null){
			params.put("pjsjt", pjsjt);
		}
		//派件人
		if(pjxx.getPjr()!=null){
			params.put("pjr", pjxx.getPjr());
		}
		//是否删除标志
		if(pjxx.getSfscbz()!=null){
			params.put("sfscbz", pjxx.getSfscbz());
		}
		Page pageinfo = pjjbxxService.findPjjbxxsForPage(params, pagesize, pagerow, sort , dir);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lPjjbxxList = pageinfo.getData();
		
		setTableData(pageinfo.getData());
		
		this.result = "success";
		return SUCCESS;
	}
	
	/**
	 * 查询单一派件信息
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception{
		if(pjxx == null)
			throw new RuntimeException("需要获取的派件信息参数不能为空");
		pjxx = pjjbxxService.getPjjbxx(pjxx);
		if(pjxx!=null && pjxx.getPjtbsj()!=null){
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender =  Calendar.getInstance();
			updateOverTimeCalender.setTime(sdf.parse(sdf.format(pjxx.getPjtbsj())));
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar=Calendar.getInstance();
			nowCalendar.setTime(now);
			if((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				overUpdateTime=true;
			else
				overUpdateTime=false;
			pjxx.setOverUpdateTime(String.valueOf(overUpdateTime));
		}
		
		return SUCCESS;
	}
	
	private void setTableData(List<Pjjbxx> lData) throws ParseException {
		// TODO Auto-generated method stub
		List lPro = new ArrayList();
		lPro.add("id");
		lPro.add("djxh");
		lPro.add("wldh");
		lPro.add("sjr_xm");
		lPro.add("sjr_zjlx");
		lPro.add("sjr_zjhm");
		lPro.add("pjsj");
		lPro.add("pjr_xm");
		lPro.add("pjtbsj");
		lPro.add("zt");
		lPro.add("overUpdateTime");
		lPro.add("kybz");
		
		List lCol = new ArrayList();
		
		List lDetail = new ArrayList();
		lDetail.add("setPjxxDetail");
		lDetail.add("详情");
		lCol.add(lDetail);

		List lSend=new ArrayList();
		lSend.add("setPjxxSend");
		lSend.add("派发");
		lCol.add(lSend);
		
		List lUpdate=new ArrayList();
		lUpdate.add("setPjxxUpdate");
		lUpdate.add("修改");
		lCol.add(lUpdate);
		
		List lDelete=new ArrayList();
		lDelete.add("setPjxxDelete");
		lDelete.add("删除");
		lCol.add(lDelete);
		
		
		for(Pjjbxx pj : lData){
			pj.setDjxh(pj.getLjjbxx().getDjxh());
			pj.setWldh(pj.getLjjbxx().getWldh());
			pj.setPjr_xm(pj.getPjr().getXm());
			pj.setSjr_xm(pj.getLjjbxx().getSjr().getXm());
			pj.setSjr_zjhm(pj.getLjjbxx().getSjr().getZjhm());
			Dict_item dict_item = new Dict_item();
			dict_item.setDict_code("dm_zjlx");
			dict_item.setFact_value(pj.getLjjbxx().getSjr().getZjlx());
			pj.setSjr_zjlx(CacheManager.getCacheDictitemOne(dict_item).getDisplay_name());
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender =  Calendar.getInstance();
			updateOverTimeCalender.setTime(sdf.parse(sdf.format(pj.getPjtbsj())));
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar=Calendar.getInstance();
			nowCalendar.setTime(now);
			if((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				pj.setOverUpdateTime("true");
			else
				pj.setOverUpdateTime("false");
			//可疑寄递标志
			pj.setKybz(pj.getLjjbxx().getKybz());
		}
		Pjjbxx setpjxx = new Pjjbxx();
		this.setData(setpjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}
}
