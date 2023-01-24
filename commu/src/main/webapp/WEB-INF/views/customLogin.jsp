<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>

<div class="section">
	<div class="row" style="margin-top: 5rem;">
		<div class="col-lg-5 border p-5 rounded-3" style="margin: auto;">
			<header class="welcome-header">
			    <h1 class="welcome-header__title">Welcome to Commu Board<br>${error }${logout}</h1>
			    <p class="welcome-header__text">If you heve a Commu Account,</p> 
			    <p class="welcome-header__text">log in with your ID.</p>
		  	</header>
  			<form action="login" method="post" id="login-form">
			    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		    	<input name="username" type="text" placeholder="ID" class="form-control">
	    		<input name="password" type="password" placeholder="Password" class="form-control">
	    		<div>
	    			<input type="checkbox" name="remember-me"> 자동 로그인
	    		</div>
	    		<input type="submit" value="Log In">
			    <a href="#">Find Commu Account or Password</a>
		  	</form>
	  	</div>
  	</div>
</div><!-- div class="section" -->

<%@ include file="includes/footer.jsp" %>
