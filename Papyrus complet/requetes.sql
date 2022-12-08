1 :
SELECT fournis.numfou AS NumFournisseur, COUNT(numcom) AS Commandes
FROM fournis
INNER JOIN entcom ON entcom.numfou = fournis.numfou
WHERE fournis.numfou = 9120;

2 :
SELECT fournis.numfou AS NumFournisseur, entcom.numcom AS Commandes
FROM fournis
INNER JOIN entcom ON entcom.numfou = fournis.numfou
WHERE entcom.numcom != 'NULL';

3 :
SELECT COUNT(fournis.numfou) AS Fournisseurs, COUNT(entcom.numcom) AS Commandes
FROM fournis
INNER JOIN entcom ON entcom.numfou = fournis.numfou
WHERE entcom.numcom != 'NULL';

4 :
SELECT codart AS NumProduit, libart AS Libellé, stkale AS StockActuel, stkphy AS StockPhysique, qteann AS qteAnnuelle
FROM produit
WHERE stkphy <= stkale AND qteann < 1000;

5 :
SELECT posfou AS Département, nomfou AS NomFournisseur
FROM fournis
WHERE posfou LIKE '75%' OR posfou LIKE '78%' OR posfou LIKE '92%' OR posfou LIKE '77%'
ORDER BY posfou DESC, nomfou;

6 :
SELECT numcom AS Commandes, datcom AS DateCommande
FROM entcom
WHERE datcom LIKE '____-03-__%' OR datcom LIKE '____-04-__%' ;

7 :
SELECT numcom AS Commandes, datcom AS DateCommande, obscom
FROM entcom
WHERE obscom != '';

8 :
SELECT numcom AS Commandes, (qtecde * priuni) AS Total
FROM ligcom
ORDER BY Total DESC

9 :
SELECT numcom AS Commandes, (qtecde * priuni) AS Total
FROM ligcom
WHERE qtecde < 1000 AND (qtecde * priuni) > 10000;

10 :
SELECT nomfou AS NomFournisseur, numcom AS Commandes, datcom AS DateCommande
FROM fournis
INNER JOIN entcom ON entcom.numfou = fournis.numfou

11 :
SELECT entcom.numcom AS Commandes, nomfou AS NomFournisseur, libart AS Libellé, (qtecde * priuni) AS SousTotal
FROM fournis
INNER JOIN entcom ON fournis.numfou = entcom.numfou
INNER JOIN ligcom ON entcom.numcom = ligcom.numcom
INNER JOIN produit ON produit.codart = ligcom.codart

12 :
SELECT nomfou, COUNT(DISTINCT vente.codart)
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
GROUP BY fournis.nomfou
HAVING COUNT(DISTINCT vente.codart)>1


???????????
SELECT nomfou, COUNT(DISTINCT codart)
FROM fournis
INNER JOIN vente ON fournis.numfou = vente.numfou
WHERE codart IN(
    SELECT codart
    FROM vente
    HAVING COUNT(DISTINCT codart)>1
)
GROUP BY nomfou;


13 :
SELECT numcom AS Commandes, datcom AS DateCommande
FROM entcom
WHERE numfou IN(
    SELECT numfou
    FROM entcom
    WHERE numcom = '70210'
);

SELECT a.numfou, b.*
FROM entcom AS a INNER JOIN entcom AS b ON a.numfou = b.numfou
WHERE a.numcom = '70210';

14 :
SELECT codart

Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont 
le premier caractère commence par R).

    Afficher libellé de l’article et prix1