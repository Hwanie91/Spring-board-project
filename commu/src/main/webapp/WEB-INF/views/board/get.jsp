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
	   							<!-- 댓글 -->
	   							<div class="panel p-1" >
	   								<div style="display: flex; justify-content: space-between; align-items: center;">
	   									<div><i class="bi bi-chat-right-text-fill"></i>댓글</div>
	   									<div><button class="btn-sm btn-success">reply</button></div>
	   								</div>
	   								<br>
	   								<div class="panel-body">
	   									<ul class="chat">
	   										<li>new reply</li>
	   									</ul>
	   								</div>
	   							</div><!-- 댓글 -->
	   						</div>
	   					</div>
	   				</div>			
				</div>
			</div><!-- div class="container" -->
			
		</div><!-- div class="container" -->
	</div><!-- div class="section" -->
	
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
	
});	
</script>

<%@ include file="../includes/footer.jsp" %>