package com.dota2.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dota2.pojo.Comment;
import com.dota2.pojo.Skill;
import com.dota2.service.MesService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/mes")
public class MesController extends BaseController{
	@Autowired
	private MesService mesService;
	private int pageSize=6;//每页数据大小
	@RequestMapping("/list")	//查询所有
	public String findAll(Model model,int pageNum) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<Comment> list = mesService.findAll();
		PageInfo<Comment> pageInfo = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo",pageInfo);
		return "mes";
	}
	@RequestMapping("/delete")	//删除单个数据，伪删除
	public String delete(@RequestParam("id") Integer id,Model model) throws Exception{
		System.out.println("删除 得到的id:"+id);
		Date date = new Date();
		mesService.delete(id,date);
		return "redirect:/mes/search.action";
	}
	@RequestMapping("/recover")	//恢复单个数据
	public String recover(@RequestParam("id") Integer id,Model model) throws Exception{
		System.out.println("恢复得到的id:"+id);
		Date date = new Date();
		mesService.recover(id,date);
		return "redirect:/mes/search.action";
	}
	@RequestMapping("/deleteAll")	//删除多个数据
	public String deleteAll(Integer[] ids,Model model) throws Exception{
		Date date = new Date();
		mesService.deleteAll(ids,date);
		model.addAttribute("msg", "删除成功！");
		return "redirect:/mes/search.action";
	}
	@RequestMapping("/recoverAll")	//恢复多个数据
	public String recoverAll(Integer[] ids,Model model) throws Exception{
		Date date = new Date();
		mesService.recoverAll(ids,date);
		model.addAttribute("msg", "huifu成功！");
		return "redirect:/mes/search.action";
	}
	@RequestMapping("/search")//搜索，模糊-查询search
	public String search(Model model,String condition) throws Exception{
		System.out.println("查询条件:"+condition);
		if(condition==null){
			condition="";
		}
		List<Comment> list = mesService.search(condition);
		model.addAttribute("list", list);
		model.addAttribute("condition",condition);
		if(list.isEmpty()){
			model.addAttribute("msg", "没有数据!重新输入...");
		}
		return "mes";
	}
}
