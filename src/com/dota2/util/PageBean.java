package com.dota2.util;

import java.util.List;

//分页
public class PageBean<T> {
	//必选项
    private int pageNum;//当前页  第几页 前台传递
    private int pageSize;//每页显示条数 固定
    private int totalRecord;//总记录数  查询数据库--注意条件
    //计算项
    private int startIndex;//起始索引  计算startIndex=(pageNum-1)*pageSize
    private int totalPage;//总页数   计算totalPage=(totalRecord+pageSize-1)/pageSize
    //分页数据
    private List<T> data;
    //动态显示条
    private int start;
    private int end;
    //构造方法 传递必选项
	public PageBean(int pageNum, int pageSize, int totalRecord) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		//计算
		//开始索引
		this.startIndex = (this.pageNum - 1)*this.pageSize;
		//总页数
		this.totalPage = (this.totalRecord + this.pageSize - 1)/this.pageSize;
		//动态显示条，初始化数据
		this.start = 1;
		this.end = 4;
		//处理数据
		if(this.totalPage <= 4){
			this.end = this.totalPage;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "PageBean [pageNum=" + pageNum + ", pageSize=" + pageSize + ", totalRecord=" + totalRecord
				+ ", startIndex=" + startIndex + ", totalPage=" + totalPage + ", data=" + data + "]";
	}
	
	
    
}
