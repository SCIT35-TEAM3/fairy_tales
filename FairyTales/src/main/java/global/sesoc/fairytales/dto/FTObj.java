package global.sesoc.fairytales.dto;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.SerializableSerializer;
/***
 *  사용안하면 지우도록하자
 * 
 */
public class FTObj extends SerializableSerializer {
	
	/**
	 * 오즈젝트 가져오기
	 */
	private static final long serialVersionUID = -6472499881271718899L;
	
	private Integer objId;		// 오브젝트 아이디
	private String objNm;		// 오브젝트 형태 / 이미지 / 텍스트
	private MultipartFile obj;	// 오브젝트
	
	public Integer getObjId() {
		return objId;
	}
	public void setObjId(Integer objId) {
		this.objId = objId;
	}
	public String getObjNm() {
		return objNm;
	}
	public void setObjNm(String objNm) {
		this.objNm = objNm;
	}
	public MultipartFile getObj() {
		return obj;
	}
	public void setObj(MultipartFile obj) {
		this.obj = obj;
	}
	
	@Override
	public String toString() {
		return "FTObj [objId=" + objId + ", objNm=" + objNm + ", obj=" + obj + "]";
	}
}
