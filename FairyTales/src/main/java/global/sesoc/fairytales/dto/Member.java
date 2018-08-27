package global.sesoc.fairytales.dto;

public class Member {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private int user_age;
	private String phone_num;
	private String user_email;
	private String address;
	private int user_level;
	private String new_date;
	private String subject;
	private String oldpwd;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String user_id, String user_pwd, String user_name, int user_age, String phone_num, String user_email,
			String address, int user_level, String new_date, String subject) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_age = user_age;
		this.phone_num = phone_num;
		this.user_email = user_email;
		this.address = address;
		this.user_level = user_level;
		this.new_date = new_date;
		this.subject = subject;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public String getNew_date() {
		return new_date;
	}

	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_age="
				+ user_age + ", phone_num=" + phone_num + ", user_email=" + user_email + ", address=" + address
				+ ", user_level=" + user_level + ", new_date=" + new_date + ", subject=" + subject + ", oldpwd="
				+ oldpwd + "]";
	}

}
