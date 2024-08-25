<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>fileUpload</h3>
<form action="exUploadPost" method="post" enctype="multipart/form-data">

<div>
	첨부파일1 : <input type="file" name="files">
</div>
<div>
	첨부파일2 : <input type="file" name="files">
</div>
<div>
	첨부파일3 : <input type="file" name="files">
</div>
<div>
	첨부파일4 : <input type="file" name="files">
</div>
<div>
	첨부파일5 : <input type="file" name="files">
</div>
<div>
	제출 : <input type="submit">
</div>

</form>

</body>
</html>