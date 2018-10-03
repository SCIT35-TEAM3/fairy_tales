package global.sesoc.fairytales.dto;

import java.util.List;

public class Chapter {
	private List<Screen> screen;
	private String background;
	private String mainImg;
	private String maxLayer;
	private Integer fairy_pk;
	private Integer chapter;
	
	public List<Screen> getScreen() {
		return screen;
	}
	public void setScreen(List<Screen> screen) {
		this.screen = screen;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getMaxLayer() {
		return maxLayer;
	}
	public void setMaxLayer(String maxLayer) {
		this.maxLayer = maxLayer;
	}
	public Integer getFairy_pk() {
		return fairy_pk;
	}
	public void setFairy_pk(Integer fairy_pk) {
		this.fairy_pk = fairy_pk;
	}
	public Integer getChapter() {
		return chapter;
	}
	public void setChapter(Integer chapter) {
		this.chapter = chapter;
	}
	@Override
	public String toString() {
		return "Chapter [screen=" + screen + ", background=" + background + ", mainImg=" + mainImg + ", maxLayer="
				+ maxLayer + ", fairy_pk=" + fairy_pk + ", chapter=" + chapter + "]";
	}
}