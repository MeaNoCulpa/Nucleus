<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8" />
		<title>Paramètres du compte</title>

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" media="all" />
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

		<script>
			var firstname = '<%=session.getAttribute("firstname")%>';
			$(function () {
				if (firstname == 'null') {
					$('#header').load('header.jsp');
				} else {
					$('#header').load('headerLogged.jsp');
				}
				$('#footer').load('footer.jsp');
			});
		</script>

		<link rel="shortcut icon" href="#" />
		<link href="styles/settings.css" rel="stylesheet" />
		<link href="styles/footer.css" rel="stylesheet" />

		<style type="text/css">
			body {
				background: #f7f7f8;
				font: 400 15px Lato, sans-serif;
				line-height: 1.8;
				color: #949494;
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
				background-color: #f6673c;
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
				color: #f6673c;
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
		<% if (session.getAttribute("firstname") == null || session.getAttribute("firstname") == "") {
		response.sendRedirect("index.jsp"); } %>
		<div id="header"></div>

		<div class="container-fluid profil-section">
			<div class="profil-info">
				<h1>Paramètres</h1>
				<div>
					<span class="profil-name"><%=session.getAttribute("firstname")%></span>
				</div>
			</div>
		</div>

		<div class="container-fluid form-section">
			<div class="col-sm-3"></div>

			<div class="col-sm-9">
				<form class="form" method="post" action="SettingsController" id="settings-form" name="settings-form">
					<div class="form-group">
						<h3>Adresse électronique</h3>

						<input type="email" class="form-control space-between" id="email"
						placeholder="<%=session.getAttribute("username")%>" disabled>

						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
							Modifier l'adresse électronique
						</button>
					</div>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Mettre à jour l'addresse électronique</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<p>
											Saisissez la nouvelle adresse électronique de votre compte. Une fois la nouvelle adresse vérifiée,
											votre compte sera mis à jour.
										</p>
										<input
											type="email"
											class="form-control"
											id="email"
											placeholder="Entrez votre addresse électronique *"
											name="username"
										/>
										<input
											type="password"
											class="form-control space-between"
											id="password"
											placeholder="Vérifier avec votre mot de passe *"
											name="password"
										/>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal">Annuler</button>
									<button type="submit" name="settings_email_btn" class="btn btn-primary" value="Enregistrer">
										Enregistrer
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>

				<form class="form" method="post" id="passwordForm" action="SettingsController" name="passwordForm">
					<div class="form-group">
						<h3>Changer le mot de passe</h3>

						<input
							type="password"
							class="form-control space-between"
							name="current-password"
							placeholder="Mot de passe actuel"
						/>

						<div>
							<input
								type="password"
								id="new-password"
								class="form-control space-between"
								name="new-password"
								placeholder="Nouveau mot de passe"
								size="20"
							/>
							<small></small>
						</div>

						<div>
							<input
								type="password"
								id="confirm-password"
								class="form-control space-between"
								name="new-password-confirmation"
								placeholder="Nouveau mot de passe (encore)"
							/>
							<small></small>
						</div>
						<button type="submit" name="settings_password_btn" class="btn btn-primary">Modifier le mot de passe</button>
					</div>
				</form>

				<div class="form-group">
					<form class="form" method="post" action="SettingsController" name="infoForm" id="infoForm">
						<h3>Informations du compte</h3>

						<div>
							<input type="text" class="form-control space-between" id="lname" name="lastname"
							value="<%=session.getAttribute("lastname")%>">
							<small></small>
						</div>
						<!-- <button type="submit" name="settings_lname_btn" class="btn btn-primary">Enregistrer</button>
   	 </form>
   	
    <form class="form" method="post" action="SettingsController" name="infoForm" id="fname-form"> -->
						<div>
							<input type="text" class="form-control space-between" id="fname" name="firstname"
							value="<%=session.getAttribute("firstname")%>">
							<small></small>
						</div>
						<button type="submit" name="settings_info_btn" class="btn btn-primary">Enregistrer</button>
					</form>
				</div>
			</div>
		</div>

		<script src="scripts/settings.js"></script>

		<div id="footer"></div>
	</body>
</html>
