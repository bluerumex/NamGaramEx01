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
  <form role="form" method="post">
    <input type="hidden" name="bno" value="${boardVO.bno}">
  </form>
  
  <div class="box-body">
    <div class="form-group">
      <lable for="exampleInputEmail1">Title</lable>
      <input type="text" name="title" class="form-control" value="${boardVO.title}" readonly="readonly"/>
    </div>
    <div class="form-group">
      <lable for="exampleInputPassword1">Content</lable>
      <textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
    </div>
    <div class="form-group">
      <lable for="exampleInputEmail1">Writer</lable>
      <input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly"/>
    </div>
  </div>
  <!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" class="btn btn-warning">Modify</button>
    <button type="submit" class="btn btn-danger">REMOVE</button>
    <button type="submit" class="btn btn-primary">LIST ALL</button>
  </div>
</body>
<script>
    $(function() {
        var formObj = $("form[role='form']");
        console.log(formObj);
        
        $(".btn-warning").on("click", function(){
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $(".btn-danger").on("click", function(){
            formObj.attr("action", "/board/remove");
            formObj.submit();
        });

        $(".btn-primary").on("click", function(){
            self.location = "/board/listAll";
        });
    });
</script>
</html>
<%@ include file="../include/footer.jsp"%>