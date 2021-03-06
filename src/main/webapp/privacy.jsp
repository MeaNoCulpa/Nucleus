<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Politique de confidentialit√©</title>

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
<h1>Politique de confidentialit√©</h1>
<p>Mise √† jour le 25/05/2022</p>
</div>

<div class="container-fluid">

<div class="row">
<div class="col-sm-3">

<div class= "sidebar">
<ul class="menu">
<li>
<a href="privacy.jsp#article1">ARTICLE 1 : Pr√©ambule</a>
</li>

<li>
<a href="privacy.jsp#article2">ARTICLE 2 : Principes g√©n√©raux en mati√®re de collecte de traitement de donn√©es</a>
</li>

<li>
<a href="privacy.jsp#article3">ARTICLE 3 : Donn√©es √† caract√®res personnel collect√©es et trait√©es dans le cadre de la navigation sur le site</a>
</li>

<li>
<a href="privacy.jsp#article4">ARTICLE 4 : Responsable du traitement de donn√©es et d√©l√©gu√© √† la protection des donn√©es</a>
</li>

<li>
<a href="privacy.jsp#article5">ARTICLE 5 : Droits de l'Utilisateur</a>
</li>

<li>
<a href="privacy.jsp#article6">ARTICLE 6 : Conditions de modification de la politique de confidentialit√©</a>
</li>

</ul>
</div> <!-- end sidebar -->
    
</div> <!-- end col-sm-3 -->

<div class="col-sm-9">
<h2 id="arcticle1">ARTICLE 1&nbsp;: PR√ČAMBULE<br /><br /></h2>

<p>Cette politique de confidentialit√© s'applique au site&nbsp;: <a href="index.jsp"  >nucleus.fr</a>.
<br />
<br />
</p>
<p>La pr√©sente politique de confidentialit√© a pour but d'exposer aux utilisateurs du site&nbsp;:</p>
<ul>
<li>La mani√®re dont sont collect√©es et trait√©es leurs donn√©es √† caract√®re personnel. Doivent √™tre consid√©r√©es comme donn√©es personnelles toutes les donn√©es √©tant susceptibles d'identifier un utilisateur. Il s'agit notamment du pr√©nom et du nom, de l'√Ęge, de l'adresse postale, l'adresse mail, la localisation de l'utilisateur ou encore son adresse IP&nbsp;;</li>
</ul>
<ul>
<li>Quels sont les droits des utilisateurs concernant ces donn√©es&nbsp;;</li>
</ul>
<ul>
<li>Qui est responsable du traitement des donn√©es √† caract√®re personnel collect√©es et trait√©es&nbsp;;</li>
</ul>
<ul>
<li>A qui ces donn√©es sont transmises&nbsp;;</li>
</ul>
<ul>
<li>Eventuellement, la politique du site en mati√®re de fichiers "cookies".</li>
</ul>
<p><br />Cette politique de confidentialit√© compl√®te les mentions l√©gales et les Conditions G√©n√©rales d'Utilisation que les utilisateurs peuvent consulter √† l'adresse ci-apr√®s&nbsp;:</p>
<p style="padding-left: 30px;"><a href="terms.jsp">https://nucleus.fr/terms.jsp</a></p>

<h2 id="article2"><br />ARTICLE 2&nbsp;: PRINCIPES G√ČN√ČRAUX EN MATI√ąRE DE COLLECTE ET DE TRAITEMENT DE DONN√ČES<br /><br /></h2>

<p>Conform√©ment aux dispositions de l'article 5 du R√®glement europ√©en 2016/679, la collecte et le traitement des donn√©es des utilisateurs du site respectent les principes suivants&nbsp;:</p>
<ul>
<li>Lic√©it√©, loyaut√© et transparence&nbsp;: les donn√©es ne peuvent √™tre collect√©es et trait√©es qu'avec le consentement de l'utilisateur propri√©taire des donn√©es. A chaque fois que des donn√©es √† caract√®re personnel seront collect√©es, il sera indiqu√© √† l'utilisateur que ses donn√©es sont collect√©es, et pour quelles raisons ses donn√©es sont collect√©es&nbsp;;</li>
</ul>
<ul>
<li>Finalit√©s limit√©es&nbsp;: la collecte et le traitement des donn√©es sont ex√©cut√©s pour r√©pondre √† un ou plusieurs objectifs d√©termin√©s dans les pr√©sentes conditions g√©n√©rales d'utilisation&nbsp;;</li>
</ul>
<ul>
<li>Minimisation de la collecte et du traitement des donn√©es&nbsp;: seules les donn√©es n√©cessaires √† la bonne ex√©cution des objectifs poursuivis par le site sont collect√©es&nbsp;;</li>
</ul>
<ul>
<li>Conservation des donn√©es r√©duites dans le temps&nbsp;: les donn√©es sont conserv√©es pour une dur√©e limit√©e, dont l'utilisateur est inform√©. Lorsque cette information ne peut pas √™tre communiqu√©e, l'utilisateur est inform√© des crit√®res utilis√©s pour d√©terminer la dur√©e de conservation&nbsp;;</li>
</ul>
<ul>
<li>Int√©grit√© et confidentialit√© des donn√©es collect√©es et trait√©es&nbsp;: le responsable du traitement des donn√©es s'engage √† garantir l'int√©grit√© et la confidentialit√© des donn√©es collect√©es.<br /><br /></li>
</ul>
<p>Afin d'√™tre licites, et ce conform√©ment aux exigences de l'article 6 du r√®glement europ√©en 2016/679, la collecte et le traitement des donn√©es √† caract√®re personnel ne pourront intervenir que s'ils respectent au moins l'une des conditions ci-apr√®s √©num√©r√©es&nbsp;:</p>
<ul>
<li>L'utilisateur a express√©ment consenti au traitement&nbsp;;</li>
</ul>
<ul>
<li>Le traitement est n√©cessaire √† la bonne ex√©cution d'un contrat&nbsp;;</li>
</ul>
<ul>
<li>Le traitement r√©pond √† une obligation l√©gale&nbsp;;</li>
</ul>
<ul>
<li>Le traitement s'explique par une n√©cessit√© li√©e √† la sauvegarde des int√©r√™ts vitaux de la personne concern√©e ou d'une autre personne physique&nbsp;;</li>
</ul>
<ul>
<li>Le traitement peut s'expliquer par une n√©cessit√© li√©e √† l'ex√©cution d'une mission d'int√©r√™t public ou qui rel√®ve de l'exercice de l'autorit√© publique&nbsp;;</li>
</ul>
<ul>
<li>Le traitement et la collecte des donn√©es √† caract√®re personnel sont n√©cessaires aux fins des int√©r√™ts l√©gitimes et priv√©s poursuivis par le responsable du traitement ou par un tiers.</li>
</ul>

<h2 id="article3"><br />ARTICLE 3&nbsp;: DONN√ČES √Ä CARACT√ąRE PERSONNEL COLLECT√ČES ET TRAIT√ČES DANS LE CADRE DE LA NAVIGATION SUR LE SITE<br /><br /></h2>

<p style="padding-left: 30px;"><strong>A. DONN√ČES COLLECT√ČES ET TRAIT√ČES ET MODE DE COLLECTE</strong></p>
<p>Les donn√©es √† caract√®re personnel collect√©es sur le site Nucleus -- Home Exchange Manager sont les suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- Pr√©noms, nom&nbsp;;<br />- Adresse √©lectronique&nbsp;;<br />- Adresse postale.</p>
<p>Ces donn√©es sont collect√©es lorsque l'utilisateur effectue l'une des op√©rations suivantes sur le site&nbsp;:</p>
<p style="padding-left: 30px;">- Lorsque l'Utilisateur s'inscrit sur le site&nbsp;;<br />- Lorsque l'Utilisateur utilise le formulaire de contact pour envoyer une demande&nbsp;;<br />- Lorsque l'Utilisateur publie une description de logement.</p>
<p>Le responsable du traitement conservera dans ses syst√®mes informatiques du site et dans des conditions raisonnables de s√©curit√© l'ensemble des donn√©es collect√©es pour une dur√©e de&nbsp;: six mois.</p>
<p>La collecte et le traitement des donn√©es r√©pondent aux finalit√©s suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- gestion de compte Utilisateur&nbsp;;<br />- r√©ponse aux demandes envoy√©es par le biais du formulaire de contact.</p>
<p>Les traitements de donn√©es effectu√©s sont fond√©s sur les bases l√©gales suivantes&nbsp;:</p>
<p style="padding-left: 30px;">- int√©r√™t l√©gitime de Nucleus (article 6.1.f RGPD).</p>

<p style="padding-left: 30px;"><strong>B. TRANSMISSION DES DONN√ČES A DES TIERS</strong></p>

<p>Les donn√©es √† caract√®re personnel collect√©es par le site ne sont transmises √† aucun tiers, et ne sont trait√©es que par l'√©diteur du site. <br /><br /></p>
<p style="padding-left: 30px;"><strong>C. H√ČBERGEMENT DES DONN√ČES</strong></p>
<p>Le site Nucleus -- Home Exchange Manager est h√©berg√© par&nbsp;: OVH, dont le si√®ge est situ√© √† l'adresse ci-apr√®s&nbsp;:</p>
<p style="padding-left: 30px;">2, rue Kellermann, 59100 Roubaix</p>
<p>L'h√©bergeur peut √™tre contact√© au num√©ro de t√©l√©phone suivant&nbsp;: 09.72.10.10.07. </p>
<p>Les donn√©es collect√©es et trait√©es par le site sont exclusivement h√©berg√©es et trait√©es en France. </p>

<h2 id="article4"><br />ARTICLE 4&nbsp;: RESPONSABLE DU TRAITEMENT DES DONN√ČES<span style="text-align: start;">ET D√ČL√ČGU√Č √Ä LA PROTECTION DES DONN√ČES</span></h2>

<p style="padding-left: 30px;"><strong>A. LE RESPONSABLE DU TRAITEMENT DES DONN√ČES</strong></p>
<p>Le responsable du traitement des donn√©es √† caract√®re personnel est&nbsp;: M. Nathana√ęl LEDRICH. Il peut √™tre contact√© de la mani√®re suivante&nbsp;:</p>
<p style="padding-left: 30px;">Le responsable du traitement des donn√©es peut √™tre contact√© par t√©l√©phone au 06.60.49.66.57, de 8h √† 19h, du lundi au vendredi.</p>
<p>Le responsable du traitement des donn√©es est charg√© de d√©terminer les finalit√©s et les moyens mis au service du traitement des donn√©es √† caract√®re personnel. <br /><br /></p>
<p style="padding-left: 30px;"><strong>B. OBLIGATIONS DU RESPONSABLE DU TRAITEMENT DES DONN√ČES</strong></p>
<p>Le responsable du traitement s'engage √† prot√©ger les donn√©es √† caract√®re personnel collect√©es, √† ne pas les transmettre √† des tiers sans que l'utilisateur n'en ait √©t√© inform√© et √† respecter les finalit√©s pour lesquelles ces donn√©es ont √©t√© collect√©es.</p>
<p>De plus, le responsable du traitement des donn√©es s'engage √† notifier l'utilisateur en cas de rectification ou de suppression des donn√©es, √† moins que cela n'entra√ģne pour lui des formalit√©s, co√Ľts et d√©marches disproportionn√©s.</p>
<p>Dans le cas o√Ļ l'int√©grit√©, la confidentialit√© ou la s√©curit√© des donn√©es √† caract√®re personnel de l'utilisateur est compromise, le responsable du traitement s'engage √† informer l'utilisateur par tout moyen. <br /><br /></p>
<p style="padding-left: 30px;"><strong>C. LE D√ČL√ČGU√Č √Ä LA PROTECTION DES DONN√ČES</strong></p>
<p>Par ailleurs, l'utilisateur est inform√© qu'un D√©l√©gu√© √† la Protection des Donn√©es a √©t√© nomm√©&nbsp;: M. Yann SPANIER.</p>
<p>Le r√īle du D√©l√©gu√© √† la Protection des Donn√©es et de s'assurer la bonne mise en Ňďuvre des dispositions nationales et supranationales relatives √† la collecte et au traitement des donn√©es √† caract√®re personnel. Il peut √©galement √™tre nomm√© DPO (pour Data Protection Officer).</p>
<p>Le d√©l√©gu√© √† la protection des donn√©es peut √™tre joint de la mani√®re suivante&nbsp;:</p>
<p style="padding-left: 30px;">Par t√©l√©phone&nbsp;: <br />au 06.66.42.64.91, <br />du lundi au vendredi de 9h √† 17h&nbsp;; <br />Par mail&nbsp;: <a href="mailto:support@nucleus.fr">support@nucleus.fr</a>.<br /><br /></p>

<h2 id="article5">ARTICLE 5&nbsp;: DROITS DE L'UTILISATEUR<br /><br /></h2>

<p>Conform√©ment √† la r√©glementation concernant le traitement des donn√©es √† caract√®re personnel, l'utilisateur poss√®de les droits ci-apr√®s √©num√©r√©s.</p>
<p>Afin que le responsable du traitement des donn√©es fasse droit √† sa demande, l'utilisateur est tenu de lui communiquer&nbsp;: ses pr√©nom et nom ainsi que son adresse e-mail, et si cela est pertinent, son num√©ro de compte ou d'espace personnel ou d'abonn√©.</p>
<p>Le responsable du traitement des donn√©es est tenu de r√©pondre √† l'utilisateur dans un d√©lai de 30 (trente) jours maximum.<br /><br /></p>
<p style="padding-left: 30px;"><strong>A. PR√ČSENTATION DES DROITS DE L'UTILISATEUR EN MATI√ąRE DE COLLECTE ET TRAITEMENT DE DONN√ČES</strong></p>
<p><em><br />a. Droit d'acc√®s, de rectification et droit √† l'effacement</em></p>
<p>L'utilisateur peut prendre connaissance, mettre √† jour, modifier ou demander la suppression des donn√©es le concernant, en respectant la proc√©dure ci-apr√®s √©nonc√©e&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit envoyer un courrier √©lectronique au responsable du traitement des donn√©es personnelles, en pr√©cisant l'objet de sa demande, √† l'adresse √©lectronique de contact. </p>
<p>S'il en poss√®de un, l'utilisateur a le droit de demander la suppression de son espace personnel en suivant la proc√©dure suivante&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit envoyer un courrier √©lectronique au responsable du traitement en pr√©cisant son num√©ro d'espace personnel. La demande sera trait√©e dans un d√©lai de 10 jours ouvr√©s.<br /><br /></p>
<p><em>b. Droit √† la portabilit√© des donn√©es</em></p>
<p>L'utilisateur a le droit de demander la portabilit√© de ses donn√©es personnelles, d√©tenues par le site, vers un autre site, en se conformant √† la proc√©dure ci-apr√®s&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit faire une demande de portabilit√© de ses donn√©es personnelles aupr√®s du responsable du traitement des donn√©es, en envoyant un courrier √©lectronique √† l'adresse pr√©vue ci-dessus.</p>
<p><br /><em>c. Droit √† la limitation et √† l'opposition du traitement des donn√©es</em></p>
<p>L'utilisateur a le droit de demander la limitation ou de s'opposer au traitement de ses donn√©es par le site, sans que le site ne puisse refuser, sauf √† d√©montrer l'existence de motifs l√©gitimes et imp√©rieux, pouvant pr√©valoir sur les int√©r√™ts et les droits et libert√©s de l'utilisateur.</p>
<p>Afin de demander la limitation du traitement de ses donn√©es ou de formuler une opposition au traitement de ses donn√©es, l'utilisateur doit suivre la proc√©dure suivante&nbsp;:</p>
<p style="padding-left: 30px;">L'utilisateur doit faire une demande de limitation au traitement de ses donn√©es personnelles par courrier √©lectronique aupr√®s du responsable du traitement des donn√©es.<br /><br /></p>
<p><em>d. Droit de ne pas faire l'objet d'une d√©cision fond√©e exclusivement sur un proc√©d√© automatis√©</em></p>
<p>Conform√©ment aux dispositions du r√®glement 2016/679, l'utilisateur a le droit de ne pas faire l'objet d'une d√©cision fond√©e exclusivement sur un proc√©d√© automatis√© si la d√©cision produit des effets juridiques le concernant, ou l'affecte de mani√®re significative de fa√ßon similaire.</p>
<p><br /><em>e. Droit de d√©terminer le sort des donn√©es apr√®s la mort</em></p>
<p>Il est rappel√© √† l'utilisateur qu'il peut organiser quel doit √™tre le devenir de ses donn√©es collect√©es et trait√©es s'il d√©c√®de, conform√©ment √† la loi n¬į2016-1321 du 7 octobre 2016.</p>
<p><br /><em>f. Droit de saisir l'autorit√© de contr√īle comp√©tente</em></p>
<p>Dans le cas o√Ļ le responsable du traitement des donn√©es d√©cide de ne pas r√©pondre √† la demande de l'utilisateur, et que l'utilisateur souhaite contester cette d√©cision, ou, s'il pense qu'il est port√© atteinte √† l'un des droits √©num√©r√©s ci-dessus, il est en droit de saisir la CNIL (Commission Nationale de l'Informatique et des Libert√©s, https://www.cnil.fr) ou tout juge comp√©tent. <br /><br /></p>
<p style="padding-left: 30px;"><span style="font-weight: bold; font-size: 14.56px;">B. DONN√ČES PERSONNELLES DES PERSONNES MINEURES</span></p>
<p>Conform√©ment aux dispositions de l'article 8 du r√®glement europ√©en 2016/679 et √† la loi Informatique et Libert√©s, seuls les mineurs √Ęg√©s de 15 ans ou plus peuvent consentir au traitement de leurs donn√©es personnelles.</p>
<p>Si l'utilisateur est un mineur de moins de 15 ans, l'accord d'un repr√©sentant l√©gal sera requis afin que des donn√©es √† caract√®re personnel puissent √™tre collect√©es et trait√©es.</p>
<p>L'√©diteur du site se r√©serve le droit de v√©rifier par tout moyen que l'utilisateur est √Ęg√© de plus de 15 ans, ou qu'il aura obtenu l'accord d'un repr√©sentant l√©gal avant de naviguer sur le site.<br /><br /></p>

<h2 id="article6">ARTICLE 6&nbsp;: CONDITIONS DE MODIFICATION DE LA POLITIQUE DE CONFIDENTIALIT√Č<br /><br /></h2>

<p>La pr√©sente politique de confidentialit√© peut √™tre consult√©e √† tout moment √† l'adresse ci-apr√®s indiqu√©e&nbsp;:</p>
<p style="padding-left: 30px;"><a href="privacy.jsp">https://nucleus.fr/privacy.jsp</a></p>
<p>L'√©diteur du site se r√©serve le droit de la modifier afin de garantir sa conformit√© avec le droit en vigueur.</p>
<p>Par cons√©quent, l'utilisateur est invit√© √† venir consulter r√©guli√®rement cette politique de confidentialit√© afin de se tenir inform√© des derniers changements qui lui seront apport√©s.</p>
<p>Il est port√© √† la connaissance de l'utilisateur que la derni√®re mise √† jour de la pr√©sente politique de confidentialit√© est intervenue le&nbsp;: 25/05/2022.</p>
</div>

</div>
</div>

<div id="footer"></div>

</body>
</html>