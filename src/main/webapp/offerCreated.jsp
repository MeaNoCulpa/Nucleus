<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/NUCLEUS";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>

<title>Offre créée - Home Exchange Manager</title>

<body>

<h1>Retrieved data from database</h1>
<table border="1">
<tr>
<td>Location</td>
<td>Start</td>
<td>End</td>
<td>Description</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from OFFER ORDER BY ID_OFFER DESC LIMIT 1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Location") %></td>
<td><%=resultSet.getString("Date_start") %></td>
<td><%=resultSet.getString("Date_end") %></td>
<td><%=resultSet.getString("Description") %></td>
</tr>
</table> 

<br/>

<table border ="1">
<tr>
<td>Services</td>
<% int service_binary = resultSet.getInt("service_binary");
if (service_binary % 100==0){
%>

<% 	
}
%>
<td>Limitations</td>
</tr>

</table>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br/>
<a href='#' onclick='javascript:window.open("http://localhost:8080/Nucleus/ImageDisplayController", "_blank", "scrollbars=1,resizable=1,height=300,width=300");' title='Pop Up'>Display Image</a>
</body>
</html>