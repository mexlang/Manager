<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> 获取 Cookie</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
		Cookie cookie = null;
		Cookie[] cookies = null;
		//获取当前域名下的cookies ， 是一个数组
		cookies = request.getCookies();
		if (cookies != null)
		{
			out.println("<h2> 查找 Cookie 名与值 </h2>");
			for (int i = 0; i < cookies.length; i++)
			{
				cookie = cookies[i];
				if ((cookie.getName( )).compareTo("name") == 0 )
				{
					/***
					删除cookie：1。获取一个已经存在的cookie 然后存储在cookie对象中
					2.将cookie的有效期设置为0
					3。将这个cookie重新添加进相应头中。
					**/
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					out.print("删除 Cookie： " +cookie.getName()+"<br>");
				}
				out.print("参数名 ： " + cookie.getName());
				out.print("<br>");
				out.print("参数值  ：" + URLDecoder.decode(cookie.getValue(),"utf-8")+" <br>");
				out.print("--------------------<br>");
			}
		}else
		{
			out.println("<h2>没有发现 Cookie</h2>");
		}
	%>
  </body>
</html>
