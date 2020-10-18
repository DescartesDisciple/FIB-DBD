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

create table pib(paisAg varchar(1) primary key, pib integer);
                                                           
create table ag(ag varchar(1) primary key, paisAg varchar(1) references pib);
                                                           
create table deute(paisD varchar(1), paisAc varchar(1), deute integer, primary key(paisD, paisAc));
                                                                                   
create table R(ag varchar(1) references ag, paisD varchar(1), paisAc varchar(1), primary key(ag, paisD, paisAc), foreign key(paisD, paisAc) references deute);                                                      
                                                           
-- -------------------------------------------------
-- PREGUNTA 4

  CREATE TABLE Esplai
(
Nom VARCHAR (1),
Adreca VARCHAR (1),
CONSTRAINT PK_Esplai PRIMARY KEY (Nom)
);
                                                                                   
CREATE TABLE Jornada
(
Data VARCHAR (1),
SortSol VARCHAR (1),
PostaSol VARCHAR (1),
CONSTRAINT PK_Jornada PRIMARY KEY (Data)
);
                                                                                   
CREATE TABLE Noi
(
Nom VARCHAR (1),
Cognom1 VARCHAR (1),
Cognom2 VARCHAR (1),
Edat VARCHAR (1),
CONSTRAINT PK_Noi PRIMARY KEY (Cognom1, Cognom2, Nom)
);
                                                                                   
CREATE TABLE Tanda
(
Nom VARCHAR (1),
Ident VARCHAR (1),
CONSTRAINT PK_Tanda PRIMARY KEY (Nom, Ident),
CONSTRAINT FK_Tanda_0 FOREIGN KEY (Nom) REFERENCES Esplai (Nom) ON DELETE CASCADE
);
                                                                                   
CREATE TABLE Membre
(
Nom VARCHAR (1),
Ident VARCHAR (1),
Cognom1 VARCHAR (1),
Cognom2 VARCHAR (1),
NomNoi VARCHAR (1),
CONSTRAINT PK_Membre PRIMARY KEY (Nom, Ident, Cognom1, Cognom2, NomNoi),
CONSTRAINT FK_Membre_0 FOREIGN KEY (Nom, Ident) REFERENCES Tanda (Nom, Ident) ON DELETE CASCADE,
CONSTRAINT FK_Membre_1 FOREIGN KEY (Cognom1, Cognom2, NomNoi) REFERENCES Noi (Cognom1, Cognom2, Nom) ON DELETE CASCADE
);
                                                                                   
CREATE TABLE Calendari
(
Nom VARCHAR (1),
Ident VARCHAR (1),
Data VARCHAR (1),
CONSTRAINT PK_Calendari PRIMARY KEY (Nom, Ident, Data),
CONSTRAINT FK_Calendari_0 FOREIGN KEY (Nom, Ident) REFERENCES Tanda (Nom, Ident) ON DELETE CASCADE,
CONSTRAINT FK_Calendari_1 FOREIGN KEY (Data) REFERENCES Jornada (Data) ON DELETE CASCADE
);
                                                                                   
CREATE TABLE Sortida
(
Data VARCHAR (1),
Nom VARCHAR (1) NOT NULL,
Ident VARCHAR (1) NOT NULL,
Cognom1 VARCHAR (1),
Cognom2 VARCHAR (1),
NomNoi VARCHAR (1),
CONSTRAINT PK_Sortida PRIMARY KEY (Data, Cognom1, Cognom2, NomNoi),
CONSTRAINT FK_Sortida_0 FOREIGN KEY (Data) REFERENCES Jornada (Data) ON DELETE CASCADE,
CONSTRAINT FK_Sortida_1 FOREIGN KEY (Nom, Ident) REFERENCES Tanda (Nom, Ident) ON DELETE CASCADE,
CONSTRAINT FK_Sortida_2 FOREIGN KEY (Cognom1, Cognom2, NomNoi) REFERENCES Noi (Cognom1, Cognom2, Nom) ON DELETE CASCADE,
CONSTRAINT SortidesSOnACalendari FOREIGN KEY (Nom, Ident, Data) REFERENCES calendari(Nom, Ident, Data),
CONSTRAINT SortidesSOnATanda FOREIGN KEY (Nom, Ident, Cognom1, Cognom2, NomNoi) REFERENCES membre(Nom, Ident, Cognom1, Cognom2,NomNoi)
);                                                                                 
