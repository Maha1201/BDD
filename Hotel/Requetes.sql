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

10 :
SELECT cli_nom AS NomClient, hot_nom AS NomHotel, res_date AS DateReservation
FROM client
FULL JOIN hotel
INNER JOIN reservation ON res_cha_id = cli_id;

11 :
SELECT sta_nom AS NomStation, hot_nom AS NomHotel, cha_numero AS NumChambre, cha_capacite AS Capacite
FROM chambre
INNER JOIN hotel ON hot_id = cha_hot_id
INNER JOIN station ON sta_id = hot_sta_id

12 :
SELECT cli_nom AS NomClient, hot_nom AS NomHotel, res_date_debut AS DateDebut, DATEDIFF(res_date_fin, res_date_debut) AS Durée
FROM client
FULL JOIN hotel
INNER JOIN reservation ON res_cli_id = cli_id;

13 :
SELECT COUNT(hot_id) AS NbHotel, sta_nom AS NomStation
FROM hotel
INNER JOIN station ON sta_id = hot_sta_id
GROUP BY sta_nom

14 :
SELECT COUNT(cha_id) AS NbChambre, sta_id AS IDStation
FROM chambre
INNER JOIN hotel ON hot_id = cha_hot_id
INNER JOIN station ON sta_id = hot_sta_id
GROUP BY sta_nom

15 :
SELECT COUNT(cha_id) AS NbChambre, sta_nom AS NomStation
FROM chambre
INNER JOIN hotel ON hot_id = cha_hot_id
INNER JOIN station ON sta_id = hot_sta_id
WHERE cha_capacite > 1
GROUP BY sta_nom

16 :
SELECT hot_nom AS NomHotel, cli_nom AS NomClient, res_id AS IDReservation
FROM client
INNER JOIN reservation ON res_cli_id = cli_id
INNER JOIN chambre ON res_cha_id = cha_id
INNER JOIN hotel ON cha_hot_id = hot_id
WHERE cli_nom = 'Squire'

17 : //////////////// Affiche que 2 stations ? la 3e na jamais été réservée ???
SELECT AVG(DATEDIFF(res_date_fin, res_date_debut)) AS DuréeMoyenne, sta_nom AS NomStation
FROM reservation
INNER JOIN chambre ON res_cha_id = cha_id
INNER JOIN hotel ON cha_hot_id = hot_id
INNER JOIN station ON hot_sta_id = sta_id
GROUP BY sta_nom