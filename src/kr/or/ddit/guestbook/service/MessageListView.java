package kr.or.ddit.guestbook.service;

import java.util.List;

import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

// 페이징 처리 전용 클래스
public class MessageListView {
	private int messageTotal;		 // 전체 글 수
	private int currentPage;		 // 현재 페이지 번호
	private int pageTotal;			 // 전체 페이지 수
	private int messageCountPerPage; // 페이지별 글의 수
	private int firstRow;			 // 첫 행 번호
	private int endRow;				 // 끝 행 번호
	private List<GuestbookMessageVO> messageList; // 출력할 데이터
	
	// 생성자
	public MessageListView(int messageTotal, int currentPage, int messageCountPerPage, int firstRow, int endRow,
			List<GuestbookMessageVO> messageList) {
		this.messageTotal = messageTotal;
		this.currentPage = currentPage;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.messageList = messageList;
		
		calculatePageTotalCount();
	}
	
	// 전체 행의 수, 페이지별 글의 개수를 이용 => 전체 페이지 개수 구함
	private void calculatePageTotalCount() {
		if(this.messageTotal == 0) { // 0행
			pageTotal = 0;
		}else { // 여러 행
			// 전체 페이지 수 = 전체 글 수 / 페이지 별 글의 수
			pageTotal = messageTotal / messageCountPerPage;
			
			// 11%3=>2(나머지) 즉, 나머지가 있으면 페이지를 1 증가
			if(messageTotal % messageCountPerPage > 0) {
				pageTotal++;
			}
		}
	}

	public int getMessageTotal() {
		return messageTotal;
	}

	public void setMessageTotal(int messageTotal) {
		this.messageTotal = messageTotal;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<GuestbookMessageVO> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<GuestbookMessageVO> messageList) {
		this.messageList = messageList;
	}
	
	// 결과가 있는지 여부
	public boolean isEmpty() {
		return messageTotal == 0; 
	}
}
