<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>空间用户登录</title>
<link href="CSS/style.css" type="text/css" rel="stylesheet">
<script src="JS/validate.js" language="javascript" type="text/javascript"></script>
<style type="text/css">

</style></head>


<body onselectstart="return false" background="images/xp.jpg">
<table width="793" height="496" border="0" align="center" cellpadding="0" cellspacing="0">
 <td width="850" valign="center">		
  <form name="form1" method="post" action="ConsumerServlet?method=0&sign=0" onSubmit="return userCheck()">
   <table width="291" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td width="66" height="30"><font color="#FFFFFF">用户名：</font></td>
    <td width="225">
      <input name="account" type="text" class="inputinput" id="account" size="30">
    </td>
    </tr>
  <tr>
    <td height="30"><div align="left"><font color="#FFFFFF">密码：</font></div></td>
    <td><input name="password" type="password" class="inputinput" id="password" size="30"></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center">
	    <input type="image" class="inputinputinput" src="images/land.gif">
             &nbsp;&nbsp;
        <a href="#" onClick="javascript:form1.reset()"><img src="images/reset.gif"></a>
        &nbsp;&nbsp;
		<a href="accountAdd.jsp"><img src="images/register.gif"></a>		
   </td>
  </tr>
</table>
</form>		
	</td>
    </table>	
</body>
</html>
