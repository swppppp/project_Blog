package kr.or.kosta.blog.common;

public class PageBuilder {
	// ���꿡 �ʿ��� �Ӽ���
	private Params params;            /** �������� �������� ���� */
	private int rowCount;             /** ���̺�κ��� �˻��� ���� �� */
	
	// ���� ��� ������ ���� �Ӽ���
	private int pageCount;            /** ������ �� */
	private int listNo;               /** ��Ϻ� �ĺ���ȣ */
	private int startPage;            /** ���� ������ ����� ���� ��ȣ */
	private int endPage;              /** ���� ������ ����� ������ ��ȣ */
	private int previousStartPage;    /** ���� ������ ����� ���� ��ȣ */
	private int nextStartPage;        /** ���� ������ ����� ������ ��ȣ */
	
	
	public PageBuilder() {}
	
	/**
	 * @param params           ��û �Ķ����
	 * @param totalRowCount    �˻�Ÿ�Ժ� �˻��� ���� ��
	 */
	public PageBuilder(Params params, int rowCount ) {
		this.params = params;
		this.rowCount = rowCount;
	}
	
	/** setter/getter method */
	public Params getParams() {
		return params;
	}

	public void setParams(Params params) {
		this.params = params;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPreviousStartPage() {
		return previousStartPage;
	}

	public void setPreviousStartPage(int previousStartPage) {
		this.previousStartPage = previousStartPage;
	}

	public int getNextStartPage() {
		return nextStartPage;
	}

	public void setNextStartPage(int nextStartPage) {
		this.nextStartPage = nextStartPage;
	}
	
	@Override
	public String toString() {
		return "PageBuilder [params=" + params + ", rowCount=" + rowCount + ", pageCount=" + pageCount + ", listNo="
				+ listNo + ", startPage=" + startPage + ", endPage=" + endPage + ", previousStartPage="
				+ previousStartPage + ", nextStartPage=" + nextStartPage + "]";
	}

	/** ����¡ ��� */
	public void build(){
		// DB�κ��� �˻��� ���� ���� ���� ��ü�������� ���
		pageCount = (int)Math.ceil((double)rowCount / params.getListSize());
		
		// ��Ϻ� ��ȣ
		listNo = (params.getPage() - 1) / params.getPageSize();
		//(1~5): 0, (6~10): 1, (11~15): 2, .....
		
		// ���� ����� ������������ȣ�� ��������������ȣ ���
		startPage = (listNo * params.getPageSize()) + 1;
		endPage = (listNo * params.getPageSize()) + params.getPageSize();
		
		if (endPage > pageCount){
			endPage = pageCount;
		}
		
		// ���� ����� ���������� ��ȣ ���
		previousStartPage = startPage - params.getPageSize();
		// ù��° ����� ��� 1�������� ����
		if (previousStartPage < 0)  previousStartPage = 1;
		
		// ���� ����� ���������� ��ȣ ���
		nextStartPage = startPage + params.getPageSize();
	}
	
	/** ���� ��Ͽ��� [ó������] ��� ���� ��ȯ */
	public boolean isShowFirst() {
		return listNo > 0;
	}
	
	/** ���� ��Ͽ��� [������] ��� ���� ��ȯ */
	public boolean isShowLast() {
		return endPage < pageCount;
	}
	
	/** ���� ��Ͽ��� [�������] ��� ���� ��ȯ */
	public boolean isShowPrevious() {
		return listNo > 0;
	}
	
	/** ���� ��Ͽ��� [�������] ��� ���� ��ȯ */
	public boolean isShowNext() {
		return endPage < pageCount;
	}
	
	/** ���� ������Ʈ�� ��ȯ */
	public String getQueryString(int page) {
		String queryString = "?page=" + page;
		// ���ǰ˻��� �ִ� ���
		queryString += params.getSearchType() != null ? "&searchType=" + params.getSearchType() + "&searchValue=" + params.getSearchValue()  :  "";
		return queryString;
	}
	
	
	/** �׽�Ʈ�� ���� main */
	public static void main(String[] args) {
		/** ����� ����������, �������� ����� ���� ��, ������ ��, �˻�����, �˻��� */
		Params params = new Params(1, 15, 10, null, null);
		int selectCount = 156;
		PageBuilder pageBuilder = new PageBuilder(params, selectCount);
		pageBuilder.build();
		
		System.out.println("�˻��� ���: " + pageBuilder.getRowCount());
		System.out.println("��û������: " + pageBuilder.getParams().getPage());
		
		System.out.println("��ü��������: " + pageBuilder.getPageCount());
		
		System.out.println("�������� ����������: " + pageBuilder.getStartPage());
		System.out.println("�������� ��������: " + pageBuilder.getEndPage());
		
		System.out.println("ó������ �����ֱ� ����: " + pageBuilder.isShowFirst());
		System.out.println("������� �����ֱ� ����: " + pageBuilder.isShowPrevious());
		
		System.out.println("������� �����ֱ� ����: " + pageBuilder.isShowNext());
		System.out.println("������ �����ֱ� ����: " + pageBuilder.isShowLast());
		
		// JSP���� ������ ��ȣ ���� ��� ��
		if(pageBuilder.isShowFirst()) {
			System.out.print("ó������ ");
		}
		
		if(pageBuilder.isShowPrevious()) {
			System.out.print("������� ");
		}
		
		for(int i=pageBuilder.getStartPage(); i<=pageBuilder.getEndPage(); i++){
			System.out.print(i + " | ");
		}
		
		if(pageBuilder.isShowNext()) {
			System.out.print("������� ");
		}
		
		if(pageBuilder.isShowLast()) {
			System.out.print("������ ");
		}
		
		System.out.println();
		
		
		System.out.println("-----------------------------------------------");
		
		// �̸����� �˻� ��
		Params searchParams = new Params(1, 15, 10, "name", "��");
		int searchCount = 11;
		PageBuilder pageBuilder2 = new PageBuilder(searchParams, searchCount);
		pageBuilder2.build();
		System.out.println("�˻��� ���: " + pageBuilder2.getRowCount());
		System.out.println("��û������: " + pageBuilder2.getParams().getPage());
		
		System.out.println("��ü��������: " + pageBuilder2.getPageCount());
		
	}

}
