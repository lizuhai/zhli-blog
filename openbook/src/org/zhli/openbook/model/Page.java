package org.zhli.openbook.model;

public class Page<T> {

	// the current page number
	private int pageNo;

	// how many records displayed per page
	private int pageSize = 10;

	// total records
	private long totalItemNumber;

	public Page(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}

	public Page(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public long getTotalItemNumber() {
		return totalItemNumber;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	// pageNo need to be checked(maybe < 1 or > totalPageNumber)
	public int getPageNo() {
		if (pageNo < 0)
			pageNo = 1;
		if (pageNo > getTotalPageNumber())
			pageNo = getTotalPageNumber();
		if (pageNo == 0) 
			pageNo = 1;
		return pageNo;
	}

	// get total page number
	public int getTotalPageNumber() {
		return (int) Math.ceil((double) totalItemNumber / pageSize);
	}

	public void setTotalItemNumber(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", pageSize=" + pageSize
				+ ", totalItemNumber=" + totalItemNumber + "]";
	}

}
