<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/constants.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  h2{
  text-align: center;
  }
  table{
  margin: auto;
  width: 60%;
  }
  .line{
  border: 1px solid lightgray;
  left: 50%;
  top: 50%;
  }
  
  .line2{
  border: 1px solid white;
  }
  </style>
  
  <script type="text/javascript">
    function check(ff){
    	
    	if(ff.subject.value==''){
    		alert("글제목을 입력하세요");
    		ff.subject.focus();
    		return false;
    	}
    	
    	if(ff.content.value==''){
    		alert("글내용을 입력하세요");
    		ff.content.focus();
    		return false;
    	}
      return true;
    }

  </script>
  
</head>
<body>

  <h2>리뷰</h2>
    <form name="writeForm" method="post" action="${ctxpath}/review/insertPro.do" onSubmit="return check(this)" encType="multipart/form-data">
    
    <table border="1">
    
    
      <tr>
      <td>작성자</td>
        <td><input type="text" name="writer" id="writer" value="${sessionScope.id}" readonly></td>
      </tr>
      
      <tr>
      <td>글제목</td>
      <td>
      <input type="text" name="subject" id="subject">
      </td>
      </tr>
      
      <tr>
        <td>평점</td>
        <td>
          <input type="number" name="rate" value="5" min="1" max="5" step="1">
        </td>
      </tr>
      
      <tr>
        <td>파일 업로드</td>
        <td><input type="file" name="img" id="img"></td>
      </tr>
      
      <tr>
        <td>글내용</td>
        <td>
          <textarea name="content" id="content" rows="10" cols="50"></textarea>
        </td>
      </tr>
   
      <tr class="line2">
        <td colspan="4" align="center">
          <input type="submit" value="리뷰등록">
          <input type="reset" value="취소">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>