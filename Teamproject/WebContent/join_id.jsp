<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<TITLE>아이디 검색</TITLE>
</HEAD>
<script src="js/join.js" charset="utf-8"></script>
<form action="join_id" method="get">
	<table border="1" style="border-collapse: collapse">
		<tr>
			<td width=346 height=60>※ 사용하고자 하는 ID를 입력해 주십시요.<br>※ 영문과 숫자의 조합으로 4자이상 8자 이하로 가능합니다..</td>
		</tr>
		<tr>
			<td>
				<%
					String id=(String)request.getAttribute("id");
					if(id==null){
						id="";
					}
					
					String msg=(String)request.getAttribute("msg");
					if(msg!=null){
						out.print(msg);
					}
				%>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="id" value="<%=id%>" maxlength="20">
				<input type="submit" value="아이디 중복확인">
			</td>
		</tr>
		<tr>
			<td>
				<input type="Button" value="확인" onClick="javascript:sendId('<%=id%>');" >
				<input type="Button" value="취 소" onClick="javascript:window.close();" >
			</td>
		</tr>
	</table>
</form>			
		
</BODY>
</HTML>
