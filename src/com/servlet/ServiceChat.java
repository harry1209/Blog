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
		// ��������
		String clientName = (String) request.getParameter("clientname");
		clientName = new String(clientName.getBytes("ISO-8859-1"),"utf-8");
		String name = "�Ҷ�  " + clientName + "˵  ";
		clientName += "_content";
		String content = (String) request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"), "utf-8");

		ServletContext app = this.getServletContext();
		Calendar ctime = Calendar.getInstance();
		SimpleDateFormat fymd = new SimpleDateFormat("HH:mm:ss");
		java.util.Date date = ctime.getTime();
		String sDate = fymd.format(date);

		//��¼������Ϣ
		allContent(name, content, sDate, app);
		
		
		//˽�ļ�¼,ֻ���û��ɼ�
		sVSc(clientName, content, sDate, app);
		
		response.sendRedirect("admin/chatting.jsp");
	}
	/**
	 *��¼���������¼
	 */
	public void allContent(String name,String content,String sDate,ServletContext app){
		if (app.getAttribute("content") == null) {
			String ss = "<font size='2' color='green'>" + name + "��" + sDate
					+ "</font>" + "</br><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>";
			app.setAttribute("content", ss);
		} else {
			String contest = app.getAttribute("content").toString();
			String ss = "<font size='2' color='green'>" + name
			+ "��" + sDate + "</font>" + "<BR/><font>" + "&nbsp;&nbsp;"
			+ content + "</font><br/>" + contest;
			app.setAttribute("content", ss);

		}
		
	}
	
	/**
	 * ��¼1��1�����¼,�û��ɼ�
	 * @param clientName
	 * @param content
	 * @param sDate
	 * @param app
	 */
	public void sVSc(String clientName,String content,String sDate,ServletContext app){
		if (app.getAttribute(clientName) == null) {
			String ss = "<font size='2' color='green'>����˵ " + sDate
					+ "</font>" + "</br><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>";
			app.setAttribute(clientName, ss);
		} else {
			String contest = app.getAttribute(clientName).toString();
			String ss = "<font size='2' color='green'>����˵ " + sDate
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
