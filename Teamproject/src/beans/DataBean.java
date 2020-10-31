package beans;

public class DataBean {
	//---------member테이블----------
	private int i_member;	//테이블번호
	private String id;		//아이디
	private String pw;		//비번
	private String name;	//이름
	private String tel;		//전화번호
	private String email;	//이메일
	private String addr;	//주소
	private String sex;		//성별
	private String r_date;	//회원가입한 날짜
	
	//---------product테이블----------
	private int i_product;	//테이블번호
//	private String name;	//상품이름
	private int price;		//가격
	private String pic;		//이미지
	private int qty;		//상품 개수
	private String info;	//상품 정보
	private String category;
	
	//-------------product_import테이블----------------
	private int i_pi;
	private String colorSize;//값이 전달되는 경로. product.jsp -> cart.jsp,order.jsp
	private String i_date;
	//-------------product_import테이블----------------
	private int i_po;
	private String firstDate;
	private String lastDate;
	
	
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getI_po() {
		return i_po;
	}
	public void setI_po(int i_po) {
		this.i_po = i_po;
	}
	public int getI_pi() {
		return i_pi;
	}
	public void setI_pi(int i_pi) {
		this.i_pi = i_pi;
	}
	public String getI_date() {
		return i_date;
	}
	public void setI_date(String i_date) {
		this.i_date = i_date;
	}
	public String getColorSize() {
		return colorSize;
	}
	public void setColorSize(String colorSize) {
		this.colorSize = colorSize;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getI_member() {
		return i_member;
	}
	public void setI_member(int i_member) {
		this.i_member = i_member;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getI_product() {
		return i_product;
	}
	public void setI_product(int i_product) {
		this.i_product = i_product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
