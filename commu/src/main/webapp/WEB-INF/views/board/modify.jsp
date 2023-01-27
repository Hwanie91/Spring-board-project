<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<%@ include file="../includes/header.jsp" %>

	<div class="section">
		<div class="container" style="margin-top: 5.5em;">
		
			<div class="row align-items-center" style="margin-bottom: 0;">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">Commu 글수정</h2>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
	   				<div class="bg-light col-lg-12">
	   					<div>
	   						<div>
	   							<form method="post" id="modifyForm" action="modify" role="form">
	   								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
									<input type="hidden" name="bno" value='<c:out value="${board.bno }"></c:out>'>
	 
	   								<div class="form-group">
	   									<label>제목</label>
	   									<input class="form-control" name="title" 
	   											value='<c:out value="${board.title }"></c:out>'>
	   								</div>
	   								<div class="form-group">
	   									<label>내용</label>
	   									<textarea class="form-control" name="content" rows="20" cols=""><c:out value="${board.content }"></c:out>
	   									</textarea>
	   								</div>
	   								<div class="form-group">
	   									<label>작성자</label>
	   									<input class="form-control" name="writer" 
	   											value='<c:out value="${board.writer }"></c:out>' readonly="readonly">
	   								</div>
	   								<sec:authentication property="principal" var="pinfo"/>
	   								<sec:authorize access="isAuthenticated()">
	   									<c:if test="${pinfo.username eq board.writer }">
	   										<button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
	   										<button type="submit" data-oper="remove" class="btn btn-primary">삭제</button>
	   									</c:if>
	   								</sec:authorize>
	   								<button type="submit" data-oper="list" class="btn btn-primary">목록</button>
	   								
	   							</form>
	   						</div>
	   					</div>
	   				</div>			
				</div>
			</div><!-- div class="container" -->
			
		</div><!-- div class="container" -->
	</div><!-- div class="section" -->
	
	
<script>
$(document).ready(function() {
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	var formObj = $("#modifyForm");
	$('button').on("click", function(e) {
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === 'remove') {
			formObj.attr("action", "remove");
		} else if(operation === 'list') {
			var PageNumTag = $("input[name='pageNum']");
			var amountTag = $("input[name='amount']");
			var keywordTag = $("input[name='keyword']");
			var typetagTag = $("input[name='type']");
			
			formObj.attr("action", "list").attr("method","get");
			formObj.empty();
			formObj.append(PageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typetagTag);
		}
		console.log(formObj);
		formObj.submit();
	});
	
})
</script>

<%@ include file="../includes/footer.jsp" %>