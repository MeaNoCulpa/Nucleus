<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">
					<img src="images/nucleus_white_header.png" alt="logo nucleus" width="200" height="20" />
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="index.jsp#header">ACCUEIL</a></li>
					<li><a href="memberController">MEMBRES</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="settings.jsp"><%=session.getAttribute("firstname")%></a></li>
					<li><a href="conversations.jsp">CONVERSATIONS</a></li>
					<li><a href="logoutController">DECONNEXION</a></li>

					<!-- <li><a href="#portfolio">LES MIEUX NOTES</a></li> -->
					<!-- <li><a href="index.jsp#services">OFFRES</a></li> -->
					<!-- <li><a href="#pricing">TARIFS</a></li> -->
					<!-- <li><a href="index.jsp#contact">CONTACT</a></li> -->
				</ul>
			</div>
		</div>
	</nav>
</header>