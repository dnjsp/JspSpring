package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

// HttpServlet 클래스 상속
public class OracleDriverLoader extends HttpServlet{
	// Servlet을 초기화할 때 호출되는 init() 메소드를 구현
	public void init(ServletConfig config) throws ServletException{
		try {
			// Oracle JDBC 드라이버를 로딩함
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// JDBC driver를 로딩 시 오류 발생하면 exception
			throw new ServletException(e);
		}
	}
}
