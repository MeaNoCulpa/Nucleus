<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.user.EditBean"%>
<%@page import="utility.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier l'utilisateur</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="shortcut icon" href="#" />
<link rel="stylesheet" href="styles/register.css" />
<link href="styles/footer.css" rel="stylesheet" />

<script>
	$(function () {
		$('#header').load('headerAdmin.jsp');
		$('#footer').load('footer.jsp');
	});
</script>

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
		background-color: #f37b41;
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
		color: #f37b41;
		font-size: 50px;
	}
	.logo {
		color: #f37b41;
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
	.carousel-control.right,
	.carousel-control.left {
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
		border-radius: 0 !important;
		transition: box-shadow 0.5s;
	}
	.panel:hover {
		box-shadow: 5px 0px 40px rgba(0, 0, 0, 0.2);
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
		background-color: #f37b41;
		z-index: 9999;
		border: 0;
		font-size: 12px !important;
		line-height: 1.42857143 !important;
		letter-spacing: 4px;
		border-radius: 0;
		font-family: Montserrat, sans-serif;
	}
	.navbar li a,
	.navbar .navbar-brand {
		color: #fff !important;
	}
	.navbar-nav li a:hover,
	.navbar-nav li.active a {
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
		color: #f37b41;
	}
	.slideanim {
		visibility: hidden;
	}
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
<body id="myPage">
<div id="header"></div>

<div class="container-fluid profil-section">
<div class="profil-info">
	<h2>Modifier un utilisateur</h2>

	<p style="color: red;"><%= ServletUtility.getErrorMessage(request)%></p>
	<p style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></p>
	</div>
</div>

  <div class="container-fluid">
    
    <div class="justify-content-center center-block form-section">
            <jsp:useBean id="bean" class="model.user.EditBean" scope="request"></jsp:useBean>
            
            <form class="form-horizontal" action="editController" method="post">
            
            <div class="form-group">
              <input type="hidden" name="id" value="<%=ServletUtility.getStringData(bean.getId())%>">
               
              <div class="row"> 
              <label class="col-sm-4 control-label" for="firstname" class="col-sm-2 control-label">Prénom</label>
              <div class="col-sm-8">
                <input type="text" class="form-control" name="firstname" value="<%=ServletUtility.getStringData(bean.getFirstname())%>">
              </div>
              </div>
              
              <br>
              
              <div class="row">
              <label class="col-sm-4 control-label" for="lastname">Nom</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" name="lastname" value="<%=ServletUtility.getStringData(bean.getLastname())%>" >
              </div>
              </div>
              
              <br>
              
              <div class="row">
              <label class="col-sm-4 control-label" for="email">Nom d'utilisateur</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" name="email" value="<%=ServletUtility.getStringData(bean.getEmail())%>" >
              </div>
              </div>
              
              <br>
              
              <div class="row">
	              <label class="col-sm-4 control-label" for="role">Rôle</label>
	              <div class="col-sm-8">
		              <select class="form-control" name="role" id="role">
		              <%
		              String role = ServletUtility.getStringData(bean.getRole());
		              if (role.equals("admin")) {
		            	%>
		            	<option value="admin" selected>Admin</option>
					    <option value="user">User</option>
		              <%}else {%>
		              <option value="user" selected>User</option>
					  <option value="admin">Admin</option>
		              <%}%>
					  </select>
	              </div>
              </div>
              
              </div>
              
              <div class="col-sm-offset-2 col-sm-8">
                <input type="submit" class="btn btn-primary" name="operation" value="Enregistrer">
              </div>
              
            </form>
            
          </div>
          
        </div>

<div id="footer"></div>
</body>
</html>