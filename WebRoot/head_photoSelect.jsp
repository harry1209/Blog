<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.form.PhotoForm" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="CSS/style.css" type="text/css" rel="stylesheet">
		<title>相册</title>
		<%@ page language="java" import="java.util.*"%>
		<style type="text/css">
</style>
	</head>
	<jsp:useBean id="pagination" class="com.tool.MyPagination"
		scope="session"></jsp:useBean>
	<jsp:useBean id="photoDao" class="com.dao.PhotoDao" scope="session"></jsp:useBean>
	<%
		String str = (String) request.getParameter("Page");
		int Page = 1;
		List list = null;
		if (str == null) {
			list = photoDao.queryPhoto();
			int pagesize = 6; //指定每页显示的记录数
			list = pagination.getInitPage(list, Page, pagesize); //初始化分页信息
		} else {
			Page = pagination.getPage(str);
			list = pagination.getAppointPage(Page); //获取指定页的数据
		}
	%>
	<body  background="images/xp.jpg">
		<!--网页头部分-->
		<jsp:include page="head_top.jsp" flush="true" />
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="74">
					&nbsp;
				</td>
				<td height="846" valign="top" background="images/head_07.jpg">
					<%
						out
								.println("<br><p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;查询所有的相片</p>");
					%>
					<table width="341" border="1" align="center" cellpadding="1"
						cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FEce62">
						<%
							for (int i = 0; i < list.size(); i++) {
								PhotoForm photoForm = (PhotoForm) list.get(i);
								if (i % 2 == 0) {
						%>
						<tr bgcolor="#FFFFFF">
							<td width="166">
								<div align="center">
									<table width="160" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="150">
												<div align="center">
													<a href="#"
														onClick="window.open('photoSelectOne.jsp?image=<%=photoForm.getPhotoAddress()%>','','width=600,height=700');"><img
															src="<%=photoForm.getPhotoAddress()%>" width="160"
															height="140">
													</a>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20">
												<div align="center"><%=photoForm.getPhotoDescription()%></div>
											</td>
										</tr>
										<tr>
											<td height="20">
												<div align="center"><%=photoForm.getPhtoTime()%></div>
											</td>
										</tr>
									</table>
								</div>
							</td>
							<%
								} else {
							%>
							<td width="162">
								<div align="center">
									<table width="160" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="150">
												<div align="center">
													<a href="#"
														onClick="window.open('photoSelectOne.jsp?image=<%=photoForm.getPhotoAddress()%>','','width=600,height=700');"><img
															src="<%=photoForm.getPhotoAddress()%>" width="160"
															height="140">
													</a>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20">
												<div align="center"><%=photoForm.getPhotoDescription()%></div>
											</td>
										</tr>
										<tr>
											<td height="20">
												<div align="center"><%=photoForm.getPhtoTime()%></div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<%
							}
							}
						%>
						<%
							if (list.size() % 2 == 1) {
						%>
						<td bgcolor="#FFFFFF">
							<div align="center">
								<table width="141" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="141" height="150">
											<div align="center"></div>
										</td>
									</tr>
									<tr>
										<td height="20">
											<div align="center"></div>
										</td>
									</tr>
									<tr>
										<td height="20">
											<div align="center"></div>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<%
							}
						%>
					</table>
					<%=pagination.printCtrl(Page)%>
				</td>
				<td width="10" background="images/head_07.jpg">
					&nbsp;
				</td>
				<td width="184" valign="top">
					<!--右侧操作部分-->
					<jsp:include page="head_right.jsp" flush="true" />
				</td>
				<td width="122">
					&nbsp;
				</td>
			</tr>
		</table>
		<!--网页尾部分-->
		<jsp:include page="head_down.jsp" flush="true" />
	</body>
</html>
