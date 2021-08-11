package com.kh.ensemble.auth;

import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.kh.ensemble.member.model.vo.Member;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
							.apiSecret(sns.getClientSecret())
							.callback(sns.getRedirectUrl())
							.scope("profile")
							.build(sns.getApi20Instance());
		this.sns = sns;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public Member getUserProfile(String code) throws Exception{
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody()); // 결과가 제이슨으로 옴
		// 바디에 담겨져 온 정보들을 파싱해서 
		
	}
	
	// 전달 받아온 값 파싱하여 Member 객체에 저장
	private Member parseJson(String body) throws Exception {
		System.out.println("====" + body + "=====");
		Member navermember = new Member();

		
		// Json을 Objsct로 매퍼
		// Node : Tree의 한 지점
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		JsonNode resNode = rootNode.get("response");
		
		navermember.setMemberId(resNode.get("id").asText());
		navermember.setMemberNick(resNode.get("nickname").asText());
		navermember.setMemberEmail(resNode.get("email").asText());
		navermember.setMemberPhone(resNode.get("mobile").asText());
		navermember.setMemberPath("S"); // 회원가입경로 -> 소셜 : S 
		
		return navermember;
	}
}
