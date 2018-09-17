package model;

public class ReservationDTO 
{
	//멤버변수
	private String reser_no;
	private String reser_name;
	private String check_in;
	private String check_out;
	private String reser_phone;
	private String visit_type;
	private String reser_date;
	private String cancle_date;
	private String cancle_fee;
	private String reser_type;
	private String payment_type;
	private String payment_price;
	private String auction_no;
	private String hotdeal_no;
	private String lodge_no;
	private String member_no;
	private String lodge_type;
	private String lodge_name;
	private String phone;
	//기본생성자
	public ReservationDTO() 
	{
		super();
	}
	//인자생성자
	public ReservationDTO(String reser_no, String reser_name, String check_in, String check_out, String reser_phone,
			String visit_type, String reser_date, String cancle_date, String cancle_fee, String reser_type,
			String payment_type, String payment_price, String auction_no, String hotdeal_no, String lodge_no,
			String member_no, String lodge_type, String lodge_name) 
	{
		super();
		this.reser_no = reser_no;
		this.reser_name = reser_name;
		this.check_in = check_in;
		this.check_out = check_out;
		this.reser_phone = reser_phone;
		this.visit_type = visit_type;
		this.reser_date = reser_date;
		this.cancle_date = cancle_date;
		this.cancle_fee = cancle_fee;
		this.reser_type = reser_type;
		this.payment_type = payment_type;
		this.payment_price = payment_price;
		this.auction_no = auction_no;
		this.hotdeal_no = hotdeal_no;
		this.lodge_no = lodge_no;
		this.member_no = member_no;
		this.lodge_type = lodge_type;
		this.lodge_name = lodge_name;
	}
	//getter/setter
	public String getReser_no() {
		return reser_no;
	}
	public void setReser_no(String reser_no) {
		this.reser_no = reser_no;
	}
	public String getReser_name() {
		return reser_name;
	}
	public void setReser_name(String reser_name) {
		this.reser_name = reser_name;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public String getReser_phone() {
		return reser_phone;
	}
	public void setReser_phone(String reser_phone) {
		this.reser_phone = reser_phone;
	}
	public String getVisit_type() {
		return visit_type;
	}
	public void setVisit_type(String visit_type) {
		this.visit_type = visit_type;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	public String getCancle_date() {
		return cancle_date;
	}
	public void setCancle_date(String cancle_date) {
		this.cancle_date = cancle_date;
	}
	public String getCancle_fee() {
		return cancle_fee;
	}
	public void setCancle_fee(String cancle_fee) {
		this.cancle_fee = cancle_fee;
	}
	public String getReser_type() {
		return reser_type;
	}
	public void setReser_type(String reser_type) {
		this.reser_type = reser_type;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}
	public String getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(String auction_no) {
		this.auction_no = auction_no;
	}
	public String getHotdeal_no() {
		return hotdeal_no;
	}
	public void setHotdeal_no(String hotdeal_no) {
		this.hotdeal_no = hotdeal_no;
	}
	public String getLodge_no() {
		return lodge_no;
	}
	public void setLodge_no(String lodge_no) {
		this.lodge_no = lodge_no;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getLodge_type() {
		return lodge_type;
	}
	public void setLodge_type(String lodge_type) {
		this.lodge_type = lodge_type;
	}
	public String getLodge_name() {
		return lodge_name;
	}
	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	
}
