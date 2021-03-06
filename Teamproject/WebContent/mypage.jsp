<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.DataBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://kit.fontawesome.com/b2b9fa9cfa.js" crossorigin="anonymous?ver=123"></script> 
	<link rel="stylesheet" type="text/css" href="css/main.css?ver=111">
    
    <link href="https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/join.css">
	<script src="js/mypage.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<%
		String msg=(String)request.getAttribute("msg");
		if(msg!=null){
			%><script>alert('<%=msg%>')</script><%
		}
	
		DataBean dataBean = (DataBean)session.getAttribute("session");
		if(dataBean == null){
			response.sendRedirect("login");//	<- 페이지가 login으로 이동된후에도 mypage.jsp의 밑에 코드가 모드 실행됨.
		}else{
	%>
    <form style="padding-top:100px;" name="frm" action="" method="POST">
        <div class="join_area">
            <div class="join_agree_area space">
                    <div class="join_agree_tit">회원정보수정</div>
            </div>

            <div class="join_mobile_certify">
                <table class="tbl_row tbl_space">
                    <colgroup>
                        <col width="128px">
                        <col width="*">
                    </colgroup>
                    <tbody>
                     	<!-- 아이디  -->
                        <tr>
                            <th class="vertical_top">
                                <label for="id_emal" class="tit_style">
                                    <span class="underline">아이디</span>
                                </label>
                            </th>
                            <td>
                                <div class="input_txt">
                                    <input type="text" id="joinEmail" name="id"  class="wd_200" readonly="readonly" value="<%=dataBean.getId()%>">
                                    <div class="form_notice_area" id="emailUseText"></div>
                                </div>
                            </td>
                        </tr>

                        <!-- 비밀번호 입력 -->
                        <tr>
                            <th class="vertical_top">
                                <label for="joinPwd" class="tit_style">
                                    <span class="underline">비밀번호</span>

                                </label>
                            </th>
                            <td>
                                <div class="input_txt">
                                    <input type="password" id="joinPwd" name="pw"  maxlength="20" placeholder="4~20자 이내 영,숫자를 사용하세요"
                                    class="wd_200" value="">
                                </div>
                                <div class="form_notice_area" id="joinPwdTxt"></div>
                            </td>
                        </tr>

                        <!-- 비밀번호 확인 -->
                        <tr>
                            <th class="vertical_top">
                                <label for="pwd_confirm" class="tit_style">
                                    <span class="underline">비밀번호 확인</span>
                                </label>
                            </th>
                            <td>
                                <div class="input_txt">
                                    <input type="password" class="wd_200" id="reJoinPwd" name="rePw"  maxlength="20">
                                </div>
                                <div class="form_notice_area" id="reJoinPwdTxt"></div>
                            </td>
                        </tr>
                        <!-- 이름 입력란 -->
                        <tr>
                            <th class="vertical_top">
                                <label for="id_emal" class="tit_style">
                                    <span class="underline" >이름</span>
                                </label>
                            </th>
                            <td>
                                <div class="input_txt">
                                    <input type="text" id="joinEmail" name="name"  class="wd_200"  maxlength="40" value="<%=dataBean.getName()%>" >
                                    <div class="form_notice_area" id="emailUseText"></div>
                                </div>
                            </td>
                        </tr>
                        
                        <!-- 폰번호 -->
                        <tr>
                            <th>
                                <label for="phone_num" class="tit_style">
                                    <span class="underline">휴대폰번호</span>
                                </label>
                            </th>
                            <td>
                                <div class="form_layout_style clfix">
                                    <ul class="form clfix">
                                        <li style="width: 20%;">
                                            <select name="tel1" style="width:77px;height:27px;">
                                           		<option value="010">010</option>
                                           		<option value="011">011</option>
                                           		<option value="016">016</option>
                                           		<option value="017">017</option>
                                           		<option value="018">018</option>
                                           		<option value="019">019</option>
                                           	</select>
                                        </li>
                                        <li class="etd_child" style="width: 25%;">
                                            <span class="input_txt">
                                                <input type="text" id="cpNo02" name="tel2" numberonly="true" maxlength="4" size="4" value="">
                                            </span>
                                        </li>
                                        <li class="last_child" style="width: 25%;">
                                            <span class="input_txt">
                                                <input type="text" id="cpNo03" name="tel3" numberonly="true" value="" maxlength="4" size="4" value="">
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <!-- 이메일 입력란 -->
                        <tr>
                            <th>
                                <span class="tit_style">
                                    <span class="underline" >이메일</span>
                                </span>
                            </th>

                            <td>
                                <div class="input_txt">
                                    <input type="email" name="email" class="wd_200"  maxlength="40" value="<%=dataBean.getEmail()%>">
                                </div>
                            </td>
                        </tr>
                        <!-- 주소 입력란 -->
                        <tr>
                            <th>
                                <span class="tit_style">
                                    <span class="underline">주소</span>
                                </span>
                            </th>

                            <td>
                                <div class="input_txt">
                                    <input type="text"  name="addr" class="wd_200" maxlength="100" value="<%=dataBean.getAddr()%>">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="btn_area">
                <a href="javascript:send()" style="margin:5px 0;" class="btn_black01" id="saveBtn">회원정보 수정</a>
                <a href="main.jsp" style="margin:5px 0;" class="btn_black01" id="saveBtn">돌아가기</a>
            </div>
        </div>
    </form>
    <%} %>
    <jsp:include page="bottom.jsp"/>
</body>
</html>
