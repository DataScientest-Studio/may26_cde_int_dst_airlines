--
-- PostgreSQL database dump
--

\restrict ORqfFx0I9ZQ4LvobaWniuad2ZHSLhgjTPgdA4tXtIiXtvf9x7RJU6GHXZfYp5oU

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-10 13:27:31

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
-- TOC entry 220 (class 1259 OID 46833)
-- Name: airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airlines (
    id text NOT NULL,
    fleet_average_age text,
    airline_id text,
    callsign text,
    hub_code text,
    iata_code text,
    icao_code text,
    country_iso2 text,
    date_founded text,
    iata_prefix_accounting text,
    airline_name text,
    country_name text,
    fleet_size text,
    status text,
    type text
);


ALTER TABLE public.airlines OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 46825)
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    id text NOT NULL,
    gmt text,
    airport_id text,
    iata_code text,
    city_iata_code text,
    icao_code text,
    country_iso2 text,
    geoname_id text,
    latitude text,
    longitude text,
    airport_name text,
    country_name text,
    phone_number text,
    timezone text
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- TOC entry 4862 (class 2606 OID 46848)
-- Name: airlines airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 46832)
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


-- Completed on 2026-10-10 13:27:31

--
-- PostgreSQL database dump complete
--

\unrestrict ORqfFx0I9ZQ4LvobaWniuad2ZHSLhgjTPgdA4tXtIiXtvf9x7RJU6GHXZfYp5oU

