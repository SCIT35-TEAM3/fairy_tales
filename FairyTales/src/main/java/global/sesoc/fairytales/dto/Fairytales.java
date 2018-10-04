package global.sesoc.fairytales.dto;

//동화
public class Fairytales {
	private Integer	fairy_pk;			//동화번호
	private String	fairy_name;			//동화이름
	private String	fairy_code;			//cd:IT	jp:일본어
	private Integer	fairy_chapter;		//최대챕터수
	private String	fairy_position;		//물리적위치
	private Integer	fairy_level;		//1초급2중급3고급
	
	public Integer getFairy_pk() {
		return fairy_pk;
	}
	public void setFairy_pk(Integer fairy_pk) {
		this.fairy_pk = fairy_pk;
	}
	public String getFairy_name() {
		return fairy_name;
	}
	public void setFairy_name(String fairy_name) {
		this.fairy_name = fairy_name;
	}
	public String getFairy_code() {
		return fairy_code;
	}
	public void setFairy_code(String fairy_code) {
		this.fairy_code = fairy_code;
	}
	public Integer getFairy_chapter() {
		return fairy_chapter;
	}
	public void setFairy_chapter(Integer fairy_chapter) {
		this.fairy_chapter = fairy_chapter;
	}
	public String getFairy_position() {
		return fairy_position;
	}
	public void setFairy_position(String fairy_position) {
		this.fairy_position = fairy_position;
	}
	public Integer getFairy_level() {
		return fairy_level;
	}
	public void setFairy_level(Integer fairy_level) {
		this.fairy_level = fairy_level;
	}
	
	@Override
	public String toString() {
		return "Fairytales [fairy_pk=" + fairy_pk + ", fairy_name=" + fairy_name + ", fairy_code=" + fairy_code
				+ ", fairy_chapter=" + fairy_chapter + ", fairy_position=" + fairy_position + ", fairy_level="
				+ fairy_level + "]";
	}
}