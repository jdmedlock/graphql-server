--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-11-21 19:07:53 CST

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
-- TOC entry 3181 (class 1262 OID 16826)
-- Name: gqlserver-prod; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "gqlserver-prod" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE "gqlserver-prod" OWNER TO postgres;

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16830)
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO gqlserver;

--
-- TOC entry 202 (class 1259 OID 16828)
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO gqlserver;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 202
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- TOC entry 205 (class 1259 OID 16838)
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO gqlserver;

--
-- TOC entry 204 (class 1259 OID 16836)
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO gqlserver;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 204
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- TOC entry 209 (class 1259 OID 16856)
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


ALTER TABLE public.pets OWNER TO gqlserver;

--
-- TOC entry 208 (class 1259 OID 16854)
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pets_id_seq OWNER TO gqlserver;

--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 208
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- TOC entry 207 (class 1259 OID 16846)
-- Name: users; Type: TABLE; Schema: public; Owner: gqlserver
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying(36),
    country_code character varying(5),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO gqlserver;

--
-- TOC entry 206 (class 1259 OID 16844)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gqlserver
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gqlserver;

--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gqlserver
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3025 (class 2604 OID 16833)
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 16841)
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 16859)
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 16849)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3169 (class 0 OID 16830)
-- Dependencies: 203
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.knex_migrations VALUES (1, '20200522223609_initial.ts', 1, '2020-11-21 17:59:01.669-06');
INSERT INTO public.knex_migrations VALUES (2, '20201119180802_initial.ts', 1, '2020-11-21 17:59:01.682-06');
INSERT INTO public.knex_migrations VALUES (3, '20201119184202_initial.ts', 1, '2020-11-21 17:59:01.684-06');
INSERT INTO public.knex_migrations VALUES (4, '20201120111945_initial.ts', 1, '2020-11-21 17:59:01.687-06');
INSERT INTO public.knex_migrations VALUES (5, '20201120114910_initial.ts', 1, '2020-11-21 17:59:01.689-06');
INSERT INTO public.knex_migrations VALUES (6, '20201120143701_initial.ts', 1, '2020-11-21 17:59:01.692-06');
INSERT INTO public.knex_migrations VALUES (7, '20201121172702_initial.ts', 1, '2020-11-21 17:59:01.693-06');


--
-- TOC entry 3171 (class 0 OID 16838)
-- Dependencies: 205
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.knex_migrations_lock VALUES (1, 0);


--
-- TOC entry 3175 (class 0 OID 16856)
-- Dependencies: 209
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.pets VALUES (1, 'spot', 1, 'MAMMALS', '2020-11-21 18:02:48.15708-06', '2020-11-21 18:02:48.15708-06');
INSERT INTO public.pets VALUES (2, 'chief', 2, 'MAMMALS', '2020-11-21 18:02:48.15708-06', '2020-11-21 18:02:48.15708-06');
INSERT INTO public.pets VALUES (3, 'king', 3, 'MAMMALS', '2020-11-21 18:02:48.15708-06', '2020-11-21 18:02:48.15708-06');


--
-- TOC entry 3173 (class 0 OID 16846)
-- Dependencies: 207
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gqlserver
--

INSERT INTO public.users VALUES (1, 'luis', '58', '2020-11-21 18:02:48.146532-06', '2020-11-21 18:02:48.146532-06');
INSERT INTO public.users VALUES (2, 'jose', '59', '2020-11-21 18:02:48.146532-06', '2020-11-21 18:02:48.146532-06');
INSERT INTO public.users VALUES (3, 'raul', '39', '2020-11-21 18:02:48.146532-06', '2020-11-21 18:02:48.146532-06');


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 202
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.pets_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gqlserver
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3036 (class 2606 OID 16843)
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- TOC entry 3034 (class 2606 OID 16835)
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 16866)
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 16853)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 16867)
-- Name: pets pets_owner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gqlserver
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owner_id_foreign FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 3181
-- Name: DATABASE "gqlserver-prod"; Type: ACL; Schema: -; Owner: postgres
--

GRANT TEMPORARY ON DATABASE "gqlserver-prod" TO gqlserver;


-- Completed on 2020-11-21 19:07:54 CST

--
-- PostgreSQL database dump complete
--

