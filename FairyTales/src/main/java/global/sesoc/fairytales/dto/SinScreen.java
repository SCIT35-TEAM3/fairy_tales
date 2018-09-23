package global.sesoc.fairytales.dto;

public class SinScreen {
	private String sinNum;
	private String screenNum;
	private String fairy_Pk;
	
	public SinScreen() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getFairy_Pk() {
		return fairy_Pk;
	}


	public void setFairy_Pk(String fairy_Pk) {
		this.fairy_Pk = fairy_Pk;
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


	@Override
	public String toString() {
		return "SinScreen [sinNum=" + sinNum + ", screenNum=" + screenNum + ", fairy_Pk=" + fairy_Pk + "]";
	}

	
	
	
}
