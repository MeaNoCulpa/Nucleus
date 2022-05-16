<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="ISO-8859-1">
<title>Se connecter</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
  $("#header").load("header.jsp"); 
  $("#footer").load("footer.jsp"); 
});
</script>
<link rel="stylesheet" href="styles/header_footer.css" />
<link rel="stylesheet" href="styles/header_footer.css" />
<link rel="shortcut icon" href="#">
</head>

<body>
<div id="header"></div>
<h2>Se connecter</h2>

<form method="post" action="loginController" name="login_form">
    Nom d'utilisateur (adresse courriel) : <input type = "email" name="username">
    <br>
    Mot de passe : <input type="password" name="password">
    <br>

    <input type="submit" name="login_btn" value="Se connecter">

    <h3>Vous n'avez pas de compte ? <a href="register.jsp">Créer un compte</a></h3>
</form>
<div id="footer"></div>
</body>
</html>