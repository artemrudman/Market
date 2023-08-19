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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: branch_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch_statuses (
    id integer NOT NULL,
    branch_status character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.branch_statuses OWNER TO postgres;

--
-- Name: branch_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_statuses_id_seq OWNER TO postgres;

--
-- Name: branch_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_statuses_id_seq OWNED BY public.branch_statuses.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    branch_name character varying(50) NOT NULL,
    barcode integer NOT NULL,
    branch_location character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    timezone character varying(50) NOT NULL,
    branch_status_id integer NOT NULL,
    work_hours character varying(150) NOT NULL,
    phone_number character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO postgres;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: condition_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condition_statuses (
    id integer NOT NULL,
    condition_status_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.condition_statuses OWNER TO postgres;

--
-- Name: condition_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condition_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condition_statuses_id_seq OWNER TO postgres;

--
-- Name: condition_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condition_statuses_id_seq OWNED BY public.condition_statuses.id;


--
-- Name: deliveryman_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliveryman_statuses (
    id integer NOT NULL,
    deliveryman_status_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.deliveryman_statuses OWNER TO postgres;

--
-- Name: deliveryman_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliveryman_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliveryman_statuses_id_seq OWNER TO postgres;

--
-- Name: deliveryman_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliveryman_statuses_id_seq OWNED BY public.deliveryman_statuses.id;


--
-- Name: deliverymans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverymans (
    id integer NOT NULL,
    deliveryman_name character varying(50) NOT NULL,
    barcode integer NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    role_id integer NOT NULL,
    deliveryman_status_id integer NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    sale_promocode json NOT NULL
);


ALTER TABLE public.deliverymans OWNER TO postgres;

--
-- Name: deliverymans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliverymans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliverymans_id_seq OWNER TO postgres;

--
-- Name: deliverymans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliverymans_id_seq OWNED BY public.deliverymans.id;


--
-- Name: general_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_statuses (
    id integer NOT NULL,
    status_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.general_statuses OWNER TO postgres;

--
-- Name: general_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_statuses_id_seq OWNER TO postgres;

--
-- Name: general_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_statuses_id_seq OWNED BY public.general_statuses.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    item_name character varying(150) NOT NULL,
    item_description character varying(350) NOT NULL,
    item_ingredients character varying(350) NOT NULL,
    barcode integer NOT NULL,
    weight integer NOT NULL,
    product_type_id integer NOT NULL,
    storage_type_id integer NOT NULL,
    shelf_id_amount_json json NOT NULL,
    expires_date timestamp without time zone,
    price double precision,
    sale_price double precision,
    is_sale boolean,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_statuses (
    id integer NOT NULL,
    order_status_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.order_statuses OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_statuses_id_seq OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_statuses_id_seq OWNED BY public.order_statuses.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_number character varying(50) NOT NULL,
    item_amount_json json NOT NULL,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    order_status_id integer NOT NULL,
    user_id integer NOT NULL,
    delivery_address character varying(150) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    worker_id integer NOT NULL,
    deliveryman_id integer NOT NULL,
    start_gather_order_time timestamp without time zone,
    finish_gather_order_time timestamp without time zone,
    deliveryman_take_time timestamp without time zone,
    delivery_finish_time timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    id integer NOT NULL,
    product_type_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_types_id_seq OWNER TO postgres;

--
-- Name: product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_types_id_seq OWNED BY public.product_types.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: shelfs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelfs (
    id integer NOT NULL,
    shelf_name character varying(50) NOT NULL,
    number_of_cells integer NOT NULL,
    storage_type_id integer NOT NULL,
    status_name_id integer NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.shelfs OWNER TO postgres;

--
-- Name: shelfs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shelfs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shelfs_id_seq OWNER TO postgres;

--
-- Name: shelfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shelfs_id_seq OWNED BY public.shelfs.id;


--
-- Name: storage_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_types (
    id integer NOT NULL,
    storage_type_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.storage_types OWNER TO postgres;

--
-- Name: storage_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_types_id_seq OWNER TO postgres;

--
-- Name: storage_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_types_id_seq OWNED BY public.storage_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    general_status_id integer NOT NULL,
    password_hash character varying(250),
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    sale_promocode json NOT NULL,
    payment_info json,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: worker_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_statuses (
    id integer NOT NULL,
    worker_status_name character varying(50) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.worker_statuses OWNER TO postgres;

--
-- Name: worker_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worker_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_statuses_id_seq OWNER TO postgres;

--
-- Name: worker_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worker_statuses_id_seq OWNED BY public.worker_statuses.id;


--
-- Name: workers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    worker_name character varying(50) NOT NULL,
    barcode integer NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    role_id integer NOT NULL,
    status_id integer NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    sale_promocode json NOT NULL
);


ALTER TABLE public.workers OWNER TO postgres;

--
-- Name: workers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workers_id_seq OWNER TO postgres;

--
-- Name: workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workers_id_seq OWNED BY public.workers.id;


--
-- Name: branch_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_statuses ALTER COLUMN id SET DEFAULT nextval('public.branch_statuses_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: condition_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condition_statuses ALTER COLUMN id SET DEFAULT nextval('public.condition_statuses_id_seq'::regclass);


--
-- Name: deliveryman_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveryman_statuses ALTER COLUMN id SET DEFAULT nextval('public.deliveryman_statuses_id_seq'::regclass);


--
-- Name: deliverymans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverymans ALTER COLUMN id SET DEFAULT nextval('public.deliverymans_id_seq'::regclass);


--
-- Name: general_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_statuses ALTER COLUMN id SET DEFAULT nextval('public.general_statuses_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: order_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN id SET DEFAULT nextval('public.order_statuses_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types ALTER COLUMN id SET DEFAULT nextval('public.product_types_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: shelfs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelfs ALTER COLUMN id SET DEFAULT nextval('public.shelfs_id_seq'::regclass);


--
-- Name: storage_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_types ALTER COLUMN id SET DEFAULT nextval('public.storage_types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: worker_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_statuses ALTER COLUMN id SET DEFAULT nextval('public.worker_statuses_id_seq'::regclass);


--
-- Name: workers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workers ALTER COLUMN id SET DEFAULT nextval('public.workers_id_seq'::regclass);


--
-- Data for Name: branch_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch_statuses (id, branch_status, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	open	2023-08-12 22:37:56.988984	2023-08-12 22:37:56.988984	1	1
2	closed	2023-08-12 22:38:01.377203	2023-08-12 22:38:01.377203	1	1
3	acceptance	2023-08-12 22:38:08.453191	2023-08-12 22:38:08.453191	1	1
4	overordered	2023-08-12 22:38:13.214288	2023-08-12 22:38:13.214288	1	1
5	overordered	2023-08-17 10:10:53.99549	2023-08-17 10:10:53.99549	1	1
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branches (id, branch_name, barcode, branch_location, address, timezone, branch_status_id, work_hours, phone_number, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	Vienna Center	123456789	Vienna	Getreidemarkt 10, 1010 Wien, Austria	Vienna	1	Mon-Fri 7:00-22:00; Sat_Sun 8:00-21:00	321-654-0987	2023-08-12 22:10:07.47081	2023-08-12 22:10:07.47081	1	1
3	Vienna Center	123456789	Vienna	Getreidemarkt 10, 1010 Wien, Austria	Vienna	1	Mon-Fri 7:00-22:00; Sat_Sun 8:00-21:00	321-654-0987	2023-08-17 10:09:39.644691	2023-08-17 10:09:39.644691	1	1
\.


--
-- Data for Name: condition_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.condition_statuses (id, condition_status_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	expired	2023-08-13 12:00:40.583533	2023-08-13 12:00:40.583533	1	1
2	bad smell	2023-08-13 12:00:51.517042	2023-08-13 12:00:51.517042	1	1
3	not looks good	2023-08-13 12:01:00.526774	2023-08-13 12:01:00.526774	1	1
4	broken	2023-08-13 12:01:06.81113	2023-08-13 12:01:06.81113	1	1
5	broken	2023-08-17 10:12:28.842691	2023-08-17 10:12:28.842691	1	1
\.


--
-- Data for Name: deliveryman_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliveryman_statuses (id, deliveryman_status_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	available	2023-08-13 12:32:28.85152	2023-08-13 12:32:28.85152	1	1
2	returning	2023-08-13 12:32:36.210349	2023-08-13 12:32:36.210349	1	1
3	break	2023-08-13 12:32:41.078733	2023-08-13 12:32:41.078733	1	1
4	handling over orders	2023-08-13 12:32:46.341494	2023-08-13 12:32:46.341494	1	1
5	on the way to client	2023-08-13 12:32:53.202427	2023-08-13 12:32:53.202427	1	1
6	picking up order	2023-08-13 12:32:59.101443	2023-08-13 12:32:59.101443	1	1
7	picking up order	2023-08-17 10:13:07.906603	2023-08-17 10:13:07.906603	1	1
\.


--
-- Data for Name: deliverymans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverymans (id, deliveryman_name, barcode, created_date, updated_date, created_by_id, updated_by_id, role_id, deliveryman_status_id, email, phone_number, sale_promocode) FROM stdin;
1	Andrey Popov	1575686	2023-08-15 11:09:15.905712	2023-08-15 11:09:15.905712	2	2	5	1	AndreyPopov555@gmail.com	123-456-7890	{"code":"SALE12345","discount":20}
2	Andrey Popov	1575686	2023-08-17 10:14:07.763539	2023-08-17 10:14:07.763539	2	2	5	1	AndreyPopov555@gmail.com	123-456-7890	{"code":"SALE12345","discount":20}
3	Andrey Popov	1575686	2023-08-17 10:35:32.362454	2023-08-17 10:35:32.362454	2	2	5	1	AndreyPopov555@gmail.com	123-456-7890	{"code":"SALE12345","discount":20}
\.


--
-- Data for Name: general_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general_statuses (id, status_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	active	2023-08-12 22:24:37.49383	2023-08-12 22:24:37.49383	1	1
2	not active	2023-08-12 22:24:53.914489	2023-08-12 22:24:53.914489	1	1
3	pending	2023-08-12 22:25:07.812887	2023-08-12 22:25:07.812887	1	1
5	pending	2023-08-17 10:10:38.999765	2023-08-17 10:10:38.999765	1	1
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, item_name, item_description, item_ingredients, barcode, weight, product_type_id, storage_type_id, shelf_id_amount_json, expires_date, price, sale_price, is_sale, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	TERRA real vegetable ships Sweet Potato BBQ	*Barbecue-flavored sweet potato-based snack *Gluten-free *Preservative-free	Sweet potato (sweet potato 88%), refined rice bran oil, flavor mixture (white sugar, tomato powder, table salt, maltodextrin, onion powder, molasses, yeast extract, acidity regulator (citric acid), garlic powder, spices (black pepper ground, oregano), grape vinegar, chili (sweet paprika), flavoring agents, anti-caking agent (silicon dioxide).	1575645686	110	1	1	{"1":14,"3":20}	2023-08-10 15:30:45.123	18.9	18.9	f	2023-08-16 20:34:51.469259	2023-08-16 20:34:51.469259	1	1
3	TERRA real vegetable ships Sweet Potato BBQ	*Barbecue-flavored sweet potato-based snack *Gluten-free *Preservative-free	Sweet potato (sweet potato 88%), refined rice bran oil, flavor mixture (white sugar, tomato powder, table salt, maltodextrin, onion powder, molasses, yeast extract, acidity regulator (citric acid), garlic powder, spices (black pepper ground, oregano), grape vinegar, chili (sweet paprika), flavoring agents, anti-caking agent (silicon dioxide).	1575645686	110	1	1	{"1":14,"3":20}	2023-08-10 15:30:45.123	18.9	18.9	f	2023-08-17 10:14:18.044816	2023-08-17 10:14:18.044816	1	1
4	TERRA real vegetable ships Sweet Potato BBQ	*Barbecue-flavored sweet potato-based snack *Gluten-free *Preservative-free	Sweet potato (sweet potato 88%), refined rice bran oil, flavor mixture (white sugar, tomato powder, table salt, maltodextrin, onion powder, molasses, yeast extract, acidity regulator (citric acid), garlic powder, spices (black pepper ground, oregano), grape vinegar, chili (sweet paprika), flavoring agents, anti-caking agent (silicon dioxide).	1575645686	110	1	1	{"1":14,"3":20}	2023-08-10 15:30:45.123	18.9	18.9	f	2023-08-17 10:15:32.99915	2023-08-17 10:15:32.99915	1	1
5	TERRA real vegetable ships Sweet Potato BBQ	*Barbecue-flavored sweet potato-based snack *Gluten-free *Preservative-free	Sweet potato (sweet potato 88%), refined rice bran oil, flavor mixture (white sugar, tomato powder, table salt, maltodextrin, onion powder, molasses, yeast extract, acidity regulator (citric acid), garlic powder, spices (black pepper ground, oregano), grape vinegar, chili (sweet paprika), flavoring agents, anti-caking agent (silicon dioxide).	1575645686	110	1	1	{"1":14,"3":20}	2023-08-10 15:30:45.123	18.9	18.9	f	2023-08-17 10:16:49.19584	2023-08-17 10:16:49.19584	1	1
6	TERRA real vegetable ships Sweet Potato BBQ	*Barbecue-flavored sweet potato-based snack *Gluten-free *Preservative-free	Sweet potato (sweet potato 88%), refined rice bran oil, flavor mixture (white sugar, tomato powder, table salt, maltodextrin, onion powder, molasses, yeast extract, acidity regulator (citric acid), garlic powder, spices (black pepper ground, oregano), grape vinegar, chili (sweet paprika), flavoring agents, anti-caking agent (silicon dioxide).	1575645686	110	1	1	{"1":14,"3":20}	2023-08-10 15:30:45.123	18.9	18.9	f	2023-08-17 10:20:28.875114	2023-08-17 10:20:28.875114	1	1
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_statuses (id, order_status_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	awaiting preparation	2023-08-13 12:11:23.165715	2023-08-13 12:11:23.165715	1	1
2	preparing	2023-08-13 12:11:31.332119	2023-08-13 12:11:31.332119	1	1
3	ready for pickup	2023-08-13 12:11:39.679346	2023-08-13 12:11:39.679346	1	1
4	delivering	2023-08-13 12:11:44.023184	2023-08-13 12:11:44.023184	1	1
5	delivered	2023-08-13 12:11:51.365682	2023-08-13 12:11:51.365682	1	1
6	returned	2023-08-13 12:11:55.473145	2023-08-13 12:11:55.473145	1	1
7	partly returned	2023-08-13 12:12:00.435386	2023-08-13 12:12:00.435386	1	1
8	not active	2023-08-13 12:12:07.870898	2023-08-13 12:12:07.870898	1	1
10	not active	2023-08-17 10:12:49.043656	2023-08-17 10:12:49.043656	1	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_number, item_amount_json, created_by_id, updated_by_id, order_status_id, user_id, delivery_address, created_date, updated_date, worker_id, deliveryman_id, start_gather_order_time, finish_gather_order_time, deliveryman_take_time, delivery_finish_time) FROM stdin;
2	5469abc	{"pizza":5,"milk":2}	2	2	1	2	Getreidemarkt 10, 1010 Wien, Austria	2023-08-17 09:31:03.530397	2023-08-17 09:31:03.530397	1	2	\N	\N	\N	\N
3	5469abc	{"pizza":5,"milk":2}	2	2	1	2	Getreidemarkt 10, 1010 Wien, Austria	2023-08-17 10:13:58.672947	2023-08-17 10:13:58.672947	1	2	\N	\N	\N	\N
4	5469abc	{"pizza":5,"milk":2}	2	2	1	2	Getreidemarkt 10, 1010 Wien, Austria	2023-08-17 10:26:24.872441	2023-08-17 10:26:24.872441	1	2	\N	\N	\N	\N
5	5469abc	{"pizza":5,"milk":2}	2	2	1	2	Getreidemarkt 10, 1010 Wien, Austria	2023-08-17 10:28:10.01517	2023-08-17 10:28:10.01517	1	2	\N	\N	\N	\N
\.


--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (id, product_type_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	milk	2023-08-13 11:52:30.485597	2023-08-13 11:52:30.485597	1	1
2	alcohol	2023-08-13 11:52:37.576727	2023-08-13 11:52:37.576727	1	1
3	fruit	2023-08-13 11:52:59.360372	2023-08-13 11:52:59.360372	1	1
4	chocolate	2023-08-13 11:53:11.747598	2023-08-13 11:53:11.747598	1	1
5	drink	2023-08-13 11:53:39.626393	2023-08-13 11:53:39.626393	1	1
6	drink	2023-08-17 10:11:14.474047	2023-08-17 10:11:14.474047	1	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role_name, created_date, updated_date) FROM stdin;
1	technical director	2023-08-12 21:28:50.999136	2023-08-12 21:28:50.999136
2	executive director	2023-08-12 21:30:32.2805	2023-08-12 21:30:32.2805
3	manager	2023-08-12 21:30:44.779829	2023-08-12 21:30:44.779829
4	warehouse worker	2023-08-12 21:30:52.050574	2023-08-12 21:30:52.050574
5	deliveryman	2023-08-12 21:30:59.656287	2023-08-12 21:30:59.656287
6	technical support	2023-08-12 21:31:04.953849	2023-08-12 21:31:04.953849
7	customer support	2023-08-12 21:31:11.872993	2023-08-12 21:31:11.872993
9	customer support	2023-08-17 10:57:34.677677	2023-08-17 10:57:34.677677
\.


--
-- Data for Name: shelfs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelfs (id, shelf_name, number_of_cells, storage_type_id, status_name_id, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	A	5	1	1	2023-08-13 12:44:25.801359	2023-08-13 12:44:25.801359	1	1
2	AA	5	1	1	2023-08-13 12:44:34.087847	2023-08-13 12:44:34.087847	1	1
3	B	5	1	1	2023-08-13 12:44:56.625095	2023-08-13 12:44:56.625095	1	1
4	BB	5	1	1	2023-08-13 12:45:02.842355	2023-08-13 12:45:02.842355	1	1
5	C	7	2	1	2023-08-13 12:45:18.936829	2023-08-13 12:45:18.936829	1	1
6	CC	7	2	1	2023-08-13 12:45:25.936702	2023-08-13 12:45:25.936702	1	1
7	D	6	3	1	2023-08-13 12:45:41.457871	2023-08-13 12:45:41.457871	1	1
8	DD	6	3	1	2023-08-13 12:46:27.424244	2023-08-13 12:46:27.424244	1	1
9	DD	6	3	1	2023-08-17 10:13:46.745472	2023-08-17 10:13:46.745472	1	1
10	EE	6	3	1	2023-08-17 10:43:05.832917	2023-08-17 10:43:05.832917	1	1
\.


--
-- Data for Name: storage_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_types (id, storage_type_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	ambient shelf	2023-08-13 11:44:56.769628	2023-08-13 11:44:56.769628	1	1
2	fridge shelf	2023-08-13 11:45:12.499179	2023-08-13 11:45:12.499179	1	1
3	frozen shelf	2023-08-13 11:45:19.820718	2023-08-13 11:45:19.820718	1	1
4	frozen shelf	2023-08-17 10:11:00.890748	2023-08-17 10:11:00.890748	1	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_name, general_status_id, password_hash, email, phone_number, sale_promocode, payment_info, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	Maria Rudman	1		mariarudman@gmail.com	1575645686	{}	{}	2023-08-17 13:38:39.655554	2023-08-17 13:38:39.655554	1	1
83	Tom Rudmannn	1	$2a$10$jZIu.vmy5ij5GdkWfpV.6OvRcLsfvcoIAsRP.YDLfKrEpy7VxNqnG	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 15:09:41.443111	2023-08-17 15:09:41.443111	1	1
84	Maria Rudman	1		mariarudman@gmail.com	1575645686	{}	{}	2023-08-17 16:03:17.135618	2023-08-17 16:03:17.135618	1	1
85	Maria Rudman	1		mariarudman@gmail.com	1575645686	{}	{}	2023-08-17 16:03:26.648639	2023-08-17 16:03:26.648639	1	1
86	Arturio Rud	1	$2a$10$y5aNhMyCwiIIZv0i8NCp0O3KyJkvOoyUlMtJWyAUpZ7S8wkKnWhna	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:15:22.118591	2023-08-17 20:15:22.118591	1	1
87	Arturio Rudiger	1	$2a$10$DpgW6QsaAH9t2wDLPnoYBe4hrSy0pgwWnYu0MvGgRDama1OuwZvlm	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:25:56.992738	2023-08-17 20:25:56.992738	1	1
88	Arturio Rudiger	1	$2a$10$98NYtpdUlBpm2iFnb.emv.W7rLl70VbDwVaawiIqFJI/KErezhhjq	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:27:16.01012	2023-08-17 20:27:16.01012	1	1
89	Arturio Rudiger	1	$2a$10$5YHeElv2enijrrPfubxMuOyLqPCU36e67pMBQ2DMgWGKyWkByrdTa	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:29:24.262255	2023-08-17 20:29:24.262255	1	1
90	Arturio Rudiger	1	$2a$10$JcWbyNkNwjRA7ieHZKPms.O0fRD5tfBDPiZVQgt1uFc.Me/o9/OUi	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:31:25.347053	2023-08-17 20:31:25.347053	1	1
91	Arturio Rudiger	1	$2a$10$dbhPkXHIf0wtgL0jSAYXR.N1y3n48FG1JWTrzfGVNuoAtLNqxEfQG	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:32:55.103904	2023-08-17 20:32:55.103904	1	1
92	Arturio Rudiger	1	$2a$10$Fc4ErO31pNHHa9SdUfboeuNgkqDUYUQrmoZw7N6ESyIwcyqfLYtqm	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:34:16.599164	2023-08-17 20:34:16.599164	1	1
93	Arturio Rudigerrr	1	$2a$10$UYGDfPVToN9vdvHpT/r6MOaU8SWDf.Sg4qjMDwP1zQ97tjmzPNnLi	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:35:03.89579	2023-08-17 20:35:03.89579	1	1
94	Arturio Rudigerrr	1	$2a$10$YMe4HA48vSA2s1Ov1Wyi9ekMs6p5EvSSKDZ81Orz70TeEIkF/sPkO	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:35:46.168342	2023-08-17 20:35:46.168342	1	1
95	Arturio Rudigerrr	1	$2a$10$XsIA8m2g0GiVtanKBMx.wOgROXEH4MI5hPh6K53xrioyOKp5GDYV.	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:37:34.277081	2023-08-17 20:37:34.277081	1	1
96	Arturio Rudigerrr	1	$2a$10$jqJHjBd3xT.j5cN6L6oHduOnyRH0GhRu5eE8SFVBs6xWBU6tzAsJG	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:37:42.688298	2023-08-17 20:37:42.688298	1	1
97	Arturio Rudigerrr	1	$2a$10$TCF1Cci1gHz50sw1X.e7IOUwt5w4.E0k2Sw1.FD0k.nZxmTy/tJZu	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:38:36.204685	2023-08-17 20:38:36.204685	1	1
98	Arturio Rudigerrr	1	$2a$10$06K9g2HzmiuAp2EbFVF9O.ZxPuuidWqDang1aB1vVYzkVbaXNPwgq	tomrudmannn@gmail.com	1575645686	{}	{}	2023-08-17 20:39:04.554134	2023-08-17 20:39:04.554134	1	1
99	Winston Rudman	1	$2a$10$wdU10..OYCIv/s7.LvobMOl6hOnMbve3R1TEMDCioql/XZ2gTqwue	winstonrudman@gmail.com	1575645686	{}	{}	2023-08-17 20:43:08.522168	2023-08-17 20:43:08.522168	1	1
100	AAA	1		aaa@gmail.com	1575645686	{}	{}	2023-08-17 20:53:30.909694	2023-08-17 20:53:30.909694	1	1
101	AAA	1		aaa@gmail.com	1575645686	{}	{}	2023-08-17 20:53:58.591626	2023-08-17 20:53:58.591626	1	1
102	AAA	1		aaa@gmail.com	1575645686	{}	{}	2023-08-17 21:14:10.654064	2023-08-17 21:14:10.654064	1	1
103	AAA	1		aaa@gmail.com	1575645686	{}	{}	2023-08-17 21:14:23.476199	2023-08-17 21:14:23.476199	1	1
\.


--
-- Data for Name: worker_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worker_statuses (id, worker_status_name, created_date, updated_date, created_by_id, updated_by_id) FROM stdin;
1	available	2023-08-13 12:20:08.135736	2023-08-13 12:20:08.135736	1	1
2	not available	2023-08-13 12:20:15.608249	2023-08-13 12:20:15.608249	1	1
3	break	2023-08-13 12:20:25.220459	2023-08-13 12:20:25.220459	1	1
4	collects and prepare order	2023-08-13 12:20:33.550326	2023-08-13 12:20:33.550326	1	1
5	collects and prepare order	2023-08-17 10:13:00.634181	2023-08-17 10:13:00.634181	1	1
6	collects and prepare order	2023-08-17 10:29:47.625293	2023-08-17 10:29:47.625293	1	1
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workers (id, worker_name, barcode, created_date, updated_date, created_by_id, updated_by_id, role_id, status_id, email, phone_number, sale_promocode) FROM stdin;
1	John Smith	123456	2023-08-11 00:00:00	2023-08-11 00:00:00	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
32	John Smith	12345	2023-08-12 21:07:17.877939	2023-08-12 21:07:17.877939	1	1	2	1	john@example.com	123-456-7890	"{ code: 'SALE123', discount: 10 }"
33	John Smith	12345	2023-08-12 21:07:55.033818	2023-08-12 21:07:55.033818	1	1	2	1	john@example.com	123-456-7890	"{ code: 'SALE123', discount: 10 }"
36	John Smithhhhhhhh	12345	2023-08-16 21:37:59.345221	2023-08-16 21:37:59.345221	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
37	John Smithhhhhhhh	12345	2023-08-16 21:46:10.363785	2023-08-16 21:46:10.363785	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
38	John Smithhhhhhhh	12345	2023-08-16 21:49:46.97996	2023-08-16 21:49:46.97996	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
39	John Smithhhhhhhh	12345	2023-08-16 21:50:07.650951	2023-08-16 21:50:07.650951	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
40	John Smithhhhhhhh	12345	2023-08-16 21:50:32.388286	2023-08-16 21:50:32.388286	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
41	John Smithhhhhhhh	12345	2023-08-16 21:52:22.501934	2023-08-16 21:52:22.501934	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
42	John Smithhhhhhhh	12345	2023-08-16 21:54:17.999042	2023-08-16 21:54:17.999042	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
43	John Smithhhhhhhh	12345	2023-08-16 22:00:51.668381	2023-08-16 22:00:51.668381	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
44	John Smithhhhhhhh	12345	2023-08-16 22:04:52.176799	2023-08-16 22:04:52.176799	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
45	John Smithhhhhhhh	12345	2023-08-16 22:07:06.141661	2023-08-16 22:07:06.141661	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
46	John Smithhhhhhhh	12345	2023-08-16 22:33:46.486234	2023-08-16 22:33:46.486234	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
47	John Smithhhhhhhh	12345	2023-08-16 22:41:04.97759	2023-08-16 22:41:04.97759	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
48	John Smithhhhhhhh	12345	2023-08-16 22:42:36.256064	2023-08-16 22:42:36.256064	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
49	John Smithhhhhhhh	12345	2023-08-16 22:49:44.979193	2023-08-16 22:49:44.979193	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
50	John Smithhhhhhhh	12345	2023-08-16 22:51:14.31175	2023-08-16 22:51:14.31175	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
51	John Smithhhhhhhh	12345	2023-08-16 23:15:22.939393	2023-08-16 23:15:22.939393	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
52	John Smithhhhhhhh	12345	2023-08-16 23:19:18.408801	2023-08-16 23:19:18.408801	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
53	John Smithhhhhhhh	12345	2023-08-16 23:39:52.893575	2023-08-16 23:39:52.893575	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
54	John Smithhhhhhhh	12345	2023-08-16 23:41:17.137945	2023-08-16 23:41:17.137945	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
55	John Smithhhhhhhfffffh	12345	2023-08-17 09:32:47.877044	2023-08-17 09:32:47.877044	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
56	John Smithhhhhhhfffffh	12345	2023-08-17 09:40:48.990375	2023-08-17 09:40:48.990375	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
57	John Smithhhhhhhfffffh	12345	2023-08-17 09:45:23.828236	2023-08-17 09:45:23.828236	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
58	John Smithhhhhhhfffffh	12345	2023-08-17 09:51:40.766674	2023-08-17 09:51:40.766674	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
59	John Smithhhhhhhfffffh	12345	2023-08-17 09:52:13.414804	2023-08-17 09:52:13.414804	1	1	2	1	john@example.com	123-456-7890	{"code":"SALE123","discount":10}
\.


--
-- Name: branch_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_statuses_id_seq', 5, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branches_id_seq', 3, true);


--
-- Name: condition_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condition_statuses_id_seq', 5, true);


--
-- Name: deliveryman_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliveryman_statuses_id_seq', 7, true);


--
-- Name: deliverymans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliverymans_id_seq', 3, true);


--
-- Name: general_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.general_statuses_id_seq', 5, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 6, true);


--
-- Name: order_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_statuses_id_seq', 10, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- Name: product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_types_id_seq', 6, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 9, true);


--
-- Name: shelfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shelfs_id_seq', 10, true);


--
-- Name: storage_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_types_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 103, true);


--
-- Name: worker_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_statuses_id_seq', 6, true);


--
-- Name: workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workers_id_seq', 59, true);


--
-- Name: branch_statuses branch_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_statuses
    ADD CONSTRAINT branch_statuses_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: condition_statuses condition_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condition_statuses
    ADD CONSTRAINT condition_statuses_pkey PRIMARY KEY (id);


--
-- Name: deliveryman_statuses deliveryman_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveryman_statuses
    ADD CONSTRAINT deliveryman_statuses_pkey PRIMARY KEY (id);


--
-- Name: deliverymans deliverymans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverymans
    ADD CONSTRAINT deliverymans_pkey PRIMARY KEY (id);


--
-- Name: general_statuses general_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_statuses
    ADD CONSTRAINT general_statuses_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shelfs shelfs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelfs
    ADD CONSTRAINT shelfs_pkey PRIMARY KEY (id);


--
-- Name: storage_types storage_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_types
    ADD CONSTRAINT storage_types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: worker_statuses worker_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_statuses
    ADD CONSTRAINT worker_statuses_pkey PRIMARY KEY (id);


--
-- Name: workers workers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

