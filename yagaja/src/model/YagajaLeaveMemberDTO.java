package model;

import java.sql.Date;

public class YagajaLeaveMemberDTO {	
	//멤버변수
	private String leave_reason;
	private String leave_reason2;	
	private String leave_date;
	private String member_no;
	private String id;
	private String authority;
	//기본생성자
	public YagajaLeaveMemberDTO() {}
	//인자생성자
	public YagajaLeaveMemberDTO(String leave_reason, String leave_reason2, String leave_date, String member_no, String id,
			String authority) {
		this.leave_reason = leave_reason;
		this.leave_reason2 = leave_reason2;
		this.leave_date = leave_date;
		this.member_no = member_no;
		this.id = id;
		this.authority = authority;
	}
	public String getLeave_reason() {
		return leave_reason;
	}
	public void setLeave_reason(String leave_reason) {
		this.leave_reason = leave_reason;
	}
	public String getLeave_reason2() {
		return leave_reason2;
	}
	public void setLeave_reason2(String leave_reason2) {
		this.leave_reason2 = leave_reason2;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
		
}
