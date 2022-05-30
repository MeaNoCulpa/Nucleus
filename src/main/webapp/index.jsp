<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.offer.*" %>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Accueil</title>
		<link rel="icon" type="image/x-icon" href="images/favicon.ico">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
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
		<link href="styles/footer.css" rel="stylesheet" />

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

	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
		<div id="header"></div>

		<div class="jumbotron text-center">
			<h1>Nucleus</h1>
			<p>OU PARTEZ-VOUS A L'AVENTURE ?</p>
			<form class="form-inline" action="searchController">
				<div class="input-group">
					<input type="text" class="form-control" size="50" placeholder="Rechercher une destination" name="location" required />
					<div class="input-group-btn">
						<button type="submit" class="btn btn-danger">Rechercher</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Container (Portfolio Section) -->
		<div id="portfolio" class="container-fluid text-center bg-grey">
			<h2>Découvrez les logements les mieux notés</h2>
			<br />
			<h4>Ce que nous vous proposons</h4>
			<div class="row text-center slideanim">
				<div class="col-sm-4">
					<div class="thumbnail">
					<% OfferDao offerDao = new OfferDao();
					   OfferBean offerBeanParis = new OfferBean();
					   offerBeanParis.setId_offer(13);
					   offerBeanParis.setOffer_image_string(offerDao.getOfferImageString(offerBeanParis));
					   OfferBean offerBeanLyon = new OfferBean();
					   offerBeanLyon.setId_offer(14);
					   offerBeanLyon.setOffer_image_string(offerDao.getOfferImageString(offerBeanLyon));
					   OfferBean offerBeanStrasbourg = new OfferBean();
					   offerBeanStrasbourg.setId_offer(17);
					   offerBeanStrasbourg.setOffer_image_string(offerDao.getOfferImageString(offerBeanStrasbourg));
					%>
					
					
						<img width="400" height="300" src=<%="data:image/png;base64," + offerBeanParis.getOffer_image_string()%>>
						<p><strong>Paris IV</strong></p>
						<p>Logement 1</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img width="400" height="300" src=<%="data:image/png;base64," + offerBeanLyon.getOffer_image_string()%>>
						<p><strong>Lyon III</strong></p>
						<p>Logement 2</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img width="400" height="300" src=<%="data:image/png;base64," + offerBeanStrasbourg.getOffer_image_string()%>>
						<p><strong>Strasbourg</strong></p>
						<p>Logement 3</p>
					</div>
				</div>
			</div>

			<!-- Container (About Section) -->
			<div id="about" class="container-fluid">
				<div class="row">
					<div class="col-sm-8">
						<h2>À propos</h2>
						<br />
						<h4>Vous souhaitez voyager à moindre coût ?</h4>
						<h4>Vous rêvez de ne payez pour l'hébergement ?</h4>
						<h4>Nucleus rend cela possible grâce à notre plateforme d'échange de logement de particuliers à particuliers.</h4>
						<h4>Echangez vos maisons, appartement ou studios pour le temps qu vous souhaitez, fixez vos conditions puis partez à l'aventure !</h4>
						<br />
						<a href="index.jsp#contact">
							<button class="btn btn-default btn-lg">Entrer en contact</button>
						</a>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-signal logo"></span>
					</div>
				</div>
			</div>

			<div class="container-fluid bg-grey">
				<div class="row">
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-globe logo slideanim"></span>
					</div>
					<div class="col-sm-8">
						<h2>Nos valeurs</h2>
						<br />
						<h4>
							<strong>NOTRE MISSION :</strong> Our mission lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
							do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
						</h4>
						<br />
						<p>
							<strong>NOTRE VISION :</strong> Our vision Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
							minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
						</p>
					</div>
				</div>
			</div>

			<!-- Container (Services Section) -->
			<div id="services" class="container-fluid text-center">
				<h2>OFFRES</h2>
				<h4>Nucleus est une solution :</h4>
				<br />
				<div class="row slideanim">
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-refresh logo-small"></span>
						<h4>PAP</h4>
						<p>Discutez et échangez
						<br>
						entre particulliers</p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-euro logo-small"></span>
						<h4>SOLIDAIRE</h4>
						<p>Partez en vacances
						<br>
						0 € pour l'hébergement</p>
					</div>
					<div class="col-sm-4">
						<span class="glyphicon glyphicon-education logo-small"></span>
						<h4>INNOVANTE</h4>
						<p>Révolutionnez vos vancances
						<br>
						partez différemment</p>
					</div>
				</div>
			</div>

			<br />

			<h2>Ils le disent</h2>
			<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h4>"Bla bla"<br /><span>Michael Jackson, Vice Président, Vilebrequin</span></h4>
					</div>
					<div class="item">
						<h4>"Un mot... WOW!!"<br /><span>Stéphane Plaza, Agent immobilier, Stéphane Plaza</span></h4>
					</div>
					<div class="item">
						<h4>"C'est top !"<br /><span>Philippe Etchebest, Cuisinier, Le Bisrtot Régent</span></h4>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Précédent</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Suivant</span>
				</a>
			</div>
		</div>

		<!-- Container (Pricing Section) -->
		<!-- <div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>Tarifs</h2>
    <h4>Choose a payment plan that works for you</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body">
          <p><strong>20</strong> Lorem</p>
          <p><strong>15</strong> Ipsum</p>
          <p><strong>5</strong> Dolor</p>
          <p><strong>2</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$19</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Pro</h1>
        </div>
        <div class="panel-body">
          <p><strong>50</strong> Lorem</p>
          <p><strong>25</strong> Ipsum</p>
          <p><strong>10</strong> Dolor</p>
          <p><strong>5</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$29</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Premium</h1>
        </div>
        <div class="panel-body">
          <p><strong>100</strong> Lorem</p>
          <p><strong>50</strong> Ipsum</p>
          <p><strong>25</strong> Dolor</p>
          <p><strong>10</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$49</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>    
  </div>
</div> -->

		<!-- Container (Contact Section) -->
		<div id="contact" class="container-fluid bg-grey">
			<h2 class="text-center">CONTACT</h2>
			<div class="row">
				<div class="col-sm-5">
					<p>Contactez-nous et nous vous répondrons dans les 24 heures.</p>

					<address>
						<span class="glyphicon glyphicon-map-marker"></span>
						<a
							href="https://www.qwant.com/maps/place/addr:2.327998;48.845303:28@28_Rue_Notre-Dame-des-Champs#map=16.50/48.8453030/2.3279980"
						>
							28, rue Notre-Dame-des-Champs<br />
							75006 Paris, Île-de-France<br />
							FRANCE
						</a>
					</address>

					<!-- <p><span class="glyphicon glyphicon-phone"></span> <a href="tel:06 85 57 35 87">06 85 57 35 87</a></p> -->
					<address>
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="mailto:support@nucleus.fr">support@nucleus.fr</a>
					</address>
				</div>
				<div class="col-sm-7 slideanim">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name" placeholder="Nom" type="text" required />
						</div>
						<div class="col-sm-6 form-group">
							<input
								class="form-control"
								id="email"
								name="email"
								placeholder="Adresse électronique"
								type="email"
								required
							/>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments" placeholder="Commentaire" rows="5"></textarea
					><br />
					<div class="row">
						<div class="col-sm-12 form-group">
							<button class="btn btn-default pull-right" type="submit">Envoyer</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="footer"></div>

		<script>
			$(document).ready(function () {
				// Add smooth scrolling to all links in navbar + footer link
				$(".navbar a, footer a[href='#myPage']").on('click', function (event) {
					// Make sure this.hash has a value before overriding default behavior
					if (this.hash !== '') {
						// Prevent default anchor click behavior
						event.preventDefault();

						// Store hash
						var hash = this.hash;

						// Using jQuery's animate() method to add smooth page scroll
						// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
						$('html, body').animate(
							{
								scrollTop: $(hash).offset().top,
							},
							900,
							function () {
								// Add hash (#) to URL when done scrolling (default click behavior)
								window.location.hash = hash;
							}
						);
					} // End if
				});

				$(window).scroll(function () {
					$('.slideanim').each(function () {
						var pos = $(this).offset().top;

						var winTop = $(window).scrollTop();
						if (pos < winTop + 600) {
							$(this).addClass('slide');
						}
					});
				});
			});
		</script>
	</body>
</html>
