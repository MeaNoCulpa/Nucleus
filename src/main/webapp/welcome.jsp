<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 07/05/22
  Time: 22h21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome page</title>
</head>
<body>
<div style="text-align: center;">
  <h2>
    <%
      if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
        response.sendRedirect("index.jsp");
      }
    %>
    Bienvenue, <%=session.getAttribute("login")%>
  </h2>

  <h3>
    <a href="logout.jsp">Se déconnecter</a>
  </h3>
</div>
</body>
</html>
