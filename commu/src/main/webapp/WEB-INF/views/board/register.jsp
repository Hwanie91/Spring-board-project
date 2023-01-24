<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<%@ include file="../includes/header.jsp" %>

	<div class="section">
		<div class="container" style="margin-top: 5.5em;">
		
			<div class="row align-items-center" style="margin-bottom: 0;">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">Commu 글쓰기</h2>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
	   				<div class="bg-light">
	   					<div>
	   						<div>
	   							<form method="post" action="register" role="form">
	   							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	   								<div class="form-group">
	   									<label>제목</label>
	   									<input class="form-control" name="title">
	   								</div>
	   								<div class="form-group">
	   									<label>내용</label>
	   									<textarea class="form-control" name="content"rows="" cols=""></textarea>
	   								</div>
	   								<div class="form-group">
	   									<label>작성자</label>
	   									<input class="form-control" name="writer"
	   										value='<sec:authentication property="principal.username"/>'
											readonly="readonly">
	   								</div>
	   								<button type="submit" class="btn btn-primary">전송</button>
	   								<button type="reset" class="btn btn-primary">최소</button>
	   							</form>
	   						</div>
	   					</div>
	   				</div>			
				</div>
			</div><!-- div class="container" -->
			
		</div><!-- div class="container" -->
	</div><!-- div class="section" -->
	
	
<script>

	
</script>

<%@ include file="../includes/footer.jsp" %>