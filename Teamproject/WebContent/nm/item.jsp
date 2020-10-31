<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.DataBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous?ver=123"></script> 
<link rel="stylesheet" type="text/css" href="css/style.css?ver=111">
<link rel="stylesheet" type="text/css" href="css/nm.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/nm.js" defer></script>
</head>
<body>
<jsp:include page="../top.jsp"/>
<%
	List<DataBean> list=(List<DataBean>)request.getAttribute("list");
%>
<div class="title">item</div>
<ul class="nm">
<%
	if(list!=null){
	for(int i=0;i<list.size();i++){ 
		if(list.get(i).getCategory().equals("item")){%>
		<%if((i+1)%3==1){ %><div class="nm-item"><%} %>
			<a href="product?i_product=<%=list.get(i).getI_product()%>">
				<li><img src="images/<%=list.get(i).getPic() %>" alt="이미지가 없음"/></li>
				<li><%=list.get(i).getName() %></li>
				<li><%=list.get(i).getPrice() %>원</li>
			</a>
			<%if(i>1 && (i+1)%3==0){ %></div><%} %>
		<%}
	}
} %>
</ul>
<!--최상단 메뉴바-->
    <jsp:include page="../bottom.jsp"/>
</body>
</html>