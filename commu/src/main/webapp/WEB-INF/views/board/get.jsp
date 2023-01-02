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
	   				<div class="bg-light col-lg-12">
	   					<div>
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
	   								<button data-oper="modify" class="btn btn-primary">
	   									<a href="/commu/board/modify?bno=${board.bno }&pageNum=${cri.pageNum}&amount=${cri.amount}"> 수정</a>
	   								</button>
	   								<button data-oper="list" class="btn btn-primary">
	   									<a href="/commu/board/list?pageNum=${cri.pageNum }&amount=${cri.amount} "> 목록</a>
	   								</button>
	   							</div>
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
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<%-- <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
</form>	<!-- 폼을 생성해서 게시물 번호를 숨김 값으로 전달 -->

<script>
$(document).ready(function() {
	$("#modify_btn").on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		if(operation == 'modify') {
			$("#infoForm").attr("action", "modify")
		}
		$("#infoForm").submit();
	});
});	
</script>

<%@ include file="../includes/footer.jsp" %>