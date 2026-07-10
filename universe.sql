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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type_id integer NOT NULL,
    diameter_in_ly numrange NOT NULL,
    quantity_stars_billions numrange NOT NULL,
    distance_earth_ly integer NOT NULL,
    age_years_billions numeric NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km numeric,
    distance_earth_au numeric NOT NULL,
    age_years_billions numeric NOT NULL,
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
    name character varying(30) NOT NULL,
    description text,
    planet_type_id integer NOT NULL,
    diameter_in_km numeric,
    quantity_of_moons integer,
    distance_earth_au numeric NOT NULL,
    age_years_billions numeric NOT NULL,
    is_inhabitable boolean NOT NULL,
    has_rings boolean NOT NULL,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_type_id integer NOT NULL,
    diameter_km_millions numeric NOT NULL,
    quantity_orbiting_bodies integer,
    distance_earth_au numeric NOT NULL,
    age_years_billions numeric NOT NULL,
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    avg_lifespan_years_millions character varying(30) NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy. It features a central bar-shaped structure of stars surrounded by a disk of major spiral arms where our solar system resides.', 1, '[100000,120000]', '[100,400]', 26000, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda(M31)', 'The closest major galaxy to the Milky Way and the largest in our Local Group. It is on a gravitational collision course with our galaxy in about 4.5 billion years.', 1, '[150000,155000]', '[1000,1000]', 2500000, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'The third-largest member of the Local Group. It is a classic "unbarred" spiral galaxy known for intense star-forming regions like the massive nebula NGC 604.', 1, '[60000,60000]', '[40,40]', 3000000, 11);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy (M104)', 'Famous for its striking appearance, it features an unusually large, bright central stellar bulge surrounded by a sharp, thick lane of dark cosmic dust.', 2, '[50000,50000]', '[800,800]', 30000000, 11);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A (NGC 5128)', 'One of the closest active radio galaxies to Earth. It is famous for a massive dark dust lane slicing across its center, a byproduct of a recent collision with a smaller spiral galaxy.', 3, '[91000,91000]', '[100,100]', 12000000, 12);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud (LMC)', 'A bright satellite galaxy orbiting the Milky Way. Though disrupted into an irregular shape by our gravity, it still maintains a distinct central stellar bar.', 4, '[32000,32000]', '[20,30]', 163000, 13);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Flat, rotating disks with a dense central bulge and glowing ""arms"" that wrap outward. These are high-energy factories. Packed with gas and dust, triggering a constant spark of new star formation. Some have a straight bar of stars cutting through the center (called Barred Spirals).');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Smooth, featureless shapes ranging from perfect spheres to elongated footballs. These are cosmic retirement homes. Contain very little gas or dust, meaning star formation has completely stopped. They are dominated by incredibly old, yellow-red stars.');
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', 'A lens-like hybrid shape. They have a flat disk and a central bulge like a spiral, but absolutely no spiral arms. Caught in the middle. They keep the disk structure of a spiral but have run out of the raw gas needed to make new stars, leaving them quiet and dim.');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'Chaotic, distorted, and completely lacking any symmetrical structure or central bulge. Pure turbulence. These are often smaller galaxies rich in gas and intensely active in star birth, frequently deformed by the immense gravtiational pull of a larger neighbouring galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '
The Moon', 'Our own natural satellite; stabilizes Earth''s axial tilt and drives our ocean tides.', 3474, 0.0026, 4.5, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A tiny, heavily cratered, potato-shaped moon; it orbits so close to Mars that it is slowly spiraling inward.', 22.2, 0.52, 4.5, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of the two Martian moons; it has a smooth appearance due to a thick coating of loose dust and debris.', 12.6, 0.52, 4.5, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active world in our solar system, boasting hundreds of active volcanoes erupting lava fountains miles high.', 3643, 4.20, 4.5, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Features a smooth, cracked ice shell hiding a vast global subsurface liquid water ocean that holds twice the water of Earth''s oceans.', 3122, 4.20, 4.5, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system (bigger than the planet Mercury) and the only moon known to possess its own magnetic field.', 5268, 4.2, 4.5, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'An icy, ancient world with the most heavily cratered surface of any known object in our solar system.', 4821, 4.2, 4.5, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Famously resembles the "Death Star" from pop culture due to the giant, gaping Herschel Crater scarring its surface.', 396, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A small icy world that actively sprays massive plumes of water vapor and organic material into space from warm fissures in its south pole.', 504, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'A highly reflective, frozen moon dominated by a massive trench system (Ithaca Chasma) that stretches across three-quarters of its circumference.', 1062, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Features heavily cratered terrain alongside bright, sweeping ice cliffs created by ancient tectonic fracturing.', 1122, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'An intensely cratered, airless ball of rock and ice; it is the second-largest moon of Saturn.', 1527, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 'The only moon in the solar system with a dense, nitrogen-rich atmosphere and stable liquid lakes (composed of liquid methane and ethane) on its surface.', 5150, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Known for its stark "yin-and-yang" appearance—one hemisphere is pitch black while the other is brilliant white ice—and a massive ridge that rings its equator.', 1470, 8.5, 4.5, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Possesses a chaotic, patchwork landscape featuring some of the deepest, most extreme canyon systems and cliffs in the solar system.', 470, 18.2, 4.5, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'The brightest moon orbiting Uranus; its surface is crisscrossed by sweeping valley networks and faults.', 1158, 18.2, 4.5, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'The darkest of Uranus''s large moons, reflecting less than half the light of Ariel, heavily scarred by old impacts.', 1169, 18.20, 4.5, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'The largest moon of Uranus, featuring massive fault lines and valleys where liquid water may have once seeped out and frozen.', 1578, 18.2, 4.5, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'The outermost large moon of Uranus; its old, dark, cratered crust shows signs of past volcanic or tectonic flooding.', 1523, 18.2, 4.5, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'A frozen, geologically active moon that orbits Neptune backward (retrograde orbit), proving it was originally a Kuiper Belt object captured by Neptune''s gravity.', 2706, 29, 4.5, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system and closest to the Sun; experiences extreme temperature swings.', 1, 4879, 0, 0.61, 4, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Earth''s "twin" in size, but choked by a runaway greenhouse effect that makes its surface hot enough to melt lead.', 1, 12104, 0, 0.28, 4.5, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet; the only world in the universe known to harbor liquid surface water and life.', 1, 12742, 1, 0, 4.5, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'A cold, dry desert world covered in iron-oxide dust, featuring the largest volcanic systems in the solar system.', 1, 6779, 2, 0.52, 4.5, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system, famous for its colorful bands of gas and a centuries-old storm.', 2, 139820, 95, 4.20, 4.5, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A giant world made mostly of hydrogen and helium, renowned for its spectacular, sprawling ice-and-rock ring system.', 2, 116460, 146, 8.50, 4.5, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'A pale blue-green planet that features a unique, extreme 98-degree tilt, causing it to orbit the Sun completely on its side.', 3, 50724, 28, 18.20, 4.5, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The most distant solar planet; a dark, freezing world swept by supersonic winds up to 2,100 km/h.', 3, 49244, 16, 29, 4.5, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'The closest known exoplanet to Earth. It sits in its star''s habitable zone but faces harsh stellar radiation.', 5, 11990, 0, 268000, 4.8, true, false, 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'An Earth-sized world considered one of the most promising candidates for liquid surface water outside our solar system.', 1, 11736, 0, 2570000, 7.6, true, false, 9);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 'A lightweight rocky world sitting right on the inner edge of its star''s habitable zone; it likely has a very tight, 4-day orbit.', 1, 10000, 0, 2570000, 7.6, true, false, 9);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 'Sits on the outer edge of the habitable zone. It is a bit larger than Earth and could potentially be an ice-covered water world.', 8, 13380, 0, 2570000, 7.6, true, false, 9);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial (Rocky)', 'Worlds made primarily of rock and metal with a solid surface. Dense, small to medium size, often have atmospheres and geological activity.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Massive planets composed mostly of hydrogen and helium gas. No solid surface, deep atmospheres, thick layers of liquid metallic hydrogen inside.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Large planets defined by a mantle of heavier "icy" elements like water, ammonia, and methane. Thick gaseous atmospheres, but their interiors are slushy, high-pressure oceans.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Round worlds that orbit the Sun but share their orbital path with other large debris. Smaller than major planets, chemically identical to terrestrial or icy worlds.');
INSERT INTO public.planet_type VALUES (5, 'Super-Earth', 'Exoplanets that are larger than Earth but significantly smaller than Neptune. Can be rocky, watery, or wrapped in a thick atmosphere; not found in our solar system.');
INSERT INTO public.planet_type VALUES (6, 'Mini-Neptune', 'Gas-dominated exoplanets that are smaller than Neptune but larger than Earth. Thick hydrogen-helium atmospheres with no solid surface; very common in the galaxy.');
INSERT INTO public.planet_type VALUES (7, 'Hot Jupiter', 'Gas giants that orbit incredibly close to their parent stars. Scorching temperatures, orbital periods lasting only a few days, violently active atmospheres.');
INSERT INTO public.planet_type VALUES (8, 'Ocean World', 'Planets whose surfaces are entirely covered by deep liquid oceans, or have subsurface oceans. Can be warm global seas or deep water layers locked beneath miles of surface ice.');
INSERT INTO public.planet_type VALUES (10, 'Rogue Planet', 'Cosmic orphans that float through interstellar space without orbiting any star. Ejected from their home star systems during early formation; dark and frozen.');
INSERT INTO public.planet_type VALUES (9, 'Lava Planet', 'Rocky worlds orbiting so close to their star that their surfaces are permanently molten. Extreme heat, literal oceans of liquid magma, and rock vaporized into "stone rain."');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun (Sol)', 'Our home star; accounts for 99.8% of all the mass in our Solar System.', 2, 1.3927, 8, 1, 4.6, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest star to our Sun. It is small, dim, and prone to violent flare activity.', 1, 0.215, 3, 268000, 4.8, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'The brightest star in Earth''s night sky, paired with a tiny white dwarf companion (Sirius B).', 3, 2.38, 1, 550000, 0.24, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'A fast-spinning star anchor in the northern sky; used historically as a baseline for measuring stellar brightness.', 3, 3.84, 0, 1580000, 0.455, 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 'An aging star moving past its main sequence. It is the brightest star in the northern celestial hemisphere.', 4, 35.4, 0, 2320000, 7.1, 1);
INSERT INTO public.star VALUES (6, 'Capella A', 'Part of a quadruple star system; it is a giant star that has exhausted its core hydrogen.', 4, 16.7, 0, 2710000, 0.65, 1);
INSERT INTO public.star VALUES (7, 'Rigel', 'The luminous left ""foot"" of Orion. It shines with the power of roughly 120,000 Suns.', 6, 110, 3, 54500000, 0.008, 1);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'A colossal, pulsing star marking Orion''s right shoulder. It is destined to end in a brilliant supernova.', 5, 1200, 1, 45800000, 0.01, 1);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 'A tiny, dim star famous for hosting seven Earth-sized rocky planets, several of which sit in its habitable zone.', 1, 0.168, 7, 2570000, 7.6, 1);
INSERT INTO public.star VALUES (10, 'UY Scuti', 'One of the largest known stars by volume. If placed in our solar system, it would engulf everything out to Saturn.', 5, 2400, 0, 600000000, 0.02, 1);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Red Dwarf', 'Smallest, coolest, and most abundant stars; burn fuel incredibly slowly.', 'Trillions');
INSERT INTO public.star_type VALUES (2, 'Yellow Dwarf', 'Medium-sized, stable stars with a moderate surface temperature.', '~10 Billion');
INSERT INTO public.star_type VALUES (3, 'Blue Giant', 'Massive, intensely hot, and highly luminous; burn through fuel rapidly.', 'Millions');
INSERT INTO public.star_type VALUES (4, 'Red Giant', 'Cooler, vastly expanded outer layers; formed when medium stars exhaust core hydrogen.', '~100 Million');
INSERT INTO public.star_type VALUES (5, 'Red Supergiant', 'Largest stars by volume; highly unstable evolutionary phase of high-mass stars.', 'A few million');
INSERT INTO public.star_type VALUES (6, 'Blue Supergiant', 'Extremely luminous and hot; a brief, active stage of a massive star''s late life.', 'A few million');
INSERT INTO public.star_type VALUES (7, 'White Dwarf', 'Earth-sized, highly dense carbon core leftover from a dead medium-sized star.', 'Trillions');
INSERT INTO public.star_type VALUES (8, 'Neutron Star', 'City-sized, ultra-dense core left after a massive supernova collapse.', 'Indefinite');
INSERT INTO public.star_type VALUES (9, 'Stellar Black Hole', 'Ultimate gravity well left behind when the most massive star cores collapse.', 'Indefinite');
INSERT INTO public.star_type VALUES (10, 'Brown Dwarf', 'Too large to be a planet, but lacks the mass to ignite true nuclear fusion. Classified as a ""failed star"".', 'Indefinite');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 1, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_types_galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_types_planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_planet_type_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_types_star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_star_type_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
-- Name: star star_star_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

