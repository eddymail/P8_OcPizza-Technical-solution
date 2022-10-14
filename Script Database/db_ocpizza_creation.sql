-- Création des tables et des clées primaires

/*
 UTILISATEUR
*/

CREATE TABLE public.civilite(
    id INTEGER NOT NULL,
    nom VARCHAR(100) NOT NULL,
    CONSTRAINT civilite_pkey PRIMARY KEY (id)
);

CREATE TABLE public.client(
    utilisateur_id INTEGER NOT NULL,
    email VARCHAR(253) NOT NULL,
    CONSTRAINT client_pkey PRIMARY KEY (utilisateur_id)
);

CREATE TABLE public.employe(
    utilisateur_id INTEGER NOT NULL,
    poste VARCHAR(100) NOT NULL,
    CONSTRAINT employe_pkey PRIMARY KEY (utilisateur_id)
);

CREATE SEQUENCE public.utilisateur_id_seq;

CREATE TABLE public.utilisateur(
    id INTEGER NOT NULL DEFAULT nextval('public.utilisateur_id_seq'),
    civilite_id INTEGER NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    adresse_id INTEGER NOT NULL,
    identifiant VARCHAR(20) NOT NULL,
    mot_de_passe VARCHAR(20) NOT NULL,
    tel VARCHAR(10) NOT NULL,
    CONSTRAINT utilisateur_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;

/*
 ADRESSE
*/

CREATE SEQUENCE public.adresse_id_seq;

CREATE TABLE public.adresse(
    id INTEGER NOT NULL DEFAULT nextval('public.adresse_id_seq'),
    numero VARCHAR(5),
    voie VARCHAR(50) NOT NULL,
    complement_instruction VARCHAR(50),
    complement_localisation VARCHAR(50),
    code_postal VARCHAR(5) NOT NULL,
    localite VARCHAR(50)NOT NULL,
    CONSTRAINT adresse_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.id;

CREATE SEQUENCE public.point_de_vente_id_seq;

CREATE TABLE public.point_de_vente(
    id INTEGER NOT NULL DEFAULT nextval('public.point_de_vente_id_seq'),
    adresse_id INTEGER NOT NULL,
    CONSTRAINT point_de_vente_pkey PRIMARY KEY (id)
    );	

ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.point_de_vente.id;

/*
 PRODUIT
*/

CREATE SEQUENCE public.stock_id_seq;

CREATE TABLE public.stock(
    id INTEGER NOT NULL DEFAULT nextval('public.stock_id_seq'),
    produit_id INTEGER NOT NULL,
    point_de_vente_id INTEGER NOT NULL,
    unite VARCHAR(3) NOT NULL,
    quantite DECIMAL(5,2) NOT NULL,
    CONSTRAINT stock_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;

CREATE SEQUENCE public.produit_id_seq;

CREATE TABLE public.produit(
    id INTEGER NOT NULL DEFAULT nextval('public.produit_id_seq'),
    nom VARCHAR(50) NOT NULL,
	recette_id INTEGER,
    categorie_id INTEGER NOT NULL,
    prix_unitaire_ht DECIMAL(5,2) NOT NULL,
    CONSTRAINT produit_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.produit_id_seq OWNED BY public.produit.id;

CREATE SEQUENCE public.categorie_id_seq;

CREATE TABLE public.categorie(
    id INTEGER NOT NULL DEFAULT nextval ('public.categorie_id_seq'),
    nom VARCHAR(100) NOT NULL,
    CONSTRAINT categorie_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;

CREATE SEQUENCE public.recette_id_seq;

CREATE TABLE public.recette(
    id INTEGER NOT NULL DEFAULT nextval ('public.recette_id_seq'),
    nom VARCHAR (100) NOT NULL,
    instruction VARCHAR (1000) NOT NULL,
    CONSTRAINT recette_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.recette_id_seq OWNED BY public.recette.id;

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.ingredient(
    id INTEGER NOT NULL DEFAULT nextval ('public.ingredient_id_seq'),
	nom VARCHAR (100) NOT NULL,
    CONSTRAINT ingredient_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;

CREATE SEQUENCE public.ingredient_en_produit_id_seq;

CREATE TABLE public.ingredient_en_produit(
	id INTEGER NOT NULL DEFAULT nextval ('public.ingredient_en_produit_id_seq'),
	produit_id INTEGER NOT NULL,
	ingredient_id INTEGER NOT NULL,
	unite VARCHAR(3) NOT NULL,
    quantite DECIMAL(5,2) NOT NULL,
	CONSTRAINT ingredient_en_produit_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.ingredient_en_produit_id_seq OWNED BY public.ingredient_en_produit.id;

/*
 COMMANDE
*/

CREATE SEQUENCE public.commande_id_seq;

CREATE TABLE public.commande(
    id INTEGER NOT NULL DEFAULT nextval('public.commande_id_seq'),
    client_id INTEGER NOT NULL,
    adresse_id INTEGER NOT NULL,
    date_creation TIMESTAMP NOT NULL,
    montant_ht DECIMAL(5,2) NOT NULL,
    montant_ttc DECIMAL(5,2) NOT NULL,
    paiement_ok BOOLEAN NOT NULL,
	statut_id INTEGER NOT NULL,
    livraison BOOLEAN NOT NULL,
    CONSTRAINT commande_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;

CREATE SEQUENCE public.produit_en_commande_id_seq;

CREATE TABLE public.produit_en_commande(
	id INTEGER NOT NULL DEFAULT nextval('public.produit_en_commande_id_seq'),
	produit_id INTEGER NOT NULL,
	commande_id INTEGER NOT NULL,
	quantite DECIMAL(5,2) NOT NULL,
	CONSTRAINT produit_en_commande_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.produit_en_commande_id_seq OWNED BY public.produit_en_commande.id;

CREATE TABLE public.statut(
    id INTEGER NOT NULL,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT statut_pkey PRIMARY KEY (id)
);

/*
 PAIEMENT
*/

CREATE SEQUENCE public.paiement_id_seq;

CREATE TABLE public.paiement(
    id INTEGER NOT NULL DEFAULT nextval ('public.paiement_id_seq'),
	commande_id INTEGER NOT NULL,
    date_creation TIMESTAMP NOT NULL,
    montant DECIMAL(5,2) NOT NULL,
    moyen_paiement_id INTEGER NOT NULL,
    CONSTRAINT paiement_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE public.paiement_id_seq OWNED BY public.paiement.id;

CREATE TABLE public.moyen_paiement(
    id INTEGER NOT NULL,
    nom VARCHAR(100) NOT NULL,
    CONSTRAINT moyen_paiement_pkey PRIMARY KEY (id)
);

-- Clée étrangères

ALTER TABLE public.client ADD CONSTRAINT utilisateur_client_fkey
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.employe ADD CONSTRAINT utilisateur_employe_fkey
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;		

ALTER TABLE public.utilisateur ADD CONSTRAINT civilite_utilisateur_fkey
FOREIGN KEY (civilite_id)
REFERENCES public.civilite (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.point_de_vente ADD CONSTRAINT adresse_point_de_vente_fkey 
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;		

ALTER TABLE public.stock ADD CONSTRAINT produit_stock_fkey
FOREIGN KEY (produit_id)
REFERENCES public.produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.stock ADD CONSTRAINT point_de_vente_stock_fkey
FOREIGN KEY (point_de_vente_id)
REFERENCES public.point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.produit ADD CONSTRAINT categorie_produit_fkey
FOREIGN KEY (categorie_id)
REFERENCES public.categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.produit ADD CONSTRAINT recette_produit_fkey
FOREIGN KEY (recette_id)
REFERENCES public.recette (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredient_en_produit ADD CONSTRAINT produit_ingredient_en_produit_fkey
FOREIGN KEY (produit_id)
REFERENCES public.produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredient_en_produit ADD CONSTRAINT ingredient_ingredient_en_produit_fkey
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fkey
FOREIGN KEY (client_id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT adresse_commande_fkey
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT statut_commande_fkey
FOREIGN KEY (statut_id)
REFERENCES public.statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produit_en_commande ADD CONSTRAINT commande_produit_en_commande_fkey
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.produit_en_commande ADD CONSTRAINT produit_produit_en_commande_fkey
FOREIGN KEY (produit_id)
REFERENCES public.produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;	

ALTER TABLE public.paiement ADD CONSTRAINT moyen_paiement_fkey
FOREIGN KEY (moyen_paiement_id)
REFERENCES public.moyen_paiement (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.paiement ADD CONSTRAINT commande_paiement_fkey
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


-- création des index

CREATE INDEX produit_nom_idx ON produit (nom);

CREATE INDEX recette_nom_idx ON recette (nom);

CREATE INDEX ingredient_nom_idx ON ingredient (nom);

CREATE INDEX utilisateur_nom_idx ON utilisateur (nom);

CREATE INDEX commande_date_idx ON commande (date_creation);

CREATE INDEX paiement_date_idx ON paiement (date_creation);
