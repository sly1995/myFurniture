package com.course.product.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Product;
import com.course.product.service.ProductService;
import com.course.util.Page;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource
	private ProductService productService;
	
	//产品管理首页
	@RequestMapping("listUI")
	public String listUI(@RequestParam(required=false,defaultValue="1") Integer currentPage , HttpServletRequest request,
			String searchName){
		Page<Product> page ;
		
		//用户输入了搜索数据
		if (searchName !=null && searchName!="") {
			List<Product> list = productService.doSearch(searchName);
			page = productService.createPage(list, currentPage, 8);
			request.setAttribute("searchName", searchName);
		}else{ //用户没有输入搜索数据
			page = productService.createPage(null, currentPage, 8);
		}
		request.setAttribute("page", page);
		return "/product/listUI";
	}
	
	//跳转到添加页面
	@RequestMapping("addUI")
	public String addUI(HttpServletRequest request){
		return "/product/addUI";
	}
	
	//添加
	@RequestMapping(value="add",method={RequestMethod.GET,RequestMethod.POST})
	public String add(@RequestParam String productName,@RequestParam Integer price){
		
		Product product = new Product();
		product.setProductName(productName);
		product.setPrice(price);
		productService.save(product);
		return "redirect:listUI.do";
	}
	
	//跳转到编辑页面
	@RequestMapping(value="editUI",method={RequestMethod.GET,RequestMethod.POST})
	public String editUI(@RequestParam Integer productId,HttpServletRequest request){
		
		//数据回显
		request.setAttribute("product",productService.findById(productId));
		return "/product/editUI";
	}
	
	//保存编辑
	@RequestMapping(value="edit",method={RequestMethod.GET,RequestMethod.POST})
	public String edit(@RequestParam String name,@RequestParam Integer price,
			 Integer productId){
		
		Product product = new Product();
		product.setProductName(name);
		product.setProductId(productId);
		product.setPrice(price);
		
		productService.update(product);
		
		return "redirect:listUI.do";
	}
	
	//删除产品
	@RequestMapping("delete")
	public String delete(@RequestParam Integer productId){
		productService.deleteById(productId);
		return "redirect:listUI.do";
	}
	
	@RequestMapping("deleteSelected")
	public String deleteSelected(@RequestParam Integer[] selectedRow){
		if (selectedRow !=null) {
			for (Integer integer : selectedRow) {
				productService.deleteById(integer);
			}
		}
		return "redirect:listUI.do";
	}	
}
