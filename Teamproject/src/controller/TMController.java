package controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import beans.DataBean;

@Controller
public class TMController {
	@Autowired
	SqlSessionTemplate sqltemp;
	
	//-------------로그인------------------
	@GetMapping("login")
	public String login() {
		return "login";
	}
	@PostMapping("login_result")
	public String login_result(DataBean user_dataBean,HttpServletRequest request) {
		//아이디,비번 체크
		int result=0;
		DataBean chk_dataBean= (DataBean)sqltemp.selectOne("test_db.select_id",user_dataBean);//한개의 행을 가져오기,chk_dataBean <- db에서 가져온행을 담은 통
		
		if(chk_dataBean!=null) {//chk_dataBean.getId()==null	<-	x
			if(user_dataBean.getId().equals(chk_dataBean.getId())){
				result=1;
				if(user_dataBean.getPw().equals(chk_dataBean.getPw())) {
					result=2;
				}
			}
		}
		
		if(result == 2) {//2이면 로그인  성공
			HttpSession session = request.getSession();
			session.setAttribute("session",chk_dataBean);
			return "main";
		}else if(result == 1){//1이면 비번실패
			request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			request.setAttribute("id",chk_dataBean.getId());
			return "login";
		}else {//나머지면 아이디실패
			request.setAttribute("msg", "아이디가 존재하지않습니다.");
			return "login";
		}
	}
	//---------------로그아웃
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("session", null);
		return "main";
	}
	//---------------------아이디비번찾기
	@GetMapping("findIdPw")
	public String findIdPw() {
		return "findIdPw";
	}
	
	//------------------회원가입------------------------
	@GetMapping("join")
	public String join() {
		return "join";
	}
	
	@PostMapping("join_result")
	public String join_result(HttpServletRequest request,DataBean dataBean) {
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String tel=tel1+tel2+tel3;
		dataBean.setTel(tel);
		
		dataBean.setI_member(sqltemp.selectOne("test_db.select_member_num"));//i_member 1씩 증가
		sqltemp.insert("test_db.insert_data",dataBean);
		
		request.setAttribute("msg", "회원가입이 완료되었습니다.");
		return "main";
	}
	//------------------아이디 중복체크
	@GetMapping("join_id")
	public String join_id(HttpServletRequest request,DataBean dataBean) {
		DataBean chk_dataBean= sqltemp.selectOne("test_db.select_id",dataBean);//commit 주의
		if(chk_dataBean!=null) {
			if(dataBean.getId().equals(chk_dataBean.getId())) {
				request.setAttribute("msg","중복된 아이디가 있습니다.");
			}
		}else {
			request.setAttribute("msg","사용가능한 아이디입니다.");
			request.setAttribute("id",dataBean.getId());
		}
		
		return "join_id";
	}
	
	//------------------회원 정보 수정------------------------
	@GetMapping("mypage")
	public String mypage() {
		return "mypage";
	}
	@PostMapping("mypage_result")
	public String mypage_result(HttpServletRequest request,DataBean dataBean) {
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String tel=tel1+tel2+tel3;
		dataBean.setTel(tel);
		
//		System.out.println(dataBean.getId());
//		System.out.println(dataBean.getPw());
//		System.out.println(dataBean.getName());
//		System.out.println(dataBean.getAddr());
//		System.out.println(dataBean.getTel());
//		System.out.println(dataBean.getEmail());
		
		sqltemp.update("test_db.update_member",dataBean);
		
		request.setAttribute("msg","회원정보가 수정되었습니다.");
		return "mypage";
	}
	
	//------------------장바구니------------------------
	@GetMapping("cart")
	public String cart(HttpServletRequest request,Model model) {
		//select - product,product_import    inner join
		List<DataBean> list	=sqltemp.selectList("test_db.select_cart");
		model.addAttribute("list", list);
		
		HttpSession session=request.getSession();
		DataBean dataBean=(DataBean)session.getAttribute("session");
		
		int cnt=0;
		if(dataBean!=null) {
			cnt=sqltemp.selectOne("test_db.select_cart_count",dataBean.getI_member());
		}
		model.addAttribute("cnt", cnt);
		
		return "cart";
	}
	//----------------장바구니-상품 수량 변경
	@GetMapping("cart_qty")
	public void cart_qty(DataBean dataBean,HttpServletResponse response) throws Exception{
//		System.out.println(dataBean.getI_pi());
//		System.out.println(dataBean.getQty());
		sqltemp.update("test_db.update_cart",dataBean);
		response.sendRedirect("cart");
	}
	//----------------장바구니-상품 색,사이즈 변경
	@GetMapping("cart_colorSize")
	public void cart_colorSize(DataBean dataBean,HttpServletResponse response) throws Exception{
//		System.out.println(dataBean.getI_pi());
//		System.out.println(dataBean.getColorSize());
		sqltemp.update("test_db.update_cart2",dataBean);
		response.sendRedirect("cart");
	}
	//---------------장바구니-주문하기
	@GetMapping("cart_order")
	public void cart_order(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String i_pi=request.getParameter("i_pi");
		String i_product=request.getParameter("i_product");
		String colorSize=request.getParameter("colorSize");
		String qty=request.getParameter("qty");
		System.out.println(i_pi);
		System.out.println(i_product);
		System.out.println(colorSize);
		System.out.println(qty);
		
		HttpSession session=request.getSession();
		DataBean m_dataBean = (DataBean)session.getAttribute("session");//로그인에서 넘어온 member값
		
		List<DataBean> list=sqltemp.selectList("test_db.select_i_product",Integer.parseInt(i_product));
		DataBean dataBean = new DataBean();
		dataBean.setI_po(sqltemp.selectOne("test_db.select_product_order_num"));
		dataBean.setI_member(m_dataBean.getI_member());
		dataBean.setI_pi(Integer.parseInt(i_pi));
		dataBean.setColorSize(colorSize);
		dataBean.setQty(Integer.parseInt(qty));
		dataBean.setName(list.get(0).getName());
		dataBean.setPic(list.get(0).getPic());
		dataBean.setPrice(list.get(0).getPrice());
		
	
		sqltemp.insert("test_db.insert_product_order",dataBean);
		sqltemp.delete("test_db.delete_product_import_cart_one",dataBean);
		
		response.sendRedirect("order");
	}
	
	//---------------장바구니-상품삭제
	@GetMapping("cart_delete")
	public void cart_delete(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String i_pi=request.getParameter("i_pi");
		sqltemp.delete("test_db.delete_product_import_cart_one",Integer.parseInt(i_pi));
//			return "cart"; <-	cart.jsp
		response.sendRedirect("cart");//servlet-context.xml의 경로 설정때문에 response사용
	}
	//---------------장바구니-전체 주문하기
	@GetMapping("cart_total_order")
	public void cart_total_order(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		List<DataBean> list=(List<DataBean>)model.getAttribute("list");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(0).getI_pi());
		}
		
		
//		String i_pi=request.getParameter("i_pi");
//		String i_product=request.getParameter("i_product");
//		String colorSize=request.getParameter("colorSize");
//		String qty=request.getParameter("qty");
//		System.out.println(i_pi);
//		System.out.println(i_product);
//		System.out.println(colorSize);
//		System.out.println(qty);
//		
//		HttpSession session=request.getSession();
//		DataBean m_dataBean = (DataBean)session.getAttribute("session");//로그인에서 넘어온 member값
//		
//		List<DataBean> list=sqltemp.selectList("test_db.select_i_product",Integer.parseInt(i_product));
//		DataBean dataBean = new DataBean();
//		dataBean.setI_po(sqltemp.selectOne("test_db.select_product_order_num"));
//		dataBean.setI_member(m_dataBean.getI_member());
//		dataBean.setI_pi(Integer.parseInt(i_pi));
//		dataBean.setColorSize(colorSize);
//		dataBean.setQty(Integer.parseInt(qty));
//		dataBean.setName(list.get(0).getName());
//		dataBean.setPic(list.get(0).getPic());
//		dataBean.setPrice(list.get(0).getPrice());
//		
//	
//		sqltemp.insert("test_db.insert_product_order",dataBean);
//		sqltemp.delete("test_db.delete_product_import_cart_one",dataBean);
//		
		response.sendRedirect("order");
	}
	
	//---------------장바구니-전체 주문하기,장바구니 비우기
	@GetMapping("cart_total_delete")
	public void cart_total_delete(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		DataBean dataBean=(DataBean)session.getAttribute("session");
		
		sqltemp.delete("test_db.delete_product_import_cart_total",dataBean);
//			return "cart"; <-	cart.jsp
		response.sendRedirect("cart");//servlet-context.xml의 경로 설정때문에 response사용
	}
	//------------------주문내역------------------------
	@GetMapping("order")
	public String order(HttpServletRequest request,Model model) throws Exception{
		String firstDate=request.getParameter("firstDate");
		String lastDate=request.getParameter("lastDate");
		if(firstDate==null) {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			Date date2=new Date();
			String fd=sdf.format(date);
			int i_fd=Integer.parseInt(fd.substring(0,4));
			i_fd--;
			String ld=sdf.format(date2);
			int i_ld=Integer.parseInt(ld.substring(0,4));
			i_ld++;
			
			firstDate=Integer.toString(i_fd)+fd.substring(4,10);
			lastDate=Integer.toString(i_ld)+fd.substring(4,10);
		}
//		System.out.println(firstDate+"firstDate");
//		System.out.println(lastDate);
		
		DataBean dataBean=new DataBean();
		dataBean.setFirstDate(firstDate);
		dataBean.setLastDate(lastDate);
	
		List<DataBean> list	=sqltemp.selectList("test_db.select_product_order",dataBean);
		model.addAttribute("list", list);
		
		return "order";
	}
	
	
	
	//------------------상품페이지------------------------
	@GetMapping("product")
	public String product(String i_product,HttpServletRequest request) {
		List<DataBean> list=sqltemp.selectList("test_db.select_i_product", i_product);
//		System.out.println(list.get(0).getI_product());
//		System.out.println(list.get(0).getName());
//		System.out.println(list.get(0).getPrice());
		
		request.setAttribute("list",list);
		return "product";
	}
	
	//---------------상품페이지-장바구니에 추가
	@GetMapping("product_cart")
	public void product_cart(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String i_product=request.getParameter("i_product");
		String colorSize=request.getParameter("colorSize");
		String qty=request.getParameter("qty");
		
//		System.out.println(i_product);
//		System.out.println(colorSize);
//		System.out.println(qty);

		
//		product_import에 상품이 있는지 없는지 체크. 있으면 update. 없으면 insert
		HttpSession session=request.getSession();
		DataBean m_dataBean = (DataBean)session.getAttribute("session");//로그인에서 넘어온 member값
		if(m_dataBean==null) {
			response.sendRedirect("login.jsp");
		}else {
			DataBean dataBean=new DataBean();//product.jsp에서 넘어온 값(insert,update할 값)
			
			dataBean.setI_product(Integer.parseInt(i_product));//product_import테이블의 foreign key인 i_product에 insert
			dataBean.setI_member(m_dataBean.getI_member());//session에서 가져온 회원의 번호를 product_import테이블의 foreign key인 i_member에 insert
			dataBean.setColorSize(colorSize);
			dataBean.setQty(Integer.parseInt(qty));
			
			int type=0;// 1:중복된 값이 있음(update), 0:중복된 값이 없음(insert)
			
			
			
			List<DataBean> list =sqltemp.selectList("test_db.select_product_import");
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getColorSize().equals(dataBean.getColorSize()) && list.get(i).getI_member()==dataBean.getI_member() && list.get(i).getI_product()==dataBean.getI_product()) {
					type=1;
//					System.out.println("list"+list.get(i).getColorSize()+"   "+dataBean.getColorSize()+"   "+list.get(i).getI_member()+"   "+dataBean.getI_member());
				}
			}
			
			
			if(type==0){//insert(product_import)
//				System.out.println("insert"+dataBean.getColorSize()+","+dataBean.getI_member());
				dataBean.setI_pi(sqltemp.selectOne("test_db.select_product_import_num"));//i_pi 1씩 증가
				sqltemp.insert("test_db.insert_product_import",dataBean);
			}else {//update(product_import)
//				System.out.println("update"+dataBean.getColorSize()+","+dataBean.getI_member());
				int result=sqltemp.update("test_db.update_product_import",dataBean);
//				System.out.println("result"+result);
				
			}
				
			
			response.sendRedirect("cart");
		}
		
		
	}
	
	//---------------상품페이지-구매하기------------
	@GetMapping("product_order")
	public void product_order(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String i_product=request.getParameter("i_product");
		String colorSize=request.getParameter("colorSize");
		String qty=request.getParameter("qty");
//		System.out.println(colorSize);
//		System.out.println(qty);
		
		HttpSession session=request.getSession();
		DataBean m_dataBean = (DataBean)session.getAttribute("session");//로그인에서 넘어온 member값
		if(m_dataBean==null) {
			response.sendRedirect("login.jsp");
		}else {
			List<DataBean> list=sqltemp.selectList("test_db.select_i_product",Integer.parseInt(i_product));
			DataBean dataBean = new DataBean();
			dataBean.setI_po(sqltemp.selectOne("test_db.select_product_order_num"));
			dataBean.setI_member(m_dataBean.getI_member());
			dataBean.setColorSize(colorSize);
			dataBean.setQty(Integer.parseInt(qty));
			dataBean.setName(list.get(0).getName());
			dataBean.setPic(list.get(0).getPic());
			dataBean.setPrice(list.get(0).getPrice());
//			System.out.println(dataBean.getI_po());
//			System.out.println(dataBean.getI_member());
//			System.out.println(dataBean.getColorSize());
//			System.out.println(dataBean.getQty());
//			System.out.println(dataBean.getName());
//			System.out.println(dataBean.getPic());
//			System.out.println(dataBean.getPirce());
			
		
			sqltemp.insert("test_db.insert_product_order",dataBean);
			
			response.sendRedirect("order");
		}
		
		
	}
}
