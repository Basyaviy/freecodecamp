--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: creature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creature (
    creature_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_ve boolean,
    planet_id integer
);


ALTER TABLE public.creature OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creature_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creature_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creature_creature_id_seq OWNED BY public.creature.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    radius numeric(10,1),
    is_generated boolean
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    color integer,
    is_half boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    color numeric(10,1),
    is_live boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    color integer,
    desc2 numeric(10,1),
    galaxy_id integer
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
-- Name: creature creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature ALTER COLUMN creature_id SET DEFAULT nextval('public.creature_creature_id_seq'::regclass);


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
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creature VALUES (1, 'Creature 1', NULL, NULL, 3);
INSERT INTO public.creature VALUES (2, 'Creature 2', NULL, NULL, 3);
INSERT INTO public.creature VALUES (3, 'Creature 3', NULL, NULL, 3);
INSERT INTO public.creature VALUES (4, 'Creature 4', NULL, NULL, 3);
INSERT INTO public.creature VALUES (5, 'Creature 5', NULL, NULL, 3);
INSERT INTO public.creature VALUES (6, 'Creature 6', NULL, NULL, 3);
INSERT INTO public.creature VALUES (7, 'Creature 7', NULL, NULL, 3);
INSERT INTO public.creature VALUES (8, 'Creature 8', NULL, NULL, 3);
INSERT INTO public.creature VALUES (9, 'Creature 9', NULL, NULL, 3);
INSERT INTO public.creature VALUES (10, 'Creature 10', NULL, NULL, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', 6, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'galaxy 7', 7, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'galaxy 8', 8, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'galaxy 9', 9, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'galaxy 10', 10, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 'Desc 1', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2', 'Desc 2', NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Moon 3', 'Desc 3', NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'Moon 4', 'Desc 4', NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, 'Moon 5', 'Desc 5', NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, 'Moon 6', 'Desc 6', NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, 'Moon 7', 'Desc 7', NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'Moon 8', 'Desc 8', NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, 'Moon 9', 'Desc 9', NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, 'Moon 10', 'Desc 10', NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, 'Moon 11', 'Desc 11', NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, 'Moon 12', 'Desc 12', NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'Moon 13', 'Desc 13', NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'Moon 14', 'Desc 14', NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, 'Moon 15', 'Desc 15', NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, 'Moon 16', 'Desc 16', NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, 'Moon 17', 'Desc 17', NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, 'Moon 18', 'Desc 18', NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, 'Moon 19', 'Desc 19', NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, 'Moon 20', 'Desc 20', NULL, NULL, 1);
INSERT INTO public.moon VALUES (21, 'Moon 21', 'Desc 21', NULL, NULL, 1);
INSERT INTO public.moon VALUES (22, 'Moon 22', 'Desc 22', NULL, NULL, 1);
INSERT INTO public.moon VALUES (23, 'Moon 23', 'Desc 23', NULL, NULL, 1);
INSERT INTO public.moon VALUES (24, 'Moon 24', 'Desc 24', NULL, NULL, 1);
INSERT INTO public.moon VALUES (25, 'Moon 25', 'Desc 25', NULL, NULL, 1);
INSERT INTO public.moon VALUES (26, 'Moon 26', 'Desc 26', NULL, NULL, 1);
INSERT INTO public.moon VALUES (27, 'Moon 27', 'Desc 27', NULL, NULL, 1);
INSERT INTO public.moon VALUES (28, 'Moon 28', 'Desc 28', NULL, NULL, 1);
INSERT INTO public.moon VALUES (29, 'Moon 29', 'Desc 29', NULL, NULL, 1);
INSERT INTO public.moon VALUES (30, 'Moon 30', 'Desc 30', NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Planet 2', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Planet 3', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Planet 4', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Planet 5', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Planet 6', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Planet 7', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Planet 8', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Planet 9', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Planet 10', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Planet 11', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Planet 12', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Planet 13', NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 'Desc 1', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Star 2', 'Desc 2', NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Star 3', 'Desc 3', NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Star 4', 'Desc 4', NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Star 5', 'Desc 5', NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Star 6', 'Desc 6', NULL, NULL, 6);
INSERT INTO public.star VALUES (7, 'Star 7', 'Desc 7', NULL, NULL, 7);
INSERT INTO public.star VALUES (8, 'Star 8', 'Desc 8', NULL, NULL, 8);
INSERT INTO public.star VALUES (9, 'Star 9', 'Desc 9', NULL, NULL, 9);
INSERT INTO public.star VALUES (10, 'Star 10', 'Desc 10', NULL, NULL, 10);


--
-- Name: creature_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creature_creature_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (creature_id);


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
-- Name: creature nn_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT nn_name UNIQUE (name);


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
-- Name: galaxy un_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT un_age UNIQUE (age);


--
-- Name: moon uq_desc; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_desc UNIQUE (description);


--
-- Name: star uq_desc_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_desc_star UNIQUE (description);


--
-- Name: creature creature_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

