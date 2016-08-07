<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
  <form id="jobForm">
    <input type="hidden" name="page" value="${pageMaker.cri.page}" >
    <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" >
  </form>

  <table class="table table-bordered">
    <tr>
      <th style="width: 10px">BNO</th>
      <th>TITLE</th>
      <th>WRITER</th>
      <th>REGDATE</th>
      <th style="width: 40px">VIEWCNT</th>
    </tr>
    <c:forEach items="${list}" var="vo">
<%-- 
      <tr>
        <td>${vo.bno}</td>
        <td><a href="/board/read?bno=${vo.bno}">${vo.title}</a></td>
        <td>${vo.writer}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
        <td><span class="badge bg-red">${vo.viewcnt}</span></td>
      </tr>
 --%>
      <tr>
        <td>${vo.bno}</td>
        <td><a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${vo.bno}">${vo.title}</a></td>
        <td>${vo.writer}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
        <td><span class="badge bg-red">${vo.viewcnt}</span></td>
      </tr>
    </c:forEach>
  </table>

  <!-- pagination -->

  <div class="text-center">
    <%-- 
    <ul class="pagination">
      <c:if test="${pageMaker.prev}">
        <li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
      </c:if>

      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" /> >
          <a href="listPage?page=${idx}">${idx}</a>
        </li>
      </c:forEach>

      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        <li><a href="listPage?page=${pageMaker.endPage + 1}">&raquo;</a></li>
      </c:if>
    </ul>
 --%>    
    <ul class="pagination">
      <c:if test="${pageMaker.prev}">
        <li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
      </c:if>

      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" /> >
          <a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
        </li>
      </c:forEach>

      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        <li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
      </c:if>
    </ul>
  </div>
</body>
<script>
/* 
    $('.pagination li a').on("click", function(event) {
        event.preventDefault();

        var targetPage = $(this).attr("href");

        var jobForm = $('#jobForm');
        jobForm.find("[name='page']").val(targetPage);
        jobForm.attr('action', "/board/listPage").attr("method", "get");
        jobForm.submit();
    });
     */
</script>
</html>
<%@ include file="../include/footer.jsp"%>