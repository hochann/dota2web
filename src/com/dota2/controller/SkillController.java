package com.dota2.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.pojo.Skill;
import com.dota2.service.HeroService;
import com.dota2.service.SkillService;
import com.dota2.util.UploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/skill")
public class SkillController extends BaseController{
	@Autowired
	private SkillService skillService;
	@Autowired
	private HeroService heroService;
	private int pageSize=6;//每页数据大小
	@RequestMapping("/list")	//查询所有
	public String findAll(Model model,int pageNum) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<Skill> list = skillService.findAll();
		PageInfo<Skill> pageInfo = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo",pageInfo);
		return "skill";
	}
	@RequestMapping("toInsert")	//跳转添加页面
	public String toInsert(Model model) throws Exception{
		//查询所有英雄,id,姓名。
		List<Hero> list = heroService.findAll();
		model.addAttribute("list", list);
		return"insertSkill";
	}
	@RequestMapping("/insert")	//初始添加数据
	public String insert(MultipartFile pic,Skill skill) throws Exception{
		System.out.println("提交的数据"+skill);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			skill.setImg(newFilename);
		}
		skillService.insert(skill);
		return "redirect:/skill/search.action";
	}
	@RequestMapping("/delete")	//删除单个数据
	public String delete(@RequestParam("id") Integer id,Model model) throws Exception{
		System.out.println("删除 得到的id:"+id);
		skillService.delete(id);
		return "redirect:/skill/search.action";
	}
	@RequestMapping("/deleteAll")	//删除多个数据
	public String deleteAll(Integer[] ids,Model model) throws Exception{
		skillService.deleteAll(ids);
		model.addAttribute("msg", "删除成功！");
		return "redirect:/skill/search.action";
	}
	@RequestMapping("/detail")	//修改,先查询一个数据 @RequestParam("id") 
	public String selectById(Integer id,Model model) throws Exception{
		System.out.println("得到用户的id:"+id);
		Skill skill = skillService.selectById(id);
		//System.out.println("结果--"+skill);
		//查询所有英雄,id,姓名。
		List<Hero> hero = heroService.findAll();
		model.addAttribute("hero", hero);
		model.addAttribute("list", skill);
		return "updateSkill";
	}
	@RequestMapping("/update")	//update修改 
	public String update(MultipartFile pic,Skill skill) throws Exception{
		System.out.println("表单的数据------"+skill);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			skill.setImg(newFilename);
		}
		skillService.update(skill);
		return "redirect:/skill/search.action";
	}
	@RequestMapping("/search")//搜索，模糊-查询search
	public String search(Model model,String condition) throws Exception{
		System.out.println("查询条件:"+condition);
		if(condition==null){
			condition="";
		}
		List<Skill> list = skillService.search(condition);
		model.addAttribute("list", list);
		model.addAttribute("condition",condition);
		if(list.isEmpty()){
			model.addAttribute("msg", "没有数据!重新输入...");
		}
		return "skill";
	}
}
