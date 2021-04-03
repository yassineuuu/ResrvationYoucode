<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Inscription</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/CSS/util.css">
    <link rel="stylesheet" type="text/css" href="resources/CSS/Main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url(resources/images/s1.jpg);">
        <div class="wrap-login100">
            <form action="addApprenant" method="post" class="login100-form validate-form">
					<span class="login100-form-logo">
                        <!--Image-->
					</span>

                <span class="login100-form-title p-b-34 p-t-27">
						Inscrivez-Vous
					</span>

                <div class="wrap-input100 validate-input" data-validate = "Entrer Votre Nom">
                    <input class="input100" type="text" name="nom" placeholder="Nom">
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>
                
                  <div class="wrap-input100 validate-input" data-validate = "Entrer Votre Préom">
                    <input class="input100" type="text" name="prenom" placeholder="prénom">
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>
                
                  <div class="wrap-input100 validate-input" data-validate = "Entrer Votre Email">
                    <input class="input100" type="text" name="email" placeholder="Email">
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>
                
                    <div class="wrap-input100 validate-input" data-validate = "Entrer Votre téléphone">
                    <input class="input100" type="text" name="tel" placeholder="Téléphone">
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter Mot de passe">
                    <input class="input100" type="password" name="mdp" placeholder="Mot de passe">
                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                </div>
                
                <div class="wrap-input100 validate-input" data-validate="Vérifié Le Mot de passe">
                    <input class="input100" type="password" name="Vmdp" placeholder="Vérification Mot de passe">
                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                </div>
                
                <div class="contact100-form-checkbox">
                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                    <label class="label-checkbox100" for="ckb1">
                        J'accepte les <a href="#"> Conditions d'utilisation </a><a href="#"> Politique de confidentialité </a>
                    </label>
                </div>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Inscription
                    </button>
                </div>

                <div class="text-center p-t-90">
                    <a class="txt1" href=index.jsp>
                       Sign in
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/bootstrap/js/popper.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="resources/js/main.js"></script>

</body>
</html>