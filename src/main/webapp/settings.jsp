<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>Paramètres du compte</title>
<link rel="stylesheet" href="styles/settings.css">

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

<body class="container">

<div id="header"></div>

<main>
    <h1>Paramètres</h1>
    <h5>Choisissez ce que vous voulez modifier.</h5>
    <form class="row g-3">

        <div class="col-md-6">
            <label class="form-label" for=lastName>Nom</label>
            <input type="text" class="form-control" id="lastName">
        </div>
        <div class="col-md-6">
            <label class="form-label" for=firstName>Prénom</label>
            <input type="text" class="form-control" id="firstName">
        </div>

        <div class="col-md-12">
            <label class="form-label" for=email>Courriel</label>
            <input type="email" class="form-control" id="email" placeholder="example@mail.com">
        </div>

        <div class="col-md-12">
            <label class="form-label" for=pass>Mot de passe</label>
            <input type="password" class="form-control" id="pass">
        </div>

        <div class="col-md-12">
            <label class="form-label" for=birthday>Date de naissance</label>
            <input type="date" class="form-control" id="birthday">
        </div>

        <div class="col-md-6">
            <button type="button" class="btn btn-primary">Enregistrer</button>
        </div>
        <div class="col-md-6">
            <button type="button" class="btn btn-default">Annuler</button>
        </div>

    </form>

</main>
<div id="footer"></div>
</body>
</html>