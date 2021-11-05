<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.io.*" %>
<html>
<head><title>절대 경로 사용하여 자원 읽기</title></head>
<body>
<%
//  /chap05/readFileDirectly.jsp
	char[] buff = new char[128];
	int len = -1;
	//절대경로로 설정
	String filePath = "D:\\A_TeachingMaterial\\6.JspSpring"
			+"\\jspServlet\\WebContent\\chap05\\message\\notice.txt";
	//try 리소스 문
	//try() => fr.close()를 생략해도 자동으로 close()가 됨
	//notice.txt로부터 내용을 읽어오는 스트림(데이터 물줄기)을 생성
	try(InputStreamReader fr 
			= new InputStreamReader(new FileInputStream(filePath)
					, "UTF-8")) {
		//notice.txt로부터 읽어온 데이터를 out 기본 객체를 사용하여 웹 브라우저에 출력함
		while ( (len = fr.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
		
	} catch(IOException ex) {
		out.println("익셉션 발생: "+ex.getMessage());
	}
%>

</body>
</html>
