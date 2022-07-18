--
-- PostgreSQL tableros database views dump
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
-- Name: problema_con_covid; Type: VIEW; Schema: tableros; Owner: dashboarduser
--

CREATE VIEW tableros.problema_con_covid AS
  SELECT hc.start_date,
    hc.cie10_codes,
    s.pt,
    s.id,
    s.sctid,
    oc.patient_id,
    p.person_id,
    vt.description,
    oc.id AS id_consulta,
    a.id AS direccion,
    c.description AS ciudad,
    c.id AS id_ciudad,
    vt.id AS tipo_variable_id
  FROM ((((((((((public.outpatient_consultation oc
    JOIN public.document d ON ((oc.document_id = d.id)))
    JOIN public.document_health_condition dhc ON ((dhc.document_id = d.id)))
    JOIN public.health_condition hc ON ((dhc.health_condition_id = hc.id)))
    JOIN public.snomed s ON ((s.id = hc.snomed_id)))
    JOIN tableros.termino_variable tv ON (((tv.id_snomed)::text = (s.sctid)::text)))
    JOIN tableros.variable_tipo vt ON ((vt.id = tv.id_variable_tipo)))
    JOIN public.patient p ON ((p.id = oc.patient_id)))
    LEFT JOIN public.person_extended pe ON ((pe.person_id = p.person_id)))
    LEFT JOIN public.address a ON ((a.id = pe.address_id)))
    LEFT JOIN public.city c ON ((c.id = a.city_id)));

ALTER TABLE tableros.problema_con_covid OWNER TO dashboarduser;

--
-- Name: covid_fecha; Type: VIEW; Schema: tableros; Owner: dashboarduser
--

CREATE VIEW tableros.covid_fecha AS
  SELECT pcc1.start_date,
    pcc1.cie10_codes,
    pcc1.sctid,
    pcc1.description AS variable,
    pcc1.id_consulta,
    pcc1.patient_id,
    pcc1.tipo_variable_id,
    pcc1.person_id,
    se.nombre_semana,
    se.numero_semana,
    se.fecha
  FROM tableros.problema_con_covid pcc1,
    tableros.semana_epidemiologica se
  WHERE ((NOT (EXISTS (SELECT pcc2.id_consulta
          FROM tableros.problema_con_covid pcc2
          WHERE ((pcc1.id_consulta <> pcc2.id_consulta) AND (pcc1.patient_id = pcc2.patient_id) AND ((pcc1.start_date >= pcc2.start_date) AND (pcc1.start_date <= (pcc2.start_date + '14 days'::interval))))))) AND ((se.fecha >= pcc1.start_date) AND (se.fecha <= (pcc1.start_date + '10 days'::interval))));

ALTER TABLE tableros.covid_fecha OWNER TO dashboarduser;

--
-- Name: map_address; Type: VIEW; Schema: tableros; Owner: dashboarduser
--

CREATE VIEW tableros.map_address AS
 SELECT pe.id,
    ad.street,
    ad.number,
    ad.postcode,
    ci.description AS city,
    de.description AS department,
    pr.description AS province,
    co.description AS country
   FROM ((((((public.person pe
     JOIN public.person_extended pee ON ((pe.id = pee.person_id)))
     JOIN public.address ad ON ((pee.address_id = ad.id)))
     JOIN public.city ci ON ((ad.city_id = ci.id)))
     JOIN public.department de ON ((ci.department_id = de.id)))
     JOIN public.province pr ON ((de.province_id = pr.id)))
     JOIN public.country co ON ((pr.country_id = co.id)));


ALTER TABLE tableros.map_address OWNER TO dashboarduser;

--
-- Name: pacientes_con_comorbilidad; Type: VIEW; Schema: tableros; Owner: dashboarduser
--

CREATE VIEW tableros.pacientes_con_comorbilidad AS
 SELECT oc.patient_id,
    t_cie.descripcion AS comorbilidad
   FROM (((((public.outpatient_consultation oc
     JOIN public.document d ON ((oc.document_id = d.id)))
     JOIN public.document_health_condition dhc ON ((dhc.document_id = d.id)))
     JOIN public.health_condition hc ON ((dhc.health_condition_id = hc.id)))
     JOIN public.snomed s ON ((s.id = hc.snomed_id)))
     JOIN public.patient p ON ((p.id = oc.patient_id))),
    tableros.cie_10 t_cie
  WHERE ((t_cie.codigo_cie)::text ~~ (hc.cie10_codes)::text)
  GROUP BY t_cie.descripcion, oc.patient_id;


ALTER TABLE tableros.pacientes_con_comorbilidad OWNER TO dashboarduser;