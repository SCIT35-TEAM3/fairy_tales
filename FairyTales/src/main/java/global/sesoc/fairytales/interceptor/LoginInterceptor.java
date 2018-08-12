package global.sesoc.fairytales.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	/***
	 * 처리전
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger.info("preHandle!!!!!!!!!!!!!!!");
		/*
		HttpSession session = request.getSession();
		
		String login = (String)session.getAttribute("login");
		
		if(login == null) {
			String contextPath = request.getContextPath();
			// el표기 ${PageContext.request.contextPath}
			response.sendRedirect(contextPath + "/login");
			return false;
		}
		*/
		return true;
	}
	
	/***
	 * 처리후
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		//logger.info("postHandle!!!!!!!!!!!!!!!");
	}
	
}