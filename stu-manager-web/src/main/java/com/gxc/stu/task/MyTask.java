package com.gxc.stu.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gxc.stu.pojo.Accesscount;
import com.gxc.stu.service.AccessCountService;

@Component
public class MyTask {

	@Autowired
	private AccessCountService accessCountService;
	
	/**
	 * 每天00:00:00，往访问数量表添加一条数据
	 */
	@Scheduled(cron = "0 0 0 * * ?")
	public void run() {
		accessCountService.addAccessCount(new Accesscount());
	}
	
}
