<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.form.ConsumerForm"/>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript" src="JS/validate.js"></script>
<title>�ռ����</title>
<style type="text/css">
</style>
</head>
<%
ConsumerForm consumerForm=(ConsumerForm)request.getAttribute("form");
%>
<body background="images/xp.jpg">
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="227" valign="top" ><jsp:include page="back_Left.jsp" flush="true" /></td>
    <td width="573" valign="top"><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
        
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top" align="center">		
		  
		  <%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;�û���ϸ��ѯ</p>");%>
		  <form name="form" method="post" action="ConsumerServlet?method=5" onSubmit="return hostUpdate()">
		  
            <table width="325" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
              <tr>
                <td width="93" height="30"><div align="center">�û�����</div></td>
                <td width="219" bgcolor="#FFFFFF"><div align="center"><input name="account" type="text" class="inputinput" size="40" value="<%=consumerForm.getAccount()%>" readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">���룺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="password" type="password" class="inputinput"  size="40" value="<%=consumerForm.getPassword()%>"></div></td>
              </tr>
			     <tr>
                <td height="30"><div align="center">�ظ����룺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="repeatPassword" type="password" class="inputinput"  size="40" value="<%=consumerForm.getPassword()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">������</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="name" type="text" class="inputinput"  size="40" value="<%=consumerForm.getName()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">�Ա�</div></td>
                <td bgcolor="#FFFFFF"><div align="center">
				<input name="sex" type="radio" class="inputinputinput" value="��" <%if(consumerForm.getSex().trim().equals("��")){%>checked<%}%> >
        ��
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="sex" type="radio" class="inputinputinput" value="Ů" <%if(consumerForm.getSex().trim().equals("Ů")){%>checked<%}%> > 
        Ů
		</div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">QQ���룺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="QQnumber" type="text" class="inputinput"  size="40" value="<%=consumerForm.getQQNumber()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">��ҳ��</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="mainPage" type="text" class="inputinput"  size="40" value="<%=consumerForm.getMainPage()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">��Ȥ���ã�</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="interest" type="text" class="inputinput"  size="40" value="<%=consumerForm.getInterest()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">�������䣺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="eMail" type="text" class="inputinput" size="40" value="<%=consumerForm.getEMail()%>"></div></td>
              </tr>
            </table><br>
 <input type="image" class="inputinputinput" src="images/save.gif">
&nbsp;&nbsp;
 <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a>
            </form>
			
			<%if(request.getAttribute("result")!=null){
			out.print(request.getAttribute("result"));
			} %></td>
        </tr>
      </table>
</td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>