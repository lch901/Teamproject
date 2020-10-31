<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.DataBean" %>
<%
	DataBean dataBean = (DataBean)session.getAttribute("session");
%>
<!-- 상단메뉴바 -->
<nav id="navbar">
	<!-- 로고 -->
	<div class="navbar_logo">
		<a href="/Teamproject/main.jsp"><img src="images/logo.png" alt="logo"></a>
	</div>
	<ul class="navbar_menu mainbar">
		<li class="navbar_menu_item btn"><a href="best">BEST</a></li>
	    <li class="navbar_menu_item btn"><a href="top">TOP</a></li>
	    <li class="navbar_menu_item btn"><a href="pants">PANTS</a></li>
	    <li class="navbar_menu_item btn"><a href="outer">OUTER</a></li>
	    <li class="navbar_menu_item btn"><a href="shirt">SHIRT</a></li>
	    <li class="navbar_menu_item btn"><a href="shoes">SHOES</a></li>
	    <li class="navbar_menu_item btn"><a href="item">ITEM</a></li>
	    <li class="navbar_menu_item btn"><a href="sale85">85%SALE</a></li>
	</ul>

	<ul class="navbar_menu">
		
		<%if(dataBean==null){ %>
       		<li class="navbar_menu_item"><a href="login" class="log">로그인</a></li>
       		<li class="navbar_menu_item"><a href="join" class="join">회원가입</a></li>
       	<%}else{ %>
       		<li class="navbar_menu_item"><a href="logout" class="log">로그아웃</a></li>
       	<%} %>
		<li class="navbar_menu_item"><a href="mypage" class="my">마이페이지</a></li>
		<li class="navbar_menu_item"><a href="cart" class="cart">장바구니</a></li>
		<li class="navbar_menu_item"><a href="order" class="order">주문내역</a></li>
	</ul>
	<div class="navbar_toggle-btn">
		<i class="fas fa-bars"></i>
	</div>
</nav>
