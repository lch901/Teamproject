<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.DataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous?ver=123"></script> 
<link rel="stylesheet" href="css/main.css">
<script src="js/main.js" defer></script>
</head>
<body>
	<%
		//메시지 
		String msg=(String)request.getAttribute("msg");
		if(msg!=null){
			%><script>alert('<%=msg%>')</script><%
		}
		DataBean dataBean = (DataBean)session.getAttribute("session");
	%>
	<!--최상단 메뉴바-->
    <jsp:include page="top.jsp"/>
    
	 <!-- 배너 슬라이드 부분 -->
    <section id="home">
        <div class="slide_section">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
            <input type="radio" name="slide" id="slide04">
			
            <div class="slidewrap">
                <!-- 슬라이드 이미지 추가 -->
                <ul class="slidelist">
                    <li>
                        <a href="#">
                            <label for="slide01" class="left"></label>            
                            <img src="images/snoopy_banner.jpg" alt="배너1">
                            <label for="slide02" class="right"></label>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <label for="slide01" class="left"></label>
                            <img src="images/ston.jpg" alt="배너2">
                            <label for="slide03" class="right"></label>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <label for="slide02" class="left"></label>
                            <img src="images/ston_2.jpg" alt="배너3">
                            <label for="slide04" class="right"></label>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <label for="slide01" class="left"></label>
                            <img src="images/ston3.jpg" alt="배너4">
                            <label for="slide01" class="right"></label>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <div id="wrap">
        <div id="container">
            <div id="contents">
                <!-- 인기상품 페이지 영역 -->
                <div class="main_list">
                    <div class="title">
                        <h3>타코야킴의 2020 가을 인기상품</h3>
                        <p>가을남자가 되기위한 추천상품을 지금 만나보세요!</p>
                        <div class="link">
                            <a href="#">보러가기</a>
                        </div>
                    </div>
            
                    <div class="list">
                        <div class="product">
                            <ul class="product_list">
                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p1.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p2.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p3.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p4.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                                
                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p3.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                                
                                <li>
                                    <dl>
                                        <dd class="img"><a href="#"><img src="images/p6.jpg" alt=""></a></dd>                        
                                        <dd>타코야킴 가을남자 시리즈</dd>
                                        <dd>69,000원</dd>
                                    </dl>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 광고부분 -->
    <div class="main_content">
        <div class="main_ban">
            <a href="#">
                <img src="images/carra.jpg" alt="">
                <div class="project_description">
                    <h3><span>타코야킴의 2020 가을 신상품</span> </h3>
                    <p><span>다양한 코디와 신상품을 만나보세요</span></p>
                </div>
            </a>  
        </div>
    </div>
	
	<!--최상단 메뉴바-->
    <jsp:include page="bottom.jsp"/>
</body>
</html>