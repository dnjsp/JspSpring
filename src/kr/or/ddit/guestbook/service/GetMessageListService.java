package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDAO;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() {
		return instance;
	}
	private GetMessageListService() {}
	
	// 한 페이지에 보여줄 메시지 개수를 3으로 지정(상수)
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	// 파라미터 : 페이지 번호
	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		
		// 현재 페이지 번호
		int currentPage = pageNumber;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// Data Access Object(DB작업하는 객체)
			MessageDAO dao = MessageDAO.getInstance();
			// 전체 글 수를 구함
			int messageTotal = dao.selectCount(conn);
			
			// 전체 데이터를 담을 List 선언
			List<GuestbookMessageVO> messageList = null;
			// 첫행
			int firstRow = 0;
			// 끝행
			int endRow = 0;
			
			if(messageTotal > 0) { // 데이터가 있으면 실행
				// 첫행 공식 : (현재페이지-1)*출력할 데이터 개수 + 1;
				firstRow = (pageNumber - 1)*MESSAGE_COUNT_PER_PAGE + 1;
				// 끝행 공식 : firstRow + 출력할 데이터 개수 - 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				// 글 목록 구하기
				messageList = MessageDAO.selectList(conn, firstRow, endRow);
				
			}else { // 데이터가 없으면
				currentPage = 0;
				
				// 비어있는 List로 사용한다는 의미. null과 다름
				// 목적 : 테스트 코드 작성 시 비어있는지 체킹할 때 사용됨
				messageList = Collections.emptyList();
				
			}
			
			return new MessageListView(messageTotal, currentPage, MESSAGE_COUNT_PER_PAGE, firstRow, endRow, messageList);
			
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
