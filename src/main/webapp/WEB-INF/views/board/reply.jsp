<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row" style="margin: 20px -15px 0 -15px">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header" style="background: #e0e0e0;">
				<i class="fa fa-comments fa-fw"></i> Review
				<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-dark btn-sm pull-right" data-toggle="modal" 
					data-target="#replyModal" id="newReplyBtn">
					New Review
				</button>
			</div>
			<!-- end of board.reply card-head -->
			<div class="card-body">
				<ul class="chat">
					<!-- 데이터 한개 당 li 태그가 생긴다. - foreach -->
					<!-- start to reply -->
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">홍길동(test)</strong>
								<small class="pull-right text-muted">2018-01-01 12:11</small>
							</div>
							<p><pre>Good job!</pre></p>
						</div>
					</li>
					<!-- end of reply -->
				</ul>
			</div>
			<div class="card-footer">
				<ul class="pagination justify-content-center pagination-sm" style="margin:5px 0">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- The Modal -->
<div class="modal" id="replyModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Write Review</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<input type="hidden" id="replyRno">
		  		<textarea rows="4" class="form-control" id="replyContent"></textarea>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button class="btn btn-dark" id="replyWriteBtn">Success</button>
				<button class="btn btn-dark" id="replyUpdateBtn">Update</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>