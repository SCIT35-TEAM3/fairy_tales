package global.sesoc.fairytales.dto;

//동화
public class Question {
	private Integer question_pk;
	private Integer fairy_pk;
	private String  answer;
	private Integer chapter;
	private Integer obj_id;
	private String  delidset; // 삭제를위한 objid 세트
	
	public Integer getQuestion_pk() {
		return question_pk;
	}
	public void setQuestion_pk(Integer question_pk) {
		this.question_pk = question_pk;
	}
	public Integer getFairy_pk() {
		return fairy_pk;
	}
	public void setFairy_pk(Integer fairy_pk) {
		this.fairy_pk = fairy_pk;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getChapter() {
		return chapter;
	}
	public void setChapter(Integer chapter) {
		this.chapter = chapter;
	}
	public Integer getObj_id() {
		return obj_id;
	}
	public void setObj_id(Integer obj_id) {
		this.obj_id = obj_id;
	}
	public String getDelidset() {
		return delidset;
	}
	public void setDelidset(String delidset) {
		this.delidset = delidset;
	}
	@Override
	public String toString() {
		return "Question [question_pk=" + question_pk + ", fairy_pk=" + fairy_pk + ", answer=" + answer + ", chapter="
				+ chapter + ", obj_id=" + obj_id + ", delidset=" + delidset + "]";
	}
}