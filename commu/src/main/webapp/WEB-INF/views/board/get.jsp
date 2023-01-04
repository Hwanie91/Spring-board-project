<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<%@ include file="../includes/header.jsp" %>

	<div class="section">
		<div class="container" style="margin-top: 5.5em;">
		
			<div class="row align-items-center" style="margin-bottom: 0;">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">Commu 글읽기</h2>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
	   				<div class="col-lg-12">
	   					<div class="bg-light border p-5 rounded-3">
	   						<div>
	   							<div>
	   								<div class="form-group">게시물 번호
	   									<input class="form-control" name="bno" 
	   											value='<c:out value="${board.bno }"></c:out>' readonly="readonly">
	   								</div>
	   								<div class="form-group">제목
	   									<input class="form-control" name="title" 
	   											value='<c:out value="${board.title }"></c:out>' readonly="readonly">
	   								</div>
	   								<div class="form-group">내용
	   									<textarea class="form-control" name="content" readonly="readonly" rows="" cols="">
	   										<c:out value="${board.content }"></c:out>
	   									</textarea>
	   								</div>
	   								<div class="form-group">작성자
	   									<input class="form-control" name="writer" 
	   											value='<c:out value="${board.writer }"></c:out>' readonly="readonly">
	   								</div>
	   								<div class="p-2">
	   								<button data-oper="modify" id="modifyB" class="btn btn-primary">수정
	   									<%-- <a href="/commu/board/modify?bno=${board.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}"> 수정</a> --%> 
	   								</button>
	   								<button data-oper="list" id="listB" class="btn btn-primary">목록
	   									<%-- <a href="/commu/board/list?pageNum=${cri.pageNum }&amount=${cri.amount} "> 목록</a> --%>
	   								</button>
	   								</div>
	   							</div>
	   							<!-- 댓글 시작-->
	   							<div class="panel p-1" >
	   								<div style="display: flex; justify-content: space-between; align-items: center;">
	   									<div><i class="bi bi-chat-right-text-fill"></i>댓글</div>
	   									<div><button id="addReplyBtn" class="btn-sm btn-success">reply</button></div>
	   								</div>
	   								<br>
	   								<div class="panel-body">
	   									<ul class="chat">
	   										<li>new reply</li>
	   									</ul>
	   								</div>
	   							</div><!-- 댓글 끝-->
	   						</div>
	   					</div><!-- div class="bg-light -->
	   				</div><!-- div class="col-lg-12" -->			
				</div><!-- div class="row" -->
			</div><!-- div class="container" -->
			
		</div><!-- div class="container" -->
	</div><!-- div class="section" -->
	
	<!-- 댓글 알림창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">댓글 작성</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>reply</label><input class="form-control" name="reply" value="new reply">
					</div>
					<div class="form-group">
						<label>writer</label><input class="form-control" name="replyer" value="replyer">
					</div>
					<div class="form-group">
						<label>replyDate</label><input class="form-control" name="replyDate" value="">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" class="btn btn-secondary" type="button">수정</button>
					<button id="modalRemoveBtn" class="btn btn-secondary" type="button">삭제</button>
					<button id="modalRegiBtn" class="btn btn-secondary" type="button">등록</button>
					<button id="modalCloseBtn" class="btn btn-secondary" type="button">닫기</button>
				</div>
			</div>	
		</div>
	</div>
	
<!-- 글 읽기 차에서 페이지 정보 처리 -->	
<form method="get" id="infoForm" action="modify">
	<input type="hidden" id="bno" name="bno" value="${board.bno }">
	<input type="hidden" name="pageNum" value="${cri.pageNum }">
	<input type="hidden" name="amount" value="${cri.amount }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	<input type="hidden" name="type" value="${cri.type }">
</form>	<!-- 폼을 생성해서 게시물 번호를 숨김 값으로 전달 -->


<script src="/commu/resources/js/reply.js"></script>
<script>
$(document).ready(function() {
	$("#listB").on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		if(operation === 'list') {
			$("#infoForm").attr("action", "list");
			$("#infoForm").find("#bno").remove();
		}
		$("#infoForm").submit();
	});
	
	$("#modifyB").on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		if(operation === 'modify') {
			$("#infoForm").attr("action", "modify");
		}
		$("#infoForm").submit();
	});
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	
	/* replyService.add({
		reply : "js test",
		replyer : "tester",
		bno : bnoValue
	}, function(result){
			alert("result" + result);
	}); */
	
	var modal = $("#myModal"); // 모달 댓글 창 
	var modalInputReplydate = modal.find("input[name='replyDate']"); // 댓글 작성일
	var modalRegiBtn = $("#modalRegiBtn"); // 댓글 쓰기 버튼
	var modalInputReply = modal.find("input[name='reply']"); // 댓글 내용
	var modalInputReplyer = modal.find("input[name='replyer']"); // 댓글 작성자
	
	// 댓글 입력 모달창
	$("#addReplyBtn").on("click", function(e) { // 댓글쓰기 버튼을 클릭하면
		modal.find("input").val(""); // 모달의 모든 입력창을 초기화
		modalInputReplydate.closest("div").hide();
		// closest : 선택요소와 가장 가까운 요소를 지정.
		// 즉, modalInputReplydate 요소의 가장 가까운 div를 찾아서 숨김(날짜창)
		
		modal.find("button[id != 'modalCloseBtn']").hide(); // 닫기 버튼을 제외하고 숨김
		modalRegiBtn.show(); // 등록 버튼은 보임
		$("#myModal").modal("show"); // 모달 표시
	});
	
	// 모달창 닫기
	$("#modalCloseBtn").on("click", function(e) {
		modal.modal("hide");
	});
	
	// 댓글 쓰기
	modalRegiBtn.on("click", function(e) {
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
		}; // ajax로 전달할 reply 객체 선언 및 할당
		replyService.add(reply, function(result) {
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
		});
	});
	
	// 댓글 목록 보이기
	replyService.getList({
		bno : bnoValue,
		page : 1
	}, function(list) {
			for(var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
	});
	
});	
</script>

<%@ include file="../includes/footer.jsp" %>