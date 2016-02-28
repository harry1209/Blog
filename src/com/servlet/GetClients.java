package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.form.Client;
import com.form.Service;

public class GetClients extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetClients() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext app = this.getServletContext();
		//实例化主人并保存
		Service service = new Service();
		System.out.println(service);
		app.setAttribute("service", service);
		//存放主人的用户
		List<Client> list = service.getList();
		request.getSession().setAttribute("clients", list);
		response.sendRedirect("admin/chatting.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
	}

}
