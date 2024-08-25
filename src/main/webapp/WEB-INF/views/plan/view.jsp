<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trip plan</title>

<style type="text/css">

.TemaBox {
	height: 240px;
}
.TemaBox > .card-body {
	position: absolute;
    bottom: 0; /* 컨테이너의 하단에 정렬 */
    margin: 0; /* 필요에 따라 마진 조정 */
}
.tripTema, .tripDate {
	font-weight: bolder;
}
.tripDate {
	Padding: 5px;
}
.trip {
	float: left;
	margin-right: 10px; 
	margin-bottom: 0
}
.tripBtn {
	margin: 20px 10px 20px 0;
}
.tripBtn:last-child {
	margin-right: 0;
}
.tripMenu {
	height: 100px;
	padding-top: 10px;
	border-top: 1px solid #343a40;
}
.tripMenu:last-child {
	border-bottom: 1px solid #343a40;
}
.planInfo {
	display: none; /* 페이지 로딩 시 기본적으로 숨기기 */
}

</style>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ac56a706c2f9b3bedb2c6faf6cfa4cc"></script> -->

<script type="text/javascript">

$(function(){
	
	// 이벤트 처리
	// 상세 일정(계획 보이기)
	$(".btn").click(function(){
		$(this).closest(".planInfo").slideToggle();
    });
	
	// 지도 부르기
	// let container = document.getElementById('map'); 
	
	// 지도의 중심 좌표
// 	let options = {
// 		center: new kakao.maps.LatLng(37.738364, 127.045936),
// 		level: 3
// 	};
	
	// 지도 생성
	// let map = new kakao.maps.Map(container, options);
	
});

</script>

</head>
<body>

<div class="container">

<div class="row" style="margin-top: 30px;">
	<div class="col-md-7"> <!-- 계획 영역 -->
		<div class="card TemaBox">
			<div class="card-body">
				<h2 class="card-title tripTema">여행 테마</h2>
				<p class="card-text trip">
					<i class="fa fa-calendar-o"></i> 시작 날짜 → 종료 날짜
				</p>
				<p class="card-text trip"><i class="fa fa-map-marker"></i> 여행지</p>
			</div>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-outline-dark tripBtn" 
				style="border-radius: 30px;">1일차</button>
			<button type="button" class="btn btn-outline-dark tripBtn" 
				style="border-radius: 30px;">2일차</button>
			<button type="button" class="btn btn-outline-dark tripBtn" 
				style="border-radius: 30px;">3일차</button>
			<button type="button" class="btn btn-outline-dark tripBtn" 
				style="border-radius: 30px;">4일차</button>
			<button type="button" class="btn btn-outline-dark tripBtn" 
				style="border-radius: 30px;">5일차</button>
		</div>
		<!-- 날짜별 일정 출력 -->
		<div class="tripMenu">
			<button type="button" class="btn planBtn" style="width: 100%;">
				<h4 class="card-title text-left tripDate">
					1일차 <span class="float-right"><i class="fa fa-angle-down"></i></span>
				</h4>
			</button>
		</div>
		<!-- 일정 리스트 출력 : 댓글 리스트 처럼 -->
		<div class="planInfo">
			<div style="background-color: red; width: 100%; height: 300px;"></div>
		</div>
	</div>
	
	<div class="col-md-5"> <!-- 지도 영역 -->
		<div id="map" style="height: 700px;"></div>
	</div>
</div>

</div>

</body>
</html>