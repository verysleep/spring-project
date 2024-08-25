<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>
<jsp:include page="../jsp/weblib.jsp" />

<style type="text/css">

h3 {
	text-align: center;
}

</style>

<script type="text/javascript">
	// 보고 있는 일반 게시판의 글번호를 전역 변수로 지정해 보자.
	let id = "test"; // 강제 로그인 -  내가 작성한 댓글에 대해서만 수정과 삭제가 가능하도록 만들기 위함
	let no = ${vo.no};
	let replyPage = 1;
	console.log("전역변수 no : " + no);
</script>

<script type="text/javascript" src="/js/util.js"></script>

<script type="text/javascript" src="/js/dateTime.js"></script>

<script type="text/javascript" src="/js/reply.js"></script>

<script type="text/javascript">
	// replyService.list();
</script>

<!-- replyService.list() 실행 -->
<script type="text/javascript" src="/js/replyProcess.js"></script>

<script>

$(function(){
	// 글수정
	$("#updateBtn").click(function(){
		 location='updateForm.do?no=${vo.no}';
	});
	
	// 글삭제
	$("#deleteBtn").click(function(){
		 $("#pw").val("");
	});
	
	// 리스트 이동
	$("#listBtn").click(function(){
		 location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}"
				 + "&key=${param.key}&word=${param.word}";
	});
});

</script>

</head>
<body>

<div class="container">

<div class="card">
	<div class="card-header">
		<h3>Board view</h3>
	</div>
	<div class="card-body">
		<div class="card dataRow" data-no="${vo.no }">
			<div class="card-header">
				<span class="float-right">hit : ${vo.hit }</span>
				${vo.no }. ${vo.title }
			</div>
			<div class="card-body">
				<pre>${vo.content }</pre>
			</div> 
			<div class="card-footer">
				<span class="float-right">
					<fmt:formatDate value="${vo.writeDate }" 
						pattern="yyyy-MM-dd"/>
				</span>
				${vo.writer }
			</div>
		</div>
	</div> 
	<div class="card-footer">
		<button class="btn btn-dark" id="updateBtn">수정</button>
		<!-- 모달창을 열어서 비밀번호를 입력받고 삭제하여 가는 처리 -->
		<button class="btn btn-danger" id="deleteBtn" data-toggle="modal" data-target="#deleteModal">삭제</button>
		<button class="btn btn-secondary" id="listBtn">리스트</button>
	</div>
</div>
<!-- end of board.view card -->

<div>
	<jsp:include page="reply.jsp" />
</div>

</div> 
<!-- end of container -->

<!-- The Modal -->
<div class="modal fade" id="deleteModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Enter your password</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<form action="delete.do" method="post">
				<input type="hidden" name="no" value="${vo.no }">
				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control" id="pw" name="pw" type="password">
					</div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="btn btn-danger">Remove</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
		  	</form>
		</div>
	</div>
</div>

</body>
</html>