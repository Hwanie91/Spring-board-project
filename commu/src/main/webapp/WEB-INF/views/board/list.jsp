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
			<div class="container">
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
							  			<a href='<c:out value="${board.bno}"/>'>
							  			<c:out value="${board.title}"/>
							 				</a>
							 			</td>
							  		<td class="col-md-2"><c:out value="${board.writer}"/></td>
							  		<td class="col-md-1.5"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/> </td>
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


<%@ include file="../includes/footer.jsp" %>