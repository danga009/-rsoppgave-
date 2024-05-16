<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sjekk pålogging</title>
</head>
<body>
<?php
        if(isset($_POST['submit'])){
            //Gjøre om POST-data til variabler
            $brukernavn = $_POST['brukernavn'];
            $passord = md5($_POST['passord']);
            
            //Koble til databasen
            $dbc = mysqli_connect('localhost', 'root', 'Admin', 'mydb')
              or die('Error connecting to MySQL server.');
            
            //Gjøre klar SQL-strengen
            $query = "SELECT username, password from users where username='$brukernavn' and password='$passord'";
            
            //Utføre spørringen
            $result = mysqli_query($dbc, $query)
              or die('Error querying database.');
            
            //Koble fra databasen
            mysqli_close($dbc);

            //Sjekke om spørringen gir resultater
            if($result->num_rows > 0){
                //Gyldig login
                header('location: index.php');
            }else{
                //Ugyldig login
                header('location: failure.html');
            }
        } else {
            echo "Du har ikke skrevet noe i form.";
        }
    ?>
</body>
</html>