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


CREATE TABLE tableros.snvs (
	ideventocaso integer NOT NULL,
	sexo character(2) NULL,
	edad_actual integer NULL,
    fecha_apertura date NOT NULL,
	departamento_residencia character varying(255) NULL,
	clasif_resumen character varying(255) NULL
);

ALTER TABLE tableros.snvs OWNER TO dashboarduser;
ALTER TABLE ONLY tableros.snvs ADD CONSTRAINT id_evento_caso_covid PRIMARY KEY (ideventocaso);
CREATE INDEX snvs_clasif_resumen_idx ON tableros.snvs USING btree (clasif_resumen);
CREATE INDEX snvs_edad_actual_idx ON tableros.snvs USING btree (edad_actual);
CREATE INDEX snvs_departamento_residencia_idx ON tableros.snvs USING btree (departamento_residencia);
CREATE INDEX snvs_sexo_idx ON tableros.snvs USING btree (sexo);
