package global.sesoc.fairytales.dto;

public class Board_1to1 {

	private Integer board_num; // 글 번호
	private String user_id; // 회원 ID
	private Integer hitcount; // 글 조회수
	private String new_date; // 작성일
	private String title; // 글 제목
	private String text; // 질문 내용
	private String secret; // 비밀글 여부
	private String origin_file_name; // 원본파일 이름
	private String save_file_name; // 저장된 파일 이름.

	private String checked; // ★관리자 전용 ★확인여부★

	public Board_1to1() {
		super();
	}

	public Board_1to1(Integer board_num, String user_id, Integer hitcount, String new_date, String title, String text,
			String secret, String origin_file_name, String save_file_name, String checked) {
		super();
		this.board_num = board_num;
		this.user_id = user_id;
		this.hitcount = hitcount;
		this.new_date = new_date;
		this.title = title;
		this.text = text;
		this.secret = secret;
		this.origin_file_name = origin_file_name;
		this.save_file_name = save_file_name;
		this.checked = checked;
	}

	public Integer getBoard_num() {
		return board_num;
	}

	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Integer getHitcount() {
		return hitcount;
	}

	public void setHitcount(Integer hitcount) {
		this.hitcount = hitcount;
	}

	public String getNew_date() {
		return new_date;
	}

	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getOrigin_file_name() {
		return origin_file_name;
	}

	public void setOrigin_file_name(String origin_file_name) {
		this.origin_file_name = origin_file_name;
	}

	public String getSave_file_name() {
		return save_file_name;
	}

	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "Board_1to1 [board_num=" + board_num + ", user_id=" + user_id + ", hitcount=" + hitcount + ", new_date="
				+ new_date + ", title=" + title + ", text=" + text + ", secret=" + secret + ", origin_file_name="
				+ origin_file_name + ", save_file_name=" + save_file_name + ", checked=" + checked + "]";
	}
	
	
	
	
}