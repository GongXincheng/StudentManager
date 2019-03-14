package com.gxc.stu.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gxc.stu.pojo.Accesscount;
import com.gxc.stu.pojo.Accessdetail;
import com.gxc.stu.service.AccessCountService;
import com.gxc.stu.service.AccessDetailService;

import utils.RealIPUtils;

public class ViewCountInterceptor implements HandlerInterceptor{

	@Autowired
	private AccessDetailService accessDetailService;
	@Autowired
	private AccessCountService accessCountService;
	
	@Value("${BACK_URL}")
	private String BACK_URL;
	@Value("${LOGIN_URL}")
	private String LOGIN_URL;
	@Value("${USER_URL}")
	private String USER_URL;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		/*
		 * 由于使用了Nginx反向代理，所以获取用户真实IP的方法失效
		 * 获取用户IP访问信息
		 */
		String ip = RealIPUtils.getRealIp(request);
	    //获取访问路径
		String resourcepath = request.getRequestURI();
		//创建 Accessdetail 对象
		Accessdetail accessdetail = new Accessdetail();
		accessdetail.setIp(ip);
		accessdetail.setResourcepath(resourcepath);
		
		/*
		 * 如果请求过于频繁,过滤（防止刷新）
		 * ip地址 和 yyyy-MM-dd HH:mm:s 和 访问URI相同 则不添加
		 */
		String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String selectDate = date1.substring(0, date1.length()-1);
		Accessdetail sameDetail = accessDetailService.findDetailByIpAndDateAndUri(ip,selectDate,resourcepath);
		
		//如果 sameDetail 不为空则取消添加
		if(sameDetail != null){	return true; }
		//执行添加
		accessDetailService.addAccessDetail(accessdetail);

		//#############  更新访问统计表 #####################
		//1.获取访问日期，判断该日期是否存在
		String date = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		Accesscount accessCount =  accessCountService.findAccessCountByDate(date);
		
		//2.如果不存在添一条数据，并设置访问人数为1
		if(accessCount==null){
			Accesscount newAccessCount = new Accesscount();
			newAccessCount.setCount(1);
			newAccessCount.setDate(new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
			accessCountService.addAccessCount(newAccessCount);
			return true;
		}
		
		//3.如果已经存在,更新人数（+1）
		accessCount.setCount(accessCount.getCount() + 1);
		accessCountService.updateAccessCount(accessCount);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(modelAndView!=null){
			//设置后台链接
			modelAndView.addObject("backUrl", BACK_URL);
			//设置登录链接
			modelAndView.addObject("loginUrl", LOGIN_URL);
			modelAndView.addObject("userUrl", USER_URL);
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
