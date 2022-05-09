<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<h2>Créer un compte</h2>

<form method="post" action="registerController" onsubmit="return validate();">

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