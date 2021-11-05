<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 입력</title>
</head>
<body>
 <!-- submit시 studentProc.jsp로 post 형식으로 값 전달 -->
    <form action="./studentProc.jsp" method="get">
    <table border="1" style="width:800px;">
        <th colspan="2"><h1>학생 정보</h1></th>
        <tr>
            <td >이름</td>
            <td width="700px"><input type="text" name="name" /></td>
        </tr>
        <tr>
            <td>성별</td>
            <td>
                <input type="radio" name="gubun" value="남자" id="gubun1">
                	<label for="gubun1" style="cursor:pointer;">남자</label>
                <input type="radio" name="gubun" value="여자" id="gubun2">
                	<label for="gubun2" style="cursor:pointer;">여자</label>
            </td>
        </tr>
        <tr>
            <td>전공</td>
            <td>
                <select name="major">
                    <option value="체육학과" selected>체육학과</option>
                    <option value="정보공학과">정보공학과</option>
                    <option value="유아교육학과">유아교육학과</option>
                    <option value="항공소프트웨어공학과">항공소프트웨어공학과</option>
                    <option value="전자공학과">전자공학과</option>
                    <option value="식품영양학과">식품영양학과</option>
                    <option value="보건행정학과">보건행정학과</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>취미</td>
            <td>
                <input type="checkbox" name="hobby" value="수영">수영
                <input type="checkbox" name="hobby" value="여행">여행
                <input type="checkbox" name="hobby" value="독서">독서
                <input type="checkbox" name="hobby" value="영화감상">영화감상
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="회원정보 보내기">&nbsp;&nbsp;&nbsp;
                <input type="reset" value="다시 쓰기">
            </td>
            
        </tr>
    </table>
    </form>
</body>
</html>