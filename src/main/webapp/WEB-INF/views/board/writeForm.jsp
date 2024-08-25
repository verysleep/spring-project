<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글등록 폼</title>
</head>
<body>

<div class="container">

<h3>Board Write From</h3>

<form action="write.do" method="post">
	<div class="form-group">
		<label for="title">title</label>
		<input class="form-control" id="title" name="title" required>
	</div>
	<div class="form-group">
		<label for="content">content</label>
		<textarea class="form-control" id="content" name="content" rows="7" required></textarea>
	</div>
	<div class="form-group">
		<label for="writer">writer</label>
		<input class="form-control" id="writer" name="writer" required>
	</div>
	<div class="form-group">
		<label for="pw">password</label>
		<input class="form-control" id="pw" name="pw" required type="password">
	</div>
	<div class="form-group">
		<label for="pw2">checked password</label>
		<input class="form-control" id="pw2" required type="password">
	</div>
	<button type="submit" class="btn btn-dark">submit</button>
	<button type="reset" class="btn btn-light">reset</button>
	<button type="button" class="cancelBtn btn btn-secondary">cancel</button>
</form>

</div>

</body>
</html>