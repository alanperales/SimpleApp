<%@page import="com.alan.init.JDBCHelper"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
				
		//Recogiendo par�metros
		String isbn = request.getParameter("isbn");
		String titulo = request.getParameter("titulo");
		String categoria = request.getParameter("categoria");
		
		
		String sql = "INSERT INTO LIBRO (isbn, titulo, categoria) VALUES('"+isbn+"','"+titulo+"','"+categoria+"')";
			
		JDBCHelper helper = new JDBCHelper();
		
		helper.modificarRegitro(sql);
			
		response.sendRedirect("MostrarLibros.jsp");
		
		
	%>
</body>
</html>