<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%!
        String depart = ""; //전공을 담을 String 멤버변수
    %>
    <%
        request.setCharacterEncoding("UTF-8"); //인코딩 형식
        
        //student.jsp에서 넘긴 값 저장
        String name = request.getParameter("name");
        String gubun = request.getParameter("gubun");
        String major = request.getParameter("major");
        String hobby[] = request.getParameterValues("hobby"); //checkBox의 여러 내용을 저장하기위해 getParameterValues 사용
        
        // <select>태그의 전공에 따라 depart에 다르게 저장
        if (major.equals("국문학과")) {
            depart="국문학과";
        } else if (major.equals("영문학과")){
            depart="영문학과";
        } else if (major.equals("수학과")){
            depart="수학과";
        } else if (major.equals("정치학과")){
            depart="정치학과";
        } else depart="체육학과";
    %>
    <table border="1" style="width:800px;">
        <th colspan="2"><h1>학생 정보</h1></th>
        <tr>
            <td >이름</td>
            <td width="700px"><%=name %></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><%=gubun %></td>
        </tr>
        <tr>
            <td>전공</td>
            <td><%=depart %></td>
        </tr>
        <tr>
            <td>취미</td>
            <td><% for(String s: hobby) out.print(s + " "); %> 
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="회원정보 보내기">&nbsp;&nbsp;&nbsp;
                <input type="reset" value="다시 쓰기">
            </td>
            
        </tr>
    </table>
</body>
</html>