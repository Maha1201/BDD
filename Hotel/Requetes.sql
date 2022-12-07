1 : 
SELECT hot_nom AS Nom, hot_ville AS Ville 
FROM hotel

2 : 
SELECT cli_nom AS Nom, cli_prenom AS Prenom, cli_ville AS Ville
FROM client 
WHERE cli_nom = 'White';

3 :
SELECT sta_nom AS NomStation, sta_altitude AS Altitude
FROM station
WHERE sta_altitude > 1000;

4 :
SELECT cha_numero AS Numero, cha_capacite AS Capacite
FROM chambre
WHERE cha_capacite > 1;

5 :
SELECT cli_nom AS Nom, cli_ville AS Ville
FROM client
WHERE cli_ville != 'Londres';

6 :
SELECT hot_nom AS Nom, hot_ville AS Ville, hot_categorie AS Categorie
FROM hotel
WHERE hot_ville = 'Bretou' AND hot_categorie > 3;

7 :
SELECT hot_nom AS NomHotel, hot_categorie AS Categorie, hot_ville AS Ville, sta_nom AS NomStation
FROM hotel 
INNER JOIN station ON hot_sta_id = sta_id;

8 :
SELECT hot_nom AS NomHotel, hot_categorie AS Categorie, hot_ville AS Ville, cha_numero AS NumChambre
FROM hotel
INNER JOIN chambre ON cha_hot_id = hot_id;

9 :
SELECT hot_nom AS NomHotel, hot_categorie AS Categorie, hot_ville AS Ville, cha_numero AS NumChambre, cha_capacite AS Capacite
FROM hotel
INNER JOIN chambre ON cha_hot_id = hot_id
WHERE hot_ville = 'Bretou' AND cha_capacite > 1;

10 : !! Pas bon !!
SELECT cli_nom AS NomClient, hot_nom AS NomHotel, res_date AS DateReservation
FROM client
INNER JOIN reservation ON res_cha_id = cli_id
INNER JOIN chambre ON res_cha_id = cha_id
INNER JOIN hotel ON cha_hot_id = hot_id;