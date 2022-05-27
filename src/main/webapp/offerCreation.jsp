<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Créez votre offre  - Home Exchange Manager</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(function(){
  $("#header").load("header.jsp"); 
  $("#footer").load("footer.jsp"); 
});
</script>
<link rel="shortcut icon" href="#">
<link href="styles/footer.css" rel="stylesheet">
<link href="styles/offer.css" rel="stylesheet">

<style type="text/css">
body {
	background: #f7f7f8;
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #f6673c;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #f6673c;
    font-size: 50px;
  }
  .logo {
    color: #f6673c;
    font-size: 200px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #f4511e;
  }
  .carousel-indicators li {
    border-color: #f4511e;
  }
  .carousel-indicators li.active {
    background-color: #f4511e;
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #f4511e; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
    border: 1px solid #f4511e;
    background-color: #fff !important;
    color: #f4511e;
  }
  .panel-heading {
    color: #fff !important;
    background-color: #f4511e !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
  }
  .panel-footer {
    background-color: white !important;
  }
  .panel-footer h3 {
    font-size: 32px;
  }
  .panel-footer h4 {
    color: #aaa;
    font-size: 14px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: #f4511e;
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: #f6673c;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f4511e !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #f6673c;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
  }
</style>

</head>

<body>
<div id="header"></div>

<div class="container-fluid profil-section">

<div class="profil-info">
<h1>Création d'offre</h1>
<p style="color: red;">
	<%
	if (request.getAttribute("WrongLoginMsg") !=  null) {
		out.println(request.getAttribute("WrongLoginMessage"));
	}
	%>
</p>
</div>

</div>

<div class="container-fluid center-block form-section">




<form id="creation" method="post" action="OfferCreationController"  enctype="multipart/form-data" onsubmit="return validation()">
<div class="form-group">
<label for="location" class="form-label">Où souhaitez-vous créer votre offre ?</label>
<input type="text" id="location" class="form-control" name="location">

<br/>

<label for="date_start" class="form-label">De:</label>
<input type="date" id="date_start" class="form-control" onfocus="this.min=new Date().toISOString().split('T')[0]" max="2022-12-31" name="date_start">



<label for="date_end" class="form-label">A:</label>
<input type="date" id="date_end" class="form-control"	onfocus="this.min=date_start.value" max="2022-12-31" name="date_end">

<br/>

<label for="offer_image" class="form-label">Veuillez fournir une image (PNG) de l'offre:</label>
<input type="file" id="offer_image" class="form-control" name="offer_image" accept="image/png">

<br/>

<label for="description" class="form-label">Décrivez votre offre:</label>
<input type="text" id="description" class="form-control" name="description">

</div>

<br/>
<div class="form-check">
<label>Services:</label><br/>
<label for="keep_pets" class="form-label">Garde des animaux</label>
<input type="checkbox" name="services" class="form-check-input" id="keep_pets" value="keep_pets"/>

<label for="water_plants" class="form-label">Arrosage des plantes</label>
<input type="checkbox" name="services" class="form-check-input" id="water_plants" value="water_plants"/>

<label for="clean_house" class="form-label">Nettoyage des lieux</label>
<input type="checkbox" name="services" class="form-check-input" id="clean_house" value="clean_house"/>

<label for="keep_inventory" class="form-label">Remplacement des denrées alimentaires</label>
<input type="checkbox" name="services" class="form-check-input" id="keep_inventory" value="keep_inventory"/>


<br/>

<label> Contraintes:</label><br/>
<label for="No_smoking" class="form-label">Non fumeur</label>
<input type="checkbox" id="No_smoking" name="limitations" class="form-check-input" value="No_smoking"/>

<label for="No_night_disturbance" class="form-label">Pas de bruit passé 23h</label>
<input type="checkbox" id="No_night_disturbance" name="limitations" class="form-check-input" value="No_night_disturbance"/>

<label for="No_children" class="form-label">Pas d'enfant de moins de 2 ans</label>
<input type="checkbox" id="No_children" name="limitations" class="form-check-input" value="No_children"/>

<label for="No_pets" class="form-label">Pas d'animal de compagnie</label>
<input type="checkbox" id="No_pets" name="limitations" class="form-check-input" value="No_pets"/>

<label for="No_party" class="form-label">Pas d'évènement festif</label>
<input type="checkbox" id="No_party" name="limitations" class="form-check-input" value="No_party"/>

</div>
<br/><br/>
<input type="submit" value="Register offer"/> 

</form>


</div>


<div id="footer"></div>

<script>
function validation() {
   var check_location = document.forms["creation"]["location"].value;
   var check_date_start = document.forms["creation"]["date_start"].value;
   var check_date_end = document.forms["creation"]["date_end"].value;
   var check_description = document.forms["creation"]["description"].value;
   
    if (check_location == null || check_location == "") {
        alert("Location cannot be empty..!!");
        return false;
    } else if (check_date_start.equals("jj/mm/aaaa") || new Date(check_date_start).before(Date())) {
    	alert("Start Date cannot be empty / before current date..!!");
        return false;
    } else if (check_date_end == null || check_date_end.before(Date())) {
    	alert("End Date cannot be empty / before current date..!!");
        return false; 
    } else if (check_date_end.before(check_date_start)) {
    	alert("End Date cannot be before start date..!!");
        return false;
    } else if (check_description == null || check_description == "") {
        alert("Description cannot be empty..!!");
        return false;
    } else {
    	return true;
    } 
 }
    
</script>
</body>
</html>