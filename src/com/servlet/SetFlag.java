package com.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.form.Client;
import com.form.Service;

public class SetFlag extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SetFlag() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = (String) request.getParameter("username");
		ServletContext app = this.getServletContext();
		Service service = (Service) app.getAttribute("service");
		List<Client> list = service.getList();
		System.out.println("-------" + list);
		for (int i = 0; i < list.size(); i++) {
			Client c = list.get(i);
			System.out.println(c.getUsername() + ";;;;;;" + username);
			if (c.getUsername().equals(username)) {
				c.setFlag(false);
				Client c1 = (Client) this.getServletContext().getAttribute(
						username);
				c1.setFlag(false);
				System.out.println(c1.isFlag());
				request.getSession().setAttribute(username, c1);
				break;
			}
		}
		app.setAttribute("service", service);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	public void init() throws ServletException {
	}

}
