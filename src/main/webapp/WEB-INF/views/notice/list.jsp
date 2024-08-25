<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Main</title>

<style type="text/css">

h3, th, td {
	text-align: center;
}
.dataRow:hover {
	background: #e0e0e0;
	cursor: pointer;
}

</style>

</head>
<body>

<div class="container">

<h3>Notice</h3>
<!-- 출력 데이터 : 번호, 제목, 공지시작일, 공지종료일, 공지일 -->
<table class="table">
	<tr>
		<th>no</th>
		<th>title</th>
		<th>startDate</th>
		<th>endDate</th>
		<th>writeDate</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr class="dataRow">
			<td>${vo.no }</td>
			<td>${vo.title }</td>
			<td>
				<fmt:formatDate value="${vo.startDate }" 
					pattern="yyyy. MM. dd" />
			</td>
			<td>
				<fmt:formatDate value="${vo.endDate }" 
					pattern="yyyy. MM. dd" />
			</td>
			<td>
				<fmt:formatDate value="${vo.writeDate }" 
					pattern="yyyy. MM. dd" />
			</td>
		</tr>
	</c:forEach>
</table>

</div>

</body>
</html>