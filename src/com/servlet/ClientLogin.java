package com.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.form.Client;
import com.form.Service;

public class ClientLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ClientLogin() {
		super();
	}

	public void destroy() {
	}

	/**
	 * 用户登录后,保存其个人资料
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext app = this.getServletContext();
		//获取登录ID
		String clientName = (String) request.getParameter("clientname").trim();
		clientName = new String(clientName.getBytes("ISO-8859-1"), "utf-8");
		//新建一个用户
		Client client = new Client(clientName);
		Service service = (Service) app.getAttribute("service");
		//使其与指定的主人对应
		client.setSerevice(service);
		service.addUser(client);
		//在session会话范围内保存当前用户名		
		request.getSession().setAttribute("clientName", clientName);
		//在context范围内保存用户对象
		app.setAttribute(clientName, client);
		app.setAttribute("service", service);
		response.sendRedirect("client/chatting.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
	}

}
