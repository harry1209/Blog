<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="com.form.ArticleTypeForm" />
<jsp:directive.page import="com.form.ArticleForm" />
<jsp:directive.page import="java.util.List" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link type="text/css" rel="stylesheet" href="CSS/style.css">
		<script language="javascript" type="text/javascript"
			src="JS/validate.js"></script>
<title>空间管理</title>
<style type="text/css">
</style>
	</head>
	<jsp:useBean id="countTime" scope="page" class="com.tool.CountTime"></jsp:useBean>
	<jsp:useBean id="articleTypeDao" scope="page" class="com.dao.ArticleTypeDao"></jsp:useBean>
	<jsp:useBean id="articleDao" scope="page" class="com.dao.ArticleDao"></jsp:useBean>
	<%
List list=articleTypeDao.queryArticleType();
ArticleForm articleForm=articleDao.queryArticleForm(Integer.valueOf(request.getParameter("id")));
%>
<body  background="images/xp.jpg">
		<jsp:include page="back_Top.jsp" flush="true" />
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0" background="images/back1.gif">
			<tr>
				<td width="227" valign="top">=<jsp:include page="back_Left.jsp" flush="true" />
				</td>
				<td width="573" valign="top">
					<table width="227" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/back_noword_03.jpg" width="573" height="25">
							</td>
						</tr>
					</table>
					<table width="573" border="0" cellpadding="0" cellspacing="0"
						>
						<tr>
							<td valign="top" align="center">

								<%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;日志修改</p>");%>
								<form name="form" method="post" action="ArticleServlet?method=4&id=<%=articleForm.getId()%>"
									onSubmit="return addArticle()">

									<table width="340" border="1" cellpadding="1" cellspacing="1"
										bordercolor="#FFFFFF" bgcolor="#FECE62">
										<tr>
											<td width="77" height="30">
												<div align="center">
													日志主题：
												</div>
											</td>
											<td width="250" bgcolor="#FFFFFF">
												<div align="center">
													<input name="title" type="text" class="inputinput"
														size="30" value="<%=articleForm.getTitle()%>">
												</div>
											</td>
										</tr>
										<tr>
											<td height="30">
												<div align="center">
													日志类别：
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
											
								<select name="typeId" class="inputinput">
								<%
								for(int i=0;i<list.size();i++){ 
								ArticleTypeForm form=(ArticleTypeForm)list.get(i);
								%>
								
									<option value="<%=form.getId()%>" 
									
									<%if(articleForm.getTypeId().equals(form.getId())){ %>
									selected="selected"
									<%} %>
									><%=form.getTypeName() %></option>
							<%} %>
													</select>
										</div>
											</td>
										</tr>
										<tr>
											<td height="30">
												<div align="center">
													日志内容：
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<textarea name="content" cols="28" rows="20"
														class="inputinput"><%=articleForm.getContent()%></textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="30">
												<div align="center">
													发布时间：
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<input name="phTime" type="text" class="inputinput"
														value="<%=articleForm.getPhTime()%>" size="30"
														readonly="readonly" onclick="alert('此文本框已设为只读，用户不能修改')">
												</div>
											</td>
										</tr>
										<tr>
											<td height="30">
												<div align="center">
													访问次数：
												</div>
											</td>
											<td bgcolor="#FFFFFF">
												<div align="center">
													<input name="number" type="text" class="inputinput"
														value="<%=articleForm.getNumber()%>" size="30" readonly="readonly"
														onclick="alert('此文本框已设为只读，用户不能修改')">
												</div>
											</td>
										</tr>
									</table>
									<br>
									<input type="image" class="inputinputinput"
										src="images/save.gif">
									&nbsp;&nbsp;
									<a href="#" onClick="javascript:form.reset()"><img
											src="images/reset.gif">
									</a>
									&nbsp;&nbsp;
<a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a>								
								</form>
								<%
										if (request.getAttribute("result") != null) {
										out.print(request.getAttribute("result"));
									}
								%>
							</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		<jsp:include page="back_Down.jsp" flush="true" />
	</body>
</html>