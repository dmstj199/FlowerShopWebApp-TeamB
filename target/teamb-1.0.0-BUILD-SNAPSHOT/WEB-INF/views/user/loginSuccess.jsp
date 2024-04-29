<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/constants.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style type="text/css">
    table{
     margin: auto;
    }
  </style>
</head>
<body>
<%--EL,JSTL /로그인 인증--%>
<%--
<c:set var="id" value="${userDto.id}" scope="session"/>
 --%>
 <%
 session.setAttribute("id", session.getAttribute("id"));
 %>
<meta http-equiv="Refresh" content="0;url=${ctxpath}">

</body>
</html>