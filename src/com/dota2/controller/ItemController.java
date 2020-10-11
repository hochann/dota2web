package com.dota2.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.service.ItemService;
import com.dota2.util.PageBean;
import com.dota2.util.UploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/item")
public class ItemController extends BaseController{
	@Autowired//依赖注入
	private ItemService itemService;
	private int pageSize=6;//每页数据大小
	//简单查询所有数据
	@RequestMapping("/list")
	public String findAll(Model model,int pageNum) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<Item> list = itemService.findAll();
		PageInfo<Item> pageInfo = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo",pageInfo);
		//System.out.println(list);
		return "item";
	}
	//springMvc可以直接接收基本数据类型,包括string.spirngMvc可以帮你自动进行类型转换.
	//controller方法接收的参数的变量名称必须要等于页面上input框的name属性值
	//spirngMvc可以直接接收pojo类型:要求页面上input框的name属性名称必须等于pojo的属性名称
	//跳转添加页面
	@RequestMapping("toInsert")
	public String toInsert() throws Exception{
		return"insertItem";
	}
	//初始添加数据
	@RequestMapping("/insert")
	public String insert(MultipartFile pic,Item item) throws Exception{
		//获取图片完整名称
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			item.setItem_img(newFilename);
		}
		itemService.insert(item);
		System.out.println("添加成功!");
//		添加完成后，，，，，重定向到查询所有数据
		return "redirect:/item/search.action";
	}
	//删除单个数据
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Integer id,Model model) throws Exception{
		System.out.println("得到的id:"+id);
		itemService.delete(id);
//		删除完成后，，，，，重定向到查询所有数据
//		model.addAttribute("msg", "删除成功!");
		return "redirect:/item/search.action";
	}
	//删除多个数据
	@RequestMapping("/deleteAll")
	//注意controller的Integer[]数组变量名ids要和jsp页面checkbox的name属性ids相等
	public String deleteAll(Integer[] ids,Model model) throws Exception{
		System.out.println("删除多个----------!");
		//测试
/*		for (int i = 0; i < ids.length; i++) {
			System.out.println(ids[i]);
		}*/
		itemService.deleteAll(ids);
//		删除完成后，，，，，重定向到查询所有数据
		model.addAttribute("msg", "删除成功！");
		return "redirect:/item/search.action";
	}
	//修改,先查询一个数据 @RequestParam("id") 
	//@ResponseBody的作用是将java对象转为json格式的数据
	@RequestMapping("/detail")
	public String selectById(Integer id,Model model) throws Exception{
		System.out.println("得到用户的id:"+id);
		//根据id查询用户
		Item item = itemService.selectById(id);
		System.out.println("结果--"+item);
		//查询完成后，，，，，返回用户信息.
		model.addAttribute("list", item);
		//跳转修改页面----;
		return "updateItem";
	}
	//update修改 
	@RequestMapping("/update")
	public String update(MultipartFile pic,Item item) throws Exception{
		System.out.println("表单的数据------"+item);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			item.setItem_img(newFilename);
		}
		itemService.update(item);
		return "redirect:/item/search.action";
	}
	//分页查询query---未完成
	@RequestMapping("/query")
	public String queryAll(Model model,HttpServletRequest request) throws Exception{
		//当前第pageNum 1页，每页10条
		String pageNum = request.getParameter("pageNum");
		System.out.println("当前页"+pageNum);
		//传递当前页
		PageBean<Item> pageBean = itemService.queryAll(Integer.parseInt(pageNum));
/*		//测试
		System.out.println(pageBean);
		List<User> data = pageBean.getData();
		System.out.println(data);*/
		//返回页面
		model.addAttribute("pb", pageBean);
		return "itemPage";
	}
	////搜索，模糊-查询search
	@RequestMapping("/search")
	public String search(Model model,String condition) throws Exception{
		System.out.println("查询条件:"+condition);
		if(condition==null){
			condition="";
		}
		List<Item> list = itemService.search(condition);
		System.out.println(list);
		model.addAttribute("list", list);
		//搜索框的条件
		model.addAttribute("condition", condition);
		if(list.isEmpty()){
			model.addAttribute("msg", "没有数据!重新输入...");
		}
		return "item";
	}
}
