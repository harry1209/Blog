<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<html>
	<head>


		<title></title>


	</head>

	<body>
		<%
			response.setHeader("refresh", "2");//ÿ������ˢ��һ��ҳ��
			/* 
			 <meta http-equiv="refresh" content="1"> //Ҳ����ˢ��ҳ��
			 */
			String clientName = (String) session.getAttribute("clientName");
			clientName += "_content";
			String content = (String) this.getServletContext().getAttribute(clientName);
			if(content != null ){
		%>
		<%=content%>
		<%} %>
	</body>
</html>
