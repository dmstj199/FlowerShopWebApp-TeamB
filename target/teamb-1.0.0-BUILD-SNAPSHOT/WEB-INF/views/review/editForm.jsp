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
  border: 1px solid black;
  width: 50%;
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
</head>
<body>

  <h2>리뷰 수정하기</h2>
  <form method="post" action="${ctxpath}/review/editPro.do" encType="multipart/form-data">
    <table>
    <tr>
      <td>이름</td>
      <td>
      ${reviewDto.writer}
      <input type="hidden" name="review_no" value="${reviewDto.review_no}">
      </td>
    </tr>
    
     <tr>
        <td>글제목</td>
        <td><input type="text" name="subject" id="subject" value="${reviewDto.subject}"></td>
      </tr>
      
      <tr>
        <td>평점</td>
        <td>
        <input type="number" name="rate" min="1" max="5" step="1">
        </td>
      </tr>
      
      <tr>
        <td>파일 업로드</td>
        <td><input type="file" name="img" id="img"></td>
      </tr>
      
      <tr>
        <td>글내용</td>
        <td>
          <textarea name="content" id="content" rows="10" cols="50">${reviewDto.content}</textarea>
        </td>
      </tr>

      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="수정완료">
          <a href="${ctxpath}/review/deletePro.do?review_no=${reviewDto.review_no}&pageNum=${pageNum}">리뷰 삭제하기</a>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>