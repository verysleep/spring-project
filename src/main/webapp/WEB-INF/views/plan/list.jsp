<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>plan main</title>

<style type="text/css">

.myTrip, .tripTema {
	font-weight: bolder;
}
.tripTema:hover {
	text-decoration: underline;
	cursor: pointer;
}
.card {
	height: 140px;
	margin-bottom: 30px;
}
.trip {
	float: left;
	margin-right: 10px; 
}
.orderBlock:hover {
	cursor: pointer;
}
.orderBlock {
    user-select: none; /* 모든 브라우저에서 텍스트 선택을 방지합니다 */
}

</style>

<script type="text/javascript">

$(function(){
	// 이벤트 처리
	// 여행 추가
	$(".myTrip").click(function(){
		alert("여행 추가 클릭");
		// 로케이션 추가 (writeFrom)
	});
	
	// 뷰 이동
	$(".tripTema").click(function(){
		// alert("테마 클릭");
		// 로케이션 추가 (view)
		location = "view.do"
	});
	
	$(".dropdown-item").click(function(event){
		
		event.preventDefault(); // 기본 링크 클릭 동작 방지

        // Get the text of the clicked item
        let order = $(this).text();

        // Update the span with the selected text
        $('.orderList').text(order);
        
	})
	
});

</script>

</head>
<body>
<div class="container">
	
	<h2 class="myTrip">내 여행</h2>
	
	<button class="btn btn-outline-dark btn-block myTrip" 
		style="margin: 30px 0; padding: 15px 10px; font-size: 17px;">
		<i class="fa fa-plus"></i> 새로운 여행 떠나기
	</button>
	
	<div class="orderBlock dropdown text-right font-weight-bolder" 
		style="margin-bottom: 16px;">
		<p class="dropdown-toggle" data-toggle="dropdown">
			정렬기준 : <span class="orderList">마지막 수정일</span>
		</p>
		<div class="dropdown-menu dropdown-menu-right">
			<a class="dropdown-item" href="list.do?order=asc">작성일</a>
			<a class="dropdown-item" href="list.do?order=desc">마지막 수정일</a>
	    </div>
	</div>
	
	<!-- start of 여행 테마 리스트 -->
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<div class="row">
						<div class="col-10">
							<h4 class="card-title tripTema">여행 테마</h4>
						</div>
						<div class="col-2">
							<h4 class="text-right"><i class="fa fa-ellipsis-h"></i></h4>
						</div>
					</div>
					<p class="card-text trip">
						<i class="fa fa-calendar-o"></i> 시작 날짜 → 종료 날짜
					</p>
					<p class="card-text"><i class="fa fa-map-marker"></i> 여행지</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<div class="row">
						<div class="col-10">
							<h4 class="card-title tripTema">여행 테마22</h4>
						</div>
						<div class="col-2">
							<h4 class="text-right"><i class="fa fa-ellipsis-h"></i></h4>
						</div>
					</div>
					<p class="card-text trip">
						<i class="fa fa-calendar-o"></i> 시작 날짜 → 종료 날짜
					</p>
					<p class="card-text"><i class="fa fa-map-marker"></i> 여행지</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<div class="row">
						<div class="col-10">
							<h4 class="card-title tripTema">여행 테마33</h4>
						</div>
						<div class="col-2">
							<h4 class="text-right"><i class="fa fa-ellipsis-h"></i></h4>
						</div>
					</div>
					<p class="card-text trip">
						<i class="fa fa-calendar-o"></i> 시작 날짜 → 종료 날짜
					</p>
					<p class="card-text"><i class="fa fa-map-marker"></i> 여행지</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end of 여행 테마 리스트 -->
	
</div>
</body>
</html>