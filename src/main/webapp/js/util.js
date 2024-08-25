/**
 * JS Utility 프로그램
 * 
 * 댓글 페이지네이션
 */
 
 /*
"pageObject":{"page":1,"perPageNum":10,"startRow":1,"endRow":10,"perGroupPageNum":10,"startPage":1,"endPage":1,
"totalPage":1,"totalRow":2,"key":null,"word":null,"period":"pre","accepter":null,"acceptMode":1,"limit":0,
"pageQuery":"page=1&perPageNum=10&key=&word=","notPageQuery":"perPageNum=10&key=&word="}

// 댓글 페이지네이션 태그들의 문자열을 만들어 넘겨준다.
*/
 function replyPagination(pageObject) {
 	let str = "";
 	
 	// disabled 추가 여부 - 이전 페이지가 없으면 disabled 로 한다.
 	str += "<li class='page-item";
 	if(pageObject.startPage == 1) str += " disabled ";
 	str += "' data-page='" + (pageObject.startPage - 1) + "'><a class='page-link' href='#'>Previous</a></li>";
	
	// startPage부터 endPage 까지 반복처리 하여 페이지 만들어 내기
	for (let i = pageObject.startPage ; i <= pageObject.endPage ; i++) {
		str += "<li class='page-item";
		if (i == pageObject.page) str += " active ";
		str += "' data-page='" + i + "'><a class='page-link' href='#'>" + i + "</a></li>";
	}
	
	// 다음 페이지 - endPage 가 10이면 11로 보내는 처리
	str += "<li class='page-item";
	if(pageObject.endPage >= pageObject.totalPage) str += " disabled ";
	str += "' data-page='" + (pageObject.endPage + 1) + "'><a class='page-link' href='#'>Next</a></li>";
	
	return str;
 }