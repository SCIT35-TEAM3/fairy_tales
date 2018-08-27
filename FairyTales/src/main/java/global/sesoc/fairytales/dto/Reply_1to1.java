package global.sesoc.fairytales.dto;

public class Reply_1to1 {

	private Integer reply_num; // 답글 번호
	private Integer board_num; // 질문글 번호
	private String user_id; // 회원 ID
	private String reply_title; // 답변 제목
	private String text; // 답변 내용
	private String new_date; // 답글 등록일

	public Reply_1to1() {
		super();
	}

	public Reply_1to1(Integer reply_num, Integer board_num, String user_id, String reply_title, String text,
			String new_date) {
		super();
		this.reply_num = reply_num;
		this.board_num = board_num;
		this.user_id = user_id;
		this.reply_title = reply_title;
		this.text = text;
		this.new_date = new_date;
	}

	public Integer getReply_num() {
		return reply_num;
	}

	public void setReply_num(Integer reply_num) {
		this.reply_num = reply_num;
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

	public String getReply_title() {
		return reply_title;
	}

	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getNew_date() {
		return new_date;
	}

	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}

	@Override
	public String toString() {
		return "Reply_1to1 [reply_num=" + reply_num + ", board_num=" + board_num + ", user_id=" + user_id
				+ ", reply_title=" + reply_title + ", text=" + text + ", new_date=" + new_date + "]";
	}

}