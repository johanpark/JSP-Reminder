package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberLoginController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("MemberLoginController()");

		String id = request.getParameter("ID");
		String password = request.getParameter("Password");

		MemberService service = MemberService.getInstance();
		MemberVO memberVO = service.memberSearch(id);

		System.out.println("MemberLoginController() - memberVO: " + memberVO.getUserPassword());

		System.out.print(memberVO.getUserPassword());
		if (!memberVO.getUserPassword().equals(password)) {
			request.setAttribute("error", "check ID & Password");
			HttpUtil.forward(request, response, "/views/login/login.jsp");
			return;
		} else {
			request.setAttribute("MemberVO", memberVO);
			HttpUtil.forward(request, response, "/views/login/login_session.jsp");
			return;
		}
	}
}
