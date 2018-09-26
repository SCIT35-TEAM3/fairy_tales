package global.sesoc.fairytales.dto;

public class Code {
	private String sinNum;
	private String screenNum;
	private String fairy_Pk;
	private String question_type;
	
	public Code() {
		// TODO Auto-generated constructor stub
	}

	public String getSinNum() {
		return sinNum;
	}

	public void setSinNum(String sinNum) {
		this.sinNum = sinNum;
	}

	public String getScreenNum() {
		return screenNum;
	}

	public void setScreenNum(String screenNum) {
		this.screenNum = screenNum;
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
		return "Code [sinNum=" + sinNum + ", screenNum=" + screenNum + ", fairy_Pk=" + fairy_Pk + ", question_type="
				+ question_type + "]";
	}

	
	
}
