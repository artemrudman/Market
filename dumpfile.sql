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
    barcode_hash character varying(250),
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
1	Artem Rudman	1	$2a$10$2xEYalhtLRwFcPHc7814ZeJOo7IbVRwWpv/tsJ4huSLB1FsplhiPO	artemrudman1994@gmail.com	+(972)51-585-99-41	{}	{}	2023-08-19 19:39:43.457549	2023-08-19 19:39:43.457549	1	1
2	Maria Zatsepina	1	$2a$10$GlgKWMdg1ribvAnYBeg6E.OaXVIhZ340sJHrr.IDIMT63dLFOiIQm	mariazatsepina1997@gmail.com	+(972)51-585-99-40	{}	{}	2023-08-19 20:37:17.241615	2023-08-19 20:37:17.241615	1	1
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

COPY public.workers (id, worker_name, barcode_hash, created_date, updated_date, created_by_id, updated_by_id, role_id, status_id, email, phone_number, sale_promocode) FROM stdin;
1	Artem Rudman	$2a$10$lAgpZkJTflk6bD3ms1pcbOocGYFBDozEllPzBIuMKHPV7KFDGtlFu	2023-08-19 20:20:13.114701	2023-08-19 20:20:13.114701	1	1	1	1	artemrudman1994@gmail.com	+(972)51-585-99-41	{"code":"SALE10","discount":10}
2	Dima Khamkov	$2a$10$mZ/VUzcC9mPO0FV8MeSpQO1pvU.DfAuvxMheV8x/91wkdCR/lsUcS	2023-08-19 20:21:47.984001	2023-08-19 20:21:47.984001	1	1	6	1	dimakhamkov2008@gmail.com	+(7)913-590-37-91	{"code":"SALE5","discount":5}
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

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: worker_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worker_statuses_id_seq', 6, true);


--
-- Name: workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workers_id_seq', 2, true);


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

