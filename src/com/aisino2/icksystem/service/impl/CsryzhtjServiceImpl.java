package com.aisino2.icksystem.service.impl;

import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.icksystem.dao.ICsryzhtjDao;
import com.aisino2.icksystem.service.ICsryzhtjService;

public class CsryzhtjServiceImpl extends BaseService implements ICsryzhtjService{
	private ICsryzhtjDao csryzhtjDao;
	
	public void setCsryzhtjDao(ICsryzhtjDao csryzhtjDao) {
		this.csryzhtjDao = csryzhtjDao;
	}

	public Page getListForPage(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		String dsjg="nvl(tj.dsjgdm,substr(dept.departcode,0,K)||'L') dsjgdm," +
		"nvl(tj.dsjgmc,(select departname from t_department where departcode=substr(dept.departcode,0,K)||'L')) dsjgmc,";
		String fxj="nvl(tj.fxjdm,substr(dept.departcode,0,K)||'L') fxjdm," +
		"nvl(tj.fxjmc,(select departname from t_department where departcode=substr(dept.departcode,0,K)||'L')) fxjmc,";
		String gxdw="nvl(tj.gxdwdm,dept.departcode) gxdwdm,nvl(tj.gxdwmc,dept.departname) gxdwmc";
		String groupBy = "";
		String selectConditon = "";
		String groupBy2 = "";
		String selectConditon2 = "";
		String selectTab="";
		String whereFlg="";
		if (map.get("iszxs")=="1") 
			dsjg=dsjg.replace("K", "2").replace("L", "0000000000");
		else 
			dsjg=dsjg.replace("K", "4").replace("L", "00000000");
		fxj=fxj.replace("K", "6").replace("L", "000000");
		
		if(((String)map.get("gxdwbz")).equalsIgnoreCase("1"))
		{
			groupBy = "dsjgdm,dsjgmc,fxjdm,fxjmc,gxdwdm,gxdwmc";
			selectConditon = groupBy;
			groupBy2 = "c.gxdwbm";
			selectTab = groupBy;
			selectTab=dsjg+fxj+gxdw;
			whereFlg=" and dept.departcode =tj.gxdwdm(+) and dept.departcode =qysc.gxdwdm(+) and dept.departcode =yyrz.gxdwdm(+) and dept.departcode =rysc.gxdwbm(+)";
		}else if(((String)map.get("fxjbz")).equalsIgnoreCase("1"))
		{
			groupBy = "dsjgdm,dsjgmc,fxjdm,fxjmc";
			selectConditon = groupBy + ",'' as gxdwdm,'' as gxdwmc";
			groupBy2 = "c.ssdxjgajgdm";
			selectTab=dsjg+fxj+"'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.fxjdm(+) and dept.departcode =qysc.fxjdm(+) and dept.departcode =yyrz.fxjdm(+) and dept.departcode =rysc.ssdxjgajgdm(+)";
		}else if(((String)map.get("dsjgbz")).equalsIgnoreCase("1"))
		{
			groupBy = "dsjgdm,dsjgmc";
			selectConditon = groupBy + ",'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
			groupBy2 = "c.ssddsjgdm";
			selectTab=dsjg+"'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
			whereFlg=" and dept.departcode =tj.dsjgdm(+) and dept.departcode =qysc.dsjgdm(+) and dept.departcode =yyrz.dsjgdm(+) and dept.departcode =rysc.ssddsjgdm(+)";
		}else{
			groupBy="";
			selectConditon="'' as dsjgdm,'' as dsjgmc,'' as fxjdm,'' as fxjmc,'' as gxdwdm,'' as gxdwmc";
			groupBy2="";
			selectTab=selectConditon;
			whereFlg="";
		}
		map.put("groupBy", groupBy);
		map.put("groupBy2", groupBy2);
		map.put("selectTab", selectTab);
		map.put("selectConditon", selectConditon);
		map.put("selectConditon2", groupBy2);
		map.put("whereFlg", whereFlg);
		return csryzhtjDao.getListForPage(map, pageNo, pageSize, sort, desc);
	}


}
