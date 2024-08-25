/**
 * replyService 객체를 이용한 댓글 처리 코드
 */

function showList(page){
	replyService.list(page,
		// 데이터 가져오기 성공했을 때 실행되는 함수 -> html tag를 만들어 표시하는 함수 실행
		function(data){
			// data의 구조 - {list[],pageObject}
			let list = data.list;
			// ul tag안에 들어가는 문자열
			let str = "";
			
			// 데이터가 없는 경우의 처리
			if(list == null || list.length == 0) {
				$(".chat").html("<li>데이터가 존재하지 않습니다.</li>");
				$(".pagination").html(""); // 댓글의 페이지를 만들지 않음
				return;
			}
			
			// 데이터가 있는 경우의 처리
			// 댓글 내용 출력
			for(let i = 0 ; i < list.length ; i ++){
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str += "<div>";
				str += "<div class='header'>";
				str += "<strong class='primary-font'>" + list[i].name + "(" + list[i].id + ")</strong>";
				str += "<small class='pull-right text-muted'>" + toDateTime(list[i].writeDate) + "</small>";
				str += "</div>";
				str += "<p><pre class='replyContent'>" + list[i].content + "</pre></p>";
				if(id == list[i].id) {
					str += "<div style='margin-bottom: 10px;'>"
					str += "<button class='replyUpdateBtn btn btn-dark btn-sm' style='margin-right: 5px;'>"
					str += "수정</button>"
					str += "<button class='replyDeleteBtn btn btn-danger btn-sm'>"
					str += "삭제</button>"
					str += "</div>"
				}
				str += "</div>";
				str += "</li>";
			} // end of for
			
			$(".chat").html(str);
			
			// 페이지에 대한 출력
			$(".pagination").html(replyPagination(data.pageObject))
			
		}
	);
};

// 일반 게시판 글보기가 처음에 보여 질 때 댓글 리스트 보이기 실행
showList(1);

// HTML이 로딩이 된 상태에서 실행한다.
$(function(){
	// 이벤트 처리
	// 새로운 댓글 등록 모달창 보이기 이벤트
	$("#newReplyBtn").click(function(){
		$("#replyModal .modal-title").text("댓글 쓰기");
		$("#replyContent").val(""); // 댓글 내용 지우기
		
		// 버튼 처리
		$("#replyModal #replyWriteBtn").show();
		$("#replyModal #replyUpdateBtn").hide();
		
	});
	// 댓글 등록 모달창
	$("#replyWriteBtn").click(function(){
		// alert("댓글 등록");
		// 댓글 등록에 필요한 데이터(no, content) 수정
		let reply = {no : no, content : $("#replyContent").val()};
		// alert(JSON.stringify(reply));
		replyService.write(reply,
			function(result){
				$("#replyModal").modal("hide");
				// alert(result);
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경되었으므로 리스트를 다시 불러온다.
				showList(1);
			}
		);
	});
	
	// 댓글 수정 버튼
	// 맨앞에 선택자는 새로 만들어 진게 아닌 원래 있었던 객체를 선택해야 함
	// 그 앞에 만들어진 HTML 에서 find를 이용해서 다시 찾아 함수를 전달해서 사용 >> 이벤트 위임
	$(".chat").on("click", ".replyUpdateBtn", function(){
		// alert("댓글 수정");
		
		// 버튼 처리
		$("#replyModal #replyWriteBtn").hide();
		$("#replyModal #replyUpdateBtn").show();
		
		let li = $(this).closest("li");
		$("#replyModal .modal-title").text("댓글 수정");
		$("#replyRno").val(li.data("rno")); // 댓글 내용 채우기
		$("#replyContent").val(li.find(".replyContent").text()); // 댓글 내용 채우기
		$("#replyModal").modal("show");
	});
	
	// 수정 처리 이벤트(모달의 수정 버튼)
	$("#replyUpdateBtn").click(function(){
		// 데이터 수집 > JSON 데이터로 만듦 - rno, content
		let reply = {rno : $("#replyRno").val(), content : $("#replyContent").val()}
		
		// 처리 - replyService
		// replyService.update(댓글객체, 성공함수, 실패함수);
		replyService.update(reply, // 서버에 전달되는 데이터 - rno, content
			function(result){ // 성공 함수
				$("#replyModal").modal("hide");
				// alert(result);
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경되었으므로 리스트를 다시 불러온다.
				showList(replyPage);
			}
		);
	});
	
	// 댓글 삭제 버튼 - 처리
	$(".chat").on("click", ".replyDeleteBtn", function(){
		// alert("댓글 삭제");
		if(!confirm("해당 댓글을 삭제하시겠습니까?")) return;
		
		// rno 수집
		let rno = $(this).closest("li").data("rno");
		
		// 삭제 처리
		replyService.delete(rno, 
			function(result){ // 성공 함수
				// alert(result);
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경되었으므로 리스트를 다시 불러온다.
				showList(1);
			}
		);
	});
	
	// 댓글 페이지네이션 이벤트 처리
	$(".pagination").on("click", "a", function(){
		// alert("페이지 클릭");
		let page = $(this).parent().data("page"); // parent - li 태그
		// page - 이동할 페이지, replyPage - 현재페이지
		// if(page == replyPage)
		// 	alert("이동 페이지(이동 안함) : " + page);
		if(page != replyPage) {
			// alert("이동 페이지(이동ㄱㄱ) : " + page);
			replyPage = page;
			showList(replyPage)
		}
		return false;
	});
});
