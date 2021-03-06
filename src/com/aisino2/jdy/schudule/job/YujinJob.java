package com.aisino2.jdy.schudule.job;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;

import com.aisino2.common.StringUtil;
import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;
import com.aisino2.jdy.domain.Yjcs;
import com.aisino2.jdy.service.IXxtsService;
import com.aisino2.jdy.service.IYjcsService;
import com.aisino2.sysadmin.domain.User;
import com.aisino2.sysadmin.domain.User_role;
import com.aisino2.sysadmin.service.IUserService;
import com.aisino2.sysadmin.service.IUser_roleService;

public class YujinJob implements Job {
	private IXxtsService xxtsService;
	private IYjcsService yjcsService;
	private IUserService userService;
	private IUser_roleService user_roleService;
	
	public void execute(JobExecutionContext job) throws JobExecutionException {
		Map<String, Object> map = job.getJobDetail().getJobDataMap();
		ApplicationContext context =  (ApplicationContext)map.get("context");
		Yjcs target = (Yjcs) map.get("target");
		xxtsService = (IXxtsService)context.getBean("XxtsServiceImpl");
		yjcsService = (IYjcsService)context.getBean("YjcsServiceImpl");
		userService = (IUserService)context.getBean("userService");
		user_roleService = (IUser_roleService)context.getBean("user_roleService");
		
		
		//设置接收人
		String[] roleid_arr = target.getRoleids().split(",");
		Set<Integer> useridset = new HashSet<Integer>();
		Map<String, Set<User>> userdepartcodemap = new HashMap<String, Set<User>>();
		for(String roleid : roleid_arr){
			User_role ur = new User_role();
			ur.setRoleid(Integer.parseInt(roleid));
			List<User_role> ur_list = user_roleService.getListUser_role(ur);
			for(User_role subur : ur_list){
				if(!useridset.contains(subur.getUserid())){
					User user = new User();
					user.setUserid(subur.getUserid());
					user = userService.getUser(user);
					if(!userdepartcodemap.containsKey(user.getDepartment().getDepartcode())){
						userdepartcodemap.put(user.getDepartment().getDepartcode(), new HashSet<User>());
					}
					userdepartcodemap.get(user.getDepartment().getDepartcode()).add(user);
					useridset.add(subur.getUserid());
				}
			}
		}
		//预警前的执行准备
		if(StringUtil.isNotEmpty(target.getYjzq()))
			yjcsService.executeSQL(target.getYjzq());
		
		//预警执行
		Pattern p = java.util.regex.Pattern.compile("\\{[\\w\\d_]*\\}");
		if(p.matcher(target.getYjyj()).find()){
			for(String departcode : userdepartcodemap.keySet()){
				Map<String, Object> para = new HashMap<String, Object>();
				para.put("gxdwbm", StringUtil.trimEven0(departcode));
				String real_sql = getMsgFormTemplate(target.getYjyj(), para);
				
				//设置消息信息
				Xxts msg = new Xxts();
				msg.setXxbt(target.getYjmc());
				msg.setClhs(target.getClhs());
				Date now = new Date();
				msg.setTssj(now);
				msg.setFsr("系统");
				
				List<Xxyh> xxyh_list = new ArrayList<Xxyh>();
				for(User jsyh : userdepartcodemap.get(departcode)){
					Xxyh xxyh =new Xxyh();
					xxyh.setJsyh(jsyh);
					xxyh.setZt(Xxts.ZT_UNREAD);
					xxyh_list.add(xxyh);
				}
				msg.setXxyh_list(xxyh_list);
				//先清楚以前的数据
				xxtsService.deleteMsg(msg);
				
				Map<String, Object> var  = yjcsService.executeSQL(real_sql);
//				不为空的时候插入消息
				if(var!=null && !var.isEmpty()){
					msg.setXxnr(getMsgFormTemplate(target.getYjxxms(), var));
					//插入新数据
					xxtsService.insertMsg(msg);
				}
			}
		}
		else{
			Map<String, Object> var  = yjcsService.executeSQL(target.getYjyj());
			//设置消息信息
			Xxts msg = new Xxts();
			msg.setXxbt(target.getYjmc());
			msg.setClhs(target.getClhs());
			Date now = new Date();
			msg.setTssj(now);
			msg.setFsr("系统");
			
			List<Xxyh> xxyh_list = new ArrayList<Xxyh>();
			Set<User> user_set_all = new HashSet<User>();
			for(String departcode : userdepartcodemap.keySet()){
				user_set_all.addAll(userdepartcodemap.get(departcode));
			}
			for(User jsyh : user_set_all){
				Xxyh xxyh =new Xxyh();
				xxyh.setJsyh(jsyh);
				xxyh.setZt(Xxts.ZT_UNREAD);
				xxyh_list.add(xxyh);
			}
			msg.setXxyh_list(xxyh_list);
			//先清楚以前的数据
			xxtsService.deleteMsg(msg);
//			不为空的时候插入消息
			if(var!=null && !var.isEmpty()){
				msg.setXxnr(getMsgFormTemplate(target.getYjxxms(), var));
				//插入新数据
				xxtsService.insertMsg(msg);
			}
		}
		
		//预警执行后的处理
		if(StringUtil.isNotEmpty(target.getYjzh()))
			yjcsService.executeSQL(target.getYjzh());
	}

	private String getMsgFormTemplate(String msgTemplate, Map<String, Object> map){
		String msg = msgTemplate;
		for(String key : map.keySet()){
			java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\\{"+key+"\\}");
			Matcher matcher = null;
			if((matcher = pattern.matcher(msg)).find()){
				msg = matcher.replaceAll(String.valueOf(map.get(key)));
			}
		}
		
		return msg;
	}
	
}
