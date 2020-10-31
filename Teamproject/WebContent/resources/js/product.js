/* product.jsp에서 넘어옴 */

/* 주문하기 */
function p_order(){
	var f=document.frm;
	if(f.qty.value<1){
		alert('수량을 정하세요.');
		return ;
	}
	if(f.colorSize.value==='[필수]옵션선택'){
		alert('옵션을 선택하세요.');
		return ;
	}
	
	f.action='product_order';
	f.submit();
}

/* 장바구니 */
function p_cart(){
	var f=document.frm;
	if(f.qty.value<1){
		alert('수량을 정하세요.');
		return ;
	}
	if(f.colorSize.value==='[필수]옵션선택'){
		alert('옵션을 선택하세요.');
		return ;
	}
	
	f.action='product_cart';
	f.submit();
}