package model;

import java.sql.Date;

public class NoticeDTO {
	
	private String notice_no;
	private String notice_title;
	private String notice_contents;
	private java.sql.Date notice_regidate;
	private String notice_name;
	
	
	public NoticeDTO() {}
	
	public NoticeDTO(String notice_no, String notice_title, String notice_contents, Date notice_regidate,
			String notice_name) {

		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_regidate = notice_regidate;
		this.notice_name = notice_name;
	}
	
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public java.sql.Date getNotice_regidate() {
		return notice_regidate;
	}
	public void setNotice_regidate(java.sql.Date notice_regidate) {
		this.notice_regidate = notice_regidate;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	
	

}
