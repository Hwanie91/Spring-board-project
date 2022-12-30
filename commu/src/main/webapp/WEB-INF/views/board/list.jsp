<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<%@ include file="../includes/header.jsp" %>

	<div class="section">
		<div class="container" style="margin-top: 5.5em;">
			<div class="row align-items-center" style="margin-bottom: 0;">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">Commu 게시판</h2>
				</div>
			</div>
			<div class="container  bg-light">
				<div class="row">
	   				<div class="commu_board">
						<div class="commu_board-body">
			  				<div style="text-align: right; margin-bottom: 1em;">
			  					<a id="regBtn" class="btn-sm btn-success" role="btn" >글쓰기</a>
			  				</div>
				   			<table class="table table-hover table-bordered">
							  <thead>
							  	<tr>
							  		<th>#번호</th>
							  		<th>제목</th>
							  		<th>작성자</th>
							  		<th>작성일</th>
							  		<th>조회수</th>
							  	</tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${list}" var="board">
							  	<tr>
							  		<td class="col-md-1.5"><c:out value="${board.bno}"/></td>
							  		<td class="col-md-6">
							  			<a href="get?bno=${board.bno }"><c:out value="${board.title}"/></a>
						  			</td>
							  		<td class="col-md-2"><c:out value="${board.writer}"/></td>
							  		<td class="col-md-1.5"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.regdate }"/> </td>
							  		<td class="col-md-1"><c:out value="${board.hit}"/></td>
							  	</tr>
							  	</c:forEach>
							  </tbody>
							</table>
						</div><!-- commu_board-body -->
					</div><!-- commu_board -->	
				</div>
				
				<div class="row align-items-center py-5">
					<div class="col-lg-3">
						Pagination (1 of 10)
					</div>
					<div class="col-lg-6 text-center">
						<div class="custom-pagination">
							<a href="#">1</a>
							<a href="#" class="active">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- 알림창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button id="modalClose" class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>	
		</div>
	</div>

<script>
$(document).ready(function() {
	
	$("#regBtn").on("click", function() {
		self.location = "register";
	});
	
	var result = '<c:out value="${result}"/>'; // 자바스크립스 형추론 이용.
	checkModal(result); // 게시판 번호를 매개변수로 전달하면서 checkModal 펑션 호출
	
	function checkModal(result) {
		if(result === '') { // ==는 값만 비교, ===은 값과 형식도 비교
			return;
		}
		if($.isNumeric(result)) {
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록");
			} 
		} else {
			$(".modal-body").html(result);
		}
			$("#myModal").modal("show"); // 모달창 표시
	}
	
	$("#modalClose").on("click", function() {
		$("#myModal").modal("hide");
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>