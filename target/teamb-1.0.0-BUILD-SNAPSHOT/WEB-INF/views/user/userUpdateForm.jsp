<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/constants.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <%--daum API사용--%>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  <script>
   function openDaumPostcode(){
       
      new daum.Postcode({
         oncomplete:function(data){
            document.getElementById('zipcode').value=data.zonecode;
            document.getElementById('address').value=data.address;
          }
         
      }).open();
   }//openDaumPostcode()---
  </script>
  
  <script type="text/javascript">
  function check(){
	  if($('#pw').val()==''){
          alert("암호를 입력하세요");
          $('#pw').focus();
          return false;
       }
       
       if($('#pw2').val()==''){
          alert("암호 확인을 입력하세요");
          $('#pw2').focus();
          return false;
       }
	  
       if($('#pw2').val()!=$('#pw').val()){
          alert("암호 확인이 일치하지 않습니다");
          $('#pw').val('');
          $('#pw2').val('');
          $('#pw').focus();
          return false;
       }
	  
       $('#email').val($('#email1').val()+$('#email2').val());
       $('#tel').val($('#tel1').val()+$('#tel2').val()+$('#tel3').val());
       
       //alert("aaa");
       //document.updateForm.submit();
  }
  </script>
  
  <script type="text/javascript">
  function deleteUser(){
	  //회원 탈퇴
	  document.deleteForm.action="${ctxpath}/user/userDeletePro.do";
	  document.deleteForm.submit();
  }
  </script>
  
  <style type="text/css">
  h2{
  text-align: center;
  }
  table{
  margin: auto;
  border: 1px solid black;
  }
  .line{
  border:1px solid white;
  }
  
  </style>
  
  <%
  session.getAttribute("id");
  %>
</head>
<body>
<h2><b>정보 수정하기</b></h2>
  <form name="updateForm" method="post" action="${ctxpath}/user/userUpdatePro.do" onsubmit="return check()">
    <table>
      <tr>
        <td>이름</td>
        <td>
        <input type="text" name="name" id="name" value="${sessionScope.name}">
        <input type="hidden" name="id" value="${sessionScope.id}">
        </td>
      </tr>
      
      <tr>
        <td>암호</td>
        <td><input type="password" name="pw" id="pw" size="20"></td>
      </tr>
      
      <tr>
        <td>암호확인</td>
        <td><input type="password" name="pw2" id="pw2" size="20"></td>
      </tr>
      
      <tr>
        <td>이메일</td>
        <td>
          <input type="text" name="email1" id="email1" value="${sessionScope.email1}" size="7">
          @
          <select name="email2" id="email2">
            <option value="${sessionScope.email2}">${sessionScope.email3}</option>
            <option value="@naver.com">naver.com</option>
            <option value="@daum.net">daum.net</option>
            <option value="@nate.com">nate.com</option>
          </select>
          <input type="hidden" name="email" id="email">
        </td>
      </tr>
      
      <tr>
        <td>전화</td>
        <td>
          <input type="text" name="tel1" id="tel1" value="${sessionScope.tel1}" size="4">-
          <input type="text" name="tel2" id="tel2" value="${sessionScope.tel2}" size="4">-
          <input type="text" name="tel3" id="tel3" value="${sessionScope.tel3}" size="4">
          <input type="hidden" name="tel" id="tel">
        </td>
      </tr>
      
      <tr>
        <td>우편번호</td>
        <td>
          <input type="text" name="zipcode" id="zipcode" value="${sessionScope.zipcode}" readonly>
          <input type="button" value="주소찾기" onclick="openDaumPostcode()">
        </td>
      </tr>
      
      <tr>
        <td>주소</td>
        <td><input type="text" name="address" id="address" value="${sessionScope.address}" size="50"></td>
      </tr>
      <br>
      <table class="line">
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="수정완료">
          <input type="button" value="수정 안함" onClick="history.back(); return false ;">
        </td>
        
        <td>
        <input type="button" value="탈퇴하기" onClick="location.href='javaScript:deleteUser()'">
        </td>
      </tr>
      </table>
    </table>
  </form>
  
  <!-- 삭제 -->
  <form name="deleteForm" method="post">
  <input type="hidden" name="id" id="id" value="${sessionScope.id}">
</form>
  
</body>
</html>