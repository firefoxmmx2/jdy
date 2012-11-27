package com.aisino2.jdy.schudule.filter;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.aisino2.jdy.domain.Yjcs;
import com.aisino2.jdy.schudule.job.YujinJob;
import com.aisino2.jdy.service.IYjcsService;

/**
 * Servlet Filter implementation class YjcsFilter
 */
public class YjcsFilter implements Filter {
	private ApplicationContext context;
	private IYjcsService yjcsService;
	private Logger log = Logger.getLogger(YjcsFilter.class);

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		chain.doFilter(request, response);
	}

	/**
	 * 启动时候运行创建调度程序的任务
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		context = WebApplicationContextUtils.getWebApplicationContext(fConfig.getServletContext());
		yjcsService = (IYjcsService)context.getBean("YjcsServiceImpl");
		
		try {
			buildYjcsSchedule();
		} catch (Exception e) {
			log.error(e);
			log.debug(e,e.fillInStackTrace());
			return;
		}
	}

	public void destroy() {
	}

	/**
	 * 创建预警参数的计划任务
	 * @throws SchedulerException 
	 * @throws ParseException 
	 */
	public void buildYjcsSchedule() throws SchedulerException, ParseException{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("zt", "1");
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
