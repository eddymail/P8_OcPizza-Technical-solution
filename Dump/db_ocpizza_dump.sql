--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-02-11 10:01:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 33037)
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresse (
    id integer NOT NULL,
    numero character varying(5),
    voie character varying(50) NOT NULL,
    complement_instruction character varying(50),
    complement_localisation character varying(50),
    code_postal character varying(5) NOT NULL,
    localite character varying(50) NOT NULL
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 33035)
-- Name: adresse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adresse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresse_id_seq OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 206
-- Name: adresse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.id;


--
-- TOC entry 215 (class 1259 OID 33069)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33067)
-- Name: categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorie_id_seq OWNER TO postgres;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 214
-- Name: categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;


--
-- TOC entry 201 (class 1259 OID 33012)
-- Name: civilite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.civilite (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.civilite OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 33017)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    utilisateur_id integer NOT NULL,
    email character varying(253) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33104)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id integer NOT NULL,
    client_id integer NOT NULL,
    adresse_id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    montant_ht numeric(5,2) NOT NULL,
    montant_ttc numeric(5,2) NOT NULL,
    paiement_ok boolean NOT NULL,
    statut_id integer NOT NULL,
    livraison boolean NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33102)
-- Name: commande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_id_seq OWNER TO postgres;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 222
-- Name: commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;


--
-- TOC entry 203 (class 1259 OID 33022)
-- Name: employe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employe (
    utilisateur_id integer NOT NULL,
    poste character varying(100) NOT NULL
);


ALTER TABLE public.employe OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33088)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33096)
-- Name: ingredient_en_produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient_en_produit (
    id integer NOT NULL,
    produit_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    unite character varying(3) NOT NULL,
    quantite numeric(5,2) NOT NULL
);


ALTER TABLE public.ingredient_en_produit OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33094)
-- Name: ingredient_en_produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_en_produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_en_produit_id_seq OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 220
-- Name: ingredient_en_produit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_en_produit_id_seq OWNED BY public.ingredient_en_produit.id;


--
-- TOC entry 218 (class 1259 OID 33086)
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- TOC entry 229 (class 1259 OID 33131)
-- Name: moyen_paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moyen_paiement (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.moyen_paiement OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33125)
-- Name: paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paiement (
    id integer NOT NULL,
    commande_id integer NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    montant numeric(5,2) NOT NULL,
    moyen_paiement_id integer NOT NULL
);


ALTER TABLE public.paiement OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33123)
-- Name: paiement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paiement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paiement_id_seq OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 227
-- Name: paiement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paiement_id_seq OWNED BY public.paiement.id;


--
-- TOC entry 209 (class 1259 OID 33045)
-- Name: point_de_vente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.point_de_vente (
    id integer NOT NULL,
    adresse_id integer NOT NULL
);


ALTER TABLE public.point_de_vente OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 33043)
-- Name: point_de_vente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.point_de_vente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.point_de_vente_id_seq OWNER TO postgres;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 208
-- Name: point_de_vente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.point_de_vente.id;


--
-- TOC entry 213 (class 1259 OID 33061)
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit (
    id integer NOT NULL,
    nom character varying(50) NOT NULL,
    recette_id integer,
    categorie_id integer NOT NULL,
    prix_unitaire_ht numeric(5,2) NOT NULL
);


ALTER TABLE public.produit OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33112)
-- Name: produit_en_commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit_en_commande (
    id integer NOT NULL,
    produit_id integer NOT NULL,
    commande_id integer NOT NULL,
    quantite numeric(5,2) NOT NULL
);


ALTER TABLE public.produit_en_commande OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33110)
-- Name: produit_en_commande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produit_en_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produit_en_commande_id_seq OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 224
-- Name: produit_en_commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produit_en_commande_id_seq OWNED BY public.produit_en_commande.id;


--
-- TOC entry 212 (class 1259 OID 33059)
-- Name: produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produit_id_seq OWNER TO postgres;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 212
-- Name: produit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produit_id_seq OWNED BY public.produit.id;


--
-- TOC entry 217 (class 1259 OID 33077)
-- Name: recette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recette (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    instruction character varying(1000) NOT NULL
);


ALTER TABLE public.recette OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33075)
-- Name: recette_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recette_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recette_id_seq OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 216
-- Name: recette_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recette_id_seq OWNED BY public.recette.id;


--
-- TOC entry 226 (class 1259 OID 33118)
-- Name: statut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statut (
    id integer NOT NULL,
    nom character varying(50) NOT NULL
);


ALTER TABLE public.statut OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33053)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    produit_id integer NOT NULL,
    point_de_vente_id integer NOT NULL,
    unite character varying(3) NOT NULL,
    quantite numeric(5,2) NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33051)
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_id_seq OWNER TO postgres;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 210
-- Name: stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;


--
-- TOC entry 205 (class 1259 OID 33029)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    civilite_id integer NOT NULL,
    prenom character varying(100) NOT NULL,
    nom character varying(100) NOT NULL,
    adresse_id integer NOT NULL,
    identifiant character varying(20) NOT NULL,
    mot_de_passe character varying(20) NOT NULL,
    tel character varying(10) NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33027)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 204
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- TOC entry 2939 (class 2604 OID 33040)
-- Name: adresse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse ALTER COLUMN id SET DEFAULT nextval('public.adresse_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 33072)
-- Name: categorie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 33107)
-- Name: commande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN id SET DEFAULT nextval('public.commande_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 33091)
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 33099)
-- Name: ingredient_en_produit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_en_produit ALTER COLUMN id SET DEFAULT nextval('public.ingredient_en_produit_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 33128)
-- Name: paiement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement ALTER COLUMN id SET DEFAULT nextval('public.paiement_id_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 33048)
-- Name: point_de_vente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_de_vente ALTER COLUMN id SET DEFAULT nextval('public.point_de_vente_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 33064)
-- Name: produit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit ALTER COLUMN id SET DEFAULT nextval('public.produit_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 33115)
-- Name: produit_en_commande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit_en_commande ALTER COLUMN id SET DEFAULT nextval('public.produit_en_commande_id_seq'::regclass);


--
-- TOC entry 2944 (class 2604 OID 33080)
-- Name: recette id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recette ALTER COLUMN id SET DEFAULT nextval('public.recette_id_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 33056)
-- Name: stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 33032)
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- TOC entry 3143 (class 0 OID 33037)
-- Dependencies: 207
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresse (id, numero, voie, complement_instruction, complement_localisation, code_postal, localite) FROM stdin;
1	94	Faubourg St Honoré	code portail 43B	Residence Windsor Batiment B	75020	Paris
2	123	rue de la Boétie			75013	Paris
3	96	avenue des Champs Elysées			75008	Paris
4	3	rue de Mézières			75006	Paris
5	94	rue des Pyrénnées			75020	Paris
6	102	avenue d'Italie			75013	Paris
\.


--
-- TOC entry 3151 (class 0 OID 33069)
-- Dependencies: 215
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (id, nom) FROM stdin;
1	pizza
2	boisson
3	dessert
\.


--
-- TOC entry 3137 (class 0 OID 33012)
-- Dependencies: 201
-- Data for Name: civilite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.civilite (id, nom) FROM stdin;
1	Mme
2	Mlle
3	Mr
\.


--
-- TOC entry 3138 (class 0 OID 33017)
-- Dependencies: 202
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (utilisateur_id, email) FROM stdin;
1	alain.coste@gmail.com
2	agathe.marchand@hotmail.com
\.


--
-- TOC entry 3159 (class 0 OID 33104)
-- Dependencies: 223
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id, client_id, adresse_id, date_creation, montant_ht, montant_ttc, paiement_ok, statut_id, livraison) FROM stdin;
1	2	2	2021-01-26 14:00:10	20.00	21.10	t	5	t
2	3	5	2021-01-28 19:05:00	11.00	11.61	t	5	f
\.


--
-- TOC entry 3139 (class 0 OID 33022)
-- Dependencies: 203
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employe (utilisateur_id, poste) FROM stdin;
3	pizzaiolo
\.


--
-- TOC entry 3155 (class 0 OID 33088)
-- Dependencies: 219
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient (id, nom) FROM stdin;
1	sauce tomate
2	mozarella
3	parmesan
4	basilic
5	huile d'olive
\.


--
-- TOC entry 3157 (class 0 OID 33096)
-- Dependencies: 221
-- Data for Name: ingredient_en_produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient_en_produit (id, produit_id, ingredient_id, unite, quantite) FROM stdin;
1	1	1	l	0.03
2	1	2	kg	0.13
3	1	3	kg	0.60
4	1	4	kg	0.01
5	1	5	l	0.02
\.


--
-- TOC entry 3165 (class 0 OID 33131)
-- Dependencies: 229
-- Data for Name: moyen_paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moyen_paiement (id, nom) FROM stdin;
1	carte bancaire
2	ticket restaurant
3	espèces
\.


--
-- TOC entry 3164 (class 0 OID 33125)
-- Dependencies: 228
-- Data for Name: paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paiement (id, commande_id, date_creation, montant, moyen_paiement_id) FROM stdin;
1	1	2021-01-26 14:10:26	21.10	1
2	2	2021-01-28 19:35:10	11.61	3
\.


--
-- TOC entry 3145 (class 0 OID 33045)
-- Dependencies: 209
-- Data for Name: point_de_vente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.point_de_vente (id, adresse_id) FROM stdin;
1	4
2	5
3	6
\.


--
-- TOC entry 3149 (class 0 OID 33061)
-- Dependencies: 213
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produit (id, nom, recette_id, categorie_id, prix_unitaire_ht) FROM stdin;
1	margherita	1	1	10.00
2	coca	\N	2	1.00
3	donut	\N	3	1.50
4	napolitaine	2	1	10.00
\.


--
-- TOC entry 3161 (class 0 OID 33112)
-- Dependencies: 225
-- Data for Name: produit_en_commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produit_en_commande (id, produit_id, commande_id, quantite) FROM stdin;
1	1	1	2.00
2	2	2	2.00
3	4	2	1.00
\.


--
-- TOC entry 3153 (class 0 OID 33077)
-- Dependencies: 217
-- Data for Name: recette; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recette (id, nom, instruction) FROM stdin;
1	margherita	Ingredients : \nsauce tomate, mozzarella, parmesan et basilic, huile d'olive, pâte à pizza\nInstructions :\nEtalez sur la pâte une louche de sauce tomate,\nDéposez la mozzarella coupée en fine tranches, saupoudrez de parmesan.\nBadigeonnez d’huile d’olive et enfournez.\nAprès cuisson déposer quelques feuilles de basilic
2	napolitaine	Ingredients : \nsauce tomate, mozzarella, anchois, olives noires, origan, huile d'olive, pâte à pizza\ninstructions :\nEtalez sur la pâte une louche de sauce tomate,\nDéposez la mozzarella coupée en fine tranches, les anchois et les olives et parsemez d’origan.\nBadigeonnez d’huile d’olive et enfournez.
\.


--
-- TOC entry 3162 (class 0 OID 33118)
-- Dependencies: 226
-- Data for Name: statut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statut (id, nom) FROM stdin;
1	en attente
2	en préparation
3	préparée
4	en livraison
5	clôturée
\.


--
-- TOC entry 3147 (class 0 OID 33053)
-- Dependencies: 211
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id, produit_id, point_de_vente_id, unite, quantite) FROM stdin;
1	1	1	l	15.00
2	4	1	l	50.00
3	2	2	kg	10.00
\.


--
-- TOC entry 3141 (class 0 OID 33029)
-- Dependencies: 205
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, civilite_id, prenom, nom, adresse_id, identifiant, mot_de_passe, tel) FROM stdin;
1	3	alain	coste	1	alain75	password	0913124876
2	2	agathe	marchand	2	aghathema	superagat	0795168935
3	3	eddy	biaggi	3	eddyb	eddy92	0689550516
\.


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 206
-- Name: adresse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresse_id_seq', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 214
-- Name: categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorie_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 222
-- Name: commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 220
-- Name: ingredient_en_produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_en_produit_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 227
-- Name: paiement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paiement_id_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 208
-- Name: point_de_vente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.point_de_vente_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 224
-- Name: produit_en_commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produit_en_commande_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 212
-- Name: produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produit_id_seq', 1, false);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 216
-- Name: recette_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recette_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 210
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 204
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, false);


--
-- TOC entry 2960 (class 2606 OID 33042)
-- Name: adresse adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 33074)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- TOC entry 2951 (class 2606 OID 33016)
-- Name: civilite civilite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.civilite
    ADD CONSTRAINT civilite_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 33021)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (utilisateur_id);


--
-- TOC entry 2980 (class 2606 OID 33109)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 33026)
-- Name: employe employe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (utilisateur_id);


--
-- TOC entry 2977 (class 2606 OID 33101)
-- Name: ingredient_en_produit ingredient_en_produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_en_produit
    ADD CONSTRAINT ingredient_en_produit_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 33093)
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 33135)
-- Name: moyen_paiement moyen_paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moyen_paiement
    ADD CONSTRAINT moyen_paiement_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 33130)
-- Name: paiement paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 33050)
-- Name: point_de_vente point_de_vente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT point_de_vente_pkey PRIMARY KEY (id);


--
-- TOC entry 2982 (class 2606 OID 33117)
-- Name: produit_en_commande produit_en_commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit_en_commande
    ADD CONSTRAINT produit_en_commande_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 33066)
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 33085)
-- Name: recette recette_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 33122)
-- Name: statut statut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statut
    ADD CONSTRAINT statut_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 33058)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 33034)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 2978 (class 1259 OID 33225)
-- Name: commande_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX commande_date_idx ON public.commande USING btree (date_creation);


--
-- TOC entry 2973 (class 1259 OID 33223)
-- Name: ingredient_nom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ingredient_nom_idx ON public.ingredient USING btree (nom);


--
-- TOC entry 2985 (class 1259 OID 33226)
-- Name: paiement_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX paiement_date_idx ON public.paiement USING btree (date_creation);


--
-- TOC entry 2965 (class 1259 OID 33221)
-- Name: produit_nom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX produit_nom_idx ON public.produit USING btree (nom);


--
-- TOC entry 2970 (class 1259 OID 33222)
-- Name: recette_nom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recette_nom_idx ON public.recette USING btree (nom);


--
-- TOC entry 2956 (class 1259 OID 33224)
-- Name: utilisateur_nom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilisateur_nom_idx ON public.utilisateur USING btree (nom);


--
-- TOC entry 3001 (class 2606 OID 33191)
-- Name: commande adresse_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT adresse_commande_fkey FOREIGN KEY (adresse_id) REFERENCES public.adresse(id);


--
-- TOC entry 2993 (class 2606 OID 33151)
-- Name: point_de_vente adresse_point_de_vente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT adresse_point_de_vente_fkey FOREIGN KEY (adresse_id) REFERENCES public.adresse(id);


--
-- TOC entry 2996 (class 2606 OID 33166)
-- Name: produit categorie_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT categorie_produit_fkey FOREIGN KEY (categorie_id) REFERENCES public.categorie(id);


--
-- TOC entry 2992 (class 2606 OID 33146)
-- Name: utilisateur civilite_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT civilite_utilisateur_fkey FOREIGN KEY (civilite_id) REFERENCES public.civilite(id);


--
-- TOC entry 3000 (class 2606 OID 33186)
-- Name: commande client_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fkey FOREIGN KEY (client_id) REFERENCES public.utilisateur(id);


--
-- TOC entry 3006 (class 2606 OID 33216)
-- Name: paiement commande_paiement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT commande_paiement_fkey FOREIGN KEY (commande_id) REFERENCES public.commande(id);


--
-- TOC entry 3003 (class 2606 OID 33201)
-- Name: produit_en_commande commande_produit_en_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit_en_commande
    ADD CONSTRAINT commande_produit_en_commande_fkey FOREIGN KEY (commande_id) REFERENCES public.commande(id);


--
-- TOC entry 2999 (class 2606 OID 33181)
-- Name: ingredient_en_produit ingredient_ingredient_en_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_en_produit
    ADD CONSTRAINT ingredient_ingredient_en_produit_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 3005 (class 2606 OID 33211)
-- Name: paiement moyen_paiement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT moyen_paiement_fkey FOREIGN KEY (moyen_paiement_id) REFERENCES public.moyen_paiement(id);


--
-- TOC entry 2995 (class 2606 OID 33161)
-- Name: stock point_de_vente_stock_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT point_de_vente_stock_fkey FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);


--
-- TOC entry 2998 (class 2606 OID 33176)
-- Name: ingredient_en_produit produit_ingredient_en_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_en_produit
    ADD CONSTRAINT produit_ingredient_en_produit_fkey FOREIGN KEY (produit_id) REFERENCES public.produit(id);


--
-- TOC entry 3004 (class 2606 OID 33206)
-- Name: produit_en_commande produit_produit_en_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit_en_commande
    ADD CONSTRAINT produit_produit_en_commande_fkey FOREIGN KEY (produit_id) REFERENCES public.produit(id);


--
-- TOC entry 2994 (class 2606 OID 33156)
-- Name: stock produit_stock_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT produit_stock_fkey FOREIGN KEY (produit_id) REFERENCES public.produit(id);


--
-- TOC entry 2997 (class 2606 OID 33171)
-- Name: produit recette_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT recette_produit_fkey FOREIGN KEY (recette_id) REFERENCES public.recette(id);


--
-- TOC entry 3002 (class 2606 OID 33196)
-- Name: commande statut_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT statut_commande_fkey FOREIGN KEY (statut_id) REFERENCES public.statut(id);


--
-- TOC entry 2990 (class 2606 OID 33136)
-- Name: client utilisateur_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT utilisateur_client_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


--
-- TOC entry 2991 (class 2606 OID 33141)
-- Name: employe utilisateur_employe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT utilisateur_employe_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


-- Completed on 2021-02-11 10:01:12

--
-- PostgreSQL database dump complete
--

