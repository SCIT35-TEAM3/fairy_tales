package global.sesoc.fairytales.dao;

import global.sesoc.fairytales.dto.Code;
import global.sesoc.fairytales.dto.SinScreen;

public interface CodeAnswerMapper {

	String selectAnswer(Code c);
}