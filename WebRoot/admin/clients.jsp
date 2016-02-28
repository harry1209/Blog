<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>


		<title></title>

		<script type="text/javascript">
		function ss(f){
			var xmlHttp;
		    f = f.replace( /^\s*/, "" ).replace( /\s*$/, "" );
		    
		   var url = '${pageContext.request.contextPath}/setFlag?'+param;
		   url
		    if(window.ActiveXObject){
		      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		    }else if(window.XMLHttpRequest){
		      xmlHttp = new XMLHttpRequest();		    
		    }
		    xmlHttp.open("post",url,true);
			xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
		    var param = "username="+encodeURI(f)+"&"+ new Date();  
			xmlHttp.send(param);   
		   }
		</script>

	</head>

	<body>

		&nbsp;
		<em><font color="green">当前用户有:</font> </em>

		<font color="#3399FF"> <c:forEach var="client"
				items="${clients}">
				<br>
				<span id="username">${client.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<input type="button" value="屏蔽" onclick="ss('${client.username}');" />
			</c:forEach> </font>
	</body>
</html>
