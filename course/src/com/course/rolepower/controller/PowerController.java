package com.course.rolepower.controller;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Power;
import com.course.menu.service.MenuService;
import com.course.rolepower.service.PowerService;

@Controller
@RequestMapping("/power")
public class PowerController {

	@Resource
	private PowerService powerService;
	@Resource
	private MenuService menuService;
	
	//用户管理首页
	@RequestMapping("listUI")
	public String listUI(HttpServletRequest request){

		request.setAttribute("powerList", powerService.findAll());
		return "/power/listUI";
	}
	
	//跳转到添加页面
	@RequestMapping("addUI")
	public String addUI(HttpServletRequest request){
		//添加菜单列表
		request.setAttribute("menuList", menuService.findBesidesParent());
		//菜单列表
		return "/power/addUI";
	}
	//添加
	@RequestMapping(value="add",method={RequestMethod.GET,RequestMethod.POST})
	public String add(@RequestParam String powerName,Integer menuId){
		
		Power power = new Power();
		power.setPowerName(powerName);
		
		//根据权限id查找权限
		if (menuId !=null) {
			power.setMenu(menuService.findById(menuId));
		}
		
		powerService.save(power);
		return "redirect:listUI.do";
	}
	
	//跳转到编辑页面
	@RequestMapping(value="editUI",method={RequestMethod.GET,RequestMethod.POST})
	public String editUI(@RequestParam Integer powerId,HttpServletRequest request){
		//菜单列表
		request.setAttribute("menuList", menuService.findBesidesParent());
		//数据回显
		request.setAttribute("power",powerService.findById(powerId));
		return "/power/editUI";
	}
	
	//保存编辑
	@RequestMapping(value="edit",method={RequestMethod.GET,RequestMethod.POST})
	public String edit(@RequestParam String name,@RequestParam Integer powerId,
			 Integer menuId){
		
		Power power = new Power();
		power.setPowerId(powerId);
		power.setPowerName(name);
		
		if (menuId != null) {
			power.setMenu(menuService.findById(menuId));
		}
		powerService.update(power);
		
		return "redirect:listUI.do";
	}
	
	//删除角色
	@RequestMapping("delete")
	public String delete(@RequestParam Integer powerId){
		try {
			//如果有其他外键引用，则无法删除，返回列表页
			powerService.deleteById(powerId);
			return "redirect:listUI.do";
		} catch (Exception e) {
			return "redirect:listUI.do";
		}
	}
		
}
