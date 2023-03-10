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
							  			<a href="${board.bno}" class="move"><c:out value="${board.title}"/>
							  				<c:if test="${board.replyCnt ne 0 }">
							  					<span style="color:Hotpink;">
							  						[<c:out value="${board.replyCnt }"/>]
							  					</span>
							  				</c:if>
							  			</a>
						  			</td>
							  		<td class="col-md-2"><c:out value="${board.writer}"/></td>
							  		<td class="col-md-1.5"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.regdate }"/> </td>
							  		<td class="col-md-1"><c:out value="${board.hit}"/></td>
							  	</tr>
							  	</c:forEach>
							  </tbody>
							</table>
							<!-- 검색창 추가 -->
							<div class="search_wrap">
								<div class="search_area">
									<select name="type">
										<option value="" <c:out value="${page.Maker.cri.type == null?'select':'' }"/>>--</option>
										<option value="T" <c:out value="${page.Maker.cri.type eq 'T'?'select':'' }"/>>제목</option>
										<option value="C" <c:out value="${page.Maker.cri.type eq 'C'?'select':'' }"/>>내용</option>
										<option value="W" <c:out value="${page.Maker.cri.type eq 'W'?'select':'' }"/>>작성자</option>
										<option value="TC" <c:out value="${page.Maker.cri.type eq 'TC'?'select':'' }"/>>제목 + 내용</option>
										<option value="TW" <c:out value="${page.Maker.cri.type eq 'TW'?'select':'' }"/>>제목 + 작성자</option>
										<option value="TCW" <c:out value="${page.Maker.cri.type eq 'TCW'?'select':'' }"/>>제목 + 내용 + 작성자</option>
									</select>
									<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
									<button class="btn-success">Search</button>
								</div>
							</div><!-- search -->
						</div><!-- commu_board-body -->
					</div><!-- commu_board -->	
				</div>
				<!-- Pagination -->
				<div class="row align-items-center py-5">
					<div class="col-lg-4">
						Pagination (<c:out value="${pageMaker.cri.pageNum}"/> of <c:out value="${pageMaker.endPage }"/>)
					</div>
					<div class="col-lg-5 text-center">
						<div class="custom-pagination">
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev }">
			    					<li class="page-item Previous">
					      				<a href="${pageMaker.startPage -1}" class="page-link" aria-label="Previous">
					      					<span aria-hidden="true">&laquo;</span>
						      			</a>
						    		</li>
					    		</c:if>
					    
							    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
					    			<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
						    			<a href="${num}" class="page-link">${num}</a>
					    			</li>
							    </c:forEach>
							    <c:if test="${pageMaker.next}">
								    <li class="page-item next">
							      		<a href="${pageMaker.endPage +1}" class="page-link" aria-label="Next">
								        	<span aria-hidden="true">&raquo;</span>
								      	</a>
								    </li>
							    </c:if>
			  				</ul>
						</div>
					</div>
				</div><!-- Pagination -->
			</div><!-- bg-light -->
		</div><!-- container -->
	</div><!-- section -->
	
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
<form method="get" id="actionForm" action="list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>

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
	
	var actForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		
		actForm.find("input[name='pageNum']").val($(this).attr("href"));
		actForm.attr("action", "list");
		actForm.submit();
	});
	
	$(".move").on("click",function(e) {
		e.preventDefault();
		
		var bno = actForm.find("input[name='bno']").val();
		if(bno != '') {
			actForm.find("input[name='bno']").remove();
		}
		
		actForm.append(" <input type='hidden' name='bno' " + " value=' "+ $(this).attr("href") +"'>");
		// <input type='hidden' name='bno' value='글번호'>
		actForm.attr("action", "/commu/board/get");
		actForm.submit();
	});
	
	$(".search_area button").on("click", function(e) {
		var type = $(".search_area select").val();
		var keyword = $(".search_area input[name='keyword']").val();
		var skey = '<c:out value="${pageMaker.cri.keyword}"/>';
		console.log("이전 검색어 : " + skey);
		console.log("현재 검색어 : " + keyword);
		
		if(!type) {
			alert("키워드를 입력하세요")
			return false;
		}
		if(!keyword) {
			alert("키워드를 입력하세요")
			return false;
		}
		if(!skey) {
			actForm.find("input[name='pageNum']").val(1);
		}
		actForm.find("input[name='type']").val(type);
		actForm.find("input[name='keyword']").val(keyword);
		actForm.submit();
		
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>