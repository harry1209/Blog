package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.form.Client;

public class ClientChatting extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ClientChatting() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	/**
	 * �û������˵������¼����
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext app = this.getServletContext();
		String name = (String) session.getAttribute("clientName");
		Client client = (Client) app.getAttribute(name);
		boolean flag = client.isFlag();
		// �û�̸����������
		String content = (String) request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"), "utf-8");
		// ����ʱ��
		Calendar ctime = Calendar.getInstance();
		SimpleDateFormat fymd = new SimpleDateFormat("HH:mm:ss");
		java.util.Date date = ctime.getTime();
		String sDate = fymd.format(date);

		// �ж��û��Ƿ�����,falseΪ�ѱ�����
		if (flag) {
			allContent(app, name, sDate, content);
			sVSc(app, session, name, sDate, content);
		} else {
			System.out.println(flag);
			sendMessage(app, session, name, sDate, content);
		}
		response.sendRedirect("client/chatting.jsp");
	}
	
	/**
	 * ����������Ϣ,�û��ɼ�
	 * @param app
	 * @param session
	 * @param name
	 * @param sDate
	 * @param content
	 */
	private void sendMessage(ServletContext app, HttpSession session,
			String name, String sDate, String content) {
		String clientName = (String) session.getAttribute("clientName");
		clientName += "_content";
		if (app.getAttribute(clientName) == null) {
			String ss = "<font size='2' color='green'>�Բ���,���Ѿ�����ֹ����</br><font>";
			app.setAttribute(clientName, ss);
		} else {
			String contest = app.getAttribute(clientName).toString();
			String ss = "<font size='2' color='green'>�Բ���,���Ѿ�����ֹ����<BR/><br/>"
						+ contest;
			app.setAttribute(clientName, ss);
		}

	}
	
	/**
	 * ��¼Ϊ�����˵�̸������,���˿ɼ�
	 * @param app
	 * @param name
	 * @param sDate
	* @param content
	*/
	public void allContent(ServletContext app, String name, String sDate,
			String content) {		
		if (app.getAttribute("content") == null) {
			String ss = "<font size='2' color='green'>" + name + "˵��" + sDate
					+ "</font>" + "</br><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>";
			app.setAttribute("content", ss);
		} else {
			String contest = app.getAttribute("content").toString();
			String ss = "<font size='2' color='green'>" + name + "˵��" + sDate
					+ "</font>" + "<BR/><font>" + "&nbsp;&nbsp;" + content
					+ "</font><br/>" + contest;
			app.setAttribute("content", ss);

		}
	}
	
	/**
	 * ��ǰ�û������������¼,�û��ɼ�
	 * @param app
	 * @param session
	 * @param name
	 * @param sDate
	 * @param content
	 */
	public void sVSc(ServletContext app, HttpSession session, String name,
			String sDate, String content) {
		
		String clientName = (String) session.getAttribute("clientName");
		clientName += "_content";
		if (app.getAttribute(clientName) == null) {
			String ss = "<font size='2' color='green'>��˵ " + sDate + "</font>"
					+ "</br><font>" + "&nbsp;&nbsp;" + content + "</font><br/>";
			app.setAttribute(clientName, ss);
		} else {
			String contest = app.getAttribute(clientName).toString();
			String ss = "<font size='2' color='green'>��˵��" + sDate + "</font>"
					+ "<BR/><font>" + "&nbsp;&nbsp;" + content + "</font><br/>"
					+ contest;
			app.setAttribute(clientName, ss);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
	}

}
