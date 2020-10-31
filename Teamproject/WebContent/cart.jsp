<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="beans.DataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous"></script> 
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">

</head>
<body>
	<jsp:include page="top.jsp"/>
	<%
		DataBean dataBean = (DataBean)session.getAttribute("session");
		if(dataBean == null){
			response.sendRedirect("login");
		}
	%>
	<div class="title" style="text-align:center;">SHOPPING LIST</div>
	<div style="margin:0 auto; width:1000px;">
		<p>상품 총 개수(&nbsp; ${cnt } &nbsp;)</p>
		<table class="table1">
			<tr class="position_center headColor">
				<td>번호</td>
				<td>이미지</td>
				<td>상품정보</td>
				<td>가격</td>
				<td>수량</td>
				<td>상품 삭제</td>
			</tr>
			<c:set var="i" value="0"/>
			<c:set var="j" value="0"/>
			<c:set var="total" value="0"/>
			<c:forEach var="product_list" items="${list }">
				<c:if test="${product_list.i_member == session.i_member}">
					<tr>
						<td class="position_center"><c:set var="j" value="${j+1}"/><c:out value="${j}"/></td>
						<td class="position_center"><img src="images/${product_list.pic }" class="img1" alt="이미지가 없음"/></td>
						<td class="product_select">
							${product_list.name }<br/>
							${product_list.colorSize }<br/>
							<form action="cart_colorSize" method="get">
								<input type="hidden" name="i_pi" value="${product_list.i_pi}">
								<select name="colorSize" style="height:23px;">
										<option >[필수]옵션선택</option>
										<option disabled="disabled">------------------------</option>
										<option disabled="disabled">색상-사이즈</option>
										<c:choose> 
											<c:when test="${product_list.category eq 'shoes'}">
												<option value="블랙-250~260">블랙-250~260</option>
												<option value="블랙-260~270">블랙-260~270</option>
												<option value="블랙-270~280">블랙-270~280</option>
												<option value="화이트-250~260">화이트-250~260</option>
												<option value="화이트-260~270">화이트-260~270</option>
												<option value="화이트-270~280">화이트-270~280</option>
												<option value="브라운-250~260">브라운-250~260</option>
												<option value="브라운-260~270">브라운-260~270</option>
												<option value="브라운-270~280">브라운-270~280</option>
											</c:when>
											<c:when test="${product_list.category == 'pants' || product_list.category == 'sale85'}">
												<option value="블랙-28">블랙-28</option>
												<option value="블랙-29">블랙-29</option>
												<option value="블랙-30">블랙-30</option>
												<option value="화이트-28">화이트-28</option>
												<option value="화이트-29">화이트-29</option>
												<option value="화이트-30">화이트-30</option>
												<option value="브라운-28">브라운-28</option>
												<option value="브라운-29">브라운-29</option>
												<option value="브라운-30">브라운-30</option>
											</c:when>
											<c:when test="${product_list.category == 'item'}">
												<option value="블랙">블랙</option>
												<option value="화이트">화이트</option>
												<option value="브라운">브라운</option>
												<option value="블루">블루</option>
												<option value="오렌지">오렌지</option>
											</c:when>
											<c:otherwise>
												<option value="블랙-95">블랙-95</option>
												<option value="블랙-100">블랙-100</option>
												<option value="블랙-105">블랙-105</option>
												<option value="화이트-95">화이트-95</option>
												<option value="화이트-100">화이트-100</option>
												<option value="화이트-105">화이트-105</option>
												<option value="브라운-95">브라운-95</option>
												<option value="브라운-100">브라운-100</option>
												<option value="브라운-105">브라운-105</option>
											</c:otherwise>
										</c:choose>
									</select>
									<input type="submit" value="변경">
								</form>
						</td>
						<td class="position_center">${product_list.price }원 <c:set var="total" value="${total+product_list.price*product_list.qty}"/></td>
						<td class="position_center">
							<form action="cart_qty" method="get">
								<input type="hidden" name="i_pi" value="${product_list.i_pi }">
								<input type="number" name="qty" value="${product_list.qty }" min="1" max="99" style="width:45px; height:25px;">
								<c:set var="i" value="${i+product_list.qty}"/>
								<input type="submit" value="변경">
							</form>
						</td>
						<td class="position_center">
							<a href="cart_order?i_pi=${product_list.i_pi}&i_product=${product_list.i_product }&colorSize=${product_list.colorSize}&qty=${product_list.qty}" onclick="return product_order();" title="주문하기"><i class="far fa-credit-card"></i></a>
							<a href="cart_delete?i_pi=${product_list.i_pi}" onclick="return product_delete();" title="삭제하기"><i class="fas fa-trash-alt"></i></a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		
		<!-- 최종 주문가격 영역 -->
		<ul class="cart_order_result clfix">
			<li class="result_unit01 clfix">
				<dl class="clfix">
					<dt>총가격</dt>
					<dd id="totalAmt"><c:out value="${total}"/>원</dd>
				</dl>
			</li>
			<li class="result_unit02 clfix">
				<dl class="clfix">
					<dt>배송비</dt>
					<dd id="totalDlvCost">+ 3000원</dd>
				</dl>
			</li>
			<li class="result_unit03 clfix">
				<dl class="clfix">
					<dt>총 결제 예상금액</dt>
					<dd>
						<span class="ico_price" id="totalAmt2"><c:out value="${total+3000*i}"/>원</span>
					</dd>
				</dl>
			</li>
		</ul>
		<span class="txt01"><b>※ 10만원 이상 구입 시 배송비가 무료입니다.</b></span>
		<div class="btn_area clfix">
			<div class="btn">
				<a href="cart_total_order" onclick="return product_total_order();" class="btn_black order_grey" id="btn_orer"> 전체주문</a>					
			</div>
			<div class="btn">
				<a href="cart_total_delete" onclick="return total_delete();" class="btn_black delete_black" id="btn_orer"> 전체삭제</a>					
			</div>
		</div>
	</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>
<script>

	function product_total_order(){
		if(confirm("전체 주문하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
	function product_order(){
		if(confirm("해당 상품을 주문하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
	function product_delete(){
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
	function total_delete(){
		if(confirm("장바구니를 비우시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
	
</script>