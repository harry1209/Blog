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
	 * �û���¼��,�������������
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext app = this.getServletContext();
		//��ȡ��¼ID
		String clientName = (String) request.getParameter("clientname").trim();
		clientName = new String(clientName.getBytes("ISO-8859-1"), "utf-8");
		//�½�һ���û�
		Client client = new Client(clientName);
		Service service = (Service) app.getAttribute("service");
		//ʹ����ָ�������˶�Ӧ
		client.setSerevice(service);
		service.addUser(client);
		//��session�Ự��Χ�ڱ��浱ǰ�û���		
		request.getSession().setAttribute("clientName", clientName);
		//��context��Χ�ڱ����û�����
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
