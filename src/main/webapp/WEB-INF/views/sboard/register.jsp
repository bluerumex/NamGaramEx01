<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <label for="exampleInputEmail1">Title</label>
        <input type="text" name="title" class="form-control" placeholder="Enter Title">
      </div>
      <div class="form-group">
        <textarea class="form-control" name="content" rows="3" placeholder="Enter....."></textarea>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Writer</label>
        <input type="text" name="writer" class="form-control" placeholder="Enter Writer">
      </div>
    </div>

    <div class="box-footer">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>
</body>
</html>
<%@ include file="../include/footer.jsp"%>