--
-- PostgreSQL tableros database schema dump
--

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
-- Name: tableros; Type: SCHEMA; Schema: -; Owner: dashboarduser
--

CREATE SCHEMA tableros;

ALTER SCHEMA tableros OWNER TO dashboarduser;

SET default_tablespace = '';

--
-- Name: cie_10; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.cie_10 (
    id integer NOT NULL,
    codigo_cie character varying(6) NOT NULL,
    descripcion character varying(250) NOT NULL
);

ALTER TABLE tableros.cie_10 OWNER TO dashboarduser;

--
-- Name: termino_variable; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.termino_variable (
    id integer NOT NULL,
    concepto character varying(255) NOT NULL,
    perf_term character varying(255) NOT NULL,
    id_snomed character varying(255) NOT NULL,
    id_variable_tipo integer NOT NULL
);


ALTER TABLE tableros.termino_variable OWNER TO dashboarduser;

--
-- Name: variable_tipo; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.variable_tipo (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE tableros.variable_tipo OWNER TO dashboarduser;

--
-- Name: semana_epidemiologica; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.semana_epidemiologica (
    id integer NOT NULL,
    nombre_semana character varying(255) NOT NULL,
    numero_semana integer NOT NULL,
    anio integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE tableros.semana_epidemiologica OWNER TO dashboarduser;


--
-- Name: grupo_edad; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.grupo_edad (
    id smallint NOT NULL,
    descripcion character(8) NOT NULL
);


ALTER TABLE tableros.grupo_edad OWNER TO dashboarduser;

--
-- Name: grupo_edad_nueva; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.grupo_edad_nueva (
    id smallint NOT NULL,
    descripcion character(8) NOT NULL
);


ALTER TABLE tableros.grupo_edad_nueva OWNER TO dashboarduser;

--
-- Name: map_coordinates; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.map_coordinates (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    importance double precision,
    type character varying(50),
    attempts integer
);


ALTER TABLE tableros.map_coordinates OWNER TO dashboarduser;


--
-- Name: snvs; Type: TABLE; Schema: tableros; Owner: dashboarduser
--

CREATE TABLE tableros.snvs (
    id_evento_caso integer,
    sexo character(2),
    edad smallint,
    edad_anios_meses character(10),
    residencia_pais_nombre character(20),
    residencia_provincia_nombre character(20),
    residencia_departamento_nombre character(30),
    carga_provincia_nombre character(30),
    fecha_inicio_sintomas date,
    fecha_apertura date,
    sepi_apertura character(20),
    fecha_internacion character(10),
    cuidado_intensivo character(20),
    fecha_cui_intensivo character(10),
    fallecido character(8),
    fecha_fallecimiento character(10),
    asistencia_respiratoria_mecanica character(6),
    carga_provincia_id character(6),
    origen_financiamiento character(15),
    clasificacion character(200),
    clasificacion_resumen character(200),
    residencia_provincia_id character(15),
    fecha_diagnostico character(15),
    residencia_departamento_id character(15),
    ultima_actualizacion character(15)
);


ALTER TABLE tableros.snvs OWNER TO dashboarduser;


--
-- Name: cie_10 id_cie_10; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.cie_10
    ADD CONSTRAINT id_cie_10 PRIMARY KEY (id);


--
-- Name: grupo_edad id_grupo_edad; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.grupo_edad
    ADD CONSTRAINT id_grupo_edad PRIMARY KEY (id);

--
-- Name: grupo_edad_nueva id_grupo_edad_nueva; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.grupo_edad_nueva
    ADD CONSTRAINT id_grupo_edad_nueva PRIMARY KEY (id);


--
-- Name: semana_epidemiologica id_semana_epidemiologica; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.semana_epidemiologica
    ADD CONSTRAINT id_semana_epidemiologica PRIMARY KEY (id);


--
-- Name: termino_variable id_termino_variable; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.termino_variable
    ADD CONSTRAINT id_termino_variable PRIMARY KEY (id);


--
-- Name: variable_tipo id_variable_tipo; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.variable_tipo
    ADD CONSTRAINT id_variable_tipo PRIMARY KEY (id);


--
-- Name: map_coordinates map_coordinates_pkey; Type: CONSTRAINT; Schema: tableros; Owner: dashboarduser
--

ALTER TABLE ONLY tableros.map_coordinates
    ADD CONSTRAINT map_coordinates_pkey PRIMARY KEY (id);


--
-- Name: snvs_clasificacion_resumen_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_clasificacion_resumen_idx ON tableros.snvs USING btree (clasificacion_resumen);


--
-- Name: snvs_edad_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_edad_idx ON tableros.snvs USING btree (edad);


--
-- Name: snvs_fecha_apertura_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_fecha_apertura_idx ON tableros.snvs USING btree (fecha_apertura);


--
-- Name: snvs_fecha_inicio_sintomas_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_fecha_inicio_sintomas_idx ON tableros.snvs USING btree (fecha_inicio_sintomas);


--
-- Name: snvs_residencia_provincia_nombre_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_residencia_provincia_nombre_idx ON tableros.snvs USING btree (residencia_provincia_nombre);


--
-- Name: snvs_sexo_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_sexo_idx ON tableros.snvs USING btree (sexo);


--
-- Name: SCHEMA tableros; Type: ACL; Schema: -; Owner: dashboarduser
--

GRANT ALL ON SCHEMA tableros TO dashboarduser;

--
-- Name: SCHEMA tableros; Type: ACL; Schema: -; Owner: dashboarduser
--

GRANT ALL ON SCHEMA tableros TO dashboarduser;
