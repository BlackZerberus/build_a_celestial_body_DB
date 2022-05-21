--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    number_of_stars integer,
    number_of_planets integer,
    type text,
    is_earth_there boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,1),
    surface_temp_in_K integer,
    hours_per_day integer,
    has_liquid_water boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,1),
    number_of_moons integer,
    surface_temp_in_k integer,
    has_liquid_water boolean,
    has_oxigen boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    number_of_planets integer,
    surface_temp integer,
    become_black_hole boolean,
    is_bigger_than_sun boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Big and brilliant');
INSERT INTO public.comet VALUES (2, 'Hale Bopp', 'a big one too');
INSERT INTO public.comet VALUES (3, 'Tempel 1', 'Jupiter-family-comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'our galaxy', 13.6, 400, 6000, 'barred spiral', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'our neighbor', 10.0, 1000, 100000, 'SA', false, false);
INSERT INTO public.galaxy VALUES (3, 'NGC 5128', 'Centaurus A', NULL, NULL, NULL, 'Lenticular', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 4038/NGC 4039', 'Antennae Galaxies', NULL, NULL, NULL, 'SB', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 4826', 'Black Eye Galaxy', NULL, NULL, NULL, '(R)SA(rs)ab', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 4254', 'Messier 99', NULL, NULL, NULL, ' SA(s)c', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'our satellite', 4.5, 380, NULL, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'mars moon', 4503.0, 233, NULL, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'mars moon', 4503.0, 233, NULL, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter moon', 4503.0, 125, NULL, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Jupiter moon', 4503.0, 110, NULL, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter moon', 4503.0, 134, NULL, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter moon', 4503.0, 132, NULL, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Amaltea', 'Jupiter moon', 4503.0, 103, NULL, false, false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Jupiter moon', 4503.0, 111, NULL, false, false, 5);
INSERT INTO public.moon VALUES (10, 'Valetudo', 'Jupiter moon', 4503.0, 90, NULL, false, false, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'Saturn moon', 4503.0, 93, NULL, false, true, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Saturn moon', 4503.0, 75, NULL, true, true, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Saturn moon', 4503.0, 64, NULL, false, true, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Saturn moon', 4503.0, 86, NULL, false, true, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Saturn moon', 4503.0, 110, NULL, false, true, 6);
INSERT INTO public.moon VALUES (16, 'Dione', 'Saturn moon', 4503.0, 110, NULL, false, true, 6);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Saturn moon', 4503.0, 100, NULL, false, true, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Saturn moon', 4503.0, 110, NULL, false, true, 6);
INSERT INTO public.moon VALUES (19, 'Titania', 'Uranus moon', 4503.0, 90, NULL, false, true, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Uranus moon', 4503.0, 87, NULL, false, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'first', 4503.0, 0, 440, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'second', 4503.0, 0, 737, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'third', 4543.0, 1, 287, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'fourth', 4603.0, 2, 227, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'fifth', 4603.0, 79, 152, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'sixth', 4503.0, 82, 143, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'seventh', 4503.0, 27, 68, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'eigth', 4503.0, 14, 53, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'nineth', NULL, 5, 44, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', NULL, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', NULL, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', NULL, NULL, NULL, NULL, false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'our star', 4600.00, 8, 5772, false, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', NULL, NULL, 8000, 3000, true, true, 1);
INSERT INTO public.star VALUES (3, 'Rigel', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Canopus', NULL, 25000.00, NULL, 7400, false, false, 1);
INSERT INTO public.star VALUES (5, 'Arcturus', NULL, 7000.00, NULL, 4286, false, true, 1);
INSERT INTO public.star VALUES (6, 'Upsilon Andromedae', NULL, 3200.00, NULL, 6213, NULL, true, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

