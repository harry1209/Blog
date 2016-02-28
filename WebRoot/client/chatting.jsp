<%@ page language="java" pageEncoding="utf-8"%>
<html>
	<head>
		<title>欢迎来聊天</title>
		<style type="text/css">
</style>

	</head>

	<body>
		<BR />
		<BR />
		<BR />

		<center class="STYLE1">
			<form action="../chat" method="get">
				<table width="500" height="425" border="1" cellpadding="0"
					cellspacing="0" bordercolor="#7E9EE5" bgcolor="#0066CC">

					<tr>
						<td width="421" height="23" bgcolor="#7E9EE5">
							<em><font size="-1" color="purple">您好</font> </em><font size="-1"
								color="purple">${clientName}</font>
						</td>

					</tr>
					<tr>
						<td height="259" bgcolor="#FFFFFF">
							<iframe width="485" height="260" src="text.jsp"></iframe>
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
