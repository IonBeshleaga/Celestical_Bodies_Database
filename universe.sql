--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(1),
    star_number double precision,
    more_info_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_shperical boolean,
    has_life boolean,
    more_info_id integer,
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    size double precision,
    size_unit character varying(5),
    mass double precision,
    mass_unit character varying(5),
    distance_from_earth double precision,
    distance_unit character varying(5),
    age_in_millions_of_years numeric,
    description text,
    name character varying(20) NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_type character varying(1),
    moon_number integer,
    has_life boolean,
    more_info_id integer,
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
    name character varying(20) NOT NULL,
    class character varying(2),
    planet_number integer,
    more_info_id integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'S', 100000000000, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'S', 4000000000, 9);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'S', 2000000000, 10);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'E', 100000000, 11);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'S', 300000000, 12);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'S', 1500000000, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, false, 22, 8);
INSERT INTO public.moon VALUES (2, 'Phobos', true, false, 23, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', true, false, 24, 3);
INSERT INTO public.moon VALUES (4, 'Triton', true, false, 25, 7);
INSERT INTO public.moon VALUES (5, 'Proteus', false, false, 26, 7);
INSERT INTO public.moon VALUES (6, 'Titania', true, false, 27, 6);
INSERT INTO public.moon VALUES (7, 'Oberon', true, false, 28, 6);
INSERT INTO public.moon VALUES (8, 'Miranda', true, false, 29, 6);
INSERT INTO public.moon VALUES (9, 'Ariel', true, false, 30, 6);
INSERT INTO public.moon VALUES (10, 'Titan', true, false, 31, 5);
INSERT INTO public.moon VALUES (11, 'Enceladus', true, false, 32, 5);
INSERT INTO public.moon VALUES (12, 'Mimas', true, false, 33, 5);
INSERT INTO public.moon VALUES (13, 'Rhea', true, false, 34, 5);
INSERT INTO public.moon VALUES (14, 'Ganymede', true, false, 35, 4);
INSERT INTO public.moon VALUES (15, 'Europa', true, false, 36, 4);
INSERT INTO public.moon VALUES (16, 'Io', true, false, 37, 4);
INSERT INTO public.moon VALUES (17, 'Callisto', true, false, 38, 4);
INSERT INTO public.moon VALUES (18, 'Amalthea', true, false, 39, 4);
INSERT INTO public.moon VALUES (20, 'Himalia', false, false, 41, 4);
INSERT INTO public.moon VALUES (21, 'Adrastea', false, false, 40, 4);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 110000, 'ly', 200000000000, 'Sun', 26500, 'ly', 13600, 'It is our home', 'Milky Way');
INSERT INTO public.more_info VALUES (3, 2.02, 'sun', 2.063e+30, 'kg', 8.6, 'ly', 200, NULL, 'Sirius');
INSERT INTO public.more_info VALUES (4, 2.83, 'sun', 2.185e+30, 'kg', 4.37, 'ly', 6000, NULL, 'Alpha Centauri');
INSERT INTO public.more_info VALUES (5, 2.362, 'sun', 2.135e+30, 'kg', 25.04, 'ly', 455, NULL, 'Vega');
INSERT INTO public.more_info VALUES (6, 680, 'sun', 1.24e+31, 'kg', 550, 'ly', 12, NULL, 'Antares');
INSERT INTO public.more_info VALUES (7, 1180, 'sun', 2e+31, 'kg', 640, 'ly', 8, NULL, 'Betelgeuse');
INSERT INTO public.more_info VALUES (8, 1400000, 'km', 1.989e+30, 'kg', 149600000, 'km', 4600, 'The nearest star', 'Sun');
INSERT INTO public.more_info VALUES (9, 1000000, 'ly', 2500000000000, 'sun', 10000000, 'ly', 13000, NULL, 'Andromeda');
INSERT INTO public.more_info VALUES (10, 750000, 'ly', 1800000000000, 'sun', 8000000, 'ly', 11000, NULL, 'Triangulum');
INSERT INTO public.more_info VALUES (11, 1200000, 'ly', 3200000000000, 'sun', 12000000, 'ly', 15000, NULL, 'Messier 87');
INSERT INTO public.more_info VALUES (12, 500000, 'ly', 1200000000000, 'sun', 5000000, 'ly', 9000, NULL, 'Sombrero');
INSERT INTO public.more_info VALUES (13, 900000, 'ly', 2000000000000, 'sun', 9000000, 'ly', 12000, NULL, 'Whirlpool');
INSERT INTO public.more_info VALUES (14, 4879, 'km', 3.3011e+23, 'kg', 92000000, 'km', 4500, NULL, 'Mercury');
INSERT INTO public.more_info VALUES (15, 12104, 'km', 4.8675e+24, 'kg', 41400000, 'km', 4600, NULL, 'Venus');
INSERT INTO public.more_info VALUES (16, 6779, 'km', 6.4171e+23, 'kg', 78300000, 'km', 4500, NULL, 'Mars');
INSERT INTO public.more_info VALUES (17, 139820, 'km', 1.8982e+27, 'kg', 628730000, 'km', 4500, NULL, 'Jupiter');
INSERT INTO public.more_info VALUES (18, 116460, 'km', 5.6834e+26, 'kg', 1275000000, 'km', 4500, NULL, 'Saturn');
INSERT INTO public.more_info VALUES (19, 50724, 'km', 8.681e+25, 'kg', 2724000000, 'km', 4500, NULL, 'Uranus');
INSERT INTO public.more_info VALUES (20, 49244, 'km', 1.02413e+26, 'kg', 4353000000, 'km', 4500, NULL, 'Neptune');
INSERT INTO public.more_info VALUES (21, 12742, 'km', 5.972e+24, 'kg', 0, 'km', 4500, NULL, 'Earth');
INSERT INTO public.more_info VALUES (22, 3474, 'km', 7.35e+22, 'kg', 384400, 'km', 4500, 'The Earth''s natural satellite.', 'Moon');
INSERT INTO public.more_info VALUES (23, 22.4, 'km', 1.08e+16, 'kg', 9377, 'km', 11, 'One of Mars''s moons.', 'Phobos');
INSERT INTO public.more_info VALUES (24, 12.4, 'km', 1.48e+15, 'kg', 23459, 'km', 11, 'Another moon of Mars.', 'Deimos');
INSERT INTO public.more_info VALUES (25, 2706, 'km', 2.14e+21, 'kg', 354800, 'km', 4500, 'Largest moon of Neptune.', 'Triton');
INSERT INTO public.more_info VALUES (26, 420, 'km', 5.02e+19, 'kg', 117647, 'km', 4500, 'Large irregular moon of Neptune.', 'Proteus');
INSERT INTO public.more_info VALUES (27, 1578, 'km', 3.42e+21, 'kg', 436300, 'km', 4500, 'Largest moon of Uranus.', 'Titania');
INSERT INTO public.more_info VALUES (28, 1523, 'km', 3.01e+21, 'kg', 583500, 'km', 4500, 'Second-largest moon of Uranus.', 'Oberon');
INSERT INTO public.more_info VALUES (29, 472, 'km', 6.41e+19, 'kg', 129900, 'km', 4500, 'Smallest and innermost of Uranus'' five major moons.', 'Miranda');
INSERT INTO public.more_info VALUES (30, 1158, 'km', 1.35e+21, 'kg', 191200, 'km', 4500, 'Fourth-largest of Uranus'' moons.', 'Ariel');
INSERT INTO public.more_info VALUES (31, 5150, 'km', 1.35e+23, 'kg', 1257060, 'km', 4500, 'Largest moon of Saturn and the second-largest natural satellite in the Solar System.', 'Titan');
INSERT INTO public.more_info VALUES (32, 504, 'km', 1.08e+20, 'kg', 238020, 'km', 100, 'Active icy moon of Saturn with geysers of water vapor.', 'Enceladus');
INSERT INTO public.more_info VALUES (33, 396, 'km', 3.75e+19, 'kg', 185539, 'km', 4500, 'Smallest and innermost of Saturn''s major moons.', 'Mimas');
INSERT INTO public.more_info VALUES (34, 1528, 'km', 2.31e+21, 'kg', 527040, 'km', 4500, 'Second-largest moon of Saturn after Titan.', 'Rhea');
INSERT INTO public.more_info VALUES (35, 5262, 'km', 1.4799999999999999e+23, 'kg', 1070400, 'km', 4500, 'Largest moon in the Solar System and the only moon known to have its own magnetic field.', 'Ganymede');
INSERT INTO public.more_info VALUES (36, 3122, 'km', 4.8e+22, 'kg', 671100, 'km', 4500, 'Smooth and icy surface with a possible subsurface ocean.', 'Europa');
INSERT INTO public.more_info VALUES (37, 3643, 'km', 8.94e+22, 'kg', 421800, 'km', 4500, 'Most volcanically active body in the Solar System.', 'Io');
INSERT INTO public.more_info VALUES (38, 4800, 'km', 1.0800000000000001e+23, 'kg', 1882700, 'km', 4500, 'Outermost of the four Galilean moons and the second-largest moon of Jupiter.', 'Callisto');
INSERT INTO public.more_info VALUES (39, 167, 'km', 2.08e+18, 'kg', 181366, 'km', 4500, 'One of the four inner moons of Jupiter and the third-largest.', 'Amalthea');
INSERT INTO public.more_info VALUES (41, 170, 'km', 9.56e+17, 'kg', 11449694, 'km', 4500, 'Irregular-shaped moon and one of the largest of Jupiter''s outer moons.', 'Himalia');
INSERT INTO public.more_info VALUES (40, 20, 'km', 2e+16, 'kg', 129000, 'km', 4500, 'One of the smallest known moons of Jupiter.', 'Adrastea');
INSERT INTO public.more_info VALUES (42, 1400000, 'km', 1.45e+30, 'kg', 1400, 'ly', 1000, 'A star known for hosting the exoplanet WASP-12 b.', 'WASP-12');
INSERT INTO public.more_info VALUES (43, 143000, 'km', 1.48e+29, 'kg', 1200, 'ly', 100, 'A hot Jupiter exoplanet orbiting very close to its host star WASP-12.', 'WASP-12 b');
INSERT INTO public.more_info VALUES (44, 2800000, 'km', 1.8e+30, 'kg', 3800, 'ly', 12000, 'A binary star system with a pulsar and a white dwarf.', 'PSR B1620-26');
INSERT INTO public.more_info VALUES (45, 40000, 'km', 1.8e+25, 'kg', 8000, 'ly', 13000, 'An exoplanet in orbit around the binary star system PSR B1620-26.', 'PSR B1620-26 b');
INSERT INTO public.more_info VALUES (46, 500000, 'km', 7e+28, 'kg', 10.3, 'ly', 11000, 'A red dwarf star located in the Leo constellation.', 'Gliese 436');
INSERT INTO public.more_info VALUES (47, 50000, 'km', 6.8e+23, 'kg', 33.4, 'ly', 12000, 'A hot Neptune exoplanet orbiting the star Gliese 436.', 'Gliese 436 b');
INSERT INTO public.more_info VALUES (48, 1400000, 'km', 5e+28, 'kg', 47.5, 'ly', 10000, 'A binary star system with a gas giant companion.', 'TYC 9486-927-1');
INSERT INTO public.more_info VALUES (49, 50000, 'km', 1.9999999999999998e+23, 'kg', 120, 'ly', 5000, 'A gas giant companion in orbit around TYC 9486-927-1.', '2MASS J2126-8140');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'T', 0, false, 14, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 'T', 0, false, 15, 6);
INSERT INTO public.planet VALUES (3, 'Mars', 'T', 2, false, 16, 6);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'G', 79, false, 17, 6);
INSERT INTO public.planet VALUES (5, 'Saturn', 'G', 83, false, 18, 6);
INSERT INTO public.planet VALUES (6, 'Uranus', 'I', 27, false, 19, 6);
INSERT INTO public.planet VALUES (7, 'Neptune', 'I', 14, false, 20, 6);
INSERT INTO public.planet VALUES (8, 'Earth', 'T', 1, true, 21, 6);
INSERT INTO public.planet VALUES (9, 'WASP-12 b', 'G', 0, false, 43, 8);
INSERT INTO public.planet VALUES (13, 'Gliese 436 b', 'G', 0, false, 47, 10);
INSERT INTO public.planet VALUES (14, '2MASS J2126-8140', 'G', 0, false, 49, 11);
INSERT INTO public.planet VALUES (10, 'PSR B1620-26 b', 'G', 0, false, 45, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'M', NULL, 4, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A', NULL, 5, 1);
INSERT INTO public.star VALUES (4, 'Antares', 'M', NULL, 6, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M', NULL, 7, 1);
INSERT INTO public.star VALUES (6, 'Sun', 'G', 8, 8, 1);
INSERT INTO public.star VALUES (8, 'WASP-12', 'G', 1, 42, 1);
INSERT INTO public.star VALUES (9, 'PSR B1620-26', 'D', 1, 44, 1);
INSERT INTO public.star VALUES (11, 'TYC 9486-927-1', 'L', 1, 48, 1);
INSERT INTO public.star VALUES (1, 'Sirius', 'A', 1, 3, 1);
INSERT INTO public.star VALUES (10, 'Gliese 436', 'M', 1, 46, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_id_seq', 49, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: more_info more_info_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_description_key UNIQUE (description);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: galaxy galaxy_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: moon moon_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


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
-- Name: star star_more_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_more_info_id_fkey FOREIGN KEY (more_info_id) REFERENCES public.more_info(more_info_id);


--
-- PostgreSQL database dump complete
--

