package com.aisino2.jdy.schudule;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;

import com.aisino2.jdy.domain.Yjcs;
import com.aisino2.jdy.schudule.filter.YjcsFilter;
import com.aisino2.jdy.schudule.job.YujinJob;
import com.aisino2.jdy.service.IYjcsService;

/**
 * 预警参数工厂
 */
public class YjcsSchuduleFactory extends WebApplicationObjectSupport{
	private ApplicationContext context;
	private IYjcsService yjcsService;
	private Logger log = Logger.getLogger(YjcsFilter.class);
	
	public void init(){
		context = getApplicationContext();
		yjcsService = (IYjcsService)context.getBean("YjcsServiceImpl");
		
		try {
			buildYjcsSchedule();
		} catch (Exception e) {
			log.error(e);
			log.debug(e,e.fillInStackTrace());
			return;
		}
	}
	
	/**
	 * 创建预警参数的计划任务
	 * @throws SchedulerException 
	 * @throws ParseException 
	 */
	public void buildYjcsSchedule() throws SchedulerException, ParseException{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("zt", Yjcs.ZT_ON);
		List<Yjcs> yjcs_list = yjcsService.query(params);
		if (yjcs_list.size() == 0)
			return;
		SchedulerFactory schufactory =  new StdSchedulerFactory();

		for(Yjcs yjcs : yjcs_list){
			
			Scheduler sche = schufactory.getScheduler();
			JobDetail jobDetail = new JobDetail(yjcs.getYjmc(),sche.DEFAULT_GROUP,YujinJob.class);
			CronTrigger triger = new CronTrigger(yjcs.getYjmc()+"触发器",sche.DEFAULT_GROUP,yjcs.getYjgzsj());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("context", context);
			map.put("target", yjcs);
			jobDetail.setJobDataMap(new JobDataMap(map));
			sche.scheduleJob(jobDetail, triger);
			sche.start();
		}
		
		
	}
}
