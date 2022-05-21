<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>Welcome</title>
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