package global.sesoc.fairytales.dto;

public class Example {
	private String objId;
	private String answer0;
	private String answer1;
	private String answer2;
	
	public String getObjId() {
		return objId;
	}
	public void setObjId(String objId) {
		this.objId = objId;
	}
	public String getAnswer0() {
		return answer0;
	}
	public void setAnswer0(String answer0) {
		this.answer0 = answer0;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	
	@Override
	public String toString() {
		return "Example [objId=" + objId + ", answer0=" + answer0 + ", answer1=" + answer1 + ", answer2=" + answer2 + "]";
	}
}