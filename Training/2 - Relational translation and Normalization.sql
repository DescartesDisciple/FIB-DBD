-- -------------------------------------------------
-- PREGUNTA 1

CREATE TABLE Grup (
nom varchar(1) ,
monitor varchar(1) ,
CONSTRAINT Grup_PK PRIMARY KEY (nom));
 
CREATE TABLE Noi (
Grup_nom varchar(1)  NOT NULL,
nom varchar(1) ,
edat varchar(1) ,
nomMascota varchar(1) UNIQUE,
CONSTRAINT Noi_FK_Grup FOREIGN KEY (Grup_nom) REFERENCES Grup(nom),
CONSTRAINT Noi_PK PRIMARY KEY (nom));
 
CREATE TABLE Amics (
Noi1_nom varchar(1) NOT NULL,
Noi2_nom varchar(1) NOT NULL,
CONSTRAINT Amics1_FK_Noi FOREIGN KEY (Noi1_nom) REFERENCES Noi(nom),
CONSTRAINT Amics2_FK_Noi FOREIGN KEY (Noi2_nom) REFERENCES Noi(nom),
CONSTRAINT Nois_No_Iguals CHECK (Noi1_nom <> Noi2_nom),
CONSTRAINT Amics_PK PRIMARY KEY (Noi1_nom, Noi2_nom));
 
CREATE TABLE Incompatibles (
Mascota1_nom varchar(1) NOT NULL,
Mascota2_nom varchar(1) NOT NULL,
CONSTRAINT Incompatibles1_FK_Mascota FOREIGN KEY (Mascota1_nom) REFERENCES Noi (nomMascota),
CONSTRAINT Incompatibles2_FK_Mascota FOREIGN KEY (Mascota2_nom) REFERENCES Noi (nomMascota),
CONSTRAINT Mascotes_No_Iguals CHECK (Mascota1_nom <> Mascota2_nom),
CONSTRAINT Incompatibles_PK PRIMARY KEY (Mascota1_nom, Mascota2_nom));

-- -------------------------------------------------
-- PREGUNTA 2
 
CREATE TABLE Repro (
reproduccio varchar(1),
familia varchar(1),
CONSTRAINT Repro_PK PRIMARY KEY (familia));

CREATE TABLE Peixos (
especie varchar(1),
familia varchar(1) NOT NULL,
color varchar(1) NOT NULL, 
raresa varchar(1),
CONSTRAINT Peixos_PK PRIMARY KEY (especie),
CONSTRAINT Peixos_AK1 UNIQUE (familia,color),
CONSTRAINT Repro_FK FOREIGN KEY (familia) REFERENCES Repro(familia));

-- -------------------------------------------------
-- PREGUNTA 3

-- -------------------------------------------------
-- PREGUNTA 4
