package poly.dto;

public class PagingDTO {
	private int pageNum;
	private int pageCount;
	private int totalCount;
	private String u_seq;
	
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getU_seq() {
		return u_seq;
	}
	public void setU_seq(String u_seq) {
		this.u_seq = u_seq;
	}
}
