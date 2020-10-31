<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="beans.DataBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous?ver=123"></script> 
<link rel="stylesheet" type="text/css" href="css/main.css?ver=111">
<style>
	.title{
		padding-top:120px;
		font-size:32px;
	}
	.table1{
		width:1000px;
	}
	.table1,tr,td{
		border:1px solid #aaa; 
		border-collapse: collapse;
		color:#aaa;
	}
	.table1 a{
		color:#aaa;
	}
	.img1{
		width:80px;
		height:100px;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<%
		DataBean dataBean = (DataBean)session.getAttribute("session");
		if(dataBean==null){
			response.sendRedirect("login");
		}
			List<DataBean> list=(List<DataBean>)request.getAttribute("list");
	%>
	<div class="title">주문 내역</div>
	<form action="order" method="get">
		<input type="date" name="firstDate">&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="lastDate">
		&nbsp;&nbsp;<input type="submit" value="조회">
	</form>
	<table class="table1" border="1" style="border-collapse: collapse;">
		<tr>
			<td>주문일자</td>
			<td>이미지</td>
			<td>상품정보</td>
			<td>가격</td>
			<td>개수</td>
			<td>상품구매금액</td>
			<td>주문처리상태</td>
		</tr>
		<%
			int sum=0; //(가격*개수)합계
			int total=0;//총 합계
			int i=0;//for문 i
		%>
		<%if(list!=null){%>
			<%for(i=0;i<list.size();i++){ %>
				<%if(dataBean.getI_member()==list.get(i).getI_member()){ %>
					<tr>
						<td><%=list.get(i).getI_date().substring(0,10)%></td>
						<td><img class="img1" src="images/<%=list.get(i).getPic()%>"></td>
						<td>
							<%=list.get(i).getName() %>
							<%=list.get(i).getColorSize() %>
						</td>
						<td><%=list.get(i).getPrice() %>원</td>
						<td><%=list.get(i).getQty() %></td>
						<td>
							<% sum=list.get(i).getQty()*list.get(i).getPrice();
							   out.print(sum);
							   total+=sum;%>
						</td>
						<td>배송중</td>
					</tr>
				<%} %>
			<%} %>
		<%} %>
	</table>
		
	<jsp:include page="bottom.jsp"/>
</body>
</html>