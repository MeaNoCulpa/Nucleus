<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 07/05/22
  Time: 21h41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register page</title>
</head>
<body>
<h2>Créer un compte</h2>

<form method="post" action="/registerController" onsubmit="return validate();">

  Prénom <input type="text" name="firstname" id="fname">
  <br>
  Nom <input type="text" name="lastname" id="lname">
  <br>
  Nom d'utilisateur (adresse courriel) <input type="email" name="username" id="uname">
  <br>
  Mot de passe <input type="password" name="password" id="password">
  <br>

  <input type="submit" name="register_btn" value="Créer un compte">

  <h3> Vous avez un compte ? <a href="index.jsp">Se connecter</a></h3>
</form>
</body>
</html>
