<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>欢迎聊天</title>
		<style type="text/css">
		</style>
		<script type="text/javascript">
      </script>

	</head>

	<body>

		<BR />
		<BR />
		<BR />

		<center class="STYLE1">
			<form action="../serviceChat" method="get">
				<table width="614" height="425" border="1" cellpadding="0"
					cellspacing="0" bordercolor="#7E9EE5" bgcolor="#0066CC">

					<tr>
						<td width="421" height="23" bgcolor="#7E9EE5">
							<em><font size="-1" color="purple">您好</font> </em><font size="-1"
								color="purple"></font>
						</td>

					</tr>
					<tr>
						<td height="259" bgcolor="#FFFFFF">
							<iframe width="485" height="260" src="text.jsp"></iframe>
						</td>
						<td rowspan="4" bgcolor="#FFFFFF">
							<iframe width="200" height="415" src="clients.jsp"></iframe>
						</td>
					</tr>
					<tr>
						<td>
							您想对
							<select name="clientname">
								<c:forEach var="client" items="${clients}">
									<br>
									<option value="${client.username}">${client.username}</option>
								</c:forEach>
							</select>
							说:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="刷新用户" onclick="history.go(0);"/>
						</td>
							
					</tr>
					<tr>
						<td height="87" bgcolor="#FFFFFF">
							<textarea id="content" name="content" cols="58" rows="6"></textarea>
					<tr>
						<td height="21" bgcolor="#7E9EE5">
							<input type="submit" name="Submit" value="发 送">
							<input type="reset" name="Submit2" value="取 消">
						</td>

					</tr>

				</table>
			</form>
		</center>
	</body>
</html>
