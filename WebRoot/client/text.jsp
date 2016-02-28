<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<html>
	<head>


		<title></title>


	</head>

	<body>
		<%
			response.setHeader("refresh", "2");//每两秒钟刷新一次页面
			/* 
			 <meta http-equiv="refresh" content="1"> //也可以刷新页面
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
