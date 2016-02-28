<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<style type="text/css">
</style>
</head>
<%
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！');window.location.href='index.jsp';</script>");
}
Integer number=1;
if(application.getAttribute("number")!=null){
  number=(Integer)application.getAttribute("number");
  number++;
}
application.setAttribute("number",number);
com.dao.ConsumerDao consumerDao=new com.dao.ConsumerDao();
com.form.ConsumerForm consumerForm1=(com.form.ConsumerForm)session.getAttribute("form");
java.util.List consumerlist=consumerDao.getConsumerList("高级");
%>
<script language="javascript" src="JS/validate.js"></script>
<body>
<!--页面头部分1-->
<!--页面头部分2-->
<!--页面头部分3-->
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  </tr>
</table>
<!--页面头部分4-->
<table width="800" height="71" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="31">&nbsp;</td>
    <td width="640"><table width="619" border="0" align="center" cellpadding="0" cellspacing="0">
      <%
      	for(int host=0;host<consumerlist.size();host++){
              com.form.ConsumerForm consumerHostForm=(com.form.ConsumerForm)consumerlist.get(host);
      %>
      <tr>
        <td  height="20"><span class="style1">我的信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="dealwith.jsp?sign=2">重新登录</a></span></td>
        <td colspan="2">
          <%if(consumerForm1.getManageLevel().equals("高级")){%>
          <div align="right"><a href="backMainPage.jsp" class="in">管理</a></div>
          <%}%>        </td>
      </tr>
      <tr>
        <td height="20"><span class="style3 style2">姓名：<%=consumerHostForm.getName()%></span></td>
        <td width="212"><span class="style3 style2">性别：<%=consumerHostForm.getSex()%></span></td>
        <td width="195"><span class="style3 style2">兴趣：<%=consumerHostForm.getInterest()%></span></td>
      </tr>
      <tr>
        <td height="20"><span class="style3 style2">QQ号码：<%=consumerHostForm.getQQNumber()%></span></td>
        <td><span class="style3 style2">E-Mail：<%=consumerHostForm.getEMail()%></span></td>
      </tr>
      <%} %>
    </table></td>
    <td width="129">&nbsp;</td>
  </tr>
</table>
<!--页面头部分5-->
<table width="800" height="26" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="37">&nbsp;</td>
    <td width="626">
	         <marquee direction="left"  scrollAmount="1" scrollDelay="1" class="tdtd">
            <span class="style4 style1">欢迎~~~欢迎~~~热烈欢迎~~~</span>
	         </marquee></td>
    <td width="137">&nbsp;</td>
  </tr>
</table>
</body>
</html>
