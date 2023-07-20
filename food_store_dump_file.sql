--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    item_name character varying(255) NOT NULL,
    department_id integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_item_id_seq OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_item_id_seq OWNED BY public.items.item_id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    purchase_id integer NOT NULL,
    trip_id integer,
    item_id integer,
    amount integer NOT NULL
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: purchases_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchases_purchase_id_seq OWNER TO postgres;

--
-- Name: purchases_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_purchase_id_seq OWNED BY public.purchases.purchase_id;


--
-- Name: shoppers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shoppers (
    shopper_id integer NOT NULL,
    shopper_name character varying(255) NOT NULL,
    payment_method character varying(20) NOT NULL
);


ALTER TABLE public.shoppers OWNER TO postgres;

--
-- Name: shoppers_shopper_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shoppers_shopper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shoppers_shopper_id_seq OWNER TO postgres;

--
-- Name: shoppers_shopper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shoppers_shopper_id_seq OWNED BY public.shoppers.shopper_id;


--
-- Name: shoppingtrips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shoppingtrips (
    trip_id integer NOT NULL,
    shopper_id integer,
    trip_date date NOT NULL,
    is_identifiable boolean NOT NULL,
    pre_order boolean NOT NULL
);


ALTER TABLE public.shoppingtrips OWNER TO postgres;

--
-- Name: shoppingtrips_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shoppingtrips_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shoppingtrips_trip_id_seq OWNER TO postgres;

--
-- Name: shoppingtrips_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shoppingtrips_trip_id_seq OWNED BY public.shoppingtrips.trip_id;


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN item_id SET DEFAULT nextval('public.items_item_id_seq'::regclass);


--
-- Name: purchases purchase_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN purchase_id SET DEFAULT nextval('public.purchases_purchase_id_seq'::regclass);


--
-- Name: shoppers shopper_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shoppers ALTER COLUMN shopper_id SET DEFAULT nextval('public.shoppers_shopper_id_seq'::regclass);


--
-- Name: shoppingtrips trip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shoppingtrips ALTER COLUMN trip_id SET DEFAULT nextval('public.shoppingtrips_trip_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	household
2	personal goods
3	dried goods
4	fresh vegetables
5	supplements
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (item_id, item_name, department_id) FROM stdin;
1	item1	1
2	item2	2
3	item3	3
4	item4	4
5	item5	5
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (purchase_id, trip_id, item_id, amount) FROM stdin;
1	1	3	2
2	1	4	1
3	2	3	1
4	2	4	2
5	3	3	1
6	3	5	1
\.


--
-- Data for Name: shoppers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shoppers (shopper_id, shopper_name, payment_method) FROM stdin;
1	Chris Brown	card
2	Jonhson Trevor	cash
3	Anonymous Shopper	cash
\.


--
-- Data for Name: shoppingtrips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shoppingtrips (trip_id, shopper_id, trip_date, is_identifiable, pre_order) FROM stdin;
1	1	2023-07-19	t	t
2	2	2023-07-19	t	f
3	\N	2023-07-19	f	f
\.


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 5, true);


--
-- Name: items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_item_id_seq', 5, true);


--
-- Name: purchases_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_purchase_id_seq', 6, true);


--
-- Name: shoppers_shopper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shoppers_shopper_id_seq', 3, true);


--
-- Name: shoppingtrips_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shoppingtrips_trip_id_seq', 3, true);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (purchase_id);


--
-- Name: shoppers shoppers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shoppers
    ADD CONSTRAINT shoppers_pkey PRIMARY KEY (shopper_id);


--
-- Name: shoppingtrips shoppingtrips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shoppingtrips
    ADD CONSTRAINT shoppingtrips_pkey PRIMARY KEY (trip_id);


--
-- Name: items items_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: purchases purchases_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(item_id);


--
-- Name: purchases purchases_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.shoppingtrips(trip_id);


--
-- Name: shoppingtrips shoppingtrips_shopper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shoppingtrips
    ADD CONSTRAINT shoppingtrips_shopper_id_fkey FOREIGN KEY (shopper_id) REFERENCES public.shoppers(shopper_id);


--
-- PostgreSQL database dump complete
--

