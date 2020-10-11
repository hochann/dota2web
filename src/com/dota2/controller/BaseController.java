package com.dota2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class BaseController {
	/**
	 * 登录权限控制，在处理方法执行前执行该方法
	 * 需要进行管理员登录权限控制的控制器类继承BaseContorller类
	 */
	@ModelAttribute
	public void isLogin(HttpSession session,HttpServletRequest request) {
		if(session.getAttribute("admin")==null){
			throw new RuntimeException("管理员没有登录！");
		}
	}
}
