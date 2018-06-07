package utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

public class IpAddressUtils {
	
	@SuppressWarnings("unchecked")
	public static String getIpAddress(String ip) throws Exception{
		//请求的url
		URL url = new URL("http://ip.taobao.com/service/getIpInfo.php?ip="+ip);
		URLConnection connection = url.openConnection();
		//获取输入流,并获取数据
		InputStream inputStream = connection.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String line;
		while((line = reader.readLine())!=null){
			sb.append(line);
		}
		//关闭资源
		reader.close();
		inputStream.close();
		
		//处理json数据
		Map<String,Object> map = JsonUtils.jsonToPojo(sb.toString(), Map.class);
		String code = String.valueOf(map.get("code"));
		if(code.equals("1")){	//失败
			return "未知IP";
		}
		else{
			//处理数据
			Map<String,Object> data = (Map<String, Object>) map.get("data");
			String country = String.valueOf(data.get("country"));
			String region = String.valueOf(data.get("region"));
			String city = String.valueOf(data.get("city"));
			return country+"-"+region+"-"+city;
		}
		
	}
	
}
