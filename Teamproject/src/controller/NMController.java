package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import beans.DataBean;

@Controller
public class NMController {//NavMenu
	
	@Autowired
	SqlSessionTemplate sqltemp;
	
	//----------------------best-------------------------
	@GetMapping("best")
	public String best(HttpServletRequest request) {
//		request.setAttribute("view","nm/best.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/best";
	}
	//----------------------outer-------------------------
	@GetMapping("outer")
	public String outer(HttpServletRequest request) {
//		request.setAttribute("view","nm/outer.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/outer";
	}
	//----------------------top-------------------------
	@GetMapping("top")
	public String top(HttpServletRequest request) {
//		request.setAttribute("view","nm/top.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/top";
	}
	//----------------------pants-------------------------
	@GetMapping("pants")
	public String pants(HttpServletRequest request) {
//		request.setAttribute("view","nm/pants.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/pants";
	}
	//----------------------shirt-------------------------
	@GetMapping("shirt")
	public String shirt(HttpServletRequest request) {
//		request.setAttribute("view","nm/shirt.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/shirt";
	}
	//----------------------shoes-------------------------
	@GetMapping("shoes")
	public String shoes(HttpServletRequest request) {
//		request.setAttribute("view","nm/shoes.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/shoes";
	}
	//----------------------item-------------------------
	@GetMapping("item")
	public String item(HttpServletRequest request) {
//		request.setAttribute("view","nm/item.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/item";
	}
	//----------------------85sale-------------------------
	@GetMapping("sale85")
	public String sale85(HttpServletRequest request) {
//		request.setAttribute("view","nm/sale85.jsp");
		List<DataBean> list=sqltemp.selectList("test_db.select_product");
		request.setAttribute("list",list );
		return "nm/sale85";
	}
}
