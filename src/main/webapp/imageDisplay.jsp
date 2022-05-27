<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Image d'offre - Home Exchange Manager</title>
</head>
<body>

<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
try {
	String connectionUrl = "jdbc:mysql://localhost:3306/NUCLEUS";
	String userid = "root";
	String password = "root";
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(connectionUrl, userid, password);
    stmt = con.createStatement();
    rs = stmt.executeQuery("select OFFER_IMAGE_VALUE from OFFER_IMAGE ORDER BY ID_OFFER_IMAGE DESC LIMIT 1");
    if (rs.next()) {
    image = rs.getBlob(1);
    imgData = image.getBytes(1,(int)image.length());
    } 
    else {
    out.println("Display Blob Example");
    out.println("image not found for given id>");
    		
    return;
    }
    // display the image
    
    response.setContentType("image/png");
    OutputStream o = response.getOutputStream();
    o.write(imgData);
    o.flush();
    o.close();
    
} catch (Exception e) {
        out.println("Unable To Display image");
    out.println("Image Display Error=" + e.getMessage());
    return;
    } finally {
    
    try {
    rs.close();
    stmt.close();
    con.close();
    
    } catch (SQLException e) {
    
    e.printStackTrace();
    
    }

}

%>



</body>
</html>