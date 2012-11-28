package com.aisino2.jdy.schudule.job;

import java.util.Map;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;

import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Yjcs;
import com.aisino2.jdy.service.IXxtsService;

public class YujinJob implements Job {
	private IXxtsService xxtsService;
	
	public void execute(JobExecutionContext job) throws JobExecutionException {
		Map<String, Object> map = job.getJobDetail().getJobDataMap();
		ApplicationContext context =  (ApplicationContext)map.get("context");
		Yjcs target = (Yjcs) map.get("target");
		xxtsService = (IXxtsService)context.getBean("xxtsService");
		Xxts msg = new Xxts();
		// @ TODO 预警业务
	}

}
