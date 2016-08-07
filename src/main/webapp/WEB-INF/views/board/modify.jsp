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
    <div class="box-body">
      <div class="form-group">
        <lable for="exampleInputEmail1">BNO</lable>
        <input type="text" name="bno" class="form-control" value="${boardVO.bno}" readonly="readonly"/>
      </div>
      <div class="form-group">
        <lable for="exampleInputEmail1">TITLE</lable>
        <input type="text" name="title" class="form-control" value="${boardVO.title}"/>
      </div>
      <div class="form-group">
        <lable for="exampleInputPassword1">CONTENT</lable>
        <textarea name="content" rows="3" class="form-control">${boardVO.content}</textarea>
      </div>
    </div>
    <div class="form-group">
      <lable for="exampleInputEmail1">WRITER</lable>
      <input type="text" name="writer" class="form-control" value="${boardVO.writer}"/>
    </div>
  </form>
  <!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" class="btn btn-primary">SAVE</button>
    <button type="submit" class="btn btn-warning">CANCEL</button>
  </div>
</body>
<script>
    $(function() {
        var formObj = $("form[role='form']");
        console.log(formObj);
        
        $(".btn-warning").on("click", function(){
            self.location = "/board/listAll";
        });

        $(".btn-primary").on("click", function(){
            formObj.submit();
        });
    });
</script>
</html>
<%@ include file="../include/footer.jsp"%>