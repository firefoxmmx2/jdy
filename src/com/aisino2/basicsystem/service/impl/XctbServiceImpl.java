package com.aisino2.basicsystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.aisino2.basicsystem.dao.IXctbDao;
import com.aisino2.basicsystem.dao.IXctb_fjDao;
import com.aisino2.basicsystem.dao.IXctbhfDao;
import com.aisino2.basicsystem.dao.IXctbjsdwDao;
import com.aisino2.basicsystem.domain.Xctb;
import com.aisino2.basicsystem.domain.Xctb_fj;
import com.aisino2.basicsystem.domain.Xctbhf;
import com.aisino2.basicsystem.domain.Xctbjsdw;
import com.aisino2.basicsystem.domain.YlcsjbxxForTree;
import com.aisino2.basicsystem.service.IXctbService;
import com.aisino2.cache.CacheManager;
import com.aisino2.common.StringUtil;
import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.sysadmin.dao.IDepartmentDao;
import com.aisino2.sysadmin.domain.Department;
import com.aisino2.sysadmin.domain.Globalpar;

public class XctbServiceImpl extends BaseService implements IXctbService {

	private IXctbDao xctbDao;
	private IXctb_fjDao xctb_fjDao;
	private IXctbjsdwDao xctbjsdwDao;
	private IXctbhfDao xctbhfDao;
	private IDepartmentDao departmentDao;

	public void setXctb_fjDao(IXctb_fjDao xctb_fjDao) {
		this.xctb_fjDao = xctb_fjDao;
	}

	public void setXctbjsdwDao(IXctbjsdwDao xctbjsdwDao) {
		this.xctbjsdwDao = xctbjsdwDao;
	}

	public void setXctbhfDao(IXctbhfDao xctbhfDao) {
		this.xctbhfDao = xctbhfDao;
	}
	
	public void setDepartmentDao(IDepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	/** @param 协查通报(t_xctb) 增加 */
	public Xctb insertXctb(Xctb xctb){
		// TODO: implement
		Xctb resXctb = (Xctb)xctbDao.insertXctb(xctb);
		
		int iTbid=resXctb.getTbid();
		Xctb_fj xctbfj;
		Xctbjsdw xctbjsdw;
		if(xctb.getXctbfj()!=null){
			for (int i=0;i<xctb.getXctbfj().size();i++){
				xctbfj=(Xctb_fj)xctb.getXctbfj().get(i);
				xctbfj.setTbid(iTbid);
				xctb_fjDao.insertXctb_fj(xctbfj);
			}
		}
		
		String jsdwmcStr = xctb.getJsdwmc(); ///接受单位字符串
		String jsdwbmStr = xctb.getJsdwbm(); ///接受单位编码
		StringTokenizer st = new StringTokenizer(jsdwbmStr,";");
		List xctbjsdwList = new ArrayList();

		List<YlcsjbxxForTree> jbxxList = xctb.getXctbjsdw();
		if(jbxxList!=null){
			int listLength = jbxxList.size();
			YlcsjbxxForTree ylcsjbxxForTree;
			for(int index=0;index<listLength;index++){
			    Xctbjsdw oneXctbjsdw = new Xctbjsdw();
			    ylcsjbxxForTree = (YlcsjbxxForTree)jbxxList.get(index);
			    oneXctbjsdw.setTbid(iTbid);
			    oneXctbjsdw.setJsdwbm(ylcsjbxxForTree.getCsbm());
			    oneXctbjsdw.setJsdwmc(ylcsjbxxForTree.getCsmc());
			    oneXctbjsdw.setHylxdm(ylcsjbxxForTree.getHylxbm());
			    oneXctbjsdw.setHylx(ylcsjbxxForTree.getHylxmc());
			    oneXctbjsdw.setGxdwbm(ylcsjbxxForTree.getGxdwbm());
			    oneXctbjsdw.setGxdwmc(ylcsjbxxForTree.getGxdwmc());
			    xctbjsdwDao.insertXctbjsdw(oneXctbjsdw);
			}
			
		}else{
			String []jsdwmcarry = xctb.getJsdwmc().split(";");
			String []jsdwbmarry = xctb.getJsdwbm().split(";");
			int length=jsdwmcarry.length;
			for(int index=0;index<length;index++){
				Xctbjsdw oneXctbjsdw = new Xctbjsdw();
				Department gxdw = new Department();
				Department parentgxdw = new Department();
				gxdw.setDepartcode(jsdwbmarry[index]);
				gxdw = departmentDao.getDepartment(gxdw);
				parentgxdw = departmentDao.getParentDepart(gxdw);
		
				oneXctbjsdw.setTbid(iTbid);
				oneXctbjsdw.setJsdwbm(jsdwbmarry[index]);
				oneXctbjsdw.setJsdwmc(jsdwmcarry[index]);
				oneXctbjsdw.setGxdwbm(parentgxdw.getDepartcode());
				oneXctbjsdw.setGxdwmc(parentgxdw.getDepartname());
				xctbjsdwDao.insertXctbjsdw(oneXctbjsdw);
			}
			
		}
		
		return resXctb;
	}

	/** @param 协查通报(t_xctb) 删除 */
	public boolean deleteXctb(Xctb xctb){
		// TODO: implement
		int iTbid=xctb.getTbid();
		Xctbhf xctbhf = new Xctbhf(); 
		xctbhf.setTbid(iTbid);
		xctbhfDao.deleteXctbhf(xctbhf); //删除回复表
		
		Xctbjsdw xctbjsdw = new Xctbjsdw();
		xctbjsdw.setTbid(iTbid);
		xctbjsdwDao.deleteXctbjsdw(xctbjsdw);///删除接受单位
		
		Xctb_fj xctb_fj = new Xctb_fj();
		xctb_fj.setTbid(iTbid);
		xctb_fjDao.deleteXctb_fj(xctb_fj); //删除附件表
		
		return xctbDao.deleteXctb(xctb)>0;
	}

	/** @param 协查通报(t_xctb) 修改 */
	public boolean updateXctb(Xctb xctb){
		// TODO: implement
		int iTbid=xctb.getTbid();
		Xctb_fj xctb_fj = new Xctb_fj();
		//xctb_fj.setTbid(iTbid);
		if(xctb.getXctbfj()!=null){
			for(int i=0;i<xctb.getXctbfj().size();i++){
				xctb_fj = (Xctb_fj)xctb.getXctbfj().get(i);
				xctb_fj.setTbid(iTbid);
				xctb_fjDao.insertXctb_fj(xctb_fj);
			}
			
		}
		
		return xctbDao.updateXctb(xctb)>0;
	}

	/** @param 协查通报(t_xctb) 查询单条 */
	public Xctb getXctb(Xctb xctb){
		// TODO: implement
		return (Xctb)xctbDao.getXctb(xctb);
	}

	/** @param 协查通报(t_xctb) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return xctbDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}
	
	public Page getListGajg(Map map, int pageNo,int pageSize,String sort,String desc){
		return xctbDao.getListGajg(map, pageNo, pageSize, sort, desc);
	}
	
	
	/** @param 内保单位 协查通报(t_xctb) 分页查询 */
	public Page getListForPageNbdw(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return xctbDao.getListForPageNbdw(map,pageNo,pageSize,sort,desc);
	}

	/** @param 协查通报(t_xctb) 多条查询 */
	public List getListXctb(Xctb xctb){
		// TODO: implement
		return xctbDao.getListXctb(xctb);
	}
	public List getXctbListForBt(Map map){
		return xctbDao.getXctbListForBt(map);
	}
	public IXctbDao getXctbDao() {
		return xctbDao;
	}

	public void setXctbDao(IXctbDao xctbDao) {
		this.xctbDao = xctbDao;
	}
	
	/** @param 协查通报场所(t_xctb) 分页查询 */
	public Page getcsListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return xctbDao.getcsListForPage(map, pageNo, pageSize, sort, desc);
	}
	
	/** @param 协查通报(t_xctb) 多条查询 查询未阅读的协查通报*/
	public List getXctbWydList(Xctb xctb)
	{
		return xctbDao.getXctbWydList(xctb);
	}
	
    /**
     * @param 协查通报企业(t_xctb) 分页查询
     */
    public Page getQydwListForPage(Map map, int pageNo, int pageSize, String sort, String desc) {
	String gxdwbm = (String) map.get("gxdwbm");
	String hylbbm = (String) map.get("hylbbm");
	String hylbbmNext = (String) map.get("hylbbmNext");
	String chaXun = "";
	String trimEven0Gxdwbm = StringUtil.trimEven0(gxdwbm);
	if ("A".equals(hylbbm)) {// 旅馆业
	    chaXun = "select a.qiyebianma qybm, a.qiyemc qymc,  a.yewulbbm hylbbm from t_lvguan a where a.zhuxiaobz = '0'";
	    if (!"".equals(hylbbmNext)) {
		chaXun += " and a.yewulbbm in (" + hylbbmNext + ")";
	    }
	    if (!"".equals(trimEven0Gxdwbm)) {
		chaXun += " and a.gxdwbm like '" + trimEven0Gxdwbm + "%'";
	    }
	} else if ("J".equals(hylbbm)) {// 娱乐业
	    chaXun = "select a.qybm qybm, a.qymc qymc, a.qyzflbm hylbbm from t_qyjbxx a  where a.zxbz = '0' and a.hylbdm = 'J'";
	    if (!"".equals(hylbbmNext)) {
		chaXun += " and a.qyzflbm in (" + hylbbmNext + ")";
	    }
	    if (!"".equals(trimEven0Gxdwbm)) {
		chaXun += " and a.gxdwbm like '" + trimEven0Gxdwbm + "%'";
	    }	    
	} else if ("N".equals(hylbbm)) {// 重点单位
	    chaXun = " select a.qybm qybm, a.qymc qymc, a.dwlbbm hylbbm from t_nbdwjbxx a  where a.zxzt = '0' and a.wsbz = '1'";
	    if (!"".equals(hylbbmNext)) {
		chaXun += " and a.dwlbbm in (" + hylbbmNext + ")";
	    }
	    if (!"".equals(trimEven0Gxdwbm)) {
		chaXun += " and a.gxdwbm like '" + trimEven0Gxdwbm + "%'";
	    }	    
	}
	Map yuju = new HashMap();
	yuju.put("yuju", chaXun);
	return xctbDao.getQydwListForPage(yuju, pageNo, pageSize, sort, desc);
    }
    
    /** @param 协查通报企业(t_xctb) 列表查询 */
    public List getQydwList(Map map){
	String hylbbm = (String) map.get("hylbbm");
	String qybms = (String) map.get("qybms");
	String chaXun = "";
	if ("A".equals(hylbbm)) {// 旅馆业
	    chaXun = "select a.qiyebianma qybm, a.qiyemc qymc,  a.yewulbbm hylbbm, a.yewulb hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_lvguan a where a.zhuxiaobz = '0'";
	    if (!"".equals(qybms)) {
		chaXun += " and a.qiyebianma in (" + qybms + ")";
	    }
	} else if ("J".equals(hylbbm)) {// 娱乐业
	    chaXun = "select a.qybm qybm, a.qymc qymc, a.qyzflbm hylbbm, a.qyzflmc hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_qyjbxx a  where a.zxbz = '0' and a.hylbdm = 'J'";
	    if (!"".equals(qybms)) {
		chaXun += " and a.qybm in (" + qybms + ")";
	    }
	} else if ("N".equals(hylbbm)) {// 重点单位
	    chaXun = " select a.qybm qybm, a.qymc qymc, a.dwlbbm hylbbm, a.dwlb hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_nbdwjbxx a  where a.zxzt = '0'";
	    if (!"".equals(qybms)) {
		chaXun += " and a.qybm in (" + qybms + ")";
	    }
	} else if("Z".equals(hylbbm)){ //出租房屋	    
	    chaXun = " select a.caijidianbm qybm, a.caijidianmc qymc, 'Z' hylbbm, '出租房行业' hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_caijidian a  where a.iszhuxiao = '0'";
	    if (!"".equals(qybms)) {
		chaXun += " and a.caijidianbm in (" + qybms + ")";
	    }	
	} else if("E03".equals(hylbbm)){//典当业
		//获取全局变量ddyversion，解决新老版本问题
	    	String ddyversion = "";
		Globalpar globalpar = new Globalpar();
		globalpar.setGlobalparcode("ddyversion");
		List globalparList = new ArrayList();
		globalparList = CacheManager.getCacheGlobalpar(globalpar);
		if (globalparList != null && globalparList.size() > 0) {
		    Globalpar glo = ((Globalpar) globalparList.get(0));
		    ddyversion = glo.getGlobalparvalue();
		}
		if ("old".equals(ddyversion)) {
		    chaXun = "select a.ddqybm qybm, a.ddqybm qymc, 'E03' hylbbm, '典当业' hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_ddqyxx a  where a.zxbz = '0'";
		    if (!"".equals(qybms)) {
			chaXun += " and a.ddqybm in (" + qybms + ")";
		    }
		} else {
		    chaXun = "select a.qybm qybm, a.qymc qymc, a.qyzflbm hylbbm, a.qyzflmc hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_qyjbxx a  where a.zxbz = '0' and a.hylbdm = '" + hylbbm + "'";
		    if (!"".equals(qybms)) {
			chaXun += " and a.qybm in (" + qybms + ")";
		    }
		}
	} else { // E01二手车、E02二手机、废旧金属、机修、印章等  
	    chaXun = "select a.qybm qybm, a.qymc qymc, a.qyzflbm hylbbm, a.qyzflmc hylbmc, a.gxdwbm gxdwbm, a.gxdwmc gxdwmc from t_qyjbxx a  where a.zxbz = '0' and a.hylbdm = '" + hylbbm + "'";
	    if (!"".equals(qybms)) {
		chaXun += " and a.qybm in (" + qybms + ")";
	    }
	}
	Map yuju = new HashMap();
	yuju.put("yuju", chaXun);
	return xctbDao.getQydwList(yuju);
    }

    /** @param 公安通知通报(webService专用) 多条查询 */
	public List getXctbListForBm(Map map) {
		return xctbDao.getXctbListForBm(map);
	}
	
	/** 企业端提示通知通报数 */
    public int getNoReplyNum(Map map){
        return xctbDao.getNoReplyNum(map);
    }
    //右下角弹出未回复协查通报
    public Page getListWhf(Map map, int pageNo,int pageSize,String sort,String desc){
    	return xctbDao.getListWhf(map, pageNo, pageSize, sort, desc);
    }
}
