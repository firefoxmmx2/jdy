package com.aisino2.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.aisino2.cache.CacheManager;
import com.aisino2.sysadmin.Constants;
import com.aisino2.sysadmin.domain.Address;
import com.aisino2.sysadmin.domain.Department;
import com.aisino2.sysadmin.domain.Dict_item;
import com.aisino2.sysadmin.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class PublicUtil {

	static StringBuffer sb = new StringBuffer();
	static String dzxx = "";
	/**
	 * 页面列表中某字段加链接方法
	 * @param col 需要加链接的字段
	 * @param method 链接调用的方法名
	 * @param value 方法中所需传的参数值
	 * @return
	 */
	public static String getHrefCol(String col,String method,String value,boolean bool){
		StringBuffer sb = new StringBuffer();
		sb.append("<a href=\"#\" title=\"");
		sb.append(col);
		sb.append("\" onClick=\"");
		sb.append(method);
		sb.append("('");
		sb.append(value);
		if(bool == true){
			sb.append("')\" class=\"fontbutton\">");
		}else{
			sb.append("')\">");
		}
		sb.append(col);
		sb.append("</a>");
		return sb.toString();
	}
	
	/** 
	 * 翻译字典项，传入字典表的Dict_code，返回map，map中key=Dict_code，value=Display_name
	 * @param Dict_code
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map translateDictZT(String Dict_code) {
		Map map = new HashMap();
		Dict_item dictitem=new Dict_item();
		dictitem.setDict_code(Dict_code);//设置要查的字典项
		List dict_item_mz = CacheManager.getCacheDictitem(dictitem);
		if(dict_item_mz != null && dict_item_mz.size() != 0){
			for (int i = 0; i < dict_item_mz.size(); i++) {
				Dict_item dict = (Dict_item) dict_item_mz.get(i);
				map.put(dict.getFact_value(), dict.getDisplay_name());//将查到的字典放入MAP中
			}
		}
		return map;
	}
	
	/**
	 * 在SQL中拼加查找登陆机构的所有下级机构条件
	 * @param lastName为SQL中主表的别名，且主表中必须有gxdwbm(管辖单位编码)这个字段
	 * @return 字符串类型，可直接放入定义的MAP中,在sqlmap中直接替换类似"where 1=1"这样的字符串
	 * @author kay.G
	 */
	public static String depcode(String lastName){
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpSession session= request.getSession();
		User user= (User)session.getAttribute(Constants.userKey);
		String deptCode = user.getDepartment().getDepartcode();//获取登陆用户的机构编码
		StringBuffer sb = new StringBuffer();
		sb.append(",");
		sb.append("(select dep.departcode from mansys.t_department dep,");
		sb.append("(select departid from mansys.t_department where departcode='");
		sb.append(deptCode);
		sb.append("') parents ");
		sb.append("start with dep.parentdepartid=parents.departid ");
		sb.append("connect by prior  dep.departid=dep.parentdepartid) deps");
		sb.append(" where deps.departcode=");
		if(lastName != null && !lastName.equals("")){
			sb.append(lastName+".");
		}
		sb.append("gxdwbm");
		return sb.toString();
	}
	
	public static String dictSelect(List list){
		StringBuffer sb = new StringBuffer();
		if(list != null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Dict_item dictItem = (Dict_item) list.get(i);
				sb.append("<option value='");
				sb.append(dictItem.getFact_value());
				sb.append("'>");
				sb.append(dictItem.getDisplay_name());
				sb.append("</option>");
			}
		}
		return sb.toString();
	}
	
	/**
	 * 创建机构树
	 * @param list
	 * @param depart
	 * @return
	 */
	public static String createTree(List list,Department depart){
		sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?> \n");
		sb.append("<tree id='0'> \n");
		for (int i = 0; i < list.size(); i++) {
			Department department = (Department) list.get(i);
			if(department.getParentdepartid().equals(depart.getDepartid())){
				if(department.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(department.getDepartname());
					sb.append("' id='");
					sb.append(department.getDepartid());
					sb.append("' im0='books_close.gif' im1='books_open.gif' im2='books_close.gif'");
					sb.append(" open='2' child='1'> \n");
					conTree(list,department);
					sb.append("</item> \n");
				}else{
					sb.append("<item text='");
					sb.append(department.getDepartname());
					sb.append("' id='");
					sb.append(department.getDepartid());
					sb.append("' im0='book.gif' im1='book.gif' im2='book.gif'/> \n");
				}
			}
		}
		sb.append("</tree>");
		return sb.toString();
	}
	
	public static String conTree(List list,Department department){
		for (int i = 0; i < list.size(); i++) {
			Department dept = (Department) list.get(i);
			if(dept.getParentdepartid().equals(department.getDepartid())){
				if(dept.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(dept.getDepartname());
					sb.append("' id='");
					sb.append(dept.getDepartid());
					sb.append("' child='1' im0='books_close.gif' im1='books_open.gif' im2='books_close.gif'> \n");
					//conTree(list,dept);
//					sb.append("<item text=' ' id='999999999999"+i+"'/>");
					sb.append("</item> \n");
				}else{
					sb.append("<item text='");
					sb.append(dept.getDepartname());
					sb.append("' id='");
					sb.append(dept.getDepartid());
					sb.append("' im0='book.gif' im1='book.gif' im2='book.gif'/> \n");
				}
			}
		}
		return sb.toString();
	}
	
	public static String nextTree(List list,Department dept){
		sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?> \n");
		sb.append("<tree id='"+dept.getDepartid()+"'> \n");
		for (int i = 0; i < list.size(); i++) {
			Department department = (Department) list.get(i);
			if(department.getParentdepartid().equals(dept.getDepartid())){
				if(department.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(department.getDepartname());
					sb.append("' id='");
					sb.append(department.getDepartid());
					sb.append("' child='1' im0='books_close.gif' im1='books_open.gif' im2='books_close.gif'/> \n");
				}else{
					sb.append("<item text='");
					sb.append(department.getDepartname());
					sb.append("' id='");
					sb.append(department.getDepartid());
					sb.append("' im0='book.gif' im1='book.gif' im2='book.gif'/> \n");
				}
			}
		}
		sb.append("</tree>");
		return sb.toString();
	}
	
	/**
	 * 创建地址树
	 * @param list
	 * @param depart
	 * @return
	 */
	public static String addressTree(List list,Address address){
		sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?> \n");
		sb.append("<tree id='0'> \n");
		for (int i = 0; i < list.size(); i++) {
			Address adrs = (Address) list.get(i);
			if(adrs.getAddressid().equals(address.getAddressid())){
				if(adrs.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
//					sb.append("' im0='books_close.gif' im1='books_open.gif' im2='books_close.gif'");
					sb.append("' child='1'  call='1' select='1' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					//conAddTree(list,adrs);//调用下面的递归方法
					sb.append("</item> \n");
				}else{
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
//					sb.append("' im0='book.gif' im1='book.gif' im2='book.gif'");
					sb.append("' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					sb.append("</item> \n");
				}
			}
		}
		sb.append("</tree>");
		return sb.toString();
	}
	
	public static String conAddTree(List list,Address address){
		for (int i = 0; i < list.size(); i++) {
			Address adrs = (Address) list.get(i);
			if(adrs.getParentaddressid().equals(address.getAddressid())){
				dzxx += adrs.getAddressname();
				if(adrs.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
					sb.append("' child='1' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					//conAddTree(list,adrs);//继续递归查询
					sb.append("</item> \n");
				}else{
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
					sb.append("' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					sb.append("</item> \n");
				}
			}
		}
		return sb.toString();
	}
	
	public static String nextAddTree(List list,Address address){
		sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?> \n");
		sb.append("<tree id='"+address.getAddressid()+"'> \n");
		for (int i = 0; i < list.size(); i++) {
			Address adrs = (Address) list.get(i);
			if(adrs.getParentaddressid().equals(address.getAddressid())){
				if(adrs.getIsleaf().equals("N")){
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
					sb.append("' child='1' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					//sb.append("<userdata name='dzxx'>"+dzxx+"</userdata> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					sb.append("</item> \n");
				}else{
					sb.append("<item text='");
					sb.append(adrs.getAddressname());
					sb.append("' id='");
					sb.append(adrs.getAddressid());
					sb.append("' tooltip='");
					sb.append(adrs.getAddressname());
					sb.append("'> \n");
					//sb.append("<userdata name='dzxx'>"+dzxx+"</userdata> \n");
					sb.append("<userdata name='fullcode'>"+adrs.getAddressfullcode()+"</userdata> \n");
					sb.append("<userdata name='departid'>"+adrs.getDepartid()+"</userdata> \n");
					sb.append("<userdata name='isleaf'>"+adrs.getIsleaf()+"</userdata> \n");
					sb.append("<userdata name='levle'>"+adrs.getAddresslevel()+"</userdata> \n");
					sb.append("</item> \n");
				}
			}
		}
		sb.append("</tree>");
		return sb.toString();
	}
}
