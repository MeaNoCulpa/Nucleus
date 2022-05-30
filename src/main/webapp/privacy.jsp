<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Politique de confidentialité</title>

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
<h1>Politique de confidentialité</h1>
<p>Mise à jour le 25/05/2022</p>
</div>

<div class="container-fluid">

<div class="row">
<div class="col-sm-3">

<div class= "sidebar">
<ul class="menu">
<li>
<a href="privacy.jsp#article1">ARTICLE 1 : Préambule</a>
</li>

<li>
<a href="privacy.jsp#article2">ARTICLE 2 : Principes généraux en matière de collecte de traitement de données</a>
</li>

<li>
<a href="privacy.jsp#article3">ARTICLE 3 : Données à caractères personnel collectées et traitées dans le cadre de la navigation sur le site</a>
</li>

<li>
<a href="privacy.jsp#article4">ARTICLE 4 : Responsable du traitement de données et délégué à la protection des données</a>
</li>

<li>
<a href="privacy.jsp#article5">ARTICLE 5 : Droits de l'Utilisateur</a>
</li>

<li>
<a href="privacy.jsp#article6">ARTICLE 6 : Conditions de modification de la politique de confidentialité</a>
</li>

</ul>
</div> <!-- end sidebar -->
    
</div> <!-- end col-sm-3 -->

<div class="col-sm-9">
<h2 id="arcticle1">ARTICLE 1&nbsp;: PRÉAMBULE<br /><br /></h2>

<p>Cette politique de confidentialité s'applique au site&nbsp;: <a href="index.jsp"  >nucleus.fr</a>.
<br />
<br />
</p>
<p>La présente politique de confidentialité a pour but d'exposer aux utilisateurs du site&nbsp;:</p>
<ul>
<li>La manière dont sont collectées et traitées leurs données à caractère personnel. Doivent être considérées comme données personnelles toutes les données étant susceptibles d'identifier un utilisateur. Il s'agit notamment du prénom et du nom, de l'âge, de l'adresse postale, l'adresse mail, la localisation de l'utilisateur ou encore son adresse IP&nbsp;;</li>
</ul>
<ul>
<li>Quels sont les droits des utilisateurs concernant ces données&nbsp;;</li>
</ul>
<ul>
<li>Qui est responsable du traitement des données à caractère personnel collectées et traitées&nbsp;;</li>
</ul>
<ul>
<li>A qui ces données sont transmises&nbsp;;</li>
</ul>
<ul>
<li>Eventuellement, la politique du site en matière de fichiers "cookies".</li>
</ul>
<p><br />Cette politique de confidentialité complète les mentions légales et les Conditions Générales d'Utilisation que les utilisateurs peuvent consulter à l'adresse ci-après&nbsp;:</p>
<p style="padding-left: 30px;"><a href="terms.jsp">https://nucleus.fr/terms.jsp</a></p>

<h2 id="article2"><br />ARTICLE 2&nbsp;: PRINCIPES GÉNÉRAUX EN MATIÈRE DE COLLECTE ET DE TRAITEMENT DE DONNÉES<br /><br /></h2>

<p>Conformément aux dispositions de l'article 5 du Règlement européen 2016/679, la collecte et le traitement des données des utilisateurs du site respectent les principes suivants&nbsp;:</p>
<ul>
<li>Licéité, loyauté et transparence&nbsp;: les données ne peuvent être collectées et traitées qu'avec le consentement de l'utilisateur propriétaire des données. A chaque fois que des données à caractère personnel seront collectées, il sera indiqué à l'utilisateur que ses données sont collectées, et pour quelles raisons ses données sont collectées&nbsp;;</li>
</ul>
<ul>
<li>Finalités limitées&nbsp;: la collecte et le traitement des données sont exécutés pour répondre à un ou plusieurs objectifs déterminés dans les présentes conditions générales d'utilisation&nbsp;;</li>
</ul>
<ul>
<li>Minimisation de la collecte et du traitement des données&nbsp;: seules les données nécessaires à la bonne exécution des objectifs poursuivis par le site sont collectées&nbsp;;</li>
</ul>
<ul>
<li>Conservation des données réduites dans le temps&nbsp;: les données sont conservées pour une durée limitée, dont l'utilisateur est informé. Lorsque cette information ne peut pas être communiquée, l'utilisateur est informé des critères utilisés pour déterminer la durée de conservation&nbsp;;</li>
</ul>
<ul>
<li>Intégrité et confidentialité des données collectées et traitées&nbsp;: le responsable du traitement des données s'engage à garantir l'intégrité et la confidentialité des données collectées.<br /><br /></li>
</ul>
<p>Afin d'être licites, et ce conformément aux exigences de l'article 6 du règlement européen 2016/679, la collecte et le traitement des données à caractère personnel ne pourront intervenir que s'ils respectent au moins l'une des conditions ci-après énumérées&nbsp;:</p>
<ul>
<li>L'utilisateur a expressément consenti au traitement&nbsp;;</li>
</ul>
<ul>
<li>Le traitement est nécessaire à la bonne exécution d'un contrat&nbsp;;</li>
</ul>
<ul>
<li>Le traitement répond à une obligation légale&nbsp;;</li>
</ul>
<ul>
<li>Le traitement s'explique par une nécessité liée à la sauvegarde des intérêts vitaux de la personne concernée ou d'une autre personne physique&nbsp;;</li>
</ul>
<ul>
<li>Le traitement peut s'expliquer par une nécessité liée à l'exécution d'une mission d'intérêt public ou qui relève de l'exercice de l'autorité publique&nbsp;;</li>
</ul>
<ul>
<li>Le traitement et la collecte des données à caractère personnel sont nécessaires aux fins des intérêts légitimes et privés poursuivis par le responsable du traitement ou par un tiers.</li>
</ul>

<h2 id="article3"><br />ARTICLE 3&nbsp;: DONNÉES À CARACTÈRE PERSONNEL COLLECTÉES ET TRAITÉES DANS LE CADRE DE LA NAVIGATION SUR LE SITE<br /><br /></h2>

<p style="padding-left: 30px;"><strong>A. DONNÉES COLLECTÉES ET TRAITÉES ET MODE DE COLLECTE</strong></p>
<p>Les données à caractère personnel collectées sur le site Nucleus -- Home Exchange Manager sont les suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- Prénoms, nom&nbsp;;<br />- Adresse électronique&nbsp;;<br />- Adresse postale.</p>
<p>Ces données sont collectées lorsque l'utilisateur effectue l'une des opérations suivantes sur le site&nbsp;:</p>
<p style="padding-left: 30px;">- Lorsque l'Utilisateur s'inscrit sur le site&nbsp;;<br />- Lorsque l'Utilisateur utilise le formulaire de contact pour envoyer une demande&nbsp;;<br />- Lorsque l'Utilisateur publie une description de logement.</p>
<p>Le responsable du traitement conservera dans ses systèmes informatiques du site et dans des conditions raisonnables de sécurité l'ensemble des données collectées pour une durée de&nbsp;: six mois.</p>
<p>La collecte et le traitement des données répondent aux finalités suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- gestion de compte Utilisateur&nbsp;;<br />- réponse aux demandes envoyées par le biais du formulaire de contact.</p>
<p>Les traitements de données effectués sont fondés sur les bases légales suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- intérêt légitime de Nucleus (article 6.1.f RGPD).</p>

<p style="padding-left: 30px;"><strong>B. TRANSMISSION DES DONNÉES A DES TIERS</strong></p>

<p>Les données à caractère personnel collectées par le site ne sont transmises à aucun tiers, et ne sont traitées que par l'éditeur du site. <br /><br /></p>
<p style="padding-left: 30px;"><strong>C. HÉBERGEMENT DES DONNÉES</strong></p>
<p>Le site Nucleus -- Home Exchange Manager est hébergé par&nbsp;: OVH, dont le siège est situé à l'adresse ci-après&nbsp;:</p>
<p style="padding-left: 30px;">2, rue Kellermann, 59100 Roubaix</p>
<p>L'hébergeur peut être contacté au numéro de téléphone suivant&nbsp;: 09.72.10.10.07. </p>
<p>Les données collectées et traitées par le site sont exclusivement hébergées et traitées en France. </p>

<h2 id="article4"><br />ARTICLE 4&nbsp;: RESPONSABLE DU TRAITEMENT DES DONNÉES<span style="text-align: start;">ET DÉLÉGUÉ À LA PROTECTION DES DONNÉES</span></h2>

<p style="padding-left: 30px;"><strong>A. LE RESPONSABLE DU TRAITEMENT DES DONNÉES</strong></p>
<p>Le responsable du traitement des données à caractère personnel est&nbsp;: M. Nathanaël LEDRICH. Il peut être contacté de la manière suivante&nbsp;:</p>
<p style="padding-left: 30px;">Le responsable du traitement des données peut être contacté par téléphone au 06.60.49.66.57, de 8h à 19h, du lundi au vendredi.</p>
<p>Le responsable du traitement des données est chargé de déterminer les finalités et les moyens mis au service du traitement des données à caractère personnel. <br /><br /></p>
<p style="padding-left: 30px;"><strong>B. OBLIGATIONS DU RESPONSABLE DU TRAITEMENT DES DONNÉES</strong></p>
<p>Le responsable du traitement s'engage à protéger les données à caractère personnel collectées, à ne pas les transmettre à des tiers sans que l'utilisateur n'en ait été informé et à respecter les finalités pour lesquelles ces données ont été collectées.</p>
<p>De plus, le responsable du traitement des données s'engage à notifier l'utilisateur en cas de rectification ou de suppression des données, à moins que cela n'entraîne pour lui des formalités, coûts et démarches disproportionnés.</p>
<p>Dans le cas où l'intégrité, la confidentialité ou la sécurité des données à caractère personnel de l'utilisateur est compromise, le responsable du traitement s'engage à informer l'utilisateur par tout moyen. <br /><br /></p>
<p style="padding-left: 30px;"><strong>C. LE DÉLÉGUÉ À LA PROTECTION DES DONNÉES</strong></p>
<p>Par ailleurs, l'utilisateur est informé qu'un Délégué à la Protection des Données a été nommé&nbsp;: M. Yann SPANIER.</p>
<p>Le rôle du Délégué à la Protection des Données et de s'assurer la bonne mise en œuvre des dispositions nationales et supranationales relatives à la collecte et au traitement des données à caractère personnel. Il peut également être nommé DPO (pour Data Protection Officer).</p>
<p>Le délégué à la protection des données peut être joint de la manière suivante&nbsp;:</p>
<p style="padding-left: 30px;">Par téléphone&nbsp;: <br />au 06.66.42.64.91, <br />du lundi au vendredi de 9h à 17h&nbsp;; <br />Par mail&nbsp;: <a href="mailto:support@nucleus.fr">support@nucleus.fr</a>.<br /><br /></p>

<h2 id="article5">ARTICLE 5&nbsp;: DROITS DE L'UTILISATEUR<br /><br /></h2>

<p>Conformément à la réglementation concernant le traitement des données à caractère personnel, l'utilisateur possède les droits ci-après énumérés.</p>
<p>Afin que le responsable du traitement des données fasse droit à sa demande, l'utilisateur est tenu de lui communiquer&nbsp;: ses prénom et nom ainsi que son adresse e-mail, et si cela est pertinent, son numéro de compte ou d'espace personnel ou d'abonné.</p>
<p>Le responsable du traitement des données est tenu de répondre à l'utilisateur dans un délai de 30 (trente) jours maximum.<br /><br /></p>
<p style="padding-left: 30px;"><strong>A. PRÉSENTATION DES DROITS DE L'UTILISATEUR EN MATIÈRE DE COLLECTE ET TRAITEMENT DE DONNÉES</strong></p>
<p><em><br />a. Droit d'accès, de rectification et droit à l'effacement</em></p>
<p>L'utilisateur peut prendre connaissance, mettre à jour, modifier ou demander la suppression des données le concernant, en respectant la procédure ci-après énoncée&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit envoyer un courrier électronique au responsable du traitement des données personnelles, en précisant l'objet de sa demande, à l'adresse électronique de contact. </p>
<p>S'il en possède un, l'utilisateur a le droit de demander la suppression de son espace personnel en suivant la procédure suivante&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit envoyer un courrier électronique au responsable du traitement en précisant son numéro d'espace personnel. La demande sera traitée dans un délai de 10 jours ouvrés.<br /><br /></p>
<p><em>b. Droit à la portabilité des données</em></p>
<p>L'utilisateur a le droit de demander la portabilité de ses données personnelles, détenues par le site, vers un autre site, en se conformant à la procédure ci-après&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit faire une demande de portabilité de ses données personnelles auprès du responsable du traitement des données, en envoyant un courrier électronique à l'adresse prévue ci-dessus.</p>
<p><br /><em>c. Droit à la limitation et à l'opposition du traitement des données</em></p>
<p>L'utilisateur a le droit de demander la limitation ou de s'opposer au traitement de ses données par le site, sans que le site ne puisse refuser, sauf à démontrer l'existence de motifs légitimes et impérieux, pouvant prévaloir sur les intérêts et les droits et libertés de l'utilisateur.</p>
<p>Afin de demander la limitation du traitement de ses données ou de formuler une opposition au traitement de ses données, l'utilisateur doit suivre la procédure suivante&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit faire une demande de limitation au traitement de ses données personnelles par courrier électronique auprès du responsable du traitement des données.<br /><br /></p>
<p><em>d. Droit de ne pas faire l'objet d'une décision fondée exclusivement sur un procédé automatisé</em></p>
<p>Conformément aux dispositions du règlement 2016/679, l'utilisateur a le droit de ne pas faire l'objet d'une décision fondée exclusivement sur un procédé automatisé si la décision produit des effets juridiques le concernant, ou l'affecte de manière significative de façon similaire.</p>
<p><br /><em>e. Droit de déterminer le sort des données après la mort</em></p>
<p>Il est rappelé à l'utilisateur qu'il peut organiser quel doit être le devenir de ses données collectées et traitées s'il décède, conformément à la loi n°2016-1321 du 7 octobre 2016.</p>
<p><br /><em>f. Droit de saisir l'autorité de contrôle compétente</em></p>
<p>Dans le cas où le responsable du traitement des données décide de ne pas répondre à la demande de l'utilisateur, et que l'utilisateur souhaite contester cette décision, ou, s'il pense qu'il est porté atteinte à l'un des droits énumérés ci-dessus, il est en droit de saisir la CNIL (Commission Nationale de l'Informatique et des Libertés, https://www.cnil.fr) ou tout juge compétent. <br /><br /></p>
<p style="padding-left: 30px;"><span style="font-weight: bold; font-size: 14.56px;">B. DONNÉES PERSONNELLES DES PERSONNES MINEURES</span></p>
<p>Conformément aux dispositions de l'article 8 du règlement européen 2016/679 et à la loi Informatique et Libertés, seuls les mineurs âgés de 15 ans ou plus peuvent consentir au traitement de leurs données personnelles.</p>
<p>Si l'utilisateur est un mineur de moins de 15 ans, l'accord d'un représentant légal sera requis afin que des données à caractère personnel puissent être collectées et traitées.</p>
<p>L'éditeur du site se réserve le droit de vérifier par tout moyen que l'utilisateur est âgé de plus de 15 ans, ou qu'il aura obtenu l'accord d'un représentant légal avant de naviguer sur le site.<br /><br /></p>

<h2 id="article6">ARTICLE 6&nbsp;: CONDITIONS DE MODIFICATION DE LA POLITIQUE DE CONFIDENTIALITÉ<br /><br /></h2>

<p>La présente politique de confidentialité peut être consultée à tout moment à l'adresse ci-après indiquée&nbsp;:</p>
<p style="padding-left: 30px;"><a href="privacy.jsp">https://nucleus.fr/privacy.jsp</a></p>
<p>L'éditeur du site se réserve le droit de la modifier afin de garantir sa conformité avec le droit en vigueur.</p>
<p>Par conséquent, l'utilisateur est invité à venir consulter régulièrement cette politique de confidentialité afin de se tenir informé des derniers changements qui lui seront apportés.</p>
<p>Il est porté à la connaissance de l'utilisateur que la dernière mise à jour de la présente politique de confidentialité est intervenue le&nbsp;: 25/05/2022.</p>
</div>

</div>
</div>

<div id="footer"></div>

</body>
</html>