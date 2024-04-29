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
      //데이터 입력 여부 체크
      if($('#id777').val()==''){
         alert("ID를 입력하세요");
         $('#id777').focus();
         return false;
      }
      
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
         $('#pw2').val('')
         $('#pw').val('').focus();
         return false;
      }

      if($('#name').val()==''){
         alert("이름을 입력하세요");
         $('#name').focus();
         return false;
      }
      
      if($('#tel1').val()==''||$('#tel2').val()==''||$('#tel3').val()==''){
          alert("전화번호를 입력하세요");
          $('#tel1').focus();
          return false;
       }
          tel=$('#tel1').val()+$('#tel2').val()+$('#tel3').val();
          $('#tel').val(tel)
      
      if($('#email1').val()==''){
         alert("이메일을 입력하세요");
         $('#email1').focus();
         return false;
      }
         email=$('#email1').val()+$('#email2').val();
         $('#email').val(email);
            
      //상세주소
      if($('#address').val()==''){
         alert("상세주소를 입력하세요");
         $('#address').focus();
         return false;
      }
      return true;
   }//check()-end
   
  //ajax:ID중복체크
    function idCheck(){
    	  if($('#id777').val()==''){
              alert("ID를 입력하세요");
              $('#id777').focus();
              return false;
           }else{
        	   $.ajax({
                   type:"post",
                   url:"${ctxpath}/user/idCheck.do",
                   data:"id="+$('#id777').val(),/*서버로 보낼 파라미터*/
                   dataType:"JSON",/*서버가 보내준 자료 타입*/
                   success:function(data){
                      //alert(data.x);
                      if(data.x==-1){
                         //사용중인 ID
                         alert("사용중인 ID");
                         $('#id777').val('').focus();
                      }else{
                         //사용 가능한ID
                         alert("사용 가능한ID");
                         $('#idck').val('true');
                         $('#pw').focus();
                      }
                   }//function()-end
                });
           }//else-end
    }//idCheck()-end
    
    function aa(){
       if($('#idck').val()=='false'){
          alert('ID중복체크를 해 주세요');
          $('#id777').focus();
          return false;
       }
    }
  </script>
  
  <style type="text/css">
  h2{
  text-align: center;
  }
  table{
  margin: auto;
  }
  </style>
</head>
<body>
<h2><b>회원가입</b></h2>
  <form name="myForm" method="post" action="${ctxpath}/user/userInsertPro.do" onSubmit="return check()">
    <table border="1">
      <tr>
        <td>ID</td>
        <td>
          <input type="text" name="id" id="id777" size="20">
          <input type="hidden" name="idck" id="idck" value="false">
          <input type="button" value="ID중복 체크" onClick="idCheck()">
        </td>
      </tr>
      
      <tr>
        <td>암호</td>
        <td><input type="password" name="pw" id="pw" size="20" onFocus="aa()"></td>
      </tr>
      
      <tr>
        <td>암호확인</td>
        <td><input type="password" name="pw2" id="pw2" size="20"></td>
      </tr>
      
      <tr>
        <td>이름</td>
        <td><input type="text" name="name" id="name" size="30"></td>
      </tr>
      
      <tr>
        <td>이메일</td>
        <td>
          <input type="text" name="email1" id="email1" size="10">@
          <select name="email2" id="email2">
            <option value="@naver.com">naver.com</option>
            <option value="@nate.com">nate.com</option>
            <option value="@daum.net">daum.net</option>
          </select>
          
          <input type="hidden" name="email" id="email"/>
        </td>
      </tr>
      
      <tr>
        <td>전화</td>
        <td>
          <input type="text" name="tel1" id="tel1" size="4">
          -
          <input type="text" name="tel2" id="tel2" size="4">
          -
          <input type="text" name="tel3" id="tel3" size="4">
          <input type="hidden" name="tel" id="tel">
        </td>
      <tr>
      
      <tr>
        <td>우편번호</td>
        <td>
          <input type="text" name="zipcode" id="zipcode" size="7" readOnly="readonly">
          <input type="button" value="주소찾기" onClick="openDaumPostcode()">
        </td>
      </tr>
      
      
      <tr>
        <td>상세주소</td>
        <td>
          <input type="text" name="address" id="address" size="20">
        </td>
      </tr>
      
      <table>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="회원가입">
          <input type="button" value="로그인하기" onClick="history.back(); return false ;">
        </td>
      </tr>
      </table>
    </table>
  </form>
</body>
</html>