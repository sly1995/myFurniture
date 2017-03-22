package com.course.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.LoginUser;
import com.course.entity.Menu;
import com.course.entity.Power;
import com.course.entity.UserInfo;
import com.course.rolepower.service.RoleService;
import com.course.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	
	//用户管理首页
	@RequestMapping("listUI")
	public String listUI(HttpServletRequest request){
		
		//添加列表用户
		request.setAttribute("userList", userService.findAll());
		return "/user/listUI";
	}
	
	//跳转到添加页面
	@RequestMapping("addUI")
	public String addUI(Model model){
		
		model.addAttribute("roleList", roleService.findAll());
		return "/user/addUI";
	}
	
	//添加
	@RequestMapping(value="add",method={RequestMethod.GET,RequestMethod.POST})
	public String add(@RequestParam String realName,@RequestParam String loginName,@RequestParam String password,
			@RequestParam String email,@RequestParam String birthday,Integer roleId){
		try {
			LoginUser loginUser = new LoginUser();
			loginUser.setEmail(email);
			loginUser.setLoginName(loginName);
			loginUser.setPassword(password);
			
			UserInfo userInfo = new UserInfo();
			userInfo.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
			userInfo.setRealName(realName);
			loginUser.setUserInfo(userInfo);
			userInfo.setLoginUser(loginUser);
			
			//添加角色
			if (roleId != null) {
				loginUser.setRole(roleService.findById(roleId));
			}
			
			userService.save(loginUser);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "redirect:listUI.do";
	}

	//跳转到编辑页面
	@RequestMapping(value="editUI",method={RequestMethod.GET,RequestMethod.POST})
	public String editUI(@RequestParam String id,HttpServletRequest request){
		//添加角色列表
		request.setAttribute("roleList", roleService.findAll());
		//数据回显
		request.setAttribute("user", userService.findById(Integer.parseInt(id)));
		return "/user/editUI";
	}
	
	//保存编辑
	@RequestMapping(value="edit",method={RequestMethod.GET,RequestMethod.POST})
	public String edit(@RequestParam String realName,@RequestParam String loginName,@RequestParam String password,
			@RequestParam String email,@RequestParam String birthday,@RequestParam Integer id,Integer roleId){
		try {
			LoginUser loginUser = new LoginUser();
			loginUser.setId(id);
			loginUser.setEmail(email);
			loginUser.setLoginName(loginName);
			loginUser.setPassword(password);
			
			UserInfo userInfo = new UserInfo();
			userInfo.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
			userInfo.setRealName(realName);
			userInfo.setId(id);
			loginUser.setUserInfo(userInfo);
			userInfo.setLoginUser(loginUser);
			
			//更新角色
			if (roleId !=null) {
				loginUser.setRole(roleService.findById(roleId));
			}
			
			userService.update(loginUser);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "redirect:listUI.do";
	}
	
	//删除用户
	@RequestMapping("delete")
	public String delete(@RequestParam Integer id){
		userService.deleteById(id);
		return "redirect:listUI.do";
	}
	
	
	
	 /***********************登录处理*************************/
	 
	//跳转到登录页面
	@RequestMapping("loginUI")
	public String loginUI(){
		return "login";
	}
	@RequestMapping("main")
	public String main(){
		return "main";
	}
	
	//退出
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session !=null) {
			session.removeAttribute("realName");
			session.removeAttribute("menus");
			session.removeAttribute("menuKey");
		}
		return "login";
	}
	
	//登录 
	@RequestMapping("login")
	public String login(@RequestParam("loginName") String name,
			@RequestParam("password") String password, HttpSession session){
		LoginUser lu= userService.login(name, password);
		if(lu!=null){
			session.setAttribute("realName", lu.getUserInfo().getRealName());
			List<Menu> list;
			HashMap<Menu,List<Menu>> menus=new HashMap<Menu,List<Menu>>();
			List<Menu> listPmenu=new ArrayList<Menu>();
			
			//得到菜单
			for (Power power : lu.getRole().getPowers()) {
				Menu menu = power.getMenu();
				Menu pMenu = menu.getParentMenu();
				
				//map中没有父菜单的key，则添加父菜单为Key，
				if (pMenu!=null && !menus.containsKey(pMenu)) {
					list=new ArrayList<Menu>();
					listPmenu.add(pMenu);
					menus.put(pMenu, list);
					((List<Menu>)menus.get(pMenu)).add(menu);
				}else{ //map中有对应父菜单的key，直接添加value
					((List<Menu>)menus.get(pMenu)).add(menu);
				}
			}
			session.setAttribute("menus", menus);
			
			//添加一级菜单名
			session.setAttribute("menuKey", listPmenu);
			return "redirect:main.do";
		}else{
			return "login";
		}
	}
}
