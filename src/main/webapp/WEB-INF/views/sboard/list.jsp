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
  <div class="box-body">
    <select name="searchType">
      <option value="n" <c:out value="${cri.searchType == null?'selected':''}" />> --- </option>
      <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}" />> Title </option>
      <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />> Content </option>
      <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}" />> Writer </option>
      <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}" />> Title Or Content </option>
      <option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}" />> Content Or Writer </option>
      <option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}" />> Title Or Content or Writer </option>
    </select>
    
    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
    <button id="searchBtn">Search</button>
    <button id="newBtn">New Board</button>
  </div>

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
      <tr>
        <td>${vo.bno}</td>
        <td><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${vo.bno}">${vo.title}</a></td>
        <td>${vo.writer}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
        <td><span class="badge bg-red">${vo.viewcnt}</span></td>
      </tr>
    </c:forEach>
  </table>

  <!-- pagination -->

  <div class="text-center">
    <ul class="pagination">
      <c:if test="${pageMaker.prev}">
        <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
      </c:if>

      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}" /> >
          <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
        </li>
      </c:forEach>

      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
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
        jobForm.attr('action', "/board/list").attr("method", "get");
        jobForm.submit();
    });
     */

     $(function () {
         $('#searchBtn').on("click", function(evt) {
             self.location = "list"
                 + '${pageMaker.makeQuery(1)}'
                 + '&searchType='
                 + $('select option:selected').val()
                 + '&keyword='+$('#keywordInput').val();
         });
         
         $('#newBtn').on("click", function(evt){
             self.location = "register";
         });
     });
</script>
</html>
<%@ include file="../include/footer.jsp"%>