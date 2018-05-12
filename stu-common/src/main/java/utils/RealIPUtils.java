package utils;

import javax.servlet.http.HttpServletRequest;

public class RealIPUtils {

	/**
	 * 如果使用了Nginx等反向代理
	 * 获取客户端真实IP
	 * @param request
	 * @return
	 */
	public static String getRealIp(HttpServletRequest request){
		String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	       ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	       ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	       ip = request.getRemoteAddr();
	    }  
		return ip;
	}
	
}
