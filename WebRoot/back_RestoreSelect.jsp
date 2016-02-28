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
<title>空间管理</title>
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
	int pagesize=8;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>

<script type="text/javascript">
function deleteForm(id,idd){
if(confirm("确定要删除此公告信息吗？")){
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
	out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;没有回复信息！</p>");
}else{out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;回复信息查询</p>");
%>
		           
    <table width="486" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
            <tr>
              <td width="81" height="25"><div align="center">回复主题</div></td>
              <td><div align="center">回复内容</div>                <div align="center"></div></td>
              <td width="64"><div align="center">回复人</div></td>
              <td width="98"><div align="center">操作</div></td>
            </tr>
            <%
            for(int i=0;i<list.size();i++){
            RestoreForm restoreForm=(RestoreForm)list.get(i);
             %>
   
            <tr bgcolor="#FFFFFF">
              <td height="30"><div align="center"><%=restoreForm.getReTitle()%></div></td>
              <td><div align="center"><%=restoreForm.getReContent()%></div></td>
              <td><div align="center"><%=consumerDao.getConsumerForm(Integer.valueOf(restoreForm.getReAccount()))%></div></td>
              <td><div align="center"><a href="javascript:deleteForm('<%=restoreForm.getId()%>','<%=request.getParameter("id") %>')">删除</a></div></td>
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