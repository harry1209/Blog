<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.form.ArticleForm"/>
<jsp:directive.page import="com.form.ArticleTypeForm"/>
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
<jsp:useBean id="articleDao" class="com.dao.ArticleDao" scope="session"></jsp:useBean>
<jsp:useBean id="articleTypeDao" class="com.dao.ArticleTypeDao" scope="session"></jsp:useBean>
<jsp:useBean id="restoreDao" class="com.dao.RestoreDao" scope="session"></jsp:useBean>
<%
Integer typeId=null;
if(request.getParameter("typeId")!=null){
typeId=Integer.valueOf(request.getParameter("typeId"));
}
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=articleDao.queryArticle(typeId);
	int pagesize=9;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>
<script type="text/javascript">
function deleteForm(id){
if(confirm("确定要删除此日志吗？")){
window.location.href="ArticleServlet?method=3&id="+id;
}
}
</script>
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
		              <%
if(pagination.getRecordSize()<=0){
	out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;没有日志查询，请后退！</p>");
	%>
	<%	
}else{
		  out.print("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;日志查询</p>");%>
		  
    <table width="500" border="0">
      <tr>
        <td><div align="center">
		    <%
    List articleTypeList=articleTypeDao.queryArticleType();
    for(int i=0;i<articleTypeList.size();i++){
    ArticleTypeForm articleTypeForm=(ArticleTypeForm)articleTypeList.get(i);
    %>
   <a href="back_ArticleSelect.jsp?typeId=<%=articleTypeForm.getId()%>"> [<%=articleTypeForm.getTypeName()%>]</a>&nbsp;
    <%}%>		
		</div></td>
      </tr>
    </table>
	         <br>             
    <table width="486" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
            <tr>
              <td width="81" height="20"><div align="center">日志题目</div></td>
              <td width="73"><div align="center">日志类别</div></td>
              <td width="142"><div align="center">发布时间</div></td>
              <td width="64"><div align="center">回复数量</div></td>
              <td width="98"><div align="center">操作</div></td>
            </tr>           
         <%for(int i=0;i<list.size();i++){ 
         ArticleForm articleForm=(ArticleForm)list.get(i);
         %>   
            <tr bgcolor="#FFFFFF">
              <td height="30"><div align="center">
			 <a href="back_RestoreSelect.jsp?id=<%=articleForm.getId()%>" title="可以查看回复内容"> <%=articleForm.getTitle()%></a>	  
			  </div></td>
              <td><div align="center"><%=articleTypeDao.queryArticleTypeName(articleForm.getTypeId())%></div></td>
              <td><div align="center"><%=articleForm.getPhTime()%></div></td>
              <td><div align="center"><%=restoreDao.queryRestore(articleForm.getId()).size()%></div></td>
              <td><div align="center"><A href="back_ArticleUpdate.jsp?id=<%=articleForm.getId()%>">修改</A>&nbsp;&nbsp;<a href="javascript:deleteForm('<%=articleForm.getId()%>')">删除</a></div></td>
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