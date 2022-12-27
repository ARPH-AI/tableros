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


CREATE TABLE tableros.snvs_dengue (
	ideventocaso integer NOT NULL,
	sexo character(1) NULL,
	edad_diagnostico integer NULL,
	id_depto_indec_residencia integer NULL,
	departamento_residencia character varying(255) NULL,
	clasificacion_manual character varying(255) NULL,
    fecha_apertura date NOT NULL
);

ALTER TABLE tableros.snvs_dengue OWNER TO dashboarduser;

ALTER TABLE ONLY tableros.snvs_dengue ADD CONSTRAINT id_evento_caso PRIMARY KEY (ideventocaso);

CREATE INDEX snvs_dengue_clasif_manual_idx ON tableros.snvs_dengue USING btree (clasificacion_manual);
CREATE INDEX snvs_dengue_edad_diagnostico_idx ON tableros.snvs_dengue USING btree (edad_diagnostico);
CREATE INDEX snvs_dengue_departamento_residencia_idx ON tableros.snvs_dengue USING btree (departamento_residencia);
CREATE INDEX snvs_dengue_sexo_idx ON tableros.snvs_dengue USING btree (sexo);
