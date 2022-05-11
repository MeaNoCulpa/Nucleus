<<<<<<< HEAD
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
=======
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles/register.css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="shortcut icon" href="#">
<title>Création de compte - Home Exchange</title>
</head>
<body>

<div class="container">

<form class="form" id="register-form" name="register-form" method="post" action="registerController">
<h1>Créer un compte</h1>

  <div class="form-field">
  	<label>Prénom :</label>
  	<input type="text" name="firstname" id="fname">
  </div>
  
  <br>
  
  <div class="form-field">
  	<label>Nom :</label>
  	<input type="text" name="lastname" id="lname">
  </div>
  
  <br>
  
  <div class="form-field">
  	<label for="email">Nom d'utilisateur (adresse courriel) : *</label>
  	<input type="email" name="email" id="email" placeholder="example@mail.com" required>
  	<small></small>
  </div>
  
  <br>
  
  <div class="form-field">
  	<label for="password">Mot de passe : *</label>
  	<input type="password" name="password" id="password" required>
  	<small></small>
  </div>
  
  <br>
  
  <div class="form-field">
  	<label for="confirm-password">Confirmez le mot de passe : *</label>
    <input type="password" name="confirm-password" id="confirm-password" autocomplete="off">
    <small></small>
  </div>
 
  <br>
  
  <div class="form-field">
  	<input type="submit" name="register_btn" value="Créer un compte">
  	</div>
<br>
  <h1> Avez-vous un compte ? <a href="index.jsp">Se connecter</a></h1>
</form>
</div>
<script src="scripts/register.js"></script>
</body>
</html>
>>>>>>> login-Nathanael
