
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Conditions générales d'utilisation</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
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

<link href="styles/terms.css" rel="stylesheet">
<link href="styles/footer.css" rel="stylesheet">
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
    background-color: #f37b41;
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
    color: #f37b41;
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

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<div id="header"></div>

<div class="jumbotron text-center">
<h1>Conditions générales d'utilisation</h1>
<p>Mises à jour le 25/05/2022</p>
</div>

<div class="container-fluid">

<div class="row">

<div class="col-sm-3">

<div class= "sidebar">
<ul class="menu">
<li>
<a href="terms.jsp#article1">ARTICLE 1 : Les mentions légales</a>
</li>

<li>
<a href="terms.jsp#article2">ARTICLE 2 : Accès au site</a>
</li>

<li>
<a href="terms.jsp#article3">ARTICLE 3 : Collecte des données</a>
</li>

<li>
<a href="terms.jsp#article4">ARTICLE 4 : Propriété intellectuelle</a>
</li>

<li>
<a href="terms.jsp#article5">ARTICLE 5 : Responsabilité</a>
</li>

<li>
<a href="terms.jsp#article6">ARTICLE 6 : Liens hypertextes</a>
</li>

<li>
<a href="terms.jsp#article7">ARTICLE 7 : Cookies</a>
</li>

<li>
<a href="terms.jsp#article8">ARTICLE 8 : Publication par l’Utilisateur</a>
</li>

<li>
<a href="terms.jsp#article9">ARTICLE 9 : Droit applicable et juridiction compétente</a>
</li>
</ul>
</div> <!-- end sidebar -->
    
</div> <!-- end col-sm-3 -->

<div class="col-sm-9">
<p>
Les présentes conditions générales d'utilisation (dites « CGU ») ont pour objet l'encadrement juridique des modalités de mise à disposition du site et des services par Nucleus  et de définir les conditions d’accès et d’utilisation des services par « l'Utilisateur ».
</p>

<p>
Les présentes CGU sont accessibles sur le site à la rubrique «CGU».
</p>

<p>
Toute inscription ou utilisation du site implique l'acceptation sans aucune réserve ni restriction des présentes CGU par l’utilisateur. Lors de l'inscription sur le site via le Formulaire d’inscription, chaque utilisateur accepte expressément les présentes CGU en cochant la case précédant le texte suivant : « Je reconnais avoir lu et compris les CGU et je les accepte ».
</p>

<p>
En cas de non-acceptation des CGU stipulées dans le présent contrat, l'Utilisateur se doit de renoncer à l'accès des services proposés par le site.
</p>

<p>
<a href="index.jsp">nucleus.fr</a> se réserve le droit de modifier unilatéralement et à tout moment le contenu des présentes CGU.
</p>

<h2 id="article1">ARTICLE 1 : Les mentions légales</h2>

<p>
L'édition du site <a href="index.jsp">nucleus.fr</a> est assurée par la Société SAS Nucleus au capital de 1,234 euros, immatriculée au RCS de Paris sous le numéro 818 164 964, dont le siège social est situé au 28, rue Notre-Dame-des-Champs, 75006 Paris.
</p>

<p>
Adresse électronique : <a href="mailto:support@nucleus.fr">support@nucleus.fr</a>.
</p>

<p>
Le Directeur de la publication est : M. LEDRICH Nathanaël.
</p>

<p>
L'hébergeur du site <a href="index.jsp">nucleus.fr</a> est la société OVH SAS, dont le siège social est situé au 2, rue Kellermann, 59100 Roubaix.
</p>

<h2 id="article2">ARTICLE 2 : Accès au site</h2>

<p>
Le site <a href="index.jsp">nucleus.fr</a> permet à l'Utilisateur un accès gratuit aux services suivants :
</p>

<ul style="list-style-type: ' -    ';">
<li> recherche de biens immobiliers à louer contre des services rendus ;
<li> publication d'annonces de mise en location de biens immobiliers.
</ul>
<p>
Le site est accessible gratuitement en tout lieu à tout Utilisateur ayant un accès à Internet. Tous les frais supportés par l'Utilisateur pour accéder au service (matériel informatique, logiciels, connexion Internet, etc.) sont à sa charge.
</p>

<p>
L’Utilisateur non membre n'a pas accès aux services réservés. Pour cela, il doit s’inscrire en remplissant le formulaire. En acceptant de s’inscrire aux services réservés, l’Utilisateur membre s’engage à fournir des informations sincères et exactes concernant son état civil et ses coordonnées, notamment son adresse électronique.
</p>

<p>
Pour accéder aux services, l’Utilisateur doit ensuite s'identifier à l'aide de son identifiant et de son mot de passe qui lui seront communiqués après son inscription.
</p>

<p>
Tout Utilisateur membre régulièrement inscrit pourra également solliciter sa désinscription en se rendant à la page dédiée sur son espace personnel. Celle-ci sera effective dans un délai raisonnable.
</p>

<p>
Tout événement dû à un cas de force majeure ayant pour conséquence un dysfonctionnement du site ou serveur et sous réserve de toute interruption ou modification en cas de maintenance, n'engage pas la responsabilité de <a href="index.jsp">nucleus.fr</a>. Dans ces cas, l’Utilisateur accepte ainsi ne pas tenir rigueur à l’éditeur de toute interruption ou suspension de service, même sans préavis.
</p>

<p>
L'Utilisateur a la possibilité de contacter le site par messagerie électronique à l’adresse électronique de l’éditeur communiqué à l’<a href="terms.jsp#article1">ARTICLE 1</a>.
</p>

<h2 id="article3">ARTICLE 3 : Collecte des données</h2>

<p>
Le site assure à l'Utilisateur une collecte et un traitement d'informations personnelles dans le respect de la vie privée conformément à la loi n°78-17 du 6 janvier 1978 relative à l'informatique, aux fichiers et aux libertés. Le site est déclaré à la CNIL sous le numéro 1958146.
</p>

<p>
En vertu de la loi Informatique et Libertés, en date du 6 janvier 1978, l'Utilisateur dispose d'un droit d'accès, de rectification, de suppression et d'opposition de ses données personnelles. L'Utilisateur exerce ce droit :
</p>

<ul style="list-style-type: ' -    ';">
<li> par mail à l'adresse électronique <a href="mailto:support@nucleus.fr">support@nucleus.fr</a> ;
<li> via un formulaire de contact ;
<li> via son espace personnel.
</ul>

<h2 id="article4">ARTICLE 4 : Propriété intellectuelle</h2>

<p>
Les marques, logos, signes ainsi que tous les contenus du site (textes, images, son…) font l'objet d'une protection par le Code de la propriété intellectuelle et plus particulièrement par le droit d'auteur.
</p>

<p>
L'Utilisateur doit solliciter l'autorisation préalable du site pour toute reproduction, publication, copie des différents contenus. Il s'engage à une utilisation des contenus du site dans un cadre strictement privé, toute utilisation à des fins commerciales et publicitaires est strictement interdite.
</p>

<p>
Toute représentation totale ou partielle de ce site par quelque procédé que ce soit, sans l’autorisation expresse de l’exploitant du site Internet constituerait une contrefaçon sanctionnée par l’article L 335-2 et suivants du Code de la propriété intellectuelle.
</p>

<p>
Il est rappelé conformément à l’article L122-5 du Code de propriété intellectuelle que l’Utilisateur qui reproduit, copie ou publie le contenu protégé doit citer l’auteur et sa source.
</p>
 
<h2 id="article5">ARTICLE 5 : Responsabilité</h2>

<p>
Les sources des informations diffusées sur le site <a href="index.jsp">nucleus.fr</a> sont réputées fiables mais le site ne garantit pas qu’il soit exempt de défauts, d’erreurs ou d’omissions.
</p>

<p>
Les informations communiquées sont présentées à titre indicatif et général sans valeur contractuelle. Malgré des mises à jour régulières, le site <a href="index.jsp">nucleus.fr</a> ne peut être tenu responsable de la modification des dispositions administratives et juridiques survenant après la publication. De même, le site ne peut être tenue responsable de l’utilisation et de l’interprétation de l’information contenue dans ce site.
</p>

<p>
L'Utilisateur s'assure de garder son mot de passe secret. Toute divulgation du mot de passe, quelle que soit sa forme, est interdite. Il assume les risques liés à l'utilisation de son identifiant et mot de passe. Le site décline toute responsabilité.
</p>

<p>
Le site <a href="index.jsp">nucleus.fr</a> ne peut être tenu pour responsable d’éventuels virus qui pourraient infecter l’ordinateur ou tout matériel informatique de l’Internaute, suite à une utilisation, à l’accès, ou au téléchargement provenant de ce site.
</p>

<p>
La responsabilité du site ne peut être engagée en cas de force majeure ou du fait imprévisible et insurmontable d'un tiers.
</p>

<h2 id="article6">ARTICLE 6 : Liens hypertextes</h2>

<p>
Des liens hypertextes peuvent être présents sur le site. L’Utilisateur est informé qu’en cliquant sur ces liens, il sortira du site <a href="index.jsp">nucleus.fr</a>. Ce dernier n’a pas de contrôle sur les pages web sur lesquelles aboutissent ces liens et ne saurait, en aucun cas, être responsable de leur contenu.
</p>

<h2 id="article7">ARTICLE 7 : Cookies</h2>

<p>
L’Utilisateur est informé que lors de ses visites sur le site, un cookie peut s’installer automatiquement sur son logiciel de navigation.
</p>

<p>
Les cookies sont de petits fichiers stockés temporairement sur le disque dur de l’ordinateur de l’Utilisateur par votre navigateur et qui sont nécessaires à l’utilisation du site <a href="index.jsp">nucleus.fr</a>. Les cookies ne contiennent pas d’information personnelle et ne peuvent pas être utilisés pour identifier quelqu’un. Un cookie contient un identifiant unique, généré aléatoirement et donc anonyme. Certains cookies expirent à la fin de la visite de l’Utilisateur, d’autres restent.
</p>

<p>
L’information contenue dans les cookies est utilisée pour améliorer le site <a href="index.jsp">nucleus.fr</a>.
</p>

<p>
En naviguant sur le site, L’Utilisateur les accepte.
</p>

<p>
L’Utilisateur pourra désactiver ces cookies par l’intermédiaire des paramètres figurant au sein de son logiciel de navigation.
</p>

<h2 id="article8">ARTICLE 8 : Publication par l’Utilisateur</h2>

<p>
Le site permet aux membres de publier les contenus suivants : 
annonces, commentaires.
</p>

<p>
Dans ses publications, le membre s’engage à respecter les règles de la Netiquette (règles de bonne conduite de l’internet) et les règles de droit en vigueur.
</p>

<p>
Le site peut exercer une modération sur les publications et se réserve le droit de refuser leur mise en ligne, sans avoir à s’en justifier auprès du membre.
</p>

<p>
Le membre reste titulaire de l’intégralité de ses droits de propriété intellectuelle. Mais en publiant une publication sur le site, il cède à la société éditrice le droit non exclusif et gratuit de représenter, reproduire, adapter, modifier, diffuser et distribuer sa publication, directement ou par un tiers autorisé, dans le monde entier, sur tout support (numérique ou physique), pour la durée de la propriété intellectuelle. Le Membre cède notamment le droit d'utiliser sa publication sur internet et sur les réseaux de téléphonie mobile.
</p>

<p>
La société éditrice s'engage à faire figurer le nom du membre à proximité de chaque utilisation de sa publication.
</p>

<p>
Tout contenu mis en ligne par l'Utilisateur est de sa seule responsabilité. L'Utilisateur s'engage à ne pas mettre en ligne de contenus pouvant porter atteinte aux intérêts de tierces personnes. Tout recours en justice engagé par un tiers lésé contre le site sera pris en charge par l'Utilisateur.
</p>

<p>
Le contenu de l'Utilisateur peut être à tout moment et pour n'importe quelle raison supprimé ou modifié par le site, sans préavis.
</p>
 
<h2 id="article9">ARTICLE 9 : Droit applicable et juridiction compétente</h2>

<p>
La législation française s'applique au présent contrat. En cas d'absence de résolution amiable d'un litige né entre les parties, les tribunaux français seront seuls compétents pour en connaître.
</p>

<p>
Pour toute question relative à l’application des présentes CGU, vous pouvez joindre l’éditeur aux coordonnées inscrites à l'<a href="terms.jsp#article1">ARTICLE 1</a>.
</p>

</div>

</div> <!-- end row -->

</div> <!-- end container-fluid -->

<div id="footer"></div>


</body>


</html>