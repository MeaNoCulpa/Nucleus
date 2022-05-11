<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="fr">
<head>
    <title>Accueil</title>
=======
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
>>>>>>> login-Nathanael
</head>
<body>
<h1><%="Bonjour bonjour !"%></h1>
<br/>
<a href="settings.jsp">Page des paramètres</a>

<h2>Se connecter</h2>

<<<<<<< HEAD
<form method="post" action="/loginController" name="login_form" onsubmit="return validate();">
=======
<form method="post" action="loginController" name="login_form">
>>>>>>> login-Nathanael
    Nom d'utilisateur (adresse courriel) : <input type = "email" name="username">
    <br>
    Mot de passe : <input type="password" name="password">
    <br>

    <input type="submit" name="login_btn" value="Se connecter">

    <h3>Vous n'avez pas de compte ? <a href="register.jsp">Créer un compte</a></h3>
</form>
<<<<<<< HEAD

=======
>>>>>>> login-Nathanael
</body>
</html>