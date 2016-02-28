<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<table width="227" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
<%
if(session.getAttribute("form")==null){
  out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！');window.location.href='index.jsp';</script>");
}
%>