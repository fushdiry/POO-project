

	 CREATE TABLE article(
		id_article Int IDENTITY(1,1),
        reference_article         Char (128),
        nature           Char (128)  ,
        nom               Char (128)  ,
        prix_article_HT            Int ,
        quantite          Int,
        reaprovisionnement Int ,
        taux_TVA                   Int 
	,CONSTRAINT article_PK PRIMARY KEY (id_article)
)

CREATE TABLE adresse(
        id_adresse    Int  IDENTITY (1,1) ,
        numero  Int ,
        voie  Char (128)  ,
        ville Char (128)  ,
        code_postal  Int  ,
        extra Char (128) 
	,CONSTRAINT adresse_PK PRIMARY KEY (id_adresse)
)

CREATE TABLE utilisateur(
        id_utilisateur     Int  IDENTITY (1,1) ,
        nom    Char (128)  ,
        prenom Char (128)  ,
        courriel  Char (128)  ,
        date_1er_achat     Date NOT NULL
	,CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
)



CREATE TABLE remise(
        id_remise                  Int  IDENTITY (1,1) ,
        remise_anniverssaire       Int  ,
        remise_anniv_1ere_commande Int ,
        remise_prix_unitaire_15_30 Int ,
        remise_prix_unitaire_31_50 Int ,
        remise_unitaire_1          Int  ,
        remise_unitaire_2          Int ,
        remise_unitaire_3          Int 
	,CONSTRAINT remise_PK PRIMARY KEY (id_remise)
)

CREATE TABLE personnel(
        id_utilisateur     Int IDENTITY (1,1),
	superieur_hierarchique char (128),
        date_embauche      Date ,
        nom    Char (128)  ,
        prenom Char (128)  ,
        courriel  Char (128)  ,
        date_1er_achat     Date 
	,CONSTRAINT personnel_PK PRIMARY KEY (id_utilisateur)
)

CREATE TABLE client(
        id_utilisateur        Int  IDENTITY (1,1),
        date_naissance Date  ,
        nom      Char (128)  ,
        prenom   Char (128) ,
        courriel    Char (128)  ,
        date_1er_achat        Date 
	,CONSTRAINT client_PK PRIMARY KEY (id_utilisateur)
)

CREATE TABLE facturation(
        id_utilisateur Int FOREIGN KEY REFERENCES utilisateur(id_utilisateur),
        id_adresse     Int  FOREIGN KEY REFERENCES adresse(id_adresse)
)

CREATE TABLE habiter(
        id_utilisateur Int  FOREIGN KEY REFERENCES utilisateur(id_utilisateur),
        id_adresse     Int  FOREIGN KEY REFERENCES adresse(id_adresse)
)

CREATE TABLE modification_prix(
        id_article		Int FOREIGN KEY REFERENCES article(id_article),
        id_remise         Int  FOREIGN KEY REFERENCES remise(id_remise)
)

CREATE TABLE commande(
	id_commande Int IDENTITY (1,1),
        reference_commande   Char (128) ,
        date_emission        Date  ,
        date_livraison       Date  ,
        total_article Int  ,
        montant_HT           Int  ,
        montant_TVA          Int  ,
        montant_TTC          Int ,
        reduction_prix       Int ,
        id_utilisateur       Int ,
        id_paiement          Int 
	,CONSTRAINT Commande_PK PRIMARY KEY (id_commande)
)

CREATE TABLE paiement(
        id_paiement             Int  IDENTITY (1,1) ,
        date_paiement           Date  ,
        moyen_paiement          Char (128)  ,
        date_reception_paiement Date  ,
        id_commande      Int 
	,CONSTRAINT paiement_PK PRIMARY KEY (id_paiement)
    )

CREATE TABLE réduction(
	id_commande Int FOREIGN KEY REFERENCES commande(id_commande)  ,
     id_remise         Int FOREIGN KEY REFERENCES remise(id_remise)
	
)

CREATE TABLE gerer(
	 id_commande Int FOREIGN KEY REFERENCES commande(id_commande)  ,
     id_article Int FOREIGN KEY REFERENCES article(id_article),
	 quantitee int
     ,CONSTRAINT gerer_PK PRIMARY KEY (id_commande,id_article)
)

