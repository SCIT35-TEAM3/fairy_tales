package global.sesoc.fairytales.dto;

import java.util.List;

public class Screen{
	private List<Scene> scene;

	public List<Scene> getScene() {
		return scene;
	}
	public void setScene(List<Scene> scene) {
		this.scene = scene;
	}
	@Override
	public String toString() {
		return "Screen [scene=" + scene + "]";
	}
}