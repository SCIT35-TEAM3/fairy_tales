package global.sesoc.fairytales.dto;

public class Board {
	private String user_id;
	private int board_num;
	private String title;
	private int hitcount;
	private String new_date;
	private String content;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(String user_id, int board_num, String title, int hitcount, String new_date, String content) {
		super();
		this.user_id = user_id;
		this.board_num = board_num;
		this.title = title;
		this.hitcount = hitcount;
		this.new_date = new_date;
		this.content = content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getNew_date() {
		return new_date;
	}

	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Board [user_id=" + user_id + ", board_num=" + board_num + ", title=" + title + ", hitcount=" + hitcount
				+ ", new_date=" + new_date + ", content=" + content + "]";
	}
	
	
}