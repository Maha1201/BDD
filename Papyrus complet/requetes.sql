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
ORDER BY Total DESC;

9 :
SELECT numcom AS Commandes, (qtecde * priuni) AS Total
FROM ligcom
WHERE qtecde < 1000 AND (qtecde * priuni) > 10000;

10 :
SELECT nomfou AS NomFournisseur, numcom AS Commandes, datcom AS DateCommande
FROM fournis
INNER JOIN entcom ON entcom.numfou = fournis.numfou;

11 :
SELECT entcom.numcom AS Commandes, nomfou AS NomFournisseur, libart AS Libellé, (qtecde * priuni) AS SousTotal
FROM fournis
INNER JOIN entcom ON fournis.numfou = entcom.numfou
INNER JOIN ligcom ON entcom.numcom = ligcom.numcom
INNER JOIN produit ON produit.codart = ligcom.codart;

12 :
SELECT nomfou, COUNT(DISTINCT vente.codart)
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
GROUP BY fournis.nomfou
HAVING COUNT(DISTINCT vente.codart)>1;

SELECT f.nomfou AS 'Nom du fournisseur', l.numcom AS 'Numéro de commande', l.numlig AS 'Numéro de ligne', l.qteliv AS 'Quantité livrée'
FROM fournis f
JOIN entcom e ON f.numfou = e.numfou
JOIN ligcom l ON e.numcom = l.numcom
WHERE l.numcom IN (
    SELECT numcom
    FROM ligcom
    WHERE qteliv > 0
)
ORDER BY e.numcom ASC, l.numlig ASC;


13 :
SELECT numcom AS Commandes, datcom AS DateCommande
FROM entcom
WHERE numfou IN(
    SELECT numfou
    FROM entcom
    WHERE numcom = '70210'
);

SELECT a.numfou, b.*
FROM entcom AS a 
INNER JOIN entcom AS b ON a.numfou = b.numfou
WHERE a.numcom = '70210';

14 :
///////
SELECT codart, prix1 AS p1
FROM vente
WHERE p1 < p2 AND prix1 IN(
    SELECT prix1 AS p2
    FROM produit
    WHERE codart IN(
    	SELECT codart
        FROM produit
        WHERE codart LIKE 'r%'
    )
);

/////////
SELECT v.codart, v.prix1 AS p1, p.libart, v.prix AS p2
FROM vente AS v
INNER JOIN produit AS p
WHERE p2 = p.libart LIKE 'r%' AND p1 < p2;

SELECT min(prix1) as p2
FROM produit
INNER JOIN vente ON vente.codart = produit.codart
WHERE libart LIKE 'r%';

15 :
SELECT numfou
FROM vente
WHERE codart IN (
    SELECT codart
    FROM produit
    WHERE stkphy <= (stkale * 1.5)
);

16 :
SELECT numfou, delliv
FROM vente
WHERE codart IN (
    SELECT codart
    FROM produit
    WHERE stkphy <= (stkale * 1.5) AND delliv < 31
);

17 :
SELECT vente.numfou, produit.stkphy
FROM vente 
INNER JOIN produit ON vente.codart = produit.codart
GROUP BY vente.numfou
ORDER BY stkphy DESC;

18 :
SELECT codart, libart
FROM produit
WHERE codart IN(
    SELECT codart
    FROM ligcom
    WHERE qtecde > qteann * 0.9
)

19 :
SELECT numfou, qtecde * priuni * 0.2 AS CA
FROM ligcom
INNER JOIN entcom ON entcom.numcom = ligcom.numcom
GROUP BY numfou