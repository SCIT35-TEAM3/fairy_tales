package global.sesoc.fairytales.dto;

public class Code {
	private String sinNum;
	private String screenNum;
	private String fairy_Pk;
	private String question_num;
	
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

	public String getQuestion_num() {
		return question_num;
	}

	public void setQuestion_num(String question_num) {
		this.question_num = question_num;
	}

	@Override
	public String toString() {
		return "Code [sinNum=" + sinNum + ", screenNum=" + screenNum + ", fairy_Pk=" + fairy_Pk + ", question_num="
				+ question_num + "]";
	}
	
	
}
