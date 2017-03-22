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
import com.course.entity.Role;
import com.course.rolepower.service.PowerService;
import com.course.rolepower.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private RoleService roleService;
	@Resource
	private PowerService powerService;
	
	//用户管理首页
	@RequestMapping("listUI")
	public String listUI(HttpServletRequest request){
		request.setAttribute("roleList", roleService.findAll());
		return "/role/listUI";
	}
	
	//跳转到添加页面
	@RequestMapping("addUI")
	public String addUI(HttpServletRequest request){
		//权限列表
		request.setAttribute("powerList", powerService.findAll());
		return "/role/addUI";
	}
	
	//添加
	@RequestMapping(value="add",method={RequestMethod.GET,RequestMethod.POST})
	public String add(@RequestParam String roleName,Integer[] powerIds){
		
		Role role = new Role();
		role.setRoleName(roleName);
		
		//根据权限id查找权限
		Set<Power> set = new HashSet<Power>();
		if (powerIds != null) {
			for (int i = 0; i < powerIds.length; i++) {
				set.add(powerService.findById(powerIds[i]));
			}
		}
		//设置权限
		role.setPowers(set);
		
		roleService.save(role);
		return "redirect:listUI.do";
	}
	
	//跳转到编辑页面
	@RequestMapping(value="editUI",method={RequestMethod.GET,RequestMethod.POST})
	public String editUI(@RequestParam Integer roleId,HttpServletRequest request){
		//权限列表
		request.setAttribute("powerList", powerService.findAll());
		//数据回显
		Role role = roleService.findById(roleId);
		
		request.setAttribute("role",role);
		
		
		return "/role/editUI";
	}
	
	//保存编辑
	@RequestMapping(value="edit",method={RequestMethod.GET,RequestMethod.POST})
	public String edit(@RequestParam String name,@RequestParam Integer roleId,
			 Integer[] powerIds){
		
		Role role = new Role();
		role.setRoleId(roleId);
		role.setRoleName(name);
		
		//设置权限
		Set<Power> set = new HashSet<Power>();
		if (powerIds != null) {
			for (int i = 0; i < powerIds.length; i++) {
				set.add(powerService.findById(powerIds[i]));
			}
		}
		role.setPowers(set);
		
		roleService.update(role);
		
		return "redirect:listUI.do";
	}
	
	//删除角色
	@RequestMapping("delete")
	public String delete(@RequestParam Integer roleId){
		try {
			//如果有其他外键引用，则无法删除，返回列表页
			roleService.deleteById(roleId);
			return "redirect:listUI.do";
		} catch (Exception e) {
			return "redirect:listUI.do";
		}
	}
		
		
}
