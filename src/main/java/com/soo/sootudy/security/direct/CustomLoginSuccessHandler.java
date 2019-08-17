package com.soo.sootudy.security.direct;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;


//스프링은 기본적으로 SavedRequestAwareAuthenticationSuccessHandler을 이용하기 때문에 그것을 이용하기 위해서 이 클래스는 없앤다.
@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	
	public RequestCache requestCache = new HttpSessionRequestCache();
    public RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.info("Login Success");

		
		resultRedirectStrategy(request, response, auth);

	}

	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException {
		// TODO Auto-generated method stub
		 SavedRequest savedRequest = requestCache.getRequest(request, response);
		 String targetUrl2 = request.getHeader("REFERER");
		 
		 log.info("targetUrl2"+targetUrl2);
	        log.info("savedRequest..."+savedRequest);
	        if(savedRequest!=null) {
	            String targetUrl = savedRequest.getRedirectUrl();
	            redirectStratgy.sendRedirect(request, response, targetUrl);
	        } else {
	            redirectStratgy.sendRedirect(request, response, "/");
	        }


	}
}


