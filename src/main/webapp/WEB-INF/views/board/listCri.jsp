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
        <td><a href="/board/read?bno=${vo.bno}">${vo.title}</a></td>
        <td>${vo.writer}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
        <td><span class="badge bg-red">${vo.viewcnt}</span></td>
      </tr>

    </c:forEach>
  </table>
</body>
<script>
    var result = '${msg}';

    if(result == 'SUCCESS') {
        alert("처리가 완료되었습니다.");
    }
</script>
</html>
<%@ include file="../include/footer.jsp"%>