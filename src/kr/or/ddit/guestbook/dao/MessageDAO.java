package kr.or.ddit.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

public class MessageDAO {
	private static MessageDAO instance = new MessageDAO();
	public static MessageDAO getInstance() {
		return instance;
	}
	private MessageDAO() {}
	
	public int insert(Connection conn, GuestbookMessageVO vo) {
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into guestbook_message"
					+ " values((select nvl(max(message_id),0) + 1 from GUESTBOOK_MESSAGE)"
					+ ",?,?,?)"
					);
			pstmt.setString(1, vo.getGuestName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getMessage());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return cnt;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt= conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			// 리턴값이 null일 수 없음.. 최소 0임~!
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			// conn은 dao에서 닫는 거 아님 service에서 닫기
		}
	}
	public static List<GuestbookMessageVO> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"SELECT S.* "
					+ "FROM "
					+ "( "
					+ "    SELECT ROW_NUMBER() OVER(ORDER BY MESSAGE_ID DESC) RNUM, "
					+ "           MESSAGE_ID ,  "
					+ "           GUEST_NAME,  "
					+ "           PASSWORD,  "
					+ "           MESSAGE  "
					+ "    FROM GUESTBOOK_MESSAGE "
					+ ") S "
					+ "WHERE S.RNUM BETWEEN ? AND ?"
					);
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<GuestbookMessageVO> list = new ArrayList<GuestbookMessageVO>();
				do {
					GuestbookMessageVO vo = new GuestbookMessageVO();
					vo.setMessageId(rs.getInt("MESSAGE_ID"));
					vo.setGuestName(rs.getString("GUEST_NAME"));
					vo.setPassword(rs.getString("PASSWORD"));
					vo.setMessage(rs.getString("MESSAGE"));
					list.add(vo);
				} while (rs.next());
				return list;
			}else { // select 결과가 없다면
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
