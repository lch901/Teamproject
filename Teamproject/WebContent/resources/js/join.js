/*join.jsp */
/* 회원정보 입력체크 */
function send(){
	var	f = document.frm;
	
	if(f.id.value===''){
		alert('아이디를 입력하세요.');
		f.id.focus();
		return true;
	}
	if(f.pw.value===''){
		alert('비밀번호를 입력하세요.');
		f.pw.focus();
		return true;
	}
	
	if(f.rePw.value===''){
		alert('확인 비밀번호를 입력하세요.');
		f.rePw.focus();
		return true;
	}
	if(f.pw.value != f.rePw.value){
		alert('확인비밀번호가 틀렸습니다.');
		f.rePw.focus();
		return true;
	}
	if(f.name.value===''){
		alert('이름을 입력하세요.');
		f.name.focus();
		return true;
	}
	
	if(f.tel1.value===''){
		alert('전화번호를 입력하세요.');
		f.tel1.focus();
		return true;
	}
	if(f.tel2.value===''){
		alert('전화번호를 입력하세요.');
		f.tel2.focus();
		return true;
	}
	if(f.tel3.value===''){
		alert('전화번호를 입력하세요.');
		f.tel3.focus();
		return ;
	}
	if(f.email.value===''){
		alert('이메일을 입력하세요.');
		f.email.focus();
		return true;
	}
	if(f.addr.value===''){
		alert('주소를 입력하세요.');
		f.addr.focus();
		return true;
	}
	
	f.action="join_result";
	f.submit();
}

/*	join_id.jsp */
/* 아이디 중복체크후 확인 */
function sendId(c_id){ 				 		
	var id = c_id;
	
	opener.document.frm.id.value = id;
	document.write("c_id = " + id);
	window.close(); 
	  	
}