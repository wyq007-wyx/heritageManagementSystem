package com.bean;

import java.util.List;

public class Page<E> {
	private int rows;
    /**一页显示有几条数据*/
    private List<E> list;
    /**分页所展示的每条数据*/
    private int currentPage;
    /**当前页数*/
    private int totalCount;
    /**总数*/
    private int totalPage;
    /**总页数*/
    private int nextPage;
    /**下一页*/
    private int prevPage;
    public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	/**下一页*/
    public int getRows() {
		return rows;
	}
	
	public Page() {
		super();
	}

	public void setRows(int rows) {
		this.rows = rows;
	}
	public List<E> getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
    public Page(int rows, List<E> list, int currentPage, int totalCount, int totalPage) {
		super();
		this.rows = rows;
		this.list = list;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
	}
}
