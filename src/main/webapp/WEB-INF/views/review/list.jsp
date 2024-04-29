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
  border: 1px solid white;
  }
  
  .line2{
  border: 1px solid lightgray;
  }
  </style>
</head>
<body>
<h2>리뷰 보기</h2>
<table>
      <tr>
        <td align="right">
        <c:if test="${id!=null}">
            <a href="${ctxpath}/review/insertForm.do">리뷰쓰기</a>
         </c:if>
        </td>
      </tr>
      
      <c:if test="${count==0}">
      행운의 첫번째 리뷰어가 돼주세요!
     </c:if>
      
    <c:if test="${count>0}"> <!-- 글갯수가 있으면! -->
      <table border="1">
        <tr class="black">
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>별점</th>
          <th>작성일</th>
        </tr>
        
    <c:forEach var="dto" items="${list}">
       <tr>
         <td>
           <c:out value="${number}"/>
           <c:set var="number" value="${number-1}"/>
         </td>
        
          <td>
          <c:if test="${dto.writer eq sessionScope.id}">
          <a href="${ctxpath}/review/editForm.do?review_no=${dto.review_no}&pageNum=${currentPage}">
          ${dto.subject}
           </a>
           </c:if>
           <c:if test="${id==null||dto.writer!=sessionScope.id}">
            ${dto.subject}
            </c:if>
          </td>
          
          <td>${dto.writer}</td>
          
          <td>
         <c:if test="${dto.rate==1}">
            <font color="#B2CCFF">★</font>
            </c:if>
            <c:if test="${dto.rate==2}">
           <font color="#B2CCFF">★★</font>
            </c:if>
            <c:if test="${dto.rate==3}">
            <font color="#B2CCFF">★★★</font>
            </c:if>
            <c:if test="${dto.rate==4}">
           <font color="#B2CCFF">★★★★</font>
            </c:if>
            <c:if test="${dto.rate==5||dto.rate==null}">
           <font color="#B2CCFF">★★★★★</font>
            </c:if>

          </td>
          
          <td>${dto.regdate}</td>
      </tr>
      
      <tr>
      <td colspan="3" align="center"><pre><b>${dto.content}</b></pre></td>
      </tr>
      
      <tr>
      <td colspan="3" align="center">
      <c:if test="${dto.imgFile!=null}">
          <img src="${ctxpath}/resources/imgs/${dto.imgFile}" width="150" height="150">
          </c:if>
          </td>
          </tr>
    </c:forEach>
      </table>
    </c:if>
    
    <%--블럭, 페이지처리 --%>
    <table>
      <tr>
        <td align="center">
          <!--에러방지  -->
          <c:if test="${endPage>pageCount}">
            <c:set var="endPage" value="${pageCount}"/>
          </c:if>
          
          <!-- 이전 블럭 -->
          <c:if test="${startPage>10}">
            <a href="${ctxpath}/review/list.do?pageNum=${startPage-10}">[이전 블럭]</a>
          </c:if>
          
          <!-- 페이지 처리 -->
          <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="${ctxpath}/review/list.do?pageNum=${i}">[${i}]</a>
          </c:forEach>
          
          <!-- 다음 블럭 처리 -->
          <c:if test="${endPage<pageCount}">
            <a href="${ctxpath}/review/list.do?pageNum=${startPage+10}">[다음 블럭]</a>
          </c:if>
        </td>
      </tr>
    </table>
    </table>
</body>
</html>