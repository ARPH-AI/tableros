ALTER TABLE tableros.snvs
ALTER COLUMN ideventocaso TYPE integer USING ideventocaso::integer,
ALTER COLUMN sexo TYPE character(2),
ALTER COLUMN fecha_apertura TYPE date USING to_date(fecha_apertura, 'DD/MM/YYYY'),
ALTER COLUMN edad_actual TYPE smallint USING edad_actual::smallint;


--
-- Name: snvs_clasificacion_resumen_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_clasif_resumen_idx ON tableros.snvs USING btree (clasif_resumen);


--
-- Name: snvs_edad_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_edad_actual_idx ON tableros.snvs USING btree (edad_actual);


--
-- Name: snvs_fecha_apertura_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_fecha_apertura_idx ON tableros.snvs USING btree (fecha_apertura);



--
-- Name: snvs_residencia_provincia_nombre_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_provincia_residencia_idx ON tableros.snvs USING btree (provincia_residencia);


--
-- Name: snvs_sexo_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--

CREATE INDEX snvs_sexo_idx ON tableros.snvs USING btree (sexo);


--
-- Name: snvs_sexo_idx; Type: INDEX; Schema: tableros; Owner: dashboarduser
--
CREATE INDEX snvs_ideventocaso_idx ON tableros.snvs USING btree (ideventocaso);
