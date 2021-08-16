package com.kh.ensemble.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ensemble.member.model.vo.Member;

@WebFilter(filterName = "adminLoginFilter", urlPatterns = {"/admin/*"})
public class AdminLoginFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 1.Session을 얻어오기 위한 request 다운 캐스팅
		HttpServletRequest req = (HttpServletRequest)request;
		
		// 2.Session 얻어오기
		HttpSession session = req.getSession();
		
		// 3.Session 에서 loginMember를 얻어와 null인지 확인
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			
			String path ="/WEB-INF/views/admin/admin-login.jsp";
			RequestDispatcher view = request.getRequestDispatcher(path);
			view.forward(request, response);
			
		}else if(loginMember.getMemberGrade().equals("G")) {
			
			session.setAttribute("icon", "warning");
			session.setAttribute("title", "잘못된 접근입니다.");
			session.setAttribute("text", "관리자페이지는 일반 회원이 접근할 수 없습니다.");
			
			((HttpServletResponse)response).sendRedirect(req.getContextPath());

			
		}else if(loginMember.getMemberGrade().equals("A")) {
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
