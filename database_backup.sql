--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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
-- Name: albums; Type: TABLE; Schema: public; Owner: Micah
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.albums OWNER TO "Micah";

--
-- Name: albums_artists; Type: TABLE; Schema: public; Owner: Micah
--

CREATE TABLE public.albums_artists (
    id integer NOT NULL,
    artist_id integer,
    album_id integer
);


ALTER TABLE public.albums_artists OWNER TO "Micah";

--
-- Name: albums_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: Micah
--

CREATE SEQUENCE public.albums_artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_artists_id_seq OWNER TO "Micah";

--
-- Name: albums_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Micah
--

ALTER SEQUENCE public.albums_artists_id_seq OWNED BY public.albums_artists.id;


--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: Micah
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO "Micah";

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Micah
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: Micah
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.artists OWNER TO "Micah";

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: Micah
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO "Micah";

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Micah
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: Micah
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying,
    album_id integer,
    track integer
);


ALTER TABLE public.songs OWNER TO "Micah";

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: Micah
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO "Micah";

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Micah
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: albums_artists id; Type: DEFAULT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.albums_artists ALTER COLUMN id SET DEFAULT nextval('public.albums_artists_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: Micah
--

COPY public.albums (id, name) FROM stdin;
95	Gran Turismo
96	Seeds
98	Life
99	Zebra
100	Moon Safari
101	Paul's Boutique
97	First Band on the Moon
103	Night Wave
\.


--
-- Data for Name: albums_artists; Type: TABLE DATA; Schema: public; Owner: Micah
--

COPY public.albums_artists (id, artist_id, album_id) FROM stdin;
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: Micah
--

COPY public.artists (id, name) FROM stdin;
1	The Cardigans
2	The Cardigans
3	The Cardigans
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: Micah
--

COPY public.songs (id, name, album_id, track) FROM stdin;
140	Your New Cuckoo	97	1
141	Been It	97	2
142	Heartbreaker	97	3
143	Happy Meal II	97	4
144	Never Recover	97	5
145	Step on Me	97	6
146	Lovefool	97	7
147	Losers	97	8
148	Iron Man	97	9
149	Great Divide	97	10
150	Choke	97	11
151	Paralyzed	95	1
152	Erase/Rewind	95	2
153	Explode	95	3
154	Starter	95	4
155	Hanging Around	95	5
156	Higher	95	6
157	Marvel Hill	95	7
158	My Favourite Game	95	8
159	Do You Believe	95	9
160	Junk of the Hearts	95	10
161	Nil	95	11
162	Carnival	98	1
163	Daddy's Car	98	2
164	Fine	98	3
165	Rise & Shine	98	4
166	Our Space	98	5
167	Celia Inside	98	6
168	Over the Water	98	7
169	Tomorrow	98	8
170	Sick & Tired	98	9
171	Beautiful One	98	10
172	Gordon's Gardenparty	98	11
173	Hey! Get Out of My Way	98	12
174	Sabbath Bloody Sabbath	98	13
175	Happy Meal	98	14
176	La femme d'argent	100	1
177	Sexy Boy	100	2
178	All I Need	100	3
179	Kelly Watch the Stars	100	4
180	Talisman	100	5
181	Remember	100	6
182	You Make It Easy	100	7
183	Ce matin là	100	8
184	New Star in the Sky (Chanson pour Solal)	100	9
185	Le voyage de Pénélope	100	10
186	To All the Girls	101	1
187	Shake Your Rump	101	2
188	Johnny Ryall	101	3
189	Egg Man	101	4
190	High Plains Drifter	101	5
191	The Sounds of Science	101	6
192	3-Minute Rule	101	7
193	Hey Ladies	101	8
194	5-Piece Chicken Dinner	101	9
195	Looking Down the Barrel of a Gun	101	10
196	Car Thief	101	11
197	What Comes Around	101	12
198	Shadrach	101	13
199	Ask for Janice	101	14
200	B-Boy Bouillabaisse	101	15
201	Quartz	96	1
202	Careful You	96	2
203	Could You	96	3
204	Happy Idiot	96	4
205	Test Pilot	96	5
206	Love Stained	96	6
207	Ride	96	7
208	Right Now	96	8
209	Winter	96	9
210	Lazerray	96	10
211	Trouble	96	11
212	Seeds	96	12
213	Tell Me What You Want	99	1
214	One More Chance	99	2
215	Slow Down	99	3
216	As I Said Before	99	4
217	Who's Behind the Door?	99	5
218	When You Get There	99	6
219	Take Your Fingers from My Hair	99	7
220	Don't Walk Away	99	8
221	The La La Song	99	9
228	Werk Me	103	1
229	Chrome Pipes	103	2
230	Bad Boyz	103	3
231	Fingers Up	103	4
232	Cheap Thrills	103	5
233	WTF	103	6
234	What Goes Up	103	7
235	Maniac	103	8
236	Chead	103	9
237	Flip the Switch	103	10
238	The Foundation	103	11
\.


--
-- Name: albums_artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Micah
--

SELECT pg_catalog.setval('public.albums_artists_id_seq', 1, false);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Micah
--

SELECT pg_catalog.setval('public.albums_id_seq', 103, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Micah
--

SELECT pg_catalog.setval('public.artists_id_seq', 3, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Micah
--

SELECT pg_catalog.setval('public.songs_id_seq', 239, true);


--
-- Name: albums_artists albums_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.albums_artists
    ADD CONSTRAINT albums_artists_pkey PRIMARY KEY (id);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: Micah
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

