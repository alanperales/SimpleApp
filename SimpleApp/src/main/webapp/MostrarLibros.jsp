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
<title>Mostrar Libro</title>
</head>
<body>
	<a href="FormularioInsertarLibro.jsp">Agregar</a>
	<br/>
	<%
		ResultSet rs = null;

		try {
			JDBCHelper helper = new JDBCHelper();
			rs = helper.seleccionarRegistros("SELECT * FROM libro");
			%>
			<table class="egt" border="1">

  				<tr>
    				<th>ID</th>
					<th>ISBN</th>
					<th>Título</th>
					<th>Categoría</th>
					<th>Editar</th>
					<th>Eliminar</th>
  				</tr>
			<%
			while (rs.next()) {
	%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("isbn")%></td>
			<td><%=rs.getString("titulo")%></td>
			<td><%=rs.getString("categoria")%></td>
		
			<td><a href="FormularioEditarLibro.jsp?id=<%=rs.getString("id")%>">Editar</a></td>
			<td><a href="EliminarLibro.jsp?id=<%=rs.getString("id")%>">Eliminar</a></td>
		</tr>
	<%
		}
	%>
		</table>
	
	<%	
		}  catch (SQLException e) {
			System.out.println("Error accediendo a las BDs: "
					+ e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println("Error cerrando el ResultSet: "
							+ e.getMessage());
				}

			}
			
		}
	%>
</body>
</html>