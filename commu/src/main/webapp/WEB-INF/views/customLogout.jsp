<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>

<div class="section">
	<div class="row" style="margin-top: 5rem;">
		<div class="col-lg-5 border p-5 rounded-3" style="margin: auto;">
			<div>
				<h1>로그아웃 처리</h1>
			    <h2>${error }</h1>
			    <h2>${logout}</h1>
		  	</div>
  			<form role="form" action="/custonlogout" method="post">
		    	<fieldset>
		    		<a href="index.html" class="btn btn-lg btn-success btn-block">
		    			로그아웃
		    		</a>
		    	</fieldset>
		    	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		  	</form>
		  	<!-- 겟 방식으로 로그아웃 페이지에 접근하고, 로그아웃 버튼을 누르면 포스트 방식으로 처리 -->
	  	</div>
  	</div>
</div><!-- div class="section" -->

<script type="text/javascript">
	$(".btn-success").on("click", function(e) {
		e.preventDefault();
		$("form").submit();
	});
</script>

<c:if test="${param.logout != null }">
	<scrtpt>
		$(document).ready(function() { <!-- 로그아웃 파라미터 값이 있다면, 로그아웃 안내창 표시 -->
			alert("로그아웃")
		});
	</scrtpt>
</c:if>

<%@ include file="includes/footer.jsp" %>
