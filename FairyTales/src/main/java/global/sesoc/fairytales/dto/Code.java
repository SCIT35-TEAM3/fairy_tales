package global.sesoc.fairytales.dto;

public class Code {
	private String chapter;
	private String objid;
	private String fairy_Pk;
	private String question_type;
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getObjid() {
		return objid;
	}
	public void setObjid(String objid) {
		this.objid = objid;
	}
	public String getFairy_Pk() {
		return fairy_Pk;
	}
	public void setFairy_Pk(String fairy_Pk) {
		this.fairy_Pk = fairy_Pk;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	@Override
	public String toString() {
		return "Code [chapter=" + chapter + ", objid=" + objid + ", fairy_Pk=" + fairy_Pk + ", question_type="
				+ question_type + "]";
	}
}
