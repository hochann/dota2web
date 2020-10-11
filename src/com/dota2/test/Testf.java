package com.dota2.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.dota2.pojo.Hero;
import com.dota2.service.HeroService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

public class Testf {
	@Autowired//依赖注入
	private HeroService heroService;
	@Test
	public void f1(){
		Date date = new Date();
		System.out.println(date.toString());
		long time = date.getTime();
		System.out.println(time);
		
		//		 155618575 3332
		String l = "1553946131";
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(date2.format(Long.parseLong(l)*1000));
	}
	@Test
	public void fy(){
		int pageNo = 2;
        int pageSize = 10;
        System.out.println(heroService);
        //PageHelper.startPage(pageNo, pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        List<Hero> list = heroService.findAll();
        System.out.println(list);
        PageInfo page = new PageInfo(list);
        System.out.println(page.toString());
	}
}
