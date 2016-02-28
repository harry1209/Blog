<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<html>
  <head>
   
    
    <title></title>


  </head>
  
  <body>
  <%
      response.setHeader("refresh","2");//每两秒钟刷新一次页面
     /* 
      <meta http-equiv="refresh" content="1"> //也可以刷新页面
     */
   %>
    ${content}
  </body>
</html>
