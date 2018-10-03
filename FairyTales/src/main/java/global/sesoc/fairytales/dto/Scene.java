package global.sesoc.fairytales.dto;


public class Scene {
	private String sceneNum;
	private String objId;
	private String top;
	private String left;
	private String layerNum;
	private String width;
	private String height;
	private String animate;
	private String time;
	private String latency;
	
	private String getSceneNum() {
		return sceneNum;
	}
	public void setSceneNum(String sceneNum) {
		this.sceneNum = sceneNum;
	}
	public String getObjId() {
		return objId;
	}
	public void setObjId(String objId) {
		this.objId = objId;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getLeft() {
		return left;
	}
	public void setLeft(String left) {
		this.left = left;
	}
	public String getLayerNum() {
		return layerNum;
	}
	public void setLayerNum(String layerNum) {
		this.layerNum = layerNum;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getAnimate() {
		return animate;
	}
	public void setAnimate(String animate) {
		this.animate = animate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLatency() {
		return latency;
	}
	public void setLatency(String latency) {
		this.latency = latency;
	}
	@Override
	public String toString() {
		return "Scene [sceneNum=" + sceneNum + ", objId=" + objId + ", top=" + top + ", left=" + left + ", layerNum="
				+ layerNum + ", width=" + width + ", height=" + height + ", animate=" + animate + ", time=" + time
				+ ", latency=" + latency + "]";
	}
}