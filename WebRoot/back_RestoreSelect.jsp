<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.form.ArticleForm"/>
<jsp:directive.page import="com.form.RestoreForm"/>
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

<jsp:useBean id="pagination" class="com.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="consumerDao" class="com.dao.ConsumerDao" scope="request"></jsp:useBean>
<jsp:useBean id="restoreDao" class="com.dao.RestoreDao" scope="session"></jsp:useBean>
<jsp:useBean id="articleDao" class="com.dao.ArticleDao" scope="request"></jsp:useBean>

<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=restoreDao.queryRestore(Integer.valueOf(request.getParameter("id")));
	int pagesize=8;      //ָ��ÿҳ��ʾ�ļ�¼��
	list=pagination.getInitPage(list,Page,pagesize);     //��ʼ����ҳ��Ϣ
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //��ȡָ��ҳ������
}
%>

<script type="text/javascript">
function deleteForm(id,idd){
if(confirm("ȷ��Ҫɾ���˹�����Ϣ��")){
window.location.href="ArticleServlet?method=6&id="+id+"&idd="+idd;
}
}
</script>
<body  background="images/xp.jpg">
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="227" valign="top"><jsp:include page="back_Left.jsp" flush="true" /></td>
    <td width="573" valign="top"><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/back_noword_03.jpg" width="573" height="25"></td>
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td valign="top" align="center">		

              <%
if(pagination.getRecordSize()<=0){
	out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;û�лظ���Ϣ��</p>");
}else{out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;�ظ���Ϣ��ѯ</p>");
%>
		           
    <table width="486" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
            <tr>
              <td width="81" height="25"><div align="center">�ظ�����</div></td>
              <td><div align="center">�ظ�����</div>                <div align="center"></div></td>
              <td width="64"><div align="center">�ظ���</div></td>
              <td width="98"><div align="center">����</div></td>
            </tr>
            <%
            for(int i=0;i<list.size();i++){
            RestoreForm restoreForm=(RestoreForm)list.get(i);
             %>
   
            <tr bgcolor="#FFFFFF">
              <td height="30"><div align="center"><%=restoreForm.getReTitle()%></div></td>
              <td><div align="center"><%=restoreForm.getReContent()%></div></td>
              <td><div align="center"><%=consumerDao.getConsumerForm(Integer.valueOf(restoreForm.getReAccount()))%></div></td>
              <td><div align="center"><a href="javascript:deleteForm('<%=restoreForm.getId()%>','<%=request.getParameter("id") %>')">ɾ��</a></div></td>
            </tr>
			<%} %>
          </table>	 
		 <%=pagination.printCtrl(Page) %>
		<%} %> 	 
		  </td>
        </tr>
      </table>
</td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>