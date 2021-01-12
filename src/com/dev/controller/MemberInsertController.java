package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberInsertController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Parameter ����
		String id = request.getParameter("userID");
		String passwd = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String mail = request.getParameter("userMail");

		// ��ȿ�� üũ
		if (id.isEmpty() || passwd.isEmpty() || name.isEmpty() || mail.isEmpty()) {
			request.setAttribute("error", "��� �׸��� �������� �Է����ֽñ� �ٶ��ϴ�!");
			HttpUtil.forward(request, response, "../login/account.jsp");
			return;
		}

		// VO��ü�� ����Ÿ ���ε�
		MemberVO member = new MemberVO();
		member.setUserID(id);
		member.setUserPassword(passwd);
		member.setUserName(name);
		member.setUserMail(mail);

		// Service ��ü�� �޼��� ȣ��
		MemberService service = MemberService.getInstance();
		service.memberInsert(member);

		// Output View �������� �̵�
		/* request.setAttribute("userID", id); */
		HttpUtil.forward(request, response, "/views/login/login.jsp");
	}
}
