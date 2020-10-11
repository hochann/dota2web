package com.dota2.util;

import java.io.File;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

//上传图片工具类
public class UploadUtil {
	public static String upload(MultipartFile pic) throws Exception{
		//1. 获取图片完整名称
		String fileName = pic.getOriginalFilename();
		if(fileName!=null && fileName.length()>0){
			//2. 使用随机生成的字符串+源图片扩展名组成新的图片名称,防止图片重名
			String newfileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			//3. 将图片保存到硬盘
			pic.transferTo(new File("F:\\image\\" + newfileName));
			return newfileName;
		}
		//4.将图片名称保存到数据库
		//item.setItem_img(newfileName);
		return fileName;
	}
}
