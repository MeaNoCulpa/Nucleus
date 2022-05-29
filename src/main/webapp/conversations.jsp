<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8" />
		<title>Mes messages</title>

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" media="all" />
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

		<script>
		var firstname = '<%=session.getAttribute("firstname")%>';
		var role = '<%=session.getAttribute("role")%>';
		$(function () {
			if (role == 'admin') {
				$('#header').load('headerAdmin.jsp');
			}
			else if (firstname == 'null') {
				$('#header').load('header.jsp');
			}
			else {
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
		<%@page import="controller.ConversationController" %>
		<div id="header"></div>
		<div class="container-fluid profil-section">
			<div class="profil-info">
				<h1>Mes messages</h1>
				<div>
					<span class="profil-name"><%=session.getAttribute("firstname")%></span>
				</div>
			</div>
		</div>

		<div class="container-fluid form-section">
			<div>
				<p>Vos discussions</p>
				<%= ConversationController.getAllConversations(Integer.parseInt(session.getAttribute("idMember").toString())) %>
			</div>
			<div class="col-sm-3"></div>
			<h3>
				<%= ConversationController.getSecondMember(String.valueOf(request.getParameter("idConversation")), Integer.parseInt(session.getAttribute("idMember").toString()))%>
			</h3>
			<%= ConversationController.getAllMessages(String.valueOf(request.getParameter("idConversation")), Integer.parseInt(session.getAttribute("idMember").toString())) %>
			<a href="conversations.jsp?idConversation=<%= ConversationController.conversationWith(Integer.parseInt(session.getAttribute("idMember").toString()), 3) %>">Discuter avec Test</a>
			<% if (request.getParameter("idConversation") != null) { %>
			<form class="form col-sm-9" action="ConversationController" method="post">
				<div>
					<input type="number" name="idConversation" value="<%= request.getParameter("idConversation") %>"
					hidden="true"/>
					<input
						type="text"
						class="form-control space-between"
						name="content"
						id="content"
						placeholder="Votre message"
					/>
					<button type="submit" class="btn btn-primary">Envoyer</button>
				</div>
			</form>
			<% } %>
		</div>

		<div id="footer"></div>
	</body>
</html>
