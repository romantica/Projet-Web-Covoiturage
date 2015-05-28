<?php
session_start();
if(!isset($_SESSION['login'])){
    $_SESSION['login'] = 'anonyme';
}

if($_SESSION['login'] = 'anonyme'){
   header('Location: inscription.php');
}

include "bdd.php";
?>

<!DOCTYPE HTML>
<html>
<head>
	<title>Proposer un covoiturage - GoCars</title>
	<meta charset="UTF-8">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css"><!--Style global-->
	<link href="css/custom.css" rel="stylesheet" type="text/css"><!--Style contenu-->
	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> <!--Bibliothèque jQuery--> 
	
	<!--Bibliothèque nécessaire au Datepicker-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
		$(function() {
			$( "#datepicker" ).datepicker();
		});
	</script>
	<!--Fin de la bibliothèque nécessaire au Datepicker-->
	
</head>

<body>
	
	<!--Menu principal-->
	<nav class="nav_princ">
		<div class="row-fluid">
			<ul class="inline">
				<li>
					<a href="index.php">
						<img src="Media/logo.png" id="nav_logo"/>
					</a>
				</li>
				
				<li>
					<a href="#resultats" id="nav_derniers2">
						<img src="Media/horloge.png" class="nav_icon" />
						Les derniers covoiturages
					</a>
				</li>
				
				<li>
					<a href="recherche.php" id="nav_recherche2">
						<img src="Media/recherche.png" class="nav_icon" />
						Trouver un covoiturage
					</a>
				</li>
				
				<li>
					<a href="ajouter.php" id="nav_proposer2">
						<img src="Media/proposer.png" class="nav_icon" />
						Proposer un covoiturage
					</a>
				</li>
				
				<li>
					<?php
						include "boutons_compte_header.php";
					?>
						<img src="Media/compte.png" class="nav_icon" />
						Mon compte
					</a>
				</li>
				
				<?php
                    include "boutons_connexion_header.php";
                ?>
			</ul>
			
		</div>
	</nav>
	
	
	<!--Contenu de la page-->
	<div id="container">
	
		<div class="row-fluid">
			<div id="form_recherche" class="contenu form_gen span8">
				
				<h2>Proposez un covoiturage</h2>
				
				<form method="post" action="ajouter.php">
					<div class="span6">
						<label>Départ</label>
						<input type="text" class="input_recherche" name="depart" placeholder="Ville, code postal..."/>
					</div>
					
					<div class="span6">
						<label>Arrivée</label>
						<input type="text" class="input_recherche" name="arrivee" placeholder="Ville, code postal..." />
					</div>
					
					<div class="row-fluid">
						<div class="span6">
							<label>Date</label>
							<input type="text" name="date" placeholder="JJ/MM/AAAA" id="datepicker" />
						</div>
						
						<div class="span6">
							<label>Heure</label>
							<select name="heure">
								<option>4h</option>
								<option>4h30</option>
								<option>5h</option>
								<option>5h30</option>
								<option>6h</option>
								<option>6h30</option>
								<option>7h</option>
								<option>7h30</option>
								<option>8h</option>
								<option>8h30</option>
								<option>9h</option>
								<option>9h30</option>
								<option>10h</option>
								<option>10h30</option>
								<option>11h</option>
								<option>11h30</option>
								<option>12h</option>
								<option>12h30</option>
								<option>13h</option>
								<option>13h30</option>
								<option>14h</option>
								<option>14h30</option>
								<option>15h</option>
								<option>15h30</option>
								<option>16h</option>
								<option>16h30</option>
								<option>17h</option>
								<option>17h30</option>
								<option>18h</option>
								<option>18h30</option>
								<option>19h</option>
								<option>19h30</option>
								<option>20h</option>
								<option>20h30</option>
								<option>21h</option>
								<option>21h30</option>
								<option>22h</option>
								<option>22h30</option>
								<option>23h</option>
								<option>23h30</option>
								<option>00h</option>
							</select>
						</div>
					</div>
					
					<hr/>
					
					<div class="row-fluid">
						<div class="span4">
							<label>Modèle de voiture</label>
							<input type="text" class="input_recherche" name="voiture" />
						</div>
					
						<div class="span4">
							<label>Nombre de places disponibles</label>
							<select name="nombre_places">
								<option> </option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
							</select>
						</div>
			
					</div>
					
					<hr/>
					
					<label>Options</label>
					<div class="icones_options">
						<input type="checkbox" name="fumeur" value="1"><img src="Media/nosmoking.png" class="options" />
						<span>Non fumeur</span>
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="animaux" value="1"><img src="Media/animaux.png" class="options" />
						<span>Animaux autorisés</span>
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="hommes" value="1"><img src="Media/hommes.png" class="options" />
						<span>Hommes seulement</span>
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="femmes" value="1"><img src="Media/femmes.png" class="options" /><span>Femmes seulement</span>
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="handicap" value="1"><img src="Media/handicap.png" class="options"/>
						<span>Handicapés pris en charge</span>
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="bagage" value="0"><img src="Media/s_baggage.png" class="options"/>
						<span>Petits baggages</span> 
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="bagage" value="1"><img src="Media/m_baggage.png" class="options" />
						<span>Moyens baggages</span> 
					</div>
						
					<div class="icones_options">
						<input type="checkbox" name="bagage" value="2"><img src="Media/l_baggage.png" class="options" />
						<span>Grands baggages</span>
					</div>
					
					<input type="submit" value="Valider" class="button_search" />
				</form>
				
			</div>
			
			
			<div id="proposition" class="span4 contenu">
			
				<h2>Consultez</h2>
				
				<p>également la liste des derniers covoiturages les plus récents mis en ligne par les internautes du site.</p>
				<p><a href="#resultats">Les derniers covoiturages</a></p>
			</div>
			
			</div>
			
		</div>
		
	</div>
	
	
	<!--Footer copyright-->
	<footer>
		<p><img src="Media/upssitech.png" id="logo_upssitech"/>Copyright © 2015 Damien FLAHOU, Mai HOANG, Paul SFEIR</p>
	</footer>

</body>

</html>

<?php
    if(isset($_POST['depart']) && isset($_POST['arrivee']) && isset($_POST['date']) && isset($_POST['heure']) && isset($_POST['nombre_places'])){
        $login = $_POST['depart'];
        $pass = $_POST['arrivee'];
        $login = $_POST['date'];
        $pass = $_POST['heure'];
        $login = $_POST['nombre_places'];
        $pass = $_POST['fumeur'];
        $login = $_POST['animaux'];
        $pass = $_POST['homme'];
        $login = $_POST['femme'];
        $pass = $_POST['handicap'];
        $login = $_POST['bagage'];
        
        $query = "INSERT INTO TRAJETS (";
		

        $result = mysqli_query($conn, $query);
        
        $tabInfoUtilisateur = mysqli_fetch_assoc($result);
         
        if($tabInfoUtilisateur != NULL){
			$_SESSION['id_utilisateurs'] = $tabInfoUtilisateur['id_utilisteurs'];
            $_SESSION['login'] = $tabInfoUtilisateur['email'];
            $_SESSION['photo'] = $tabInfoUtilisateur['photo'];
            $_SESSION['prenom'] = $tabInfoUtilisateur['prenom'];
            $_SESSION['nom'] = $tabInfoUtilisateur['nom'];
			
        }
     
    }

?>