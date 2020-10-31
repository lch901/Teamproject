<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.DataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous?ver=123"></script> 
<link rel="stylesheet" type="text/css" href="css/main.css?ver=123">
<link rel="stylesheet" type="text/css" href="css/nm.css">
<script src="js/product.js" charset="utf-8"></script>

<style>
	.product-img {margin: 80px 100px 20px;}
	.product-img > img {width: 500px; height: 650px;}
	.product-table {margin: 80px 100px 20px; width: 500px; height: 650px;}
	form {width: 500px; height: 650px; padding-left: 30px;}
	table tr td:nth-child(1) {font-size: 30px; color:#444; text-align: left; padding: 0 80px 20px 0;}
	table tr td:nth-child(2) {font-size: 30px; color:#444; text-align: left; padding: 0 0 20px 0;}
	input[type="number"] {vertical-align: middle; width: 200px; height: 40px; font-size: 30px;}
</style>
</head>
<body>
<jsp:include page="top.jsp"/>
	<%
		List<DataBean> list=(List<DataBean>)request.getAttribute("list");
	%>
	<div style="display:flex; justify-content: center; align-items: flex-start; padding: 120px 120px 30px; flex-wrap: wrap;">
		<div class="product-img">
			<img src="images/${list.get(0).getPic()}" alt="이미지 없음">
		</div>
		<div class="product-table">
			<form name="frm" action="" method="get">
				<table border="1" style="border-collapse: collapse;">
					<tr>
						<td>상품명</td>
						<td><%=list.get(0).getName() %></td>
					</tr>
					<tr>
						<td>판매가</td>
						<td><%=list.get(0).getPrice() %></td>
					</tr>
					<tr>
						<td>사이즈</td>
						<%if(list.get(0).getCategory().equals("shoes")){ %>
							<td>size (250~280)</td>
						<%}else if(list.get(0).getCategory().equals("pants") || list.get(0).getCategory().equals("sale85")){ %>
							<td>size (28~30)</td>
						<%}else if(list.get(0).getCategory().equals("item")){ %>
							<td>size (-)</td>
						<%}else{ %>
							<td>size (95~105)</td>
						<%} %>
					</tr>
					<tr>
						<td colspan="2">
							<select name="colorSize" style="vertical-align: middle; width: 440px; height: 40px; font-size: 20px;">
								<option >[필수]옵션선택</option>
								<option disabled="disabled">------------------------</option>
								<option disabled="disabled">색상-사이즈</option>
								<%if(list.get(0).getCategory().equals("shoes")){ %>
									<option value="블랙-250~260">블랙-250~260</option>
									<option value="블랙-260~270">블랙-260~270</option>
									<option value="블랙-270~280">블랙-270~280</option>
									<option value="화이트-250~260">화이트-250~260</option>
									<option value="화이트-260~270">화이트-260~270</option>
									<option value="화이트-270~280">화이트-270~280</option>
									<option value="브라운-250~260">브라운-250~260</option>
									<option value="브라운-260~270">브라운-260~270</option>
									<option value="브라운-270~280">브라운-270~280</option>
								<%}else if(list.get(0).getCategory().equals("pants") || list.get(0).getCategory().equals("sale85")){ %>
									<option value="블랙-28">블랙-28</option>
									<option value="블랙-29">블랙-29</option>
									<option value="블랙-30">블랙-30</option>
									<option value="화이트-28">화이트-28</option>
									<option value="화이트-29">화이트-29</option>
									<option value="화이트-30">화이트-30</option>
									<option value="브라운-28">브라운-28</option>
									<option value="브라운-29">브라운-29</option>
									<option value="브라운-30">브라운-30</option>
								<%}else if(list.get(0).getCategory().equals("item")){ %>
									<option value="블랙">블랙</option>
									<option value="화이트">화이트</option>
									<option value="브라운">브라운</option>
									<option value="블루">블루</option>
									<option value="오렌지">오렌지</option>
								<%}else{ %>
									<option value="블랙-95">블랙-95</option>
									<option value="블랙-100">블랙-100</option>
									<option value="블랙-105">블랙-105</option>
									<option value="화이트-95">화이트-95</option>
									<option value="화이트-100">화이트-100</option>
									<option value="화이트-105">화이트-105</option>
									<option value="브라운-95">브라운-95</option>
									<option value="브라운-100">브라운-100</option>
									<option value="브라운-105">브라운-105</option>
								<%} %>
							</select>
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td>
							<input type="number" name="qty" value="${list.get(0).getQty()}" min="0" max="99">
						</td>
					</tr>
				</table>
				<!-- 숨김 -->
				<input type="hidden" name="i_product" value="${list.get(0).getI_product()}">
				<a href="javascript:p_order()" style="display: inline-block; width: 218px; height: 45px; text-align: center; line-height: 42px; font-size: 18px; border-radius: 2px; background: #0a56a9; color: #fff; margin-top: 100px;">구매하기</a>
				<a href="javascript:p_cart()" style="display: inline-block; width: 218px; height: 45px; text-align: center; line-height: 42px; font-size: 18px; border-radius: 2px; background: #666; color: #fff; margin-top: 100px;">장바구니</a>
				<!-- <input type="submit" value="구매하기" onclick="javascript: form.action='order';">
				<input type="submit" value="장바구니" onclick="javascript: form.action='cart';"> -->
			</form>	
		</div>
	</div>
<!--최상단 메뉴바-->
    <jsp:include page="bottom.jsp"/>
</body>
</html>