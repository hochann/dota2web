package com.dota2.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class JsonURL{
	public static <T> List<T> getData(Class<T> clazz,String str) throws Exception{
		//1.请求接口URL
		URL url = new URL(str);
		// 2.获取HttpURRLConnection对象
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		// 3.调用connect方法连接远程资源
		//在调用api接口做测试的时候出现java.io.IOException: Server returned HTTP response code: 403 for URL
	    //因为服务器的安全设置不接受Java程序作为客户端访问，解决方案是设置客户端的User Agent
	    connection.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
		connection.connect();
		// 4.访问资源数据，使用getInputStream方法获取一个输入流用以读取信息
		BufferedReader bReader = new BufferedReader(
	               new InputStreamReader(connection.getInputStream(), "UTF-8"));
		// 对数据进行访问
		String line = null;
		StringBuilder stringBuilder = new StringBuilder(5000*1024);
		while ((line = bReader.readLine()) != null) {
			stringBuilder.append(line);
		}
		// 关闭流
		bReader.close();
		// 关闭链接
		connection.disconnect();
		// 打印获取的结果
		System.out.println(stringBuilder);
		List<T> list = JSON.parseArray(stringBuilder.toString(), clazz);
		return list;
	}
}
