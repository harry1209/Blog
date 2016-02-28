package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.form.Service;

public class ServiceChat extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ServiceChat() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 发表内容
		String clientName = (String) request.getParameter("clientname");
		clientName = new String(clientName.getBytes("ISO-8859-1"),"utf-8");
		String name = "我对  " + clientName + "说  ";
		clientName += "_content";
		String content = (String) request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"), "utf-8");

		ServletContext app = this.getServletContext();
		Calendar ctime = Calendar.getInstance();
		SimpleDateFormat fymd = new SimpleDateFormat("HH:mm:ss");
		java.util.Date date = ctime.getTime();
		String sDate = fymd.format(date);

		//记录公共信息
		allContent(name, content, sDate, app);
		
		
		//私聊记录,只有用户可见
		sVSc(clientName, content, sDate, app);
		
		response.sendRedirect("admin/chatting.jsp");
	}
	/**
	 *记录公共聊天记录
	 */
	public void allContent(String name,String content,String sDate,ServletContext app){
		if (app.getAttribute("content") == null) {
			String ss = "<font size='2' color='green'>" + name + "　" + sDate
					+ "</font>" + "</br><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>";
			app.setAttribute("content", ss);
		} else {
			String contest = app.getAttribute("content").toString();
			String ss = "<font size='2' color='green'>" + name
			+ "　" + sDate + "</font>" + "<BR/><font>" + "&nbsp;&nbsp;"
			+ content + "</font><br/>" + contest;
			app.setAttribute("content", ss);

		}
		
	}
	
	/**
	 * 记录1对1聊天记录,用户可见
	 * @param clientName
	 * @param content
	 * @param sDate
	 * @param app
	 */
	public void sVSc(String clientName,String content,String sDate,ServletContext app){
		if (app.getAttribute(clientName) == null) {
			String ss = "<font size='2' color='green'>主人说 " + sDate
					+ "</font>" + "</br><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>";
			app.setAttribute(clientName, ss);
		} else {
			String contest = app.getAttribute(clientName).toString();
			String ss = "<font size='2' color='green'>主人说 " + sDate
					+ "</font>" + "<BR/><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>" + contest;
			app.setAttribute(clientName, ss);

		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
