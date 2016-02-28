<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<title>空间管理</title>
<style type="text/css">
</style>
</head>

<body  background="images/xp.jpg">
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="227" valign="top" >
		<jsp:include page="back_Left.jsp" flush="true" />   </td>
    <td width="573" valign="top" ><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="85" height="88">&nbsp;</td>
              <td width="148" height="88"><a href="back_ArticleAdd.jsp" class="aaaa">发表日志</a><br></td>
            </tr>
            <tr>
              <td height="76">&nbsp;</td>
              <td width="148" height="88"><a href="back_PhotoInsert.jsp" class="aaaa">添加相片</a><br></td>
            </tr>
            <tr>
              <td height="74"><a href="ConsumerServlet?method=4"></a></td>
              <td width="148" height="88"><a href="ConsumerServlet?method=4"  class="aaaa">主人设置</a><br></td>
            </tr>
			
            <tr>
              <td height="94"><a href="ConsumerServlet?method=4"></a></td>
              <td height="94" colspan="3"><a href="back_consumerSelect.jsp" class="aaaa">用户设置</a><br></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="227" border="0" cellpadding="0" cellspacing="0">
    </table></td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>
