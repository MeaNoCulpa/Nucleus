<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Accueil</title>
</head>
<body>
<h1><%="Bonjour bonjour !"%></h1>
<br/>
<a href="settings.jsp">Page des paramètres</a>

<h2>Se connecter</h2>

<form method="post" action="/loginController" name="login_form" onsubmit="return validate();">
    Nom d'utilisateur (adresse courriel) : <input type = "email" name="username">
    <br>
    Mot de passe : <input type="password" name="password">
    <br>

    <input type="submit" name="login_btn" value="Se connecter">

    <h3>Vous n'avez pas de compte ? <a href="register.jsp">Créer un compte</a></h3>
</form>

</body>
</html>