CREATE TABLE Employes (
    emp_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emp_matricule INT NOT NULL,
    emp_nom VARCHAR(50) NOT NULL,
    emp_prenom VARCHAR(50) NOT NULL,
    emp_dep CHAR(3) NOT NULL,
    emp_salaire DECIMAL(6,2)
);

INSERT INTO Employes (emp_id, emp_matricule, emp_nom, emp_prenom, emp_dep, emp_salaire)
VALUES (1, 140, 'TIFIET', 'Tarek', 30, 2100)

INSERT INTO Employes (emp_matricule, emp_nom, emp_prenom, emp_dep)
VALUES
(152, 'CONDA', 'Anna', 41)

INSERT INTO Employes
VALUES
(13, 567, 'BAMBEL', 'Lary', 43, Null)

INSERT INTO Employes (emp_matricule, emp_nom, emp_prenom, emp_dep, emp_salaire)
VALUES
(666, 'FER', 'Lucie', 42, 2130),
(42, 'MATIK', 'Otto', 50, Null)

INSERT INTO entcom (numcom, datcom, numfou)
VALUES
(70010, '2018-04-23 15:59:51', 120)