<<<<<<< HEAD
<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 07/05/22
  Time: 22h24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout page</title>
=======
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>   
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="ISO-8859-1">
<title>Déconnection</title>
>>>>>>> login-Nathanael
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> login-Nathanael