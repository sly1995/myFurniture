package com.course.menu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Menu;
import com.course.menu.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Resource
	private MenuService menuService;
	
	//用户管理首页
	@RequestMapping("listUI")
	public String listUI(HttpServletRequest request){
		
		request.setAttribute("menuList", menuService.findAll());
		return "/menu/listUI";
	}
	
	//跳转到添加页面
	@RequestMapping("addUI")
	public String addUI(HttpServletRequest request){
		
		//查询父菜单添加到request域
		request.setAttribute("parentList", menuService.findAllParent());
		//菜单列表
		return "/menu/addUI";
	}
	
	//添加（因为添加页面在WEB-INF下，不能直接访问，只能加一个方法跳转到添加页面）
	@RequestMapping(value="add",method={RequestMethod.GET,RequestMethod.POST})
	public String add(@RequestParam String menuName,@RequestParam String url,Integer parentMenuId){
		
		Menu menu = new Menu();
		menu.setMenuName(menuName);
		menu.setUrl(url);
		
		//添加父菜单
		if (parentMenuId !=null) {
			Menu paMenu = menuService.findById(parentMenuId);
			menu.setParentMenu(paMenu);
		}
		
		menuService.save(menu);
		return "redirect:listUI.do";
	}
	
	//跳转到编辑页面
	@RequestMapping(value="editUI",method={RequestMethod.GET,RequestMethod.POST})
	public String editUI(@RequestParam Integer menuId,HttpServletRequest request){
		//父菜单列表
		request.setAttribute("parentList", menuService.findAllParent());
		
		//数据回显
		Menu menu = menuService.findById(menuId);
		
		request.setAttribute("menu",menu);
		
		return "/menu/editUI";
	}
	
	//保存编辑
	@RequestMapping(value="edit",method={RequestMethod.GET,RequestMethod.POST})
	public String edit(@RequestParam String name,@RequestParam Integer menuId,@RequestParam String url,
			 Integer parentMenuId){
		
		Menu menu = new Menu();
		
		menu.setMenuId(menuId);
		menu.setMenuName(name);
		menu.setUrl(url);
		
		//更新父菜单
		if (parentMenuId != null) {
			menu.setParentMenu( menuService.findById(parentMenuId));
		}
		menuService.update(menu);
		
		return "redirect:listUI.do";
	}
	
	//删除角色
	@RequestMapping("delete")
	public String delete(@RequestParam Integer menuId){
		try {
			//如果有其他外键引用，则无法删除，返回列表页
			menuService.deleteById(menuId);
			return "redirect:listUI.do";
		} catch (Exception e) {
			return "redirect:listUI.do";
		}
	}
}
