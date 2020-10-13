--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)
-- Dumped by pg_dump version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO urban;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO urban;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO urban;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO urban;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO urban;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO urban;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO urban;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO urban;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO urban;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO urban;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO urban;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO urban;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO urban;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO urban;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO urban;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO urban;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO urban;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO urban;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO urban;

--
-- Name: urban_backend_category; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.urban_backend_category (
    id integer NOT NULL,
    category_name character varying(222),
    is_delete boolean NOT NULL
);


ALTER TABLE public.urban_backend_category OWNER TO urban;

--
-- Name: urban_backend_category_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.urban_backend_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urban_backend_category_id_seq OWNER TO urban;

--
-- Name: urban_backend_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.urban_backend_category_id_seq OWNED BY public.urban_backend_category.id;


--
-- Name: urban_backend_fooditems; Type: TABLE; Schema: public; Owner: urban
--

CREATE TABLE public.urban_backend_fooditems (
    id integer NOT NULL,
    food_name character varying(222),
    discription character varying(222),
    price double precision,
    is_available boolean NOT NULL,
    is_delivered boolean NOT NULL,
    delivery_partener character varying(22),
    item_rating character varying(22),
    category_name_id integer,
    is_veg boolean NOT NULL
);


ALTER TABLE public.urban_backend_fooditems OWNER TO urban;

--
-- Name: urban_backend_fooditems_id_seq; Type: SEQUENCE; Schema: public; Owner: urban
--

CREATE SEQUENCE public.urban_backend_fooditems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urban_backend_fooditems_id_seq OWNER TO urban;

--
-- Name: urban_backend_fooditems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: urban
--

ALTER SEQUENCE public.urban_backend_fooditems_id_seq OWNED BY public.urban_backend_fooditems.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: urban_backend_category id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_category ALTER COLUMN id SET DEFAULT nextval('public.urban_backend_category_id_seq'::regclass);


--
-- Name: urban_backend_fooditems id; Type: DEFAULT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_fooditems ALTER COLUMN id SET DEFAULT nextval('public.urban_backend_fooditems_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add food items	8	add_fooditems
30	Can change food items	8	change_fooditems
31	Can delete food items	8	delete_fooditems
32	Can view food items	8	view_fooditems
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	urban_backend	category
8	urban_backend	fooditems
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-10 21:56:14.542268+05:30
2	auth	0001_initial	2020-10-10 21:56:14.615322+05:30
3	admin	0001_initial	2020-10-10 21:56:14.709167+05:30
4	admin	0002_logentry_remove_auto_add	2020-10-10 21:56:14.750481+05:30
5	admin	0003_logentry_add_action_flag_choices	2020-10-10 21:56:14.764329+05:30
6	contenttypes	0002_remove_content_type_name	2020-10-10 21:56:14.783001+05:30
7	auth	0002_alter_permission_name_max_length	2020-10-10 21:56:14.791045+05:30
8	auth	0003_alter_user_email_max_length	2020-10-10 21:56:14.799776+05:30
9	auth	0004_alter_user_username_opts	2020-10-10 21:56:14.807942+05:30
10	auth	0005_alter_user_last_login_null	2020-10-10 21:56:14.815955+05:30
11	auth	0006_require_contenttypes_0002	2020-10-10 21:56:14.818084+05:30
12	auth	0007_alter_validators_add_error_messages	2020-10-10 21:56:14.825589+05:30
13	auth	0008_alter_user_username_max_length	2020-10-10 21:56:14.839749+05:30
14	auth	0009_alter_user_last_name_max_length	2020-10-10 21:56:14.848112+05:30
15	auth	0010_alter_group_name_max_length	2020-10-10 21:56:14.857488+05:30
16	auth	0011_update_proxy_permissions	2020-10-10 21:56:14.864808+05:30
17	auth	0012_alter_user_first_name_max_length	2020-10-10 21:56:14.873677+05:30
18	sessions	0001_initial	2020-10-10 21:56:14.882289+05:30
19	urban_backend	0001_initial	2020-10-10 22:23:54.447252+05:30
20	urban_backend	0002_category_is_delete	2020-10-10 22:31:07.26292+05:30
21	urban_backend	0003_auto_20201010_1711	2020-10-10 22:41:04.809081+05:30
22	urban_backend	0004_auto_20201010_1713	2020-10-10 22:43:59.841617+05:30
23	urban_backend	0005_auto_20201010_1717	2020-10-10 22:47:16.477582+05:30
24	urban_backend	0006_auto_20201011_0400	2020-10-11 09:31:09.026782+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: urban_backend_category; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.urban_backend_category (id, category_name, is_delete) FROM stdin;
6	Biryani	f
7	Pizza	f
8	Burger	f
9	sandwitch	f
10	Chhole Bhatore	f
11	Roll	f
12	Icecream	f
\.


--
-- Data for Name: urban_backend_fooditems; Type: TABLE DATA; Schema: public; Owner: urban
--

COPY public.urban_backend_fooditems (id, food_name, discription, price, is_available, is_delivered, delivery_partener, item_rating, category_name_id, is_veg) FROM stdin;
1	veg biryani	Authentic Vegetable biryani recipe that tastes awesome and so good	100	t	t	Zomato	4	6	t
2	Pulses biryani recipe	Healthy Pulses Biryani Recipe-Chana,Rajma,Kabuli Biryani Recipe-Sunday Lunch Recipes Series 21	120	t	t	Zomato	4	6	t
3	Sindhi biryani	Sindhi Biryani Recipe-Pakistani Biryani-Sunday Lunch Recipes Series 19	150	t	t	Zomato	4	6	t
4	Hyderabadi Biryani	Straight from the streets of Hyderabad, get the authentic flavours simmering in your kitchen. One of the most popular biryani recipes, this dish is surely here to win hearts.	160	t	t	Swiggy	5	6	f
5	 Chicken Reshmi Biryani	Explore the burst of flavours enrobed in a mix of chicken and rice. A simple recipe, chicken reshmi biryani is everything you need to celebrate Eid.	160	t	t	Swiggy	5	6	f
6	Calicut Chicken Biryani	From the beautiful city of Calicut, comes this authentic chicken Biryani. A quick and easy recipe using chicken and rice with distinct flavours of South. Yes, perfect biryani does exist.	180	t	t	Swiggy	5	6	f
8	Crispy Veg Burger	The Whopper sandwich is the signature hamburger product sold by the international fast-food restaurant chain Burger King and its Australian franchise Hungry Jack's. 	39	t	t	Swiggy	5	8	t
10	Veg Whopper Combo	The burger is one of the best known products in the fast food industry; it is so well known that Burger  	239	t	t	Swiggy	5	8	t
11	Fiery Chicken Burger Combo	it was originally called the Double Supreme and was configured similarly to the McDonald's Big Mac—including a three piece roll	339	t	t	Swiggy	5	8	f
12	Chicken Tandoor Grill Burger Combo	The Whopper is the signature sandwich and an associated product line sold by international fast food restaurant chain Burger King and its Australian franchise	339	t	t	Swiggy	5	8	f
13	Double Cheese Margherita	The ever-popular Margherita - loaded with extra cheese... oodies of it!	139	t	t	Zomato	5	7	t
14	Deluxe Veggie	A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.	239	t	t	Zomato	5	7	t
15	Veg Extravaganza	A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, juicyfresh tomatoes and jalapeno - with extra cheese to go all around.	339	t	t	Zomato	4	7	t
16	Chicken Golden Delight	Mmm! Barbeque chicken with a topping of golden corn loaded with extra cheese. Worth its weight in gold!	229	t	t	Zomato	4	7	f
17	PEPPER BARBECUE & ONION	Pepper Barbecue Chicken I Onion	429	t	t	Swiggy	5	7	f
18	Indi Chicken Tikka	The wholesome flavour of tandoori masala with Chicken tikka I onion I red paprika I mint mayo	399	t	t	Swiggy	3	7	f
19	Non Veg Supreme	Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers	499	t	t	Zomato	4	7	f
22	Blue Moon ice cream	Blue moon is an ice cream flavor with bright blue coloring, available in the Upper Midwest of the United States and originating	150	t	t	Zomato	4	12	t
24	Grape-Nut ice cream	Grape-Nut ice cream is a popular regional dish in the Canadian Maritimes, the Shenandoah Valley, Jamaica, and New England.	150	t	t	Zomato	4	12	t
25	Veg Roll	Grape-Nut ice cream is a popular regional dish in the Canadian Maritimes, the Shenandoah Valley, Jamaica, and New England	150	t	t	Zomato	4	11	t
27	Chhole Bhatore	Grape-Nut ice cream is a popular regional dish in the Canadian Maritimes, the Shenandoah Valley, Jamaice	150	t	t	Zomato	4	10	t
28	Nonveg sandwitch	Grape-Nut ice cream is a popular regional dish in the Canadian Maritimes, the Shenandoah Valley	160	t	t	Zomato	4	9	f
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: urban_backend_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.urban_backend_category_id_seq', 13, true);


--
-- Name: urban_backend_fooditems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: urban
--

SELECT pg_catalog.setval('public.urban_backend_fooditems_id_seq', 28, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: urban_backend_category urban_backend_category_gategory_name_key; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_category
    ADD CONSTRAINT urban_backend_category_gategory_name_key UNIQUE (category_name);


--
-- Name: urban_backend_category urban_backend_category_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_category
    ADD CONSTRAINT urban_backend_category_pkey PRIMARY KEY (id);


--
-- Name: urban_backend_fooditems urban_backend_fooditems_discription_key; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_fooditems
    ADD CONSTRAINT urban_backend_fooditems_discription_key UNIQUE (discription);


--
-- Name: urban_backend_fooditems urban_backend_fooditems_food_name_key; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_fooditems
    ADD CONSTRAINT urban_backend_fooditems_food_name_key UNIQUE (food_name);


--
-- Name: urban_backend_fooditems urban_backend_fooditems_pkey; Type: CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_fooditems
    ADD CONSTRAINT urban_backend_fooditems_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: urban_backend_category_gategory_name_1a7837ee_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX urban_backend_category_gategory_name_1a7837ee_like ON public.urban_backend_category USING btree (category_name varchar_pattern_ops);


--
-- Name: urban_backend_fooditems_discription_07d160dc_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX urban_backend_fooditems_discription_07d160dc_like ON public.urban_backend_fooditems USING btree (discription varchar_pattern_ops);


--
-- Name: urban_backend_fooditems_food_name_1c491e1c_like; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX urban_backend_fooditems_food_name_1c491e1c_like ON public.urban_backend_fooditems USING btree (food_name varchar_pattern_ops);


--
-- Name: urban_backend_fooditems_gategory_name_id_ddf61cf4; Type: INDEX; Schema: public; Owner: urban
--

CREATE INDEX urban_backend_fooditems_gategory_name_id_ddf61cf4 ON public.urban_backend_fooditems USING btree (category_name_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: urban_backend_fooditems urban_backend_foodit_category_name_id_08fc4ead_fk_urban_bac; Type: FK CONSTRAINT; Schema: public; Owner: urban
--

ALTER TABLE ONLY public.urban_backend_fooditems
    ADD CONSTRAINT urban_backend_foodit_category_name_id_08fc4ead_fk_urban_bac FOREIGN KEY (category_name_id) REFERENCES public.urban_backend_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

