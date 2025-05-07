--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: MatchPlayer; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public."MatchPlayer" (
    "userId" integer NOT NULL,
    "matchId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."MatchPlayer" OWNER TO balanty;

--
-- Name: gallery; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.gallery (
    id integer NOT NULL,
    "StadiumId" integer,
    image text DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg'::text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


ALTER TABLE public.gallery OWNER TO balanty;

--
-- Name: gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gallery_id_seq OWNER TO balanty;

--
-- Name: gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.gallery_id_seq OWNED BY public.gallery.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.matches (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    "startDate" character varying(255) NOT NULL,
    "endDate" character varying(255) NOT NULL,
    seats integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ownerId" integer,
    "stadiumId" integer
);


ALTER TABLE public.matches OWNER TO balanty;

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matches_id_seq OWNER TO balanty;

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "MatchId" integer
);


ALTER TABLE public.messages OWNER TO balanty;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO balanty;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.players (
    id integer NOT NULL,
    avatar text DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png'::text,
    age character varying(255) DEFAULT 'لم يتم ادخال عمر'::character varying,
    "position" character varying(100) DEFAULT 'لم يتم ادخال مركز'::character varying,
    cover text DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-EbTsSBS9XCU_ten8O9UB1m9q4UwXxsZ_A&usqp=CAU'::text,
    bio text DEFAULT 'لم يتم ادخال وصف'::text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


ALTER TABLE public.players OWNER TO balanty;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO balanty;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "playerId" integer,
    "stadiumId" integer
);


ALTER TABLE public.reviews OWNER TO balanty;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO balanty;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: stadiums; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.stadiums (
    id integer NOT NULL,
    address character varying(255) DEFAULT 'لم يتم ادخال عنوان'::character varying,
    description character varying(255) DEFAULT 'لم يتم ادخال وصف'::character varying,
    price integer DEFAULT 0,
    ground character varying(50) DEFAULT 'يمكنك اضافة نوع الارضية '::character varying,
    image text DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg'::text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


ALTER TABLE public.stadiums OWNER TO balanty;

--
-- Name: stadiums_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.stadiums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stadiums_id_seq OWNER TO balanty;

--
-- Name: stadiums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.stadiums_id_seq OWNED BY public.stadiums.id;


--
-- Name: usermessage; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.usermessage (
    id integer NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "FromID" integer,
    "ToID" integer
);


ALTER TABLE public.usermessage OWNER TO balanty;

--
-- Name: usermessage_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.usermessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usermessage_id_seq OWNER TO balanty;

--
-- Name: usermessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.usermessage_id_seq OWNED BY public.usermessage.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: balanty
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    phone character varying(10) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO balanty;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: balanty
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO balanty;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: balanty
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: gallery id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.gallery ALTER COLUMN id SET DEFAULT nextval('public.gallery_id_seq'::regclass);


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: stadiums id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.stadiums ALTER COLUMN id SET DEFAULT nextval('public.stadiums_id_seq'::regclass);


--
-- Name: usermessage id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.usermessage ALTER COLUMN id SET DEFAULT nextval('public.usermessage_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: MatchPlayer; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public."MatchPlayer" ("userId", "matchId", "createdAt", "updatedAt") FROM stdin;
30	13	2025-04-27 16:29:36.367+03	2025-04-27 16:29:36.367+03
30	19	2025-04-27 16:43:57.741+03	2025-04-27 16:43:57.741+03
23	13	2025-05-03 10:58:21.525+03	2025-05-03 10:58:21.525+03
23	20	2025-05-03 10:58:23.108+03	2025-05-03 10:58:23.108+03
\.


--
-- Data for Name: gallery; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.gallery (id, "StadiumId", image, "createdAt", "updatedAt", "UserId") FROM stdin;
52	16	https://images.unsplash.com/photo-1506626637585-0802df0d0269?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D	2025-04-27 12:14:03.077+03	2025-04-27 12:14:03.077+03	32
37	24	https://plus.unsplash.com/premium_photo-1684713510655-e6e31536168d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Zm9vdGJhbGx8ZW58MHx8MHx8fDA%3D	2025-04-27 12:20:38.021+03	2025-04-27 12:20:38.021+03	40
53	16	https://images.unsplash.com/flagged/photo-1550413231-202a9d53a331?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTY4fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:03.077+03	2025-04-27 12:14:03.077+03	32
58	18	https://images.unsplash.com/photo-1556056504-dc77ff4d11b0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjEyfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:15:59.809+03	2025-04-27 12:15:59.809+03	34
40	24	https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:20:38.021+03	2025-04-27 12:20:38.021+03	40
32	17	https://images.unsplash.com/photo-1474899452492-5eea44100ec4?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTc1fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:49.869+03	2025-04-27 12:14:49.869+03	33
41	24	https://images.unsplash.com/photo-1430232324554-8f4aebd06683?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D	2025-04-27 12:20:38.021+03	2025-04-27 12:20:38.021+03	40
28	13	https://images.unsplash.com/photo-1556056504-5c7696c4c28d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:11:26.684+03	2025-04-27 12:11:26.684+03	18
54	17	https://images.unsplash.com/photo-1531861218190-f90c89febf69?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjEwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:49.869+03	2025-04-27 12:14:49.869+03	33
38	24	https://images.unsplash.com/photo-1556056504-5c7696c4c28d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:20:38.021+03	2025-04-27 12:20:38.021+03	40
42	13	https://images.unsplash.com/photo-1487466365202-1afdb86c764e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTF8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:11:26.684+03	2025-04-27 12:11:26.684+03	18
43	13	https://images.unsplash.com/photo-1473976345543-9ffc928e648d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:11:26.684+03	2025-04-27 12:11:26.684+03	18
44	13	https://images.unsplash.com/photo-1522778119026-d647f0596c20?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:11:26.684+03	2025-04-27 12:11:26.684+03	18
55	17	https://images.unsplash.com/photo-1501520158826-76df880863a3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTk5fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:49.869+03	2025-04-27 12:14:49.869+03	33
29	14	https://images.unsplash.com/photo-1510051640316-cee39563ddab?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:12:21.488+03	2025-04-27 12:12:21.488+03	19
45	14	https://images.unsplash.com/photo-1563299796-b729d0af54a5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTE5fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:12:21.488+03	2025-04-27 12:12:21.488+03	19
46	14	https://images.unsplash.com/photo-1508697371770-529139794f8b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAyfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:12:21.488+03	2025-04-27 12:12:21.488+03	19
47	14	https://images.unsplash.com/photo-1607627000458-210e8d2bdb1d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODd8fGZvb3RiYWxsfGVufDB8fDB8fHww	2025-04-27 12:12:21.488+03	2025-04-27 12:12:21.488+03	19
56	17	https://images.unsplash.com/photo-1508863702330-2eece3ea08cb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjAzfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:49.869+03	2025-04-27 12:14:49.869+03	33
30	15	https://images.unsplash.com/photo-1504016798967-59a258e9386d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM5fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:13:00.907+03	2025-04-27 12:13:00.907+03	31
48	15	https://images.unsplash.com/photo-1516283250450-174387a1af6b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTUxfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:13:00.907+03	2025-04-27 12:13:00.907+03	31
49	15	https://images.unsplash.com/photo-1542683305-710078a12f73?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTYwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:13:00.907+03	2025-04-27 12:13:00.907+03	31
50	15	https://images.unsplash.com/photo-1544698310-74ea9d1c8258?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ2fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:13:00.907+03	2025-04-27 12:13:00.907+03	31
31	16	https://images.unsplash.com/photo-1564833592193-3270b5618e7f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTcxfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:03.077+03	2025-04-27 12:14:03.077+03	32
51	16	https://images.unsplash.com/photo-1518605125802-006dcc629439?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTc4fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:14:03.077+03	2025-04-27 12:14:03.077+03	32
59	18	https://images.unsplash.com/photo-1493038950213-29266628eb06?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjIwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:15:59.809+03	2025-04-27 12:15:59.809+03	34
33	18	https://images.unsplash.com/photo-1569337042150-c21c85b80a10?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjE1fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:15:59.809+03	2025-04-27 12:15:59.809+03	34
57	18	https://images.unsplash.com/photo-1569863959165-56dae551d4fc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjExfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:15:59.809+03	2025-04-27 12:15:59.809+03	34
34	19	https://images.unsplash.com/photo-1519743375942-b497d66b1e8f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjc5fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:17:40.459+03	2025-04-27 12:17:40.459+03	35
60	19	https://images.unsplash.com/photo-1556962021-9d0303621643?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjg2fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:17:40.459+03	2025-04-27 12:17:40.459+03	35
61	19	https://images.unsplash.com/photo-1505305976870-c0be1cd39939?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjgyfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:17:40.459+03	2025-04-27 12:17:40.459+03	35
36	21	https://images.unsplash.com/photo-1540379708242-14a809bef941?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzg3fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	37
62	19	https://images.unsplash.com/photo-1628936949855-87daf01d52f1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjU1fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:17:40.459+03	2025-04-27 12:17:40.459+03	35
35	20	https://images.unsplash.com/photo-1556962021-9d0303621643?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjg2fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:18:44.426+03	2025-04-27 12:18:44.426+03	36
63	20	https://images.unsplash.com/photo-1629217855633-79a6925d6c47?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzQ0fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:18:44.426+03	2025-04-27 12:18:44.426+03	36
64	20	https://images.unsplash.com/photo-1531861184681-f2de7dd72da5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzI2fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:18:44.426+03	2025-04-27 12:18:44.426+03	36
65	20	https://images.unsplash.com/photo-1546717003-caee5f93a9db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjk4fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:18:44.426+03	2025-04-27 12:18:44.426+03	36
66	21	https://images.unsplash.com/photo-1491324213149-48ea4e31bf50?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDMwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	37
67	21	https://images.unsplash.com/photo-1550591822-385011169f30?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDA4fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	37
68	21	https://images.unsplash.com/photo-1529663297269-6d349ec39b57?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzk1fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	37
69	22	https://images.unsplash.com/photo-1620003048892-ea674d6d018e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTgzfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	38
70	22	https://images.unsplash.com/photo-1664829879065-7c20cb1aa032?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDkwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	38
71	22	https://images.unsplash.com/photo-1508181382850-5b57cb8caa92?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDY0fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	38
72	22	https://images.unsplash.com/photo-1532262757596-f93a9d92f879?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDYwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	38
75	23	https://images.unsplash.com/flagged/photo-1639036711375-df3d6ef8232e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjEwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	39
76	23	https://images.unsplash.com/photo-1603351820801-5d9c3623f4e0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjU4fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	39
73	23	https://images.unsplash.com/photo-1702569801978-5894103e1c32?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjI0fHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	39
74	23	https://images.unsplash.com/photo-1741862470968-ccceece09f10?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAwfHxmb290YmFsbHxlbnwwfHwwfHx8MA%3D%3D	2025-04-27 12:19:30.693+03	2025-04-27 12:19:30.693+03	39
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.matches (id, title, description, "startDate", "endDate", seats, "createdAt", "updatedAt", "ownerId", "stadiumId") FROM stdin;
23	مباراة النهائية	مباراة بين الفرق النهائية 	2025-07-05T01:00:00+03:00	2025-07-05T03:00:00+03:00	25	2025-05-03 11:55:22.061+03	2025-05-03 11:55:22.061+03	38	38
9	ديربي النجوم	مواجهة بين نجوم اللعبة	2025-07-10T17:00:00+03:00	2025-07-10T18:00:00+03:00	12	2025-04-27 15:06:33.685+03	2025-04-27 15:06:33.685+03	20	19
11	مباراة الديربي الكبير	مباراة قوية بين اثنين من أعرق الأندية يتنافسان على القمة	2025-07-27T10:00:00	2025-07-27T11:00:00	12	2025-04-27 15:21:37.224+03	2025-04-27 15:21:37.224+03	24	19
12	مباراة النجوم اللامعة	مواجهة بين نجوم اللعبة الذين يسعون لإثبات قوتهم على الأرض	2025-12-03T14:00:00	2025-12-03T15:00:00	12	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	28	34
13	مباراة التحدي الكبير	تحدي جديد ينتظر بين فريقين يسعيان للفوز بأي ثمن	2025-05-14T10:00:00	2025-05-14T11:00:00	14	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	17	38
14	مباراة الحسم	مباراة حاسمة بين فريقين يسعيان لتحقيق الانتصار في اللحظات الأخيرة	2025-12-08T18:00:00	2025-12-08T19:00:00	20	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	28	38
15	مباراة الأبطال الأقوياء	لقاء ينتظره الجميع بين الأبطال الذين لا يعرفون المستحيل	2025-11-04T18:00:00	2025-11-04T19:00:00	13	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	24	32
17	مباراة القمة الكبرى	صراع من العيار الثقيل بين أفضل فريقين في الدوري	2025-06-04T15:00:00	2025-06-04T16:00:00	18	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	24	35
18	مباراة المنافسة الشرسة	مباراة حاسمة للمنافسة على لقب البطولة، سيتواجه خلالها عمالقة الفرق	2025-12-05T13:00:00	2025-12-05T14:00:00	20	2025-04-27 15:21:37.225+03	2025-04-27 15:21:37.225+03	26	39
19	القتال على البطولة	مباراة لا تُفوّت بين أبطال الفرق الذين يتنافسون على الفوز	2025-05-22T14:00:00	2025-05-22T15:00:00	10	2025-04-27 15:21:37.226+03	2025-04-27 15:21:37.226+03	20	40
20	مباراة التحدي النهائي	مواجهة لا مثيل لها بين فريقين يسعيان لتحقيق الانتصار بأي وسيلة	2025-08-24T10:00:00	2025-08-24T11:00:00	19	2025-04-27 15:21:37.226+03	2025-04-27 15:21:37.226+03	20	40
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.messages (id, message, "createdAt", "updatedAt", "UserId", "MatchId") FROM stdin;
17	مرحباً، هل أنتم جاهزون لمباراة اليوم؟ الجميع متحمس للغاية!	2025-04-27 16:08:38.107+03	2025-04-27 16:08:38.107+03	18	\N
18	نعم، الفريق كله في أتم الاستعداد. لا أستطيع الانتظار لبداية المباراة!	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	17	\N
19	أعتقد أن هذه المباراة ستكون صعبة، الخصم قوي جداً. لكننا مستعدون تماماً!	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	20	\N
20	لا يوجد شيء صعب علينا، سنبذل قصارى جهدنا للفوز اليوم. الفريق في أفضل حالاته.	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	21	\N
21	التحدي سيكون كبيرًا، ولكننا نعلم أن لدينا القدرة على تحقيق النصر. دعونا نبذل المزيد من الجهد!	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	22	\N
22	لقد تدربنا كثيرًا لهذه المباراة، ونحن واثقون من قدرتنا على التفوق. الحماس في أوجه!	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	23	\N
23	لن تكون المباراة سهلة أبدًا، ولكننا نحب التحديات. الجميع في أتم الاستعداد للقتال.	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	24	\N
24	الروح المعنوية مرتفعة، ونحن نؤمن بقدراتنا. المباراة ستكون مثيرة!	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	25	\N
25	أنا متأكد أننا سنقدم أفضل أداء لدينا اليوم. الاستعدادات كانت رائعة.	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	26	\N
42	مرحباً بالجميع، هل أنتم مستعدون لمباراة اليوم؟	2025-04-27 16:14:59.786+03	2025-04-27 16:14:59.786+03	19	9
43	نعم، الفريق في أفضل حالاته. سنبذل كل ما في وسعنا للفوز!	2025-04-27 16:14:59.786+03	2025-04-27 16:14:59.786+03	17	9
44	نحن في حالة رائعة! التحدي سيكون صعبًا، لكننا مستعدون له!	2025-04-27 16:14:59.786+03	2025-04-27 16:14:59.786+03	20	9
45	نعم، الفريق الخصم قوي ولكننا لن نتراجع. الفوز لنا!	2025-04-27 16:14:59.786+03	2025-04-27 16:14:59.786+03	21	9
46	الروح المعنوية مرتفعة، كلنا جاهزون لمباراة اليوم.	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	22	9
47	مباراة اليوم ستكون حاسمة، لكننا لا نشعر بالخوف. نحن نؤمن بقدراتنا.	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	23	9
48	بالتأكيد، هذه المباراة ستظهر من الفريق الأفضل. سنبذل قصارى جهدنا!	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	24	9
49	لن يكون هناك مجال للخطأ. الفوز هدفنا اليوم!	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	25	9
50	الكل في حالة تركيز عالية، واثقون من قدرتنا على الفوز اليوم.	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	26	9
26	أود أن أتمنى التوفيق للجميع! لنرى من سيتفوق في هذه المباراة الرائعة.	2025-04-27 16:08:38.108+03	2025-04-27 16:08:38.108+03	27	\N
28	مرحباً بالجميع، هل أنتم مستعدون للمباراة الكبيرة اليوم؟	2025-04-27 16:12:22.218+03	2025-04-27 16:12:22.218+03	18	\N
29	نعم، الفريق في أفضل حالاته. نحن جاهزون للتحدي!	2025-04-27 16:12:22.218+03	2025-04-27 16:12:22.218+03	17	\N
30	أنا متحمس لهذه المباراة، أتوقع أن تكون قوية جداً!	2025-04-27 16:12:22.218+03	2025-04-27 16:12:22.218+03	20	\N
31	لن تكون مباراة سهلة، ولكننا مستعدون لأية تحديات!	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	21	\N
51	لن نترك فرصة للخصم. نحن مستعدون للتحدي الكبير!	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	27	9
52	كل واحد في الفريق سيكون له دور مهم في المباراة. لن نخيب آمال جمهورنا!	2025-04-27 16:14:59.787+03	2025-04-27 16:14:59.787+03	28	9
53	الفوز سيكون حليفنا اليوم، نحتاج فقط للتركيز والعمل كفريق واحد.	2025-04-27 16:14:59.788+03	2025-04-27 16:14:59.788+03	29	9
54	نعم، الروح الجماعية هي سر النجاح. دعونا نثبت ذلك في الملعب.	2025-04-27 16:14:59.788+03	2025-04-27 16:14:59.788+03	30	9
70	هل أنتم مستعدون للمباراة اليوم؟ أعتقد أنها ستكون صعبة.	2025-04-27 16:20:47.065+03	2025-04-27 16:20:47.065+03	19	11
72	إنه تحدي كبير، لكننا سنثبت أننا الأفضل.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	20	11
71	نعم، نحن مستعدون تماماً! الفريق في أفضل حالاته.	2025-04-27 16:20:47.065+03	2025-04-27 16:20:47.065+03	17	11
73	يجب أن نكون حذرين، الفريق المنافس ليس سهلاً.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	21	11
74	لا تقلق، لدينا القدرة على الفوز. فقط نحتاج إلى العمل كفريق.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	22	11
75	هذه المباراة ستكون حاسمة. يجب أن نثبت قوتنا في الملعب.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	23	11
76	التكتيك الجيد والروح الجماعية هما مفتاح الفوز. سنكون مستعدين.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	24	11
77	نحن في حالة معنوية مرتفعة. لا شيء سيوقفنا!	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	25	11
78	يجب أن نركز على كل التفاصيل الصغيرة. الفوز سيكون حليفنا اليوم.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	26	11
79	نعم، وعلينا أن نتحلى بالصبر والتركيز طوال المباراة.	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	27	11
80	الفوز سيعني الكثير للجميع. نحن جاهزون لتحقيق النصر!	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	28	11
81	دعونا نثبت للجميع أننا الفريق الأقوى في هذه البطولة!	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	29	11
82	هذه فرصتنا لإظهار مهاراتنا. الفوز سيكون لنا إن شاء الله!	2025-04-27 16:20:47.066+03	2025-04-27 16:20:47.066+03	30	11
98	هل أنتم جاهزون للمباراة اليوم؟ أعتقد أنها ستكون صعبة!	2025-04-27 16:26:10.106+03	2025-04-27 16:26:10.106+03	34	12
99	نعم، الفريق في حالة جيدة. سنقدم أفضل ما لدينا.	2025-04-27 16:26:10.107+03	2025-04-27 16:26:10.107+03	17	12
100	اليوم سيكون الاختبار الأصعب لنا هذا الموسم. لكننا واثقون من أنفسنا.	2025-04-27 16:26:10.107+03	2025-04-27 16:26:10.107+03	20	12
101	لا مجال للخطأ اليوم. يجب أن نبقى مركزين على هدفنا.	2025-04-27 16:26:10.107+03	2025-04-27 16:26:10.107+03	21	12
102	سنستغل كل فرصة لتحقيق النصر. هذه فرصتنا لإثبات أنفسنا.	2025-04-27 16:26:10.107+03	2025-04-27 16:26:10.107+03	22	12
103	الفريق المنافس قوي لكننا لدينا القدرة على التفوق عليه.	2025-04-27 16:26:10.107+03	2025-04-27 16:26:10.107+03	23	12
104	نحن بحاجة إلى الحفاظ على هدوئنا وتركيزنا طوال المباراة.	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	24	12
105	الجميع في الفريق يدرك أهمية هذه المباراة. سنتحلى بالصبر.	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	25	12
106	نحن مستعدون على جميع الأصعدة. المباراة ستكون لنا.	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	26	12
107	التركيز هو المفتاح. لا نريد أن نضيع أي فرصة.	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	27	12
56	مرحباً بالجميع، هل أنتم جاهزون للمباراة اليوم؟	2025-04-27 16:17:35.379+03	2025-04-27 16:17:35.379+03	40	\N
57	نعم، الفريق في حالة جيدة ونحن متحمسون! هذه المباراة ستكون مثيرة.	2025-04-27 16:17:35.379+03	2025-04-27 16:17:35.379+03	17	\N
58	نحن مستعدون تماماً. التحدي سيكون كبيراً لكننا واثقون في قوتنا.	2025-04-27 16:17:35.379+03	2025-04-27 16:17:35.379+03	20	\N
59	لا مجال للخطأ اليوم. الفوز هو هدفنا الوحيد.	2025-04-27 16:17:35.379+03	2025-04-27 16:17:35.379+03	21	\N
60	الفريق بأكمله جاهز، سنعمل ككتلة واحدة لتحقيق النصر.	2025-04-27 16:17:35.379+03	2025-04-27 16:17:35.379+03	22	\N
61	مباراة اليوم هي اختبار حقيقي. لكننا سنثبت قدرتنا على الفوز.	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	23	\N
62	يجب أن نركز بشكل كامل. الفوز هو ما نحتاجه، لا شيء آخر.	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	24	\N
63	كل فرد في الفريق له دور مهم. لن نسمح لأي شيء أن يوقفنا.	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	25	\N
64	نحن في أفضل حالاتنا، ومباراة اليوم ستكون بداية نجاحات كبيرة.	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	26	\N
65	الضغط علينا، لكننا مستعدون لمواجهة كل التحديات. الفوز قريب.	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	27	\N
66	الروح المعنوية عالية في الفريق. دعونا نثبت أننا الأفضل!	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	28	\N
67	كل شيء جاهز للمباراة. سنبذل قصارى جهدنا اليوم!	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	29	\N
68	الوقت قد حان لترك بصمتنا في الملعب. دعونا نبدأ بحماس!	2025-04-27 16:17:35.38+03	2025-04-27 16:17:35.38+03	30	\N
108	الفوز في هذه المباراة سيعطينا دفعة قوية في البطولة. نحن مستعدون!	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	28	12
109	الجميع في الفريق متحمس لهذه المباراة. دعونا نحقق النصر معاً!	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	29	12
110	لن نتوقف حتى نحقق الفوز! نحن بحاجة إلى هذه النقاط.	2025-04-27 16:26:10.108+03	2025-04-27 16:26:10.108+03	30	12
112	هل أنتم مستعدون للمباراة القادمة؟ ستكون صعبة جداً!	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	38	13
113	نعم، الفريق في حالة ممتازة. لدينا ما يكفي من القوة لتحقيق الفوز.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	17	13
114	الفريق المنافس قوي، ولكننا جاهزون لمواجهتهم بكل قوة.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	20	13
115	نحن نعلم أن المباراة هذه ستكون الاختبار الأكبر لنا هذا الموسم.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	21	13
116	دعونا نركز على كل دقيقة في المباراة. كل شيء ممكن.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	22	13
117	الفريق سيقاتل حتى النهاية. لا مجال للخطأ.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	23	13
118	هذه فرصة لإثبات أننا الأفضل. لا يوجد مجال للتراجع.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	24	13
119	نحتاج إلى تنظيم صفوفنا والتركيز على التكتيك بشكل جيد.	2025-04-27 16:29:42.793+03	2025-04-27 16:29:42.793+03	25	13
120	التحضير لهذا اللقاء كان مكثفاً جداً. نحن جاهزون للقتال.	2025-04-27 16:29:42.794+03	2025-04-27 16:29:42.794+03	26	13
121	الأجواء داخل الفريق رائعة، ونحن واثقون من الفوز.	2025-04-27 16:29:42.794+03	2025-04-27 16:29:42.794+03	27	13
122	الجميع متحمس للغاية. دعونا نثبت أننا الأفضل في البطولة.	2025-04-27 16:29:42.794+03	2025-04-27 16:29:42.794+03	28	13
123	كلنا معاً لتحقيق النصر. هذه فرصتنا للسيطرة على البطولة.	2025-04-27 16:29:42.794+03	2025-04-27 16:29:42.794+03	29	13
124	لا تهم الظروف. سنقاتل حتى آخر لحظة لتحقيق الفوز.	2025-04-27 16:29:42.794+03	2025-04-27 16:29:42.794+03	30	13
126	هل أنتم مستعدون للمباراة اليوم؟ ستكون مباراة مثيرة.	2025-04-27 16:32:15.088+03	2025-04-27 16:32:15.088+03	38	14
127	نعم، الفريق في أفضل حالاته. نحتاج فقط إلى التركيز على التكتيك.	2025-04-27 16:32:15.088+03	2025-04-27 16:32:15.088+03	17	14
128	لا شك أن المنافس قوي، لكن نحن مستعدون للتحدي.	2025-04-27 16:32:15.088+03	2025-04-27 16:32:15.088+03	20	14
129	بالتأكيد، لن نسمح لهم بالتفوق علينا. نحن مستعدون لأكبر تحدي.	2025-04-27 16:32:15.088+03	2025-04-27 16:32:15.088+03	24	14
130	تذكروا، النجاح يتطلب كل جهد ممكن. لنستمتع بكل دقيقة.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	25	14
131	نحتاج إلى قوة ذهنية كبيرة للفوز في هذه المباراة.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	26	14
132	المباراة ستكون صعبة، ولكن لدينا الخبرة الكافية للفوز.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	27	14
133	متحمس جداً لهذه المباراة! الفريق في قمة جاهزيته.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	28	14
134	الحماس بين اللاعبين في أعلى مستوياته! سنحقق الفوز حتماً.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	29	14
135	نحن نعلم أن هذا التحدي سيكون أكبر اختبار لنا هذا الموسم.	2025-04-27 16:32:15.089+03	2025-04-27 16:32:15.089+03	30	14
137	هل أنتم جاهزون للمباراة غداً؟ نحتاج إلى التركيز أكثر.	2025-04-27 16:34:27.793+03	2025-04-27 16:34:27.793+03	32	15
138	نعم، الفريق في أعلى جاهزيته. كل شيء تحت السيطرة.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	17	15
139	المباراة ستكون صعبة، لكننا نملك أفضل العناصر لتحقيق الفوز.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	20	15
140	نعم، التحدي سيكون كبيرًا. ولكن إذا ركزنا، سنتجاوزهم.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	21	15
141	المنافس فريق قوي، ولكننا نملك استراتيجية مدروسة جيدًا.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	22	15
142	الروح المعنوية عالية جدًا بين اللاعبين، سنتفوق بإذن الله.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	23	15
143	نتمنى أن نصل إلى هذه المباراة ونحن في أفضل حالة.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	24	15
144	هذه المباراة ستكون حاسمة بالنسبة لنا. نحتاج إلى كل نقطة.	2025-04-27 16:34:27.794+03	2025-04-27 16:34:27.794+03	25	15
145	ستكون مباراة قوية. كل فريق سيبذل أقصى ما لديه للفوز.	2025-04-27 16:34:27.795+03	2025-04-27 16:34:27.795+03	26	15
146	يجب أن نستعد لكل الاحتمالات. لا مجال للخطأ في هذه المباراة.	2025-04-27 16:34:27.795+03	2025-04-27 16:34:27.795+03	29	15
147	هذه المباراة ستحدد الكثير من الأمور في البطولة. لن نستسلم أبدًا.	2025-04-27 16:34:27.795+03	2025-04-27 16:34:27.795+03	30	15
149	هل أنتم مستعدون للمباراة الكبرى اليوم؟	2025-04-27 16:40:14.217+03	2025-04-27 16:40:14.217+03	35	17
150	نعم، كل شيء جاهز. الفريق في أفضل حالاته.	2025-04-27 16:40:14.217+03	2025-04-27 16:40:14.217+03	21	17
153	التشكيلة النهائية تم تحديدها. كل اللاعبين في مكانهم.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	24	17
151	نأمل أن نحقق الفوز اليوم. المباراة ستكون صعبة.	2025-04-27 16:40:14.217+03	2025-04-27 16:40:14.217+03	22	17
154	المهم أن نكون في حالة معنوية عالية، الفوز سيكون لنا.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	25	17
152	لا شك في ذلك. نحن مستعدون جيدًا لهذه المواجهة.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	23	17
155	نحن متفائلون جدًا بهذه المباراة. نعلم أن لدينا الأفضل.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	26	17
156	المنافس فريق قوي، ولكننا نملك خطة رائعة للتفوق عليهم.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	27	17
157	استعداداتنا في أفضل حال. نحن جاهزون للتحدي.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	28	17
158	نتمنى أن نتمكن من تحقيق الفوز، كل شيء في أيدينا الآن.	2025-04-27 16:40:14.218+03	2025-04-27 16:40:14.218+03	29	17
159	لن يكون لدينا أي عذر اليوم. كل شيء جاهز لنحقق الانتصار.	2025-04-27 16:40:14.219+03	2025-04-27 16:40:14.219+03	30	17
161	هل أنتم مستعدون للمباراة النهائية اليوم؟	2025-04-27 16:41:58.528+03	2025-04-27 16:41:58.528+03	39	18
162	نعم، كل شيء جاهز! الفريق في قمة مستواه.	2025-04-27 16:41:58.528+03	2025-04-27 16:41:58.528+03	17	18
163	نحن بحاجة إلى التركيز على كل تفاصيل المباراة. لا مجال للتراجع.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	20	18
164	بالتأكيد، المباراة ستكون صعبة ولكن لدينا ثقة في قدرتنا على الفوز.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	21	18
165	كل فريق لديه نقاط قوته وضعفه، لكننا نعمل على استغلال كل فرصة.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	22	18
173	كلنا نعلم أن المباراة هذه ستحدد مصيرنا، فلنعمل معًا من أجل الفوز.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	30	18
166	سنبذل كل جهدنا لتحقيق النصر، لا مكان للخطأ في مثل هذه المباراة.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	23	18
170	ستكون هذه المباراة واحدة من أهم المباريات في مسيرتنا.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	27	18
167	التشكيلة النهائية جاهزة. لا تنسوا أن الهدف الأول هو الفوز.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	24	18
168	لا شك في أن النتيجة ستكون لصالحنا إذا لعبنا بروح الفريق.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	25	18
169	نعم، المهم أن نبقى متماسكين ونحافظ على هدوئنا طوال المباراة.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	26	18
171	دعونا نترك كل شيء على أرض الملعب ونمنح الجمهور عرضًا مذهلًا.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	28	18
172	في النهاية، الفريق الذي يظهر بمستوى أفضل هو الذي سيفوز.	2025-04-27 16:41:58.529+03	2025-04-27 16:41:58.529+03	29	18
175	هل أنتم جاهزون للمباراة؟ يجب أن نقدم كل ما لدينا!	2025-04-27 16:44:02.288+03	2025-04-27 16:44:02.288+03	40	19
176	نعم، لدينا خطة محكمة وسنركز على جميع التفاصيل.	2025-04-27 16:44:02.288+03	2025-04-27 16:44:02.288+03	17	19
177	الفوز في هذه المباراة مهم للغاية. كلنا على استعداد للقتال من أجل النصر!	2025-04-27 16:44:02.288+03	2025-04-27 16:44:02.288+03	20	19
178	دعونا نبقى هادئين ونتعامل مع المباراة بحذر. الفوز يحتاج إلى تخطيط جيد.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	21	19
179	الفريق يبدو في حالة جيدة، لكن لدينا تحديات كبيرة اليوم.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	22	19
180	التحدي كبير، لكننا نؤمن بأننا قادرون على تحقيق الفوز.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	23	19
181	أهم شيء هو الحفاظ على التنظيم داخل الملعب وعدم إضاعة الفرص.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	24	19
182	نعم، كل شيء يتوقف على كيفية تعاملنا مع الفرص المتاحة.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	25	19
183	نحن بحاجة إلى التركيز على كل لحظة في المباراة. لا مجال لأي أخطاء.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	26	19
184	الكل يراهن على فوزنا اليوم. علينا أن نثبت أننا نستحق الفوز.	2025-04-27 16:44:02.289+03	2025-04-27 16:44:02.289+03	27	19
186	هل أنتم جاهزون لهذه المباراة؟ نحتاج إلى تركيز كامل.	2025-04-27 16:45:43.641+03	2025-04-27 16:45:43.641+03	40	20
187	نعم، كنا نستعد منذ فترة. اليوم سيكون تحديًا كبيرًا.	2025-04-27 16:45:43.641+03	2025-04-27 16:45:43.641+03	17	20
189	التحدي كبير، لكننا متأكدون من قدرتنا على الفوز.	2025-04-27 16:45:43.641+03	2025-04-27 16:45:43.641+03	21	20
188	نحتاج إلى أن نكون متيقظين منذ الدقيقة الأولى. أي خطأ قد يكلفنا المباراة.	2025-04-27 16:45:43.641+03	2025-04-27 16:45:43.641+03	20	20
190	يجب أن نعمل كفريق واحد. النجاح في هذه المباراة يتطلب التعاون الكامل.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	22	20
191	نعم، كل واحد منا يجب أن يعطي أقصى ما لديه. نحتاج إلى التركيز الشديد.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	25	20
192	لا يمكننا تحمل الخسارة. نحتاج إلى التحلي بالثقة والتركيز.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	26	20
193	سنقاتل على كل كرة في هذه المباراة. الفوز هدفنا الأساسي.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	27	20
194	دعونا نثبت للجميع أننا الأفضل. نحتاج إلى تقديم كل ما لدينا.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	28	20
195	نحن متحمسون لهذا التحدي! معًا يمكننا تحقيق الفوز.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	29	20
196	الفريق في حالة جيدة، لكن يجب أن نكون حذرين في كل لحظة.	2025-04-27 16:45:43.642+03	2025-04-27 16:45:43.642+03	30	20
32	نحن نؤمن بقدرتنا على الفوز. يجب أن نقدم أفضل ما لدينا!	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	22	\N
33	الأمور تبدو جيدة، لكننا يجب أن نكون في قمة تركيزنا أثناء المباراة.	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	23	\N
34	أتفق معك، يجب أن نلعب بروح الفريق الواحد لتحقيق النصر!	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	24	\N
35	كل شيء جاهز للمباراة. سأعطي كل ما لدي اليوم!	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	25	\N
36	لن تكون المباراة سهلة، لكن لدينا القدرة على الفوز إذا لعبنا بتركيز.	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	26	\N
37	أنا متأكد أن الفريق سيبذل كل ما في وسعه لتحقيق الفوز اليوم!	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	27	\N
38	يجب أن نركز على التفاصيل الصغيرة، فهي التي ستصنع الفارق في المباراة.	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	28	\N
39	بالتأكيد، كل شيء يعتمد على كيف سنواجه التحديات في الملعب.	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	29	\N
40	لن نسمح لأي شيء أن يعيقنا. الفوز هو هدفنا الوحيد.	2025-04-27 16:12:22.219+03	2025-04-27 16:12:22.219+03	30	\N
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.players (id, avatar, age, "position", cover, bio, "createdAt", "updatedAt", "UserId") FROM stdin;
5	https://images.unsplash.com/photo-1562159278-1253a58da141?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDY2fHx8ZW58MHx8fHx8	22 سنة	جناح هجومي	https://images.unsplash.com/photo-1551958219-acbc608c6377?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fGZvb3RiYWxsfGVufDB8fDB8fHww	بولندي هداف، قوة بدنية وإنهاء رائع أمام المرمى.	2025-04-27 09:47:57.921+03	2025-04-27 09:47:57.921+03	17
6	https://images.unsplash.com/photo-1733880218271-8c0be28e4643?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDU2fHx8ZW58MHx8fHx8	37 سنة	مهاجم	https://images.unsplash.com/photo-1504305754058-2f08ccd89a0a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fGZvb3RiYWxsfGVufDB8fDB8fHww	صاحب تمريرات سحرية ورؤية ميدانية مذهلة.	2025-04-27 11:14:22.531+03	2025-04-27 11:14:22.531+03	20
7	https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDE2fHx8ZW58MHx8fHx8	41 سنة	مهاجم / جناح	https://images.unsplash.com/photo-1626248801379-51a0748a5f96?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fGZvb3RiYWxsfGVufDB8fDB8fHww	معروف بتحكمه في الإيقاع ودقته في التمرير.	2025-04-27 11:15:57.564+03	2025-04-27 11:15:57.564+03	21
8	https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDUyfHx8ZW58MHx8fHx8	35 سنة	جناح أيسر	https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGZvb3RiYWxsfGVufDB8fDB8fHww	يمتاز بالتحكم الرائع بالكرة والرؤية الذكية.	2025-04-27 11:16:41.439+03	2025-04-27 11:16:41.439+03	22
9	https://images.unsplash.com/photo-1611695434369-a8f5d76ceb7b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDQzfHx8ZW58MHx8fHx8	33سنة	وسط هجومي	https://images.unsplash.com/photo-1552318965-6e6be7484ada?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGZvb3RiYWxsfGVufDB8fDB8fHww	قوة بدنية وأناقة في صناعة اللعب	2025-04-27 11:17:16.105+03	2025-04-27 11:17:16.105+03	23
10	https://images.unsplash.com/photo-1606070348308-8f4ed2f9a06d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDQxfHx8ZW58MHx8fHx8	31 سنة	لاعب وسط	https://images.unsplash.com/photo-1508087625439-de3978963553?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb3RiYWxsfGVufDB8fDB8fHww	ماكينة مراوغات برازيلية، يتمتع بسرعة وانفجار هجومي	2025-04-27 11:17:54.478+03	2025-04-27 11:17:54.478+03	24
11	https://images.unsplash.com/photo-1543965170-4c01a586684e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDI5fHx8ZW58MHx8fHx8	30 سنة	جناح / وسط هجومي	https://images.unsplash.com/photo-1511886929837-354d827aae26?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGZvb3RiYWxsfGVufDB8fDB8fHww	موهبة إنجليزية مذهلة، يجمع بين المهارة والتسجيل وصناعة اللعب.	2025-04-27 11:18:29.565+03	2025-04-27 11:18:29.565+03	25
12	https://images.unsplash.com/photo-1718239036877-a33f17f27179?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDI2fHx8ZW58MHx8fHx8	28 سنة	وسط هجومي	https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb3RiYWxsfGVufDB8fDB8fHww	يتميز بالمرونة والمهارات الفردية العالية	2025-04-27 11:19:09.394+03	2025-04-27 11:19:09.394+03	26
13	https://images.unsplash.com/photo-1734830268394-6c4a1f165af1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDIyfHx8ZW58MHx8fHx8	27 سنة	وسط ميدان	https://images.unsplash.com/photo-1589487391730-58f20eb2c308?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGZvb3RiYWxsfGVufDB8fDB8fHww	طاقة وحيوية لا تتوقف في وسط الملعب.	2025-04-27 11:19:40.278+03	2025-04-27 11:19:40.278+03	27
14	https://images.unsplash.com/photo-1678282955795-200c1e18bc7d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDEyfHx8ZW58MHx8fHx8	25 سنة	مهاجم	https://images.unsplash.com/photo-1517927033932-b3d18e61fb3a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvb3RiYWxsfGVufDB8fDB8fHww	متاز بالقوة والسرعة أمام المرمى.	2025-04-27 11:20:50.209+03	2025-04-27 11:20:50.209+03	28
15	https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDl8fHxlbnwwfHx8fHw%3D	23 سنة	وسط دفاعي	https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZvb3RiYWxsfGVufDB8fDB8fHww	وهبة أرجنتينية صاعدة، سرعة ومهارة ومراوغات رائعة	2025-04-27 11:22:09.092+03	2025-04-27 11:22:09.092+03	29
16	https://images.unsplash.com/photo-1569779213435-ba3167dde7cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx2aXN1YWwtc2VhcmNofDJ8fHxlbnwwfHx8fHw%3D	22 سنة	جناح أيسر	https://plus.unsplash.com/premium_photo-1677146015088-71992ac139af?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZvb3RiYWxsfGVufDB8fDB8fHww	موهبة واعدة من إسبانيا، رغم الإصابات، يظل خطير هجوميًا.	2025-04-27 11:23:35.73+03	2025-04-27 11:23:35.73+03	30
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.reviews (id, value, "createdAt", "updatedAt", "playerId", "stadiumId") FROM stdin;
8	1	2025-04-27 10:27:33.757+03	2025-04-27 10:37:17.828+03	17	18
9	0.5	2025-04-27 10:41:22.148+03	2025-04-27 10:41:24.424+03	17	\N
10	2.5	2025-04-27 10:41:32.625+03	2025-04-27 10:41:32.625+03	17	\N
11	2	2025-04-27 12:10:14.369+03	2025-04-27 12:10:14.369+03	30	19
12	3.5	2025-04-27 12:21:01.889+03	2025-04-27 12:21:01.889+03	30	34
13	4	2025-04-27 12:26:29.315+03	2025-04-27 12:26:29.315+03	40	18
14	1	2025-04-27 12:38:36.331+03	2025-04-27 12:38:36.331+03	40	35
15	1.5	2025-04-27 14:10:57.425+03	2025-04-27 14:10:57.425+03	40	39
16	2.5	2025-05-03 11:09:26.304+03	2025-05-03 11:09:26.304+03	23	38
\.


--
-- Data for Name: stadiums; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.stadiums (id, address, description, price, ground, image, "createdAt", "updatedAt", "UserId") FROM stdin;
13	النصيرات - وسط القطاع\n	ملعب ممتاز	60	نجيل صناعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 09:50:27.345+03	2025-04-27 09:50:27.345+03	18
14	غزة - تل الهوى	ملعب مجهز بالكامل	50	عشب طبيعي	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 10:43:26.822+03	2025-04-27 10:43:26.822+03	19
15	غزة - الشجاعية\n	ملعب متوسط\t	40	نجيل صناعي	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:11:26.682+03	2025-04-27 12:11:26.682+03	31
16	غزة - الرمال الجنوبي\n	ملعب حديث	60	عشب طبيعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:12:21.486+03	2025-04-27 12:12:21.486+03	32
17	رفح - حي البرازيل\n	مناسب للبطولات	55	نجيل صناعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:13:00.905+03	2025-04-27 12:13:00.905+03	33
18	غزة - شارع النصر\n	ملعب معتمد\t	45	عشب طبيعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:14:03.074+03	2025-04-27 12:14:03.074+03	34
19	المغازي - وسط القطاع\n	ملعب بسيط\t	30	رمل صناعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:14:49.868+03	2025-04-27 12:14:49.868+03	35
22	خانيونس - البلد\n	ملعب تدريبي\t	35	نجيل صناعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:18:44.423+03	2025-04-27 12:18:44.423+03	38
20	دير البلح - وسط القطاع\n	ملعب مجهز\t	40	عشب طبيعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:15:59.807+03	2025-04-27 12:15:59.807+03	36
23	غزة - حي الزيتون\n	بحاجة إلى تطوير\t	25	ترابي	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:19:30.69+03	2025-04-27 12:19:30.69+03	39
21	بيت لاهيا - شارع البحر\n	ملعب واسع\t	50	نجيل صناعي\t	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg	2025-04-27 12:17:40.457+03	2025-04-27 12:17:40.457+03	37
24	جباليا النزلة - السوق\n	ملعب شعبي\t	20	ترابي	https://plus.unsplash.com/premium_photo-1684713510655-e6e31536168d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Zm9vdGJhbGx8ZW58MHx8MHx8fDA%3D	2025-04-27 12:20:38.018+03	2025-04-27 12:59:30.634+03	40
\.


--
-- Data for Name: usermessage; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.usermessage (id, message, "createdAt", "updatedAt", "FromID", "ToID") FROM stdin;
6	مرحباً، مستعد لمباراة الغد؟ شكلها بتكون قوية.	2025-04-28 10:07:44.843+03	2025-04-28 10:07:44.843+03	17	27
7	أكيد! اشتغلت كثير على التكتيك واللياقة، وأنت كيف محضّر حالك؟	2025-04-28 10:07:44.844+03	2025-04-28 10:07:44.844+03	27	17
8	ركزت على التسديدات والسرعة، والمدرب عمل لنا خطط جديدة للهجوم.	2025-04-28 10:07:44.844+03	2025-04-28 10:07:44.844+03	17	27
9	حلو، أنا كمان ركزت على الدفاع والتغطية. لازم نكون منظمين من البداية.	2025-04-28 10:07:44.844+03	2025-04-28 10:07:44.844+03	27	17
10	صح كلامك، أهم شي نلعب بروح الفريق. بتتوقع مين يكون نجم المباراة؟	2025-04-28 10:07:44.845+03	2025-04-28 10:07:44.845+03	17	27
11	بصراحة شايف فرصتنا قوية، لو لعبنا صح كل الفريق رح يلمع مو بس لاعب واحد.	2025-04-28 10:07:44.845+03	2025-04-28 10:07:44.845+03	27	17
12	متحمس جداً! نشوفك بكرة بالملعب. بالتوفيق لنا جميعاً!	2025-04-28 10:07:44.845+03	2025-04-28 10:07:44.845+03	17	27
13	بإذن الله، بالتوفيق لنا! نشوفك هناك.	2025-04-28 10:07:44.845+03	2025-04-28 10:07:44.845+03	27	17
15	مرحباً، كيف تجهيزات الملعب لمباراة الغد؟	2025-04-28 10:15:08.129+03	2025-04-28 10:15:08.129+03	40	30
16	أهلاً، كل شيء تحت السيطرة. انتهينا من تجهيز الأرضية.	2025-04-28 10:15:08.13+03	2025-04-28 10:15:08.13+03	30	40
17	ممتاز! كيف حالة العشب؟	2025-04-28 10:15:08.13+03	2025-04-28 10:15:08.13+03	40	30
18	العشب بحالة ممتازة وتم قصه حسب المعايير.	2025-04-28 10:15:08.13+03	2025-04-28 10:15:08.13+03	30	40
19	حلو، الإضاءة كمان كويسة للمباراة المسائية؟	2025-04-28 10:15:08.13+03	2025-04-28 10:15:08.13+03	40	30
20	أكيد، عملنا فحص شامل للإضاءة أمس.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
21	ممتاز. بخصوص غرف الملابس، هل كل شيء جاهز فيها؟	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
22	نعم، تم تنظيفها وترتيب الأدوات بالكامل.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
23	رائع. بالنسبة للجماهير، كم يتوقع الحضور؟	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
24	نتوقع امتلاء 70% من المقاعد.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
26	أكيد، خاصة مع أهمية المباراة.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
25	إن شاء الله تكون أجواء حماسية.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
27	بخصوص الأمن، هل تم التنسيق مع الفرق المختصة؟	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
28	نعم، الشرطة والأمن الخاص متواجدين منذ الصباح.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
29	ممتاز، هيك بنلعب مرتاحين.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
30	صحيح، نحرص دائماً على راحتكم كلاعبين.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
31	هل في أماكن مخصصة للإحماء قبل المباراة؟	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
32	نعم، جهزنا منطقة خلف المرميين.	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	30	40
33	جميل. هل راح يتم فحص أرضية الملعب قبل دخولنا؟	2025-04-28 10:15:08.131+03	2025-04-28 10:15:08.131+03	40	30
34	طبعاً، حكام المباراة سيفحصون الأرضية قبل ساعتين.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
35	هل تجهيزات الإسعاف جاهزة أيضاً؟	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
36	نعم، يوجد طاقم طبي كامل مع سيارة إسعاف قرب الملعب.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
37	ممتاز، شكراً على التنظيم الرائع.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
38	واجبنا، الأهم سلامتكم.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
39	بالمناسبة، هل في احتفال خاص بعد نهاية المباراة؟	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
40	نعم، حفل بسيط للفريق الفائز.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
41	متحمس! إن شاء الله نكون الفريق اللي يحتفل.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
42	بالتوفيق لكم جميعاً.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
43	شكراً لك، نشوفك غداً قبل المباراة.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
44	إن شاء الله، الملعب رح يكون مفتوح قبل ساعتين.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
45	تمام، رح أكون هناك باكراً للإحماء.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
46	رح نجهز كل شيء قبل وصولكم.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
47	يعطيكم العافية على جهودكم.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
48	الله يعافيك، أهم شي تلعبوا براحة وتركيز.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
49	بإذن الله. خلينا نختم المحادثة ونركز.	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	40	30
50	تمام، بالتوفيق بالمباراة!	2025-04-28 10:15:08.132+03	2025-04-28 10:15:08.132+03	30	40
53	السلام عيلكم	2025-05-03 11:05:42.17+03	2025-05-03 11:05:42.17+03	17	23
54	كيف اخبارك	2025-05-03 11:05:56.664+03	2025-05-03 11:05:56.664+03	22	23
55	كيف الوضع	2025-05-03 11:58:00.302+03	2025-05-03 11:58:00.302+03	18	38
56	المباريات كانت منيحة؟	2025-05-03 11:58:19.638+03	2025-05-03 11:58:19.638+03	20	38
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: balanty
--

COPY public.users (id, username, phone, email, password, role, "createdAt", "updatedAt") FROM stdin;
17	Erling Haaland	0255442362	ErlingHaaland@gmail.com	$2b$10$0xhxIhfgTP3eFHKAMbt9I.MeVV4V1IAhp4yjqZO2Imrix0T7r5lUe	player	2025-04-27 09:47:57.588+03	2025-04-27 09:47:57.588+03
20	Ansu Fati	0144775563	AnsuFati@gmail.com	$2b$10$tTcgKf.ii3Pev/t89UEAO.r/G9Ah83oDZ298gHVLkL.Wem.K0iPr6	player	2025-04-27 11:14:22.508+03	2025-04-27 11:14:22.508+03
21	Eduardo Camavinga	0566853254	EduardoCamavinga@gmail.com	$2b$10$FGFstneJ/7z6Ay6yTp4e6uZ/Ydp7zmK5Gk8QwHLHkcv.avTGe7W.W	player	2025-04-27 11:15:57.544+03	2025-04-27 11:15:57.544+03
22	Ashraf Ali	0366587445	AshrafAli@gmail.com	$2b$10$RBjqLGnGh1Bc8ySCpC0gseHopI3zvxKmmfrDYyeNrQXfYSg2wyTQm	player	2025-04-27 11:16:41.42+03	2025-04-27 11:16:41.42+03
23	Mohammed Adnan	0599565528	MohammedAdnan@gmail.com	$2b$10$6ixaQSoV0Q9k6xtmYOOwGuUBBT3YW1yakh026cCJBuc7.jmoznuu6	player	2025-04-27 11:17:16.086+03	2025-04-27 11:17:16.086+03
24	Pedri	0982335512	Pedri@gmail.com	$2b$10$D9d9GISnANmrPMobSG2bIu2bZ4C47PxHK8tRAWdlkEUuj2vg2VQwG	player	2025-04-27 11:17:54.467+03	2025-04-27 11:17:54.467+03
25	Kevin De Bruyne	0721323525	KevinDeBruyne@gmail.com	$2b$10$5qo4VfKqGPS5aXJrctrdDuYDgkpzfGcOyXZljvu7Ac2saCh2/d7H6	player	2025-04-27 11:18:29.545+03	2025-04-27 11:18:29.545+03
26	Rasmus Højlund	0882355532	RasmusHojlund@gmail.com	$2b$10$Wsc5wGOtLvsIZ.UNzM5AnuLt8.xaR9Mjw2dp1s6jL2.SnnEnEub2S	player	2025-04-27 11:19:09.375+03	2025-04-27 11:19:09.375+03
27	Alejandro Garnacho\t	9772355523	AlejandroGarnacho@gmail.com	$2b$10$bmIjJ0FK4Q08jKrSERMMqO7v.dA/jIPFCU9F..CrAuIr/OTFweC7W	player	2025-04-27 11:19:40.266+03	2025-04-27 11:19:40.266+03
28	Gavi	8342312352	Gavi@gmail.com	$2b$10$PCCd3Oa45NDgkrmrkMuXqeBKZLI9H/VJ/GcEyCk2udeGAH815zu8K	player	2025-04-27 11:20:50.188+03	2025-04-27 11:20:50.188+03
29	Vinícius Jr.\t	0888832412	ViniciusJr@gmail.com	$2b$10$j/H/LewCQTj3PEjCZ.EDWuce5ztCcgTlb9/3NB4L8BF90Wu.BUutW	player	2025-04-27 11:22:09.085+03	2025-04-27 11:22:09.085+03
30	Phil Foden	0598827535	PhilFoden@gmail.com	$2b$10$4k4.ZmRuOGpGYz9Id3HyJ.Azq9CWdE.45RHIaLX6mfT2ibuLsVvRG	player	2025-04-27 11:23:35.711+03	2025-04-27 11:23:35.711+03
18	ملعب خدمات النصيرات	0133665748	amhmm@gmail.com	$2b$10$9zIV6Ykzd44JzsRRFwdzo.Oshm57TWgAD/rdC.B.KnBUb.geChowq	stadium	2025-04-27 09:50:27.321+03	2025-04-27 09:50:27.321+03
19	ملعب فلسطين الرياضي	0123233655	abbsdlf@gmail.com	$2b$10$EgBGGbZx9b73sxxqgXiKguTuQMJx44HdyygrKY2iwzXXVWaHasF2i	stadium	2025-04-27 10:43:26.779+03	2025-04-27 10:43:26.779+03
31	ملعب الشجاعية	0592152363	Rafah@gmail.com	$2b$10$A8Y8xNU/LwO8UjJlbj1BtuS.ybFncOB.ZcHnatwtSnr1920khHUFO	stadium	2025-04-27 12:11:26.659+03	2025-04-27 12:11:26.659+03
32	ملعب نادي الهلال	0598762343	Fallogh@gmail.com	$2b$10$Qd5QfxmSv1Om3Yzl7zmteemP8wh/znH08CiMPdbm57vR81vwRmfHW	stadium	2025-04-27 12:12:21.468+03	2025-04-27 12:12:21.468+03
33	ملعب خدمات رفح	0592363623	Sahade@gmail.com	$2b$10$DN0phiJzocoRnn68kZbQOOFEEg1eUF18tBgLd.XfYHVrvN8gjVTHO	stadium	2025-04-27 12:13:00.896+03	2025-04-27 12:13:00.896+03
34	ملعب الصداقة\t	0598652132	alathad@gmail.com	$2b$10$TDulnhZsCVfzlQ9NUpSBBOGpUAHSVGT1W..EQq/zHMtf88pj3Hq8e	stadium	2025-04-27 12:14:03.066+03	2025-04-27 12:14:03.066+03
35	ملعب نادي المغازي\t	0598332355	AlslamdStamtul@gmail.com	$2b$10$rY0IZxX5Es.l/qOJaeYgEeS.p.y6WXTqCcjoC8v3dgxkgnvUNvHT6	stadium	2025-04-27 12:14:49.846+03	2025-04-27 12:14:49.846+03
36	ملعب اتحاد دير البلح\t	0596633255	JabaliaServices@gmail.com	$2b$10$7wAYrZBMEL.3HKyLbkEQmeioMy/05PwcBcQw9Ho9.eoqipxr.Aovu	stadium	2025-04-27 12:15:59.799+03	2025-04-27 12:15:59.799+03
39	ملعب نادي الزيتون\t	0598563323	Al-HaraClubStadium@gmail.com	$2b$10$WPVTA39BZafCEJe9v4XUdOonHRVfkjbMHx3l7400eDV5/rCXYsRKC	stadium	2025-04-27 12:19:30.672+03	2025-04-27 12:19:30.672+03
37	ملعب بيت لاهيا\t	0598886552	BeitLahiaServices@gmail.com	$2b$10$OYtkc4gOog4wAOqZ.TgGneeW7GvxWQiJwjoHgsjTpws6wLSEzmNYa	stadium	2025-04-27 12:17:40.435+03	2025-04-27 12:17:40.435+03
40	ملعب نادي جباليا النزلة\t	0563325523	JabaliaCampClubStadium@gmail.com	$2b$10$e4UehRfW/SveDN1YW7mfIuUQqLN9bEhPWWNMakYoPqVfB6HRJlD5.	stadium	2025-04-27 12:20:37.997+03	2025-04-27 12:20:37.997+03
38	ملعب شباب خانيونس	0598663552	StadiumKhanYunis@gmail.com	$2b$10$/UhcFavOcVslV2Iu0RnaguQVqDfHmarCTIkmruTwW4xLdeC7WP87K	stadium	2025-04-27 12:18:44.405+03	2025-04-27 12:18:44.405+03
\.


--
-- Name: gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.gallery_id_seq', 76, true);


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.matches_id_seq', 23, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.messages_id_seq', 197, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.players_id_seq', 16, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.reviews_id_seq', 16, true);


--
-- Name: stadiums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.stadiums_id_seq', 24, true);


--
-- Name: usermessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.usermessage_id_seq', 56, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: balanty
--

SELECT pg_catalog.setval('public.users_id_seq', 40, true);


--
-- Name: MatchPlayer MatchPlayer_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public."MatchPlayer"
    ADD CONSTRAINT "MatchPlayer_pkey" PRIMARY KEY ("userId", "matchId");


--
-- Name: gallery gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: stadiums stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY (id);


--
-- Name: usermessage usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: MatchPlayer MatchPlayer_matchId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public."MatchPlayer"
    ADD CONSTRAINT "MatchPlayer_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES public.matches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MatchPlayer MatchPlayer_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public."MatchPlayer"
    ADD CONSTRAINT "MatchPlayer_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: gallery gallery_StadiumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT "gallery_StadiumId_fkey" FOREIGN KEY ("StadiumId") REFERENCES public.stadiums(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: gallery gallery_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT "gallery_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: matches matches_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: matches matches_stadiumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messages messages_MatchId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_MatchId_fkey" FOREIGN KEY ("MatchId") REFERENCES public.matches(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messages messages_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: players players_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "players_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_playerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_stadiumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stadiums stadiums_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT "stadiums_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usermessage usermessage_FromID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT "usermessage_FromID_fkey" FOREIGN KEY ("FromID") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usermessage usermessage_ToID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balanty
--

ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT "usermessage_ToID_fkey" FOREIGN KEY ("ToID") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

