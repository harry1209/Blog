<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.form.ArticleTypeForm"/>
<jsp:directive.page import="com.form.ArticleForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>说明</title>
<%@ page language="java" import="java.util.*" %>
<style type="text/css">
</style></head>
<jsp:useBean id="articleTypeDao" scope="request" class="com.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="articleDao" scope="request" class="com.dao.ArticleDao"></jsp:useBean>
<body  background="images/xp.jpg">
<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74">&nbsp;</td>
    <td height="846" valign="top" background="images/head_07.jpg">
	<!--登录用户部分-->
		<br>
<table width="390" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#F7D069">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <div align="left"><strong>说明：</strong></div></td>
  </tr>
  <tr>
    <td height="55" valign="top" bgcolor="#FFFFFF">&nbsp;大家好！！！</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><div align="left"><strong>我的宣言：</strong></div></td>
  </tr>
  <tr>
    <td height="61" valign="top" bgcolor="#FFFFFF">&nbsp;好好学习，天天向上</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><div align="left"><strong>联系我：</strong></div></td>
  </tr>
  <tr>
    <td height="35" align="center" bgcolor="#FFFFFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;421267553@qq.com</div></td>
  </tr>
</table>
</td>
    <td width="10" background="images/head_07.jpg">&nbsp;</td>
    <td width="184" valign="top">
  	<!--右侧操作部分-->
	  <jsp:include page="head_right.jsp" flush="true" />	  
    </td>
    <td width="122">&nbsp;</td>
  </tr>
</table>
<!--网页尾部分-->
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
