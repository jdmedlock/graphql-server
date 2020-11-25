--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-24 20:08:38 CST

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

SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 3181 (class 1262 OID 17622)
-- Name: gqlserver-prod; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "gqlserver-prod" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect -reuse-previous=on "dbname='gqlserver-prod'"

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

SET SESSION AUTHORIZATION 'gqlserver';

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 17626)
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


--
-- TOC entry 202 (class 1259 OID 17624)
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 202
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- TOC entry 205 (class 1259 OID 17634)
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


--
-- TOC entry 204 (class 1259 OID 17632)
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 204
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- TOC entry 209 (class 1259 OID 17652)
-- Name: pets; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    name character varying(255),
    owner_id integer,
    specie character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17650)
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 208
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- TOC entry 207 (class 1259 OID 17642)
-- Name: users; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying(36),
    country_code character varying(5),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17640)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3025 (class 2604 OID 17629)
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 17637)
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 17655)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 17645)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3169 (class 0 OID 17626)
-- Dependencies: 203
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.knex_migrations VALUES (1, '20200522223609_initial.ts', 1, '2020-11-19 18:18:48.288-06');
INSERT INTO public.knex_migrations VALUES (2, '20201119180802_initial.ts', 1, '2020-11-19 18:18:48.293-06');
INSERT INTO public.knex_migrations VALUES (3, '20201119184202_initial.ts', 2, '2020-11-19 18:42:26.137-06');


--
-- TOC entry 3171 (class 0 OID 17634)
-- Dependencies: 205
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.knex_migrations_lock VALUES (1, 0);


--
-- TOC entry 3175 (class 0 OID 17652)
-- Dependencies: 209
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.pets VALUES (1, 'spot', 1, 'MAMMALS', '2020-11-20 18:42:45.030599-06', '2020-11-20 18:42:45.030599-06');
INSERT INTO public.pets VALUES (2, 'chief', 2, 'MAMMALS', '2020-11-20 18:42:45.030599-06', '2020-11-20 18:42:45.030599-06');
INSERT INTO public.pets VALUES (3, 'king', 3, 'MAMMALS', '2020-11-20 18:42:45.030599-06', '2020-11-20 18:42:45.030599-06');
INSERT INTO public.pets VALUES (4, 'wanda', 4, 'MAMMALS', '2020-11-20 18:42:45.030599-06', '2020-11-20 18:42:45.030599-06');
INSERT INTO public.pets VALUES (5, 'bicardi', 4, 'MAMMALS', '2020-11-20 18:42:45.030599-06', '2020-11-20 18:42:45.030599-06');
INSERT INTO public.pets VALUES (6, 'molly', 5, 'MAMMALS', '2020-11-20 20:59:54.244963-06', '2020-11-20 20:59:54.244963-06');


--
-- TOC entry 3173 (class 0 OID 17642)
-- Dependencies: 207
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.users VALUES (1, 'luis', '58', '2020-11-20 18:42:44.948231-06', '2020-11-20 18:42:44.948231-06');
INSERT INTO public.users VALUES (2, 'jose', '59', '2020-11-20 18:42:44.948231-06', '2020-11-20 18:42:44.948231-06');
INSERT INTO public.users VALUES (3, 'raul', '39', '2020-11-20 18:42:44.948231-06', '2020-11-20 18:42:44.948231-06');
INSERT INTO public.users VALUES (4, 'jim', '1', '2020-11-20 18:42:44.948231-06', '2020-11-20 18:42:44.948231-06');
INSERT INTO public.users VALUES (5, 'kay', '1', '2020-11-20 20:50:55.220696-06', '2020-11-20 20:50:55.220696-06');


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 202
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 3, true);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 204
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 208
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.pets_id_seq', 6, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 3036 (class 2606 OID 17639)
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- TOC entry 3034 (class 2606 OID 17631)
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 17662)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 17649)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 17663)
-- Name: pets pets_owner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owner_id_foreign FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


SET SESSION AUTHORIZATION 'postgres';

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 3181
-- Name: DATABASE "gqlserver-prod"; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE "gqlserver-prod" TO gqlserver;


-- Completed on 2020-11-24 20:08:38 CST

--
-- PostgreSQL database dump complete
--

