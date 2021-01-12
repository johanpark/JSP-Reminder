package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberInsertController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Parameter 추출
		String id = request.getParameter("userID");
		String passwd = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String mail = request.getParameter("userMail");

		// 유효성 체크
		if (id.isEmpty() || passwd.isEmpty() || name.isEmpty() || mail.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다!");
			HttpUtil.forward(request, response, "../login/account.jsp");
			return;
		}

		// VO객체에 데이타 바인딩
		MemberVO member = new MemberVO();
		member.setUserID(id);
		member.setUserPassword(passwd);
		member.setUserName(name);
		member.setUserMail(mail);

		// Service 객체의 메서드 호출
		MemberService service = MemberService.getInstance();
		service.memberInsert(member);

		// Output View 페이지로 이동
		/* request.setAttribute("userID", id); */
		HttpUtil.forward(request, response, "/views/login/login.jsp");
	}
}
