package com.aisino2.jdy.action;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import sun.misc.BASE64Decoder;

import com.aisino2.cache.CacheManager;
import com.aisino2.common.ItemChange;
import com.aisino2.common.QjblUtil;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.web.PageAction;
import com.aisino2.jdy.domain.Jdpxx;
import com.aisino2.jdy.domain.Ljjbxx;
import com.aisino2.jdy.domain.Pjjbxx;
import com.aisino2.jdy.domain.Rdrjbxx;
import com.aisino2.jdy.service.ILjjbxxService;
import com.aisino2.jdy.service.IPjjbxxService;
import com.aisino2.publicsystem.domain.Qyjbxx;
import com.aisino2.publicsystem.domain.Qyryxx;
import com.aisino2.publicsystem.service.IQyryxxService;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * 派件信息
 * 
 * @author hooxin
 * 
 */
public class PjxxAction extends PageAction {
	private IPjjbxxService pjjbxxService;
	private IQyryxxService qyryxxService;
	private ILjjbxxService ljjbxxService;
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

	private String uploadFile;
	
	
	public String getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}

	public void setLjjbxxService(ILjjbxxService ljjbxxService) {
		this.ljjbxxService = ljjbxxService;
	}

	public void setQyryxxService(IQyryxxService qyryxxService) {
		this.qyryxxService = qyryxxService;
	}

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
	 * 
	 * @return
	 * @throws Exception
	 */
	public String insert() throws Exception {
		if (pjxx == null)
			throw new RuntimeException("需要添加的派件信息参数不能为空");
		User curr_user = (User) this.getRequest().getSession()
				.getAttribute(Constants.userKey);

		Qyryxx pjtbr = new Qyryxx();
		pjtbr.setCyrybh(curr_user.getUseraccount());
		pjxx.setPjtbr(pjtbr); // 修正 没有派件填报人的问题。
		pjxx.setPjtbsj(new Date());
		pjjbxxService.insertPjjbxx(pjxx);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 删除一个派件信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		if (pjxx == null)
			throw new RuntimeException("需要删除的派件信息参数不能为空");
		pjjbxxService.deletePjjbxx(pjxx);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 更改一个派件信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		if (pjxx == null)
			throw new RuntimeException("需要修改的派件信息参数不能为空");

		pjjbxxService.updatePjjbxx(pjxx);

		this.result = SUCCESS;
		return SUCCESS;
	}

	/**
	 * 查询派件信息分页列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querylist() throws Exception {

		// ActionContext ctx = ActionContext.getContext();
		// HttpServletRequest request = (HttpServletRequest)
		// ctx.get(ServletActionContext.HTTP_REQUEST);
		// HttpSession session = ServletActionContext.getRequest().getSession();
		// session.removeAttribute("Pjjbxxdaocchucxtj");// 清除session中的导出查询条件

		// 如果派件查询参数不为空的话，配置数据库的查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		if (pjxx != null) {
			// 揽件信息查询
			if (pjxx.getLjjbxx() != null) {
				params.put("ljjbxx", pjxx.getLjjbxx());
			}
			// 代收人
			if (pjxx.getDsr() != null) {
				params.put("dsr", pjxx.getDsr());
			}

		}
		// 登记时间
		if (pjtbsjf != null) {
			params.put("pjtbsjf", pjtbsjf);
		}
		if (pjtbsjt != null) {
			params.put("pjtbsjt", pjtbsjt);
		}
		// 派件时间
		if (pjsjf != null) {
			params.put("pjsjf", pjsjf);
		}
		if (pjsjt != null) {
			params.put("pjsjt", pjsjt);
		}
		// 派件人
		if (pjxx.getPjr() != null) {
			params.put("pjr", pjxx.getPjr());
		}
		// 是否删除标志
		if (pjxx.getSfscbz() != null) {
			params.put("sfscbz", pjxx.getSfscbz());
		}

		// 将查询参数放到session中
		// session.setAttribute("Pjjbxxdaocchucxtj", params);

		Page pageinfo = pjjbxxService.findPjjbxxsForPage(params, pagesize,
				pagerow, sort, dir);
		totalpage = pageinfo.getTotalPages();
		totalrows = pageinfo.getTotalRows();
		lPjjbxxList = pageinfo.getData();

		setTableData(pageinfo.getData());

		this.result = "success";
		return SUCCESS;
	}

	/**
	 * 查询单一派件信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String query() throws Exception {
		if (pjxx == null)
			throw new RuntimeException("需要获取的派件信息参数不能为空");
		pjxx = pjjbxxService.getPjjbxx(pjxx);
		if (pjxx != null && pjxx.getPjtbsj() != null) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender = Calendar.getInstance();
			updateOverTimeCalender.setTime(sdf.parse(sdf.format(pjxx
					.getPjtbsj())));
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar = Calendar.getInstance();
			nowCalendar.setTime(now);
			if ((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				overUpdateTime = true;
			else
				overUpdateTime = false;
			pjxx.setOverUpdateTime(String.valueOf(overUpdateTime));
		}
		// 照片内容不为空将照片内容转换成base64Decoder编码
		if (pjxx.getLjjbxx().getJjr().getZpxx() != null) {
			if (pjxx.getLjjbxx().getJjr().getZpxx().getZpnr() != null) {
				String jjrzpnr;
				sun.misc.BASE64Encoder base64Encoder = new sun.misc.BASE64Encoder();
				jjrzpnr = base64Encoder.encodeBuffer(pjxx.getLjjbxx().getJjr()
						.getZpxx().getZpnr());
				pjxx.getLjjbxx().setJjrzpxx(jjrzpnr);
			}
		}
		if (pjxx.getLjjbxx().getSjr().getZpxx() != null) {
			if (pjxx.getLjjbxx().getSjr().getZpxx().getZpnr() != null) {
				String sjrzpnr;
				sun.misc.BASE64Encoder base64Encoder = new sun.misc.BASE64Encoder();
				sjrzpnr = base64Encoder.encodeBuffer(pjxx.getLjjbxx().getSjr()
						.getZpxx().getZpnr());
				pjxx.getLjjbxx().setSjrzpxx(sjrzpnr);
			}
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

		List lSend = new ArrayList();
		lSend.add("setPjxxSend");
		lSend.add("派发");
		lCol.add(lSend);

		List lUpdate = new ArrayList();
		lUpdate.add("setPjxxUpdate");
		lUpdate.add("修改");
		lCol.add(lUpdate);

		List lDelete = new ArrayList();
		lDelete.add("setPjxxDelete");
		lDelete.add("删除");
		lCol.add(lDelete);

		for (Pjjbxx pj : lData) {
			pj.setDjxh(pj.getLjjbxx().getDjxh());
			pj.setWldh(pj.getLjjbxx().getWldh());
			pj.setPjr_xm(pj.getPjr().getXm());
			pj.setSjr_xm(pj.getLjjbxx().getSjr().getXm());
			pj.setSjr_zjhm(pj.getLjjbxx().getSjr().getZjhm());
			Dict_item dict_item = new Dict_item();
			dict_item.setDict_code("dm_zjlx");
			dict_item.setFact_value(pj.getLjjbxx().getSjr().getZjlx());
			pj.setSjr_zjlx(CacheManager.getCacheDictitemOne(dict_item)
					.getDisplay_name());
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar updateOverTimeCalender = Calendar.getInstance();
			updateOverTimeCalender
					.setTime(sdf.parse(sdf.format(pj.getPjtbsj())));
			updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
			Calendar nowCalendar = Calendar.getInstance();
			nowCalendar.setTime(now);
			if ((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
				pj.setOverUpdateTime("true");
			else
				pj.setOverUpdateTime("false");
			// 可疑寄递标志
			pj.setKybz(pj.getLjjbxx().getKybz());
		}
		Pjjbxx setpjxx = new Pjjbxx();
		this.setData(setpjxx, lData, lPro, lCol);
		this.tabledata = this.getData();
		totalrows = this.getTotalrows();
	}

	/***
	 * 派件信息导出时的查询，企业端
	 * 
	 * @return
	 * @throws Exception
	 */
	public String querycxForExport() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("Pjjbxxdaocjgj");// 清除session中的导出结果
		String maxRows = QjblUtil.queryQjblVal("exportmaxrows");// 最大导出记录数
		if (maxRows == null || "".equals(maxRows)) {
			maxRows = "0";
		}
		try {
			// //如果派件查询参数不为空的话，配置数据库的查询参数
			// Map<String, Object> params = new HashMap<String, Object>();
			// params = (Map) session.getAttribute("Pjjbxxdaocchucxtj");

			// 如果派件查询参数不为空的话，配置数据库的查询参数
			Map<String, Object> params = new HashMap<String, Object>();
			if (pjxx != null) {
				// 揽件信息查询
				if (pjxx.getLjjbxx() != null) {
					params.put("ljjbxx", pjxx.getLjjbxx());
					if (pjxx.getLjjbxx().getQyjbxx() != null) {
						if (StringUtil.isNotEmpty(pjxx.getLjjbxx().getQyjbxx()
								.getGxdwbm())) {
							pjxx.getLjjbxx()
									.getQyjbxx()
									.setGxdwbm(
											StringUtil.trimEven0(pjxx
													.getLjjbxx().getQyjbxx()
													.getGxdwbm()));
						}
					}
				}
				// 代收人
				if (pjxx.getDsr() != null) {
					params.put("dsr", pjxx.getDsr());
				}

			}
			// 登记时间
			if (pjtbsjf != null) {
				params.put("pjtbsjf", pjtbsjf);
			}
			if (pjtbsjt != null) {
				params.put("pjtbsjt", pjtbsjt);
			}
			// 派件时间
			if (pjsjf != null) {
				params.put("pjsjf", pjsjf);
			}
			if (pjsjt != null) {
				params.put("pjsjt", pjsjt);
			}
			// 派件人
			if (pjxx.getPjr() != null) {
				params.put("pjr", pjxx.getPjr());
			}
			// 是否删除标志
			if (pjxx.getSfscbz() != null) {
				params.put("sfscbz", pjxx.getSfscbz());
			}

			Page pageinfo = pjjbxxService.findPjjbxxsForPage(params, 1,
					Integer.parseInt(maxRows), sort, dir);
			totalpage = pageinfo.getTotalPages();
			totalrows = pageinfo.getTotalRows();
			lPjjbxxList = pageinfo.getData();
			for (Pjjbxx pj : lPjjbxxList) {
				pj.setDjxh(pj.getLjjbxx().getDjxh());
				pj.setWldh(pj.getLjjbxx().getWldh());
				pj.setPjr_xm(pj.getPjr().getXm());
				pj.setSjr_xm(pj.getLjjbxx().getSjr().getXm());
				pj.setSjr_zjhm(pj.getLjjbxx().getSjr().getZjhm());
				Dict_item dict_item = new Dict_item();
				dict_item.setDict_code("dm_zjlx");
				dict_item.setFact_value(pj.getLjjbxx().getSjr().getZjlx());
				pj.setSjr_zjlx(CacheManager.getCacheDictitemOne(dict_item)
						.getDisplay_name());
				Date now = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar updateOverTimeCalender = Calendar.getInstance();
				updateOverTimeCalender.setTime(sdf.parse(sdf.format(pj
						.getPjtbsj())));
				updateOverTimeCalender.add(Calendar.DAY_OF_MONTH, 1);
				Calendar nowCalendar = Calendar.getInstance();
				nowCalendar.setTime(now);
				if ((nowCalendar.compareTo(updateOverTimeCalender)) >= 0)
					pj.setOverUpdateTime("true");
				else
					pj.setOverUpdateTime("false");
				// 可疑寄递标志
				pj.setKybz(pj.getLjjbxx().getKybz());
			}
			session.setAttribute("Pjjbxxdaocjgj", lPjjbxxList);
			this.result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			this.result = e.getMessage();
		}
		return "success";
	}

	/***
	 * 派件信息导出
	 */
	public void exportExcel() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.userKey);
		try {
			String bbmc = request.getParameter("bbmc");
			String tabletitle = request.getParameter("tabletitle");
			// Excel输出
			List lResult = new ArrayList(); // //开头excel
			List pjxxList = (List) session.getAttribute("Pjjbxxdaocjgj");
			Pjjbxx setPjjbxx = new Pjjbxx();
			List lColumn = this.getExcelColumn(tabletitle);
			lResult.add(bbmc);
			lResult.add(lColumn);
			lResult.add(response);
			lResult.add(pjxxList);
			lResult.add(setPjjbxx);
			this.setExcelCreate("Pjxx", lResult);
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
 * 导入派件信息
 * @return
 * @throws Exception
 */
	public String importPjxx() throws Exception {
		List<String> failLjxxs = new ArrayList<String>();
		if(!StringUtil.isNotEmpty(uploadFile)){
			this.result = "excel文件没有导入成功";
			return SUCCESS;
		}
		BASE64Decoder decoder=new BASE64Decoder();
		byte[] xlsfileByte=decoder.decodeBuffer(uploadFile);
		
		InputStream xlsin = new ByteArrayInputStream(xlsfileByte);
		HttpSession session = this.getRequest().getSession();
		User currUser = (User) session.getAttribute(Constants.userKey);
		int jdpxxSize = 6;
		int jdpxxColumn = 22;
		try {
			HSSFWorkbook wb = new HSSFWorkbook(xlsin);
			HSSFSheet sheet = wb.getSheetAt(0);
			Qyryxx tbr = new Qyryxx();
			tbr.setCyrybh(currUser.getUseraccount());
			Qyjbxx qyjbxx = new Qyjbxx();
			qyjbxx.setQybm(currUser.getSsdwbm());
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				Ljjbxx ljxx = new Ljjbxx();
				ljxx.setWldh(getCellString(row.getCell(0)));
				ljxx.setQyjbxx(qyjbxx);
				ljxx = ljjbxxService.getLjjbxx(ljxx);
				
				if (ljxx == null) {
					Rdrjbxx jjr = new Rdrjbxx();
					jjr.setXm(getCellString(row.getCell(1)));
					jjr.setZjlx(getCellString(row.getCell(2)));
					jjr.setZjhm(getCellString(row.getCell(3)));
					jjr.setSsx(getCellString(row.getCell(4)));
					jjr.setSsxmc(ItemChange.codeChange("dm_xzqh", jjr.getSsx()));
					jjr.setXxdz(getCellString(row.getCell(5)));
					jjr.setLxdh(getCellString(row.getCell(6)));
					jjr.setGddh(getCellString(row.getCell(7)));
					ljxx.setJjr(jjr);
					Rdrjbxx sjr = new Rdrjbxx();
					sjr.setXm(getCellString(row.getCell(8)));
					sjr.setZjlx(getCellString(row.getCell(9)));
					sjr.setZjhm(getCellString(row.getCell(10)));
					sjr.setSsx(getCellString(row.getCell(11)));
					sjr.setSsxmc(ItemChange.codeChange("dm_xzqh", sjr.getSsx()));
					sjr.setXxdz(getCellString(row.getCell(12)));
					sjr.setLxdh(getCellString(row.getCell(13)));
					sjr.setGddh(getCellString(row.getCell(14)));
					ljxx.setSjr(sjr);
					Qyryxx ljr = new Qyryxx();
					ljr.setXm(getCellString(row.getCell(15)));
					ljr.setQybm(currUser.getDepartcode() == null ? currUser
							.getDepartment().getDepartcode() : currUser
							.getDepartcode());
					ljxx.setLjr((Qyryxx) qyryxxService.getListQyryxx(ljr)
							.get(0));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					ljxx.setLjsj(sdf.parse(getCellString(row.getCell(16))));

					ljxx.setLjtbr(tbr);
					// jdpxx
					ljxx.setJdp_list(new ArrayList<Jdpxx>());
					int column = jdpxxColumn;
					while (true) {
						boolean ret = false;
						for (int j = column; j < column + jdpxxSize; j++)
							if ((ret = ret || row.getCell(j) != null))
								break;
						if (!ret) {
							break;
						}

						Jdpxx jdpxx = new Jdpxx();
						jdpxx.setJdpmc(getCellString(row.getCell(column)));
						column++;
						jdpxx.setJdpdlx(getCellString(row.getCell(column)));
						column++;
						jdpxx.setJdplx(getCellString(row.getCell(column)));
						column++;
						jdpxx.setJdpsm(getCellString(row.getCell(column)));
						column++;
						jdpxx.setJdpzl(getCellString(row.getCell(column)));
						column++;
						jdpxx.setJdptj(getCellString(row.getCell(column)));
						column++;
						jdpxx.setSfscbz("N");
						jdpxx.setJdpdlxmc(ItemChange.codeChange("dm_jdwpdl", jdpxx.getJdpdlx()));
						jdpxx.setJdplxmc(ItemChange.codeChange("dm_jdwpdl", jdpxx.getJdplx()));
						ljxx.getJdp_list().add(jdpxx);
					}
				}
				
				Pjjbxx pjxx = new Pjjbxx();
				pjxx.setPjtbr(tbr);
				pjxx.setPjtbsj(new Date());
				pjxx.setLjjbxx(ljxx);
				Qyryxx pjr = new Qyryxx();
				pjr.setXm(getCellString(row.getCell(15)));
				pjr.setQybm(currUser.getSsdwbm());
				pjr = (Qyryxx) qyryxxService.getListQyryxx(pjr)
						.get(0);
				pjxx.setPjr(pjr);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				pjxx.setPjsj(sdf.parse(getCellString(row.getCell(16))));
				
				String dsrxm = getCellString(row.getCell(17));
				String dsrzjlx  = getCellString(row.getCell(18));
				String dsrzjhm = getCellString(row.getCell(19));
				if(StringUtil.isNotEmpty(dsrxm) && StringUtil.isNotEmpty(dsrzjlx) && StringUtil.isNotEmpty(dsrzjhm)){
					Rdrjbxx dsr = new Rdrjbxx();
					dsr.setZjhm(dsrzjhm);
					dsr.setXm(dsrxm);
					dsr.setZjlx(dsrzjlx);
					pjxx.setDsr(dsr);
				}
				
				try {
					pjjbxxService.insertPjjbxx(pjxx);
				} catch (Exception e) {
					log.debug(e, e.fillInStackTrace());
					log.error(e);
					if (e.getMessage().contains("ORA-00001"))
						failLjxxs.add(ljxx.getWldh());
				}

			}
		} catch (Exception e) {
			log.error(e);
			log.debug(e, e.fillInStackTrace());
			this.result = "导入模板级解析错误，导入失败";
			return SUCCESS;
		} finally {
			xlsin.close();
		}
		this.result = SUCCESS;
		if (failLjxxs.size() > 0 && failLjxxs.size() < 15)
			this.result = "导入成功，但是物流单号：" + failLjxxs + "重复导入忽略";
		else if(failLjxxs.size()>15)
			this.result = "导入成功，但是部分数据因为重复被忽略,详细参看系统日志";
		return SUCCESS;
	}

	private String getCellString(HSSFCell cell) {
		Object result = null;
		if (cell != null) {

			int cellType = cell.getCellType();

			switch (cellType) {

			case HSSFCell.CELL_TYPE_STRING:
				result = cell.getRichStringCellValue().getString();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				result = (long) cell.getNumericCellValue();
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				result = (long) cell.getNumericCellValue();
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				result = null;
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				result = cell.getBooleanCellValue();
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				result = null;
				break;
			}
		}
		return result != null ? String.valueOf(result) : null;
	}
}
