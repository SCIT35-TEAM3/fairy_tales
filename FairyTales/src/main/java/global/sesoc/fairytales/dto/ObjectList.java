package global.sesoc.fairytales.dto;

public class ObjectList {
	private String objId;
	private String objType;
	private String obj;
	private String view;
	public String getObjId() {
		return objId;
	}
	public void setObjId(String objId) {
		this.objId = objId;
	}
	public String getObjType() {
		return objType;
	}
	public void setObjType(String objType) {
		this.objType = objType;
	}
	public String getObj() {
		return obj;
	}
	public void setObj(String obj) {
		this.obj = obj;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	@Override
	public String toString() {
		return "Object [objId=" + objId + ", objType=" + objType + ", obj=" + obj + ", view=" + view + "]";
	}
}