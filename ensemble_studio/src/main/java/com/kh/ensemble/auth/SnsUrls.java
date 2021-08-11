package com.kh.ensemble.auth;

public interface SnsUrls {
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize"; // 통해서 로그인창 띄움
	static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
}
