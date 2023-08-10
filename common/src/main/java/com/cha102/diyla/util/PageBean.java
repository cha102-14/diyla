package com.cha102.diyla.util;

/**
 * 分頁功能
 * 這個PageBean工具類別是用來封裝分頁查詢結果和相關分頁資訊的資料結構 可以在分頁查詢時使用，方便記錄和管理分頁資料。
 */
public class PageBean {
	private int page = 1;// 目前頁碼，預設為1
	private int rows = 10;// 每頁顯示的記錄數，預設為10
	private int total = 0;// 總記錄數
	private boolean pagination = true;// 是否分頁，預設為true。
	private Object data; // 查詢結果資料。

	public PageBean() {
		super();
	}

//getPage()、setPage(int page): 獲取和設置目前頁碼。
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

//getRows()、setRows(int rows): 獲取和設置每頁顯示的記錄數。
	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

//getTotal()、setTotal(int total)、setTotal(String total): 獲取和設置總記錄數。
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setTotal(String total) {
		this.total = Integer.parseInt(total);
	}

//isPagination()、setPagination(boolean pagination): 獲取和設置是否進行分頁。
	public boolean isPagination() {
		return pagination;
	}

	public void setPagination(boolean pagination) {
		this.pagination = pagination;
	}

//getData()、setData(Object data): 獲取和設置查詢結果資料。
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

//getStartIndex(): 計算起始記錄的索引。
	public int getStartIndex() {
		return (this.page - 1) * this.rows;
	}

	/*
	 * toString(): 重新撰寫了Object類別的toString()方法 用於將PageBean物件轉換為字串表示，包括各個屬性的值。
	 * 
	 */
	@Override
	public String toString() {
		return "PageBean{" + "page=" + page + ", rows=" + rows + ", total=" + total + ", pagination=" + pagination
				+ ", data=" + data + '}';
	}
}
