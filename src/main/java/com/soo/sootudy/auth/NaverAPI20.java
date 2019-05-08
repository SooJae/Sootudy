package com.soo.sootudy.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{

	private NaverAPI20() {
	}
	
	private static class Instance {
		private static final NaverAPI20 INSTANCE =new NaverAPI20(); // final이므로 무조건 한번밖에 안 만들어진다. 자연스럽게 싱글톤이 된다.
	}
	
	public static NaverAPI20 getInstance() {
		return Instance.INSTANCE;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return null;
	}

}
