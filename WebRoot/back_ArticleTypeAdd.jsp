<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript" src="JS/validate.js"></script>
<title>空间管理</title>
<style type="text/css">
</style>
</head>
<jsp:useBean id="countTime" scope="page" class="com.tool.CountTime"></jsp:useBean>
<body  background="images/xp.jpg">
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="227" valign="top"><jsp:include page="back_Left.jsp" flush="true" /></td>
    <td width="573" valign="top"><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
        
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top" align="center">				  
		  <%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;日志类型添加</p>");%>
		  <form name="form" method="post" action="ArticleServlet?method=0" onSubmit="return addArticleType()">	  
            <table width="340" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
              <tr>
                <td width="77" height="30"><div align="center">日志类型：</div></td>
                <td width="250" bgcolor="#FFFFFF"><div align="center">
                  <input name="typeName" type="text" class="inputinput" size="30">
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">日志描述：</div></td>
                <td bgcolor="#FFFFFF"><div align="center">
                  <input name="description" type="text" class="inputinput" size="30">
                </div></td>
              </tr>
            </table>
            <br>
 <input type="image" class="inputinputinput" src="images/save.gif">
&nbsp;&nbsp;
 <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a>
            &nbsp;&nbsp;
			<a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a>
			</form>		
			</td>
        </tr>
      </table>
</td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>