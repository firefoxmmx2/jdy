package com.webService.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.aisino2.basicsystem.dao.IBjxxbDao;
import com.aisino2.cache.CacheManager;
import com.aisino2.common.NullEntityResolver;
import com.aisino2.common.StringUtil;
import com.aisino2.sysadmin.domain.Globalpar;
import com.webService.IBaoJingWebService;
public class BaoJingWebServiceImpl implements IBaoJingWebService{
	
 
 	 
 	 
	private IBjxxbDao bjxxbDao;
	public IBjxxbDao getBjxxbDao() {
		return bjxxbDao;
	}
	public void setBjxxbDao(IBjxxbDao bjxxbDao) {
		this.bjxxbDao = bjxxbDao;
	}
	
	public int getBaojingCount(String jqztdm,String gxdwbm) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("jqztdm", jqztdm);
		map.put("gxdwbm", StringUtil.trimEven0(gxdwbm)+"%");
		return bjxxbDao.getBjxxbCount(map);
		
	}
	public int getBaojingCount(String jqztdm,String gxdwbm,String userType) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("jqztdm", jqztdm);
		map.put("gxdwbm", StringUtil.trimEven0(gxdwbm)+"%");
		map.put("hylbdmall", querySelDictinhylb(userType));
		return bjxxbDao.getBjxxbCount(map);
		
	}
	public String getSessionOutA() {
		//      /D:/PROJECTS/scpt/WebRoot/WEB-INF/classes/
		//System.getProperty("user.dir");
		String classPathName="";
		try{
//			 ss= this.getClass().getClassLoader().getResource("").getPath();
//			 ss =ss.replace("/","\\\\");
//			ss = ss.substring(2, ss.length()-9);
//			ss=ss+"web.xml";
			 classPathName = BaoJingWebServiceImpl.class.getClassLoader().getResource("struts.xml").getPath();
		    // String classPathName = BaoJingWebServiceImpl.class.getClassLoader().getResource("web.xml").getPath(); 
			int endingIndex = classPathName.length()-"struts.xml".length();
			classPathName = classPathName.substring(0, endingIndex);
			
			    String sPath="/";
				if(classPathName.indexOf(":")!=-1){
					sPath="\\";
					classPathName =classPathName.replace("/",sPath);
				}
				classPathName = classPathName.substring(0, classPathName.length()-9);
				classPathName=classPathName+sPath+"web.xml";
				

			File file = new File(classPathName);
			SAXReader reader = new SAXReader();
			
			//去掉取消DTD的验证start
			       NullEntityResolver resolver = new NullEntityResolver();
			      reader.setEntityResolver(resolver);
			//去掉取消DTD的验证end
			
//			Document doc = reader.read(file);
//			XMLDocument xmlDocument = new XMLDocument();
//		 	xmlDocument.paseText(doc.asXML());
//		 	XMLElement xml=xmlDocument.getRootElement();
//		 	int time = Integer.parseInt(xml.selectSingleElement("//session-timeout").getText());
		     	 Document xmlDoc=reader.read(file);   
		     	Element	element =xmlDoc.getRootElement();
		     	Element ele = element.element("session-config");
		     	String times =ele.elementText("session-timeout");
			    int time = Integer.parseInt(times);
		 	Globalpar globalpar = new Globalpar();
			globalpar.setGlobalparcode("bjsxzxsj");
			List list = CacheManager.getCacheGlobalpar(globalpar);
			String bjsxzxsj="30";
			if(list!=null&&list.size()>0){
				bjsxzxsj =( ((Globalpar)list.get(0)).getGlobalparvalue()).toString();
				}
		 	return time*60+","+bjsxzxsj;
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("7============"+classPathName);
			return "";//0异常
		}
	}
	
	public int getSessionOut() {
		//      /D:/PROJECTS/scpt/WebRoot/WEB-INF/classes/
		//System.getProperty("user.dir");
		String classPathName="";
		try{
			 classPathName = BaoJingWebServiceImpl.class.getClassLoader().getResource("struts.xml").getPath();
			 //1============/D:/IBM/WebSphere/AppServer/profiles/AppSrv01/installedApps/scptdbCell01/SCPT-GZ_war.ear/SCPT-GZ.war/WEB-INF/classes/struts.xml
			int endingIndex = classPathName.length()-"struts.xml".length();
			classPathName = classPathName.substring(0, endingIndex);
		    String sPath="/";
			if(classPathName.indexOf(":")!=-1){
				sPath="\\";
				classPathName =classPathName.replace("/",sPath);
			}
			classPathName = classPathName.substring(0, classPathName.length()-9);
			classPathName=classPathName+sPath+"web.xml";
			
			File file = new File(classPathName);
			   SAXReader reader=new SAXReader();   
			 //去掉取消DTD的验证start
		       NullEntityResolver resolver = new NullEntityResolver();
		      reader.setEntityResolver(resolver);
		     //去掉取消DTD的验证end
		 	 Document xmlDoc=reader.read(file);   
		     	Element	element =xmlDoc.getRootElement();
		     	Element ele = element.element("session-config");
		     	String times =ele.elementText("session-timeout");
			    int time = Integer.parseInt(times);
		 	   return time*60;

		}catch(Exception e){
			e.printStackTrace();
			return 0;//0异常
		}
	}
	public String getFtpIpAccountPass() {
		// TODO Auto-generated method stub
		Globalpar globalpar = new Globalpar();
		globalpar.setGlobalparcode("ftpip");
		List list = CacheManager.getCacheGlobalpar(globalpar);
		String ftpIP="";
		if(list!=null&&list.size()>0){
			ftpIP =( ((Globalpar)list.get(0)).getGlobalparvalue()).toString();
			}
		globalpar.setGlobalparcode("ftpAccunt");
		List listftpAccunt = CacheManager.getCacheGlobalpar(globalpar);
		String ftpAccunt="";
		if(listftpAccunt!=null&&listftpAccunt.size()>0){
			ftpAccunt =( ((Globalpar)listftpAccunt.get(0)).getGlobalparvalue()).toString();
			}
		globalpar.setGlobalparcode("ftppass");
		List listpass = CacheManager.getCacheGlobalpar(globalpar);
		String ftppass="";
		if(listpass!=null&&listpass.size()>0){
			ftppass =( ((Globalpar)listpass.get(0)).getGlobalparvalue()).toString();
			}
		
		return ftpIP+","+ftpAccunt+","+ftppass;
	}
	/**
	 * 行业类别字典下拉列表查询 in 方式
	 * @return
	 * @throws Exception
	 */	
	public String querySelDictinhylb(String userType) {
		
		String[] utype = userType.split(",");
		if(userType!=null&&userType.startsWith("999")){
			return "'J','K','A','E03','C','B','E01','E02','E04','F01','F02','Z','X','N','E07','C01','T','Z01','RK','Y01','D'";
		}
		for(int i=0;i<utype.length;i++){
				if("11".equals(utype[i]) || "12".equals(utype[i]) || "13".equals(utype[i]) || "14".equals(utype[i]))
					utype[i]="'J'";
				if("141".equals(utype[i]) || "142".equals(utype[i]) || "143".equals(utype[i]) || "144".equals(utype[i]))
					utype[i]="'K'";
				if("24".equals(utype[i]))
					utype[i]="'A'";
				if("32".equals(utype[i]) || "33".equals(utype[i]) || "34".equals(utype[i])|| "35".equals(utype[i])|| "36".equals(utype[i]))
					utype[i]="'E03'";
				if("42".equals(utype[i]) || "43".equals(utype[i]) || "44".equals(utype[i]) || "45".equals(utype[i]) || "46".equals(utype[i]))
					utype[i]="'C'";
				if("51".equals(utype[i]) || "52".equals(utype[i]) || "53".equals(utype[i]) || "55".equals(utype[i]) || "56".equals(utype[i]))
					utype[i]="'B'";
				if("62".equals(utype[i]) || "63".equals(utype[i]) || "64".equals(utype[i]) || "65".equals(utype[i]) || "66".equals(utype[i]))
					utype[i]="'E01'";
				if("72".equals(utype[i]) || "73".equals(utype[i]) || "74".equals(utype[i]) || "75".equals(utype[i]) || "76".equals(utype[i]))
					utype[i]="'E02'";
				if("82".equals(utype[i]) || "83".equals(utype[i]) || "84".equals(utype[i]) || "85".equals(utype[i]) || "86".equals(utype[i]))
					utype[i]="'E04'";
				if("92".equals(utype[i]) || "93".equals(utype[i]) || "94".equals(utype[i]) || "95".equals(utype[i]) || "96".equals(utype[i]))
					utype[i]="'F01'";
				if("102".equals(utype[i]) || "103".equals(utype[i]) || "104".equals(utype[i]) || "105".equals(utype[i]) || "106".equals(utype[i]))
					utype[i]="'F02'";
				if("91".equals(utype[i]))
					utype[i]="'Z'";
				if("112".equals(utype[i]) || "113".equals(utype[i]) || "114".equals(utype[i]) || "115".equals(utype[i]) || "116".equals(utype[i]))
					utype[i]="'X'";
				if("121".equals(utype[i]) || "122".equals(utype[i]) || "125".equals(utype[i])|| "126".equals(utype[i])|| "9998".equals(utype[i]))
					utype[i]="'N'";
				if("164".equals(utype[i]) || "163".equals(utype[i]) || "162".equals(utype[i]) || "165".equals(utype[i]) || "166".equals(utype[i]))
					utype[i]="'E07'";
				if("154".equals(utype[i]) || "153".equals(utype[i])|| "152".equals(utype[i]) || "156".equals(utype[i]) || "155".equals(utype[i]))
					utype[i]="'C01'";
				if("201".equals(utype[i]) || "203".equals(utype[i])|| "202".equals(utype[i]))
					utype[i]="'T'";
				if("224".equals(utype[i]) || "223".equals(utype[i])|| "222".equals(utype[i]))
					utype[i]="'Z01'";
				if("204".equals(utype[i]))
					utype[i]="'RK'";
				if("244".equals(utype[i]) || "243".equals(utype[i])|| "242".equals(utype[i])) 
					utype[i]="'Y01'";
				if("234".equals(utype[i]) || "233".equals(utype[i]))
					utype[i]="'D'";
		}
		
		
			
		return org.apache.commons.lang.StringUtils.join(utype,",");
	}
	
}
