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
SELECT codart AS NumProduit, 