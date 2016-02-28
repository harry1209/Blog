<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<style type="text/css">
.STYLE1 {color: #0000FF}
</style>
</head>
<%@ page language="java" import="java.util.*" %>
<%! String days[]; %>
<%
days=new String[42];
for(int i=0;i<42;i++)
{
days[i]="";
}
%>
<%
GregorianCalendar currentDay = new GregorianCalendar();
int today=currentDay.get(Calendar.DAY_OF_MONTH);
int month=currentDay.get(Calendar.MONTH)+1;
int year= currentDay.get(Calendar.YEAR);
Calendar thisMonth=Calendar.getInstance();
thisMonth.set(Calendar.MONTH, month );
thisMonth.set(Calendar.YEAR, year );
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
thisMonth.set(Calendar.DAY_OF_MONTH,1);
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i=0;i<maxIndex;i++)
{
days[firstIndex+i]=String.valueOf(i+1);
}
%>
<body onselectstart="return false">
	<table width="184" height="35" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="23" height="28">&nbsp;</td>
            <td width="123" valign="bottom"><a href="head_main.jsp" class="head-01 STYLE2 STYLE1"><strong><font color="black">首页</font></strong></a></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="184" height="30" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="23" height="24">&nbsp;</td>
              <td width="123" valign="bottom"><a href="head_explain.jsp" class="head-01 STYLE2 STYLE1"><strong><font color="black">说明</font></strong></a></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" height="29" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23" height="24">&nbsp;</td>
                <td width="123" valign="bottom"><a href="head_ArticleList.jsp" class="head-01 STYLE2 STYLE1"><strong><font color="black">文章</font></strong></a></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" height="29" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23" height="24">&nbsp;</td>
                <td width="123" valign="bottom"><a href="head_photoSelect.jsp" class="head-01 STYLE2 STYLE1"><strong><font color="black">相册</font></strong></a></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" height="28" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23" height="24">&nbsp;</td>
                <td width="123" valign="bottom"><a href="login.jsp" class="head-01 STYLE2 STYLE1"><strong><font color="black">在线交流</font></strong></a></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div align="center" class="STYLE3">日历</div></td>
        </tr>
        <tr>
        </tr>
      </table>
      <table width="184" height="179" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <table width="180" height="81" border="1" align="center" cellpadding="1" cellspacing="1" >
              <tr >
                <td height="15" colspan="7" align="center"><%=year%>年<%=month%>月</td>
              </tr>
              <tr >
                <td width="25" height="15" ><font color="red">日</font> </td>
                <td width="25" height="16" ><strong><font color="black">一</font></strong></td>
                <td width="25" height="16" ><strong><font color="black">二</font></strong></td>
                <td width="25" height="16" ><strong><font color="black">三</font></strong></td>
                <td width="25" height="16" ><strong><font color="black">四</font></strong></td>
                <td width="25" height="16" ><strong><font color="black">五</font></strong></td>
                <td width="25" height="16" ><font color="red">六</font></td>
              </tr>
              <% for(int j=0;j<6;j++) { %>
              <tr bgcolor="FFFCF1">
                <% for(int i=j*7;i<(j+1)*7;i++) { %>
                <td width="25" height="15" align="center" valign="middle">
                  <%if((i-firstIndex+1)==today){
%>
                  <b> <font color="red"><%=days[i]%></font></b>
                  <%
} else {
%>
                  <%=days[i]%>
                  <%
}
%></td>
                <% } %>
              </tr>
              <% } %>
          </table></td>
        </tr>
</table>
</body>
</html>
