package model;



public class YagajaMemberDTO {	
	//멤버변수
	private String member_no;
	private String id;
	private String pass;
	private String nickname;
	private String phone;
	private String m_point;
	private String email;
	private String regidate;
	private String authority;
	//기본생성자
	public YagajaMemberDTO() {}
	//인자생성자
	public YagajaMemberDTO(String member_no, String id, String pass, String nickname, String phone, String m_point,
			String email, String regidate, String authority) {
		this.member_no = member_no;
		this.id = id;
		this.pass = pass;
		this.nickname = nickname;
		this.phone = phone;
		this.m_point = m_point;
		this.email = email;
		this.regidate = regidate;
		this.authority = authority;
	}
	//getter/setter
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	} 
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getM_point() {
		return m_point;
	}
	public void setM_point(String m_point) {
		this.m_point = m_point;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
