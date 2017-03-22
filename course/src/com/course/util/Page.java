package com.course.util;

import java.util.List;

/**
 * 
 * Description: <br />
 * Project: abc <br />
 * ClassName: Page <br />
 * @author wangwei
 * @version 1.0 2014年10月21日下午3:11:27
 * @param <T>
 */
public class Page<T> {
	private List<T> list;
	private int currentPageNum; //当前页数
	private int pageSize = 4;   //页数
	private int prePageNum;     //上一页
	private int nextPageNum;    //下一页
	private int totalPageNum;   //总页数
	private int totalCount;     //总共的记录条数
	
	public Page(){}
	
	public Page(int pageNum,int pageSize){
		this.currentPageNum=pageNum;
		this.pageSize=pageSize;
	}
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getPrePageNum() {
		return prePageNum;
	}
	public void setPrePageNum(int prePageNum) {
		this.prePageNum = prePageNum;
	}
	public int getNextPageNum() {
		return nextPageNum;
	}
	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if(totalCount%pageSize==0)
			totalPageNum=totalCount/pageSize;
		else
			totalPageNum=totalCount/pageSize+1;
		
		if(currentPageNum>1)
			prePageNum=currentPageNum-1;
		else
			prePageNum=1;
		
		if(currentPageNum<totalPageNum)
			nextPageNum=currentPageNum+1;
		else
			nextPageNum=totalPageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
