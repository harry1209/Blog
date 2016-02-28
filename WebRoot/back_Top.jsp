<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！');window.location.href='index.jsp';</script>");
}
%>
<script language="javascript" src="JS/onclock.js"></script>
<style type="text/css">
.STYLE3 {color: #F0F0F0}
</style>
<body onselectstart="return false" onLoad="clockon(bgclock)">

<table width="800" height="65" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="501">&nbsp;</td>
    <td width="299"><p>&nbsp;</p>
    <p>
	<a href="head_main.jsp" class="backTop STYLE2"><font color="#000">首页</font></a>
	&nbsp;&nbsp; 
	<a href="backMainPage.jsp" class="backTop STYLE2"><font color="#000">管理</font></a>
	&nbsp;&nbsp; 
	<a href="dealwith.jsp?sign=2" class="backTop STYLE2"><font color="#000">退出</font></a>
	</p></td>
  </tr>
</table>

<table width="800" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="379" height="23" border="0" cellpadding="0" cellspacing="0">
      <tr align="center"  >
        <td><font color="#805717"><div id="bgclock"></div></font></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>