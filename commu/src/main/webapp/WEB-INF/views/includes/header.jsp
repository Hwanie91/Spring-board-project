<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap5" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="/commu/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/commu/resources/fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="/commu/resources/css/tiny-slider.css">
	<link rel="stylesheet" href="/commu/resources/css/aos.css">
	<link rel="stylesheet" href="/commu/resources/css/style.css">
	<script src="/commu/resources/js/jquery.min.js"></script>

	<title>Commu Board Project</title>
</head>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="#" class="logo m-0 float-start">Commu Board</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu">
						<li class="active"><a href="/commu">Home</a></li>
						<li><a href="/commu/board/list">게시판</a></li>
						<li><a href="#">영상저장소</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
					
					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="has-children">
							<a href="#">☆ Star</a>
							<ul class="dropdown">
								<li><a href="#">로그인</a></li>
								<li><a href="#">회원가입</a></li>
								<li class="has-children">
									<a href="#">My Info</a>
									<ul class="dropdown">
										<li><a href="#">Profile</a></li>
										<li><a href="#">Sub Menu Two</a></li>
										<li><a href="#">로그아웃</a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>