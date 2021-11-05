<%@page import="java.util.UUID"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! // ! = 선언부
private String getFolder() {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String str = sdf.format(date);
	return str.replace("-", File.separator);
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>/guestbook/fileupload03_process.jsp</title>
</head>
<body>
<!--
Commons-FileUpload를 이용한 파일 업로드
http://commons.apache.org/downloads
1) commons-fileupload.jar
2) commons-io.jar
-->
<%
String fileUploadPath = "C:\\ddit\\A_TeachingMaterial\\6.JspSpring\\workspace\\jspServlet\\WebContent\\images";

// 파일 업로드를 위해 diskfileUpload 클래스 생성
DiskFileUpload upload = new DiskFileUpload();

// 요청 파라미터를 전달받도록 DiskfileUpload 객체 타입으로 생성
List items = upload.parseRequest(request);

// 폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환
Iterator params = items.iterator();

// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator 객체 타입의 hasNaxt() 메소드 작성

// 날짜 폴더 생성 시작 ------------------
File uploadPath = new File(fileUploadPath, getFolder());
out.println("upload path : " + uploadPath);
if(uploadPath.exists() == false) {
	uploadPath.mkdirs();
}
// 날짜 폴더 생성 끝 ------------------

// 요청 파라미터가 없을 때까지 반복
while(params.hasNext()) {
	FileItem fileItem = (FileItem)params.next();
	
	// 폼 페이지에서 전송된 요청 파라미터가 파일이면
	if(!fileItem.isFormField()) {
		String fileName = fileItem.getName();
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

		// 파일명 중복처리 시작 ---------------
		// 유일한 128bit 랜던 값을 구함
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName;
		// 파일명 중복처리 끝 ---------------
		
		// before : File file = new File(fileUploadPath + "/" + fileName);
		File file = new File(uploadPath, fileName);
		
		// 서버의 저장 경로에 파일을 저장
		fileItem.write(file);
	}
}
%>
</body>
</html>