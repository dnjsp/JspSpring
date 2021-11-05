package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.dao.MessageDAO;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {
		return instance;
	}
	private WriteMessageService() {}
	
	// insert
	public void write(GuestbookMessageVO vo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDAO dao = MessageDAO.getInstance();
			int cnt = dao.insert(conn, vo);
		} catch (SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
