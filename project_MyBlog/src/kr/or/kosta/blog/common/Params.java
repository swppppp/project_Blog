package kr.or.kosta.blog.common;
/**
 * 여러 인자 전달을 위한 Wrapper클래스
 * {사용자 선택페이지, 한페이지에 출력하는 행의 개수, 출력 페이지 개수, 검색유형, 검색값 등}
 * @author Siwon
 */
public class Params {
	private int page;            /** 사용자가 선택한 페이지 */
	private int listSize;        /** 조회 목록 개수 ..한 페이지에 있는 article갯수*/
	private int pageSize;        /** 출력 페이지 개수 ..몇페이지까지 보일건지..*/
	private String searchType;   /** 검색 유형 */
	private String searchValue;  /** 검색 값 */
	
	public Params() {
		// 기본생성자.. 사용자는 첫페이지, 한 화면에 15개의 article목록, 5페이지씩보여줌
		this(1, 15, 5, null, null);
	}
	
	public Params(int page, int listSize, String searchType, String searchValue) {
		this(page, listSize, 5, null, null);
	}
	
	public Params(int page, int listSize, int pageSize, String searchType, String searchValue) {
		this.page = page;
		this.listSize = listSize;
		this.pageSize = pageSize;
		this.searchType = searchType;
		this.searchValue = searchValue;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "Params [page=" + page + ", listSize=" + listSize + ", pageSize=" + pageSize + ", searchType="
				+ searchType + ", searchValue=" + searchValue + "]";
	}

}
