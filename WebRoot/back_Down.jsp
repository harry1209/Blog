<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<table width="227" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
<%
if(session.getAttribute("form")==null){
  out.print("<script language=javascript>alert('���Ѿ���������Ͽ��������µ�¼��');window.location.href='index.jsp';</script>");
}
%>