--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Debian 13.7-1.pgdg110+1)
-- Dumped by pg_dump version 13.7

-- Started on 2022-07-15 20:03:29 UTC

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
-- TOC entry 3821 (class 0 OID 19351)
-- Dependencies: 463
-- Data for Name: cie_10; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.cie_10 (id, codigo_cie, descripcion) FROM stdin;
1	E10.0	Diabetes
2	E10.1	Diabetes
3	E10.2	Diabetes
4	E10.3	Diabetes
5	E10.4	Diabetes
6	E10.5	Diabetes
7	E10.6	Diabetes
8	E10.7	Diabetes
9	E10.8	Diabetes
10	E10.9	Diabetes
11	E11.0	Diabetes
12	E11.1	Diabetes
13	E11.2	Diabetes
14	E11.3	Diabetes
15	E11.4	Diabetes
16	E11.5	Diabetes
17	E11.6	Diabetes
18	E11.7	Diabetes
19	E11.8	Diabetes
20	E11.9	Diabetes
21	E12.0	Diabetes
22	E12.1	Diabetes
23	E12.2	Diabetes
24	E12.3	Diabetes
25	E12.4	Diabetes
26	E12.5	Diabetes
27	E12.6	Diabetes
28	E12.7	Diabetes
29	E12.8	Diabetes
30	E12.9	Diabetes
31	E13.0	Diabetes
32	E13.1	Diabetes
33	E13.2	Diabetes
34	E13.3	Diabetes
35	E13.4	Diabetes
36	E13.5	Diabetes
37	E13.6	Diabetes
38	E13.7	Diabetes
39	E13.8	Diabetes
40	E13.9	Diabetes
41	E14.0	Diabetes
42	E14.1	Diabetes
43	E14.2	Diabetes
44	E14.3	Diabetes
45	E14.4	Diabetes
46	E14.5	Diabetes
47	E14.6	Diabetes
48	E14.7	Diabetes
49	E14.8	Diabetes
50	E14.9	Diabetes
51	J45.0	Asma
52	J45.1	Asma
53	J45.8	Asma
54	J45.9	Asma
55	J46.X	Asma
56	J40.X	EPOC
57	J41.0	EPOC
58	J41.1	EPOC
59	J41.8	EPOC
60	J42.X	EPOC
61	J43.0	EPOC
62	J43.1	EPOC
63	J43.2	EPOC
64	J43.8	EPOC
65	J43.9	EPOC
66	J44.0	EPOC
67	J44.1	EPOC
68	J44.8	EPOC
69	J44.9	EPOC
70	J47.X	EPOC
71	I10.X	Enfermedades hipertensivas
72	I11.0	Enfermedades hipertensivas
73	I11.9	Enfermedades hipertensivas
74	I12.0	Enfermedades hipertensivas
75	I12.9	Enfermedades hipertensivas
76	I13.0	Enfermedades hipertensivas
77	I13.1	Enfermedades hipertensivas
78	I13.2	Enfermedades hipertensivas
79	I13.9	Enfermedades hipertensivas
80	I15.0	Enfermedades hipertensivas
81	I15.1	Enfermedades hipertensivas
82	I15.2	Enfermedades hipertensivas
83	I15.8	Enfermedades hipertensivas
84	I15.9	Enfermedades hipertensivas
85	E66.0	Obesidad
86	E66.1	Obesidad
87	E66.2	Obesidad
88	E66.8	Obesidad
89	E66.9	Obesidad
90	N18.0	Insuficiencia renal crónica
91	N18.1	Insuficiencia renal crónica
92	N18.2	Insuficiencia renal crónica
93	N18.3	Insuficiencia renal crónica
94	N18.4	Insuficiencia renal crónica
95	N18.5	Insuficiencia renal crónica
96	N18.8	Insuficiencia renal crónica
97	N18.9	Insuficiencia renal crónica
98	I50.0	Insuficiencia cardíaca
99	I50.1	Insuficiencia cardíaca
100	I50.9	Insuficiencia cardíaca
101	A15.0	Tuberculosis
102	A15.1	Tuberculosis
103	A15.2	Tuberculosis
104	A15.3	Tuberculosis
105	A15.4	Tuberculosis
106	A15.5	Tuberculosis
107	A15.6	Tuberculosis
108	A15.7	Tuberculosis
109	A15.8	Tuberculosis
110	A15.9	Tuberculosis
111	A16.0	Tuberculosis
112	A16.1	Tuberculosis
113	A16.2	Tuberculosis
114	A16.3	Tuberculosis
115	A16.4	Tuberculosis
116	A16.5	Tuberculosis
117	A16.7	Tuberculosis
118	A16.8	Tuberculosis
119	A16.9	Tuberculosis
120	A17.0	Tuberculosis
121	A17.1	Tuberculosis
122	A17.8	Tuberculosis
123	A17.9	Tuberculosis
124	A18.0	Tuberculosis
125	A18.1	Tuberculosis
126	A18.2	Tuberculosis
127	A18.3	Tuberculosis
128	A18.4	Tuberculosis
129	A18.5	Tuberculosis
130	A18.6	Tuberculosis
131	A18.7	Tuberculosis
132	A18.8	Tuberculosis
133	A19.0	Tuberculosis
134	A19.1	Tuberculosis
135	A19.2	Tuberculosis
136	A19.8	Tuberculosis
137	A19.9	Tuberculosis
138	C00.0	Enfermedad oncológica (cáncer)
139	C00.1	Enfermedad oncológica (cáncer)
140	C00.2	Enfermedad oncológica (cáncer)
141	C00.3	Enfermedad oncológica (cáncer)
142	C00.4	Enfermedad oncológica (cáncer)
143	C00.5	Enfermedad oncológica (cáncer)
144	C00.6	Enfermedad oncológica (cáncer)
145	C00.8	Enfermedad oncológica (cáncer)
146	C00.9	Enfermedad oncológica (cáncer)
147	C01.X	Enfermedad oncológica (cáncer)
148	C02.0	Enfermedad oncológica (cáncer)
149	C02.1	Enfermedad oncológica (cáncer)
150	C02.2	Enfermedad oncológica (cáncer)
151	C02.3	Enfermedad oncológica (cáncer)
152	C02.4	Enfermedad oncológica (cáncer)
153	C02.8	Enfermedad oncológica (cáncer)
154	C02.9	Enfermedad oncológica (cáncer)
155	C03.0	Enfermedad oncológica (cáncer)
156	C03.1	Enfermedad oncológica (cáncer)
157	C03.9	Enfermedad oncológica (cáncer)
158	C04.0	Enfermedad oncológica (cáncer)
159	C04.1	Enfermedad oncológica (cáncer)
160	C04.8	Enfermedad oncológica (cáncer)
161	C04.9	Enfermedad oncológica (cáncer)
162	C05.0	Enfermedad oncológica (cáncer)
163	C05.1	Enfermedad oncológica (cáncer)
164	C05.2	Enfermedad oncológica (cáncer)
165	C05.8	Enfermedad oncológica (cáncer)
166	C05.9	Enfermedad oncológica (cáncer)
167	C06.0	Enfermedad oncológica (cáncer)
168	C06.1	Enfermedad oncológica (cáncer)
169	C06.2	Enfermedad oncológica (cáncer)
170	C06.8	Enfermedad oncológica (cáncer)
171	C06.9	Enfermedad oncológica (cáncer)
172	C07.X	Enfermedad oncológica (cáncer)
173	C08.0	Enfermedad oncológica (cáncer)
174	C08.1	Enfermedad oncológica (cáncer)
175	C08.8	Enfermedad oncológica (cáncer)
176	C08.9	Enfermedad oncológica (cáncer)
177	C09.0	Enfermedad oncológica (cáncer)
178	C09.1	Enfermedad oncológica (cáncer)
179	C09.8	Enfermedad oncológica (cáncer)
180	C09.9	Enfermedad oncológica (cáncer)
181	C10.0	Enfermedad oncológica (cáncer)
182	C10.1	Enfermedad oncológica (cáncer)
183	C10.2	Enfermedad oncológica (cáncer)
184	C10.3	Enfermedad oncológica (cáncer)
185	C10.4	Enfermedad oncológica (cáncer)
186	C10.8	Enfermedad oncológica (cáncer)
187	C10.9	Enfermedad oncológica (cáncer)
188	C11.0	Enfermedad oncológica (cáncer)
189	C11.1	Enfermedad oncológica (cáncer)
190	C11.2	Enfermedad oncológica (cáncer)
191	C11.3	Enfermedad oncológica (cáncer)
192	C11.8	Enfermedad oncológica (cáncer)
193	C11.9	Enfermedad oncológica (cáncer)
194	C12.X	Enfermedad oncológica (cáncer)
195	C13.0	Enfermedad oncológica (cáncer)
196	C13.1	Enfermedad oncológica (cáncer)
197	C13.2	Enfermedad oncológica (cáncer)
198	C13.8	Enfermedad oncológica (cáncer)
199	C13.9	Enfermedad oncológica (cáncer)
200	C14.0	Enfermedad oncológica (cáncer)
201	C14.2	Enfermedad oncológica (cáncer)
202	C14.8	Enfermedad oncológica (cáncer)
203	C15.0	Enfermedad oncológica (cáncer)
204	C15.1	Enfermedad oncológica (cáncer)
205	C15.2	Enfermedad oncológica (cáncer)
206	C15.3	Enfermedad oncológica (cáncer)
207	C15.4	Enfermedad oncológica (cáncer)
208	C15.5	Enfermedad oncológica (cáncer)
209	C15.8	Enfermedad oncológica (cáncer)
210	C15.9	Enfermedad oncológica (cáncer)
211	C16.0	Enfermedad oncológica (cáncer)
212	C16.1	Enfermedad oncológica (cáncer)
213	C16.2	Enfermedad oncológica (cáncer)
214	C16.3	Enfermedad oncológica (cáncer)
215	C16.4	Enfermedad oncológica (cáncer)
216	C16.5	Enfermedad oncológica (cáncer)
217	C16.6	Enfermedad oncológica (cáncer)
218	C16.8	Enfermedad oncológica (cáncer)
219	C16.9	Enfermedad oncológica (cáncer)
220	C17.0	Enfermedad oncológica (cáncer)
221	C17.1	Enfermedad oncológica (cáncer)
222	C17.2	Enfermedad oncológica (cáncer)
223	C17.3	Enfermedad oncológica (cáncer)
224	C17.8	Enfermedad oncológica (cáncer)
225	C17.9	Enfermedad oncológica (cáncer)
226	C18.0	Enfermedad oncológica (cáncer)
227	C18.1	Enfermedad oncológica (cáncer)
228	C18.2	Enfermedad oncológica (cáncer)
229	C18.3	Enfermedad oncológica (cáncer)
230	C18.4	Enfermedad oncológica (cáncer)
231	C18.5	Enfermedad oncológica (cáncer)
232	C18.6	Enfermedad oncológica (cáncer)
233	C18.7	Enfermedad oncológica (cáncer)
234	C18.8	Enfermedad oncológica (cáncer)
235	C18.9	Enfermedad oncológica (cáncer)
236	C19.X	Enfermedad oncológica (cáncer)
237	C20.X	Enfermedad oncológica (cáncer)
238	C21.0	Enfermedad oncológica (cáncer)
239	C21.1	Enfermedad oncológica (cáncer)
240	C21.2	Enfermedad oncológica (cáncer)
241	C21.8	Enfermedad oncológica (cáncer)
242	C22.0	Enfermedad oncológica (cáncer)
243	C22.1	Enfermedad oncológica (cáncer)
244	C22.2	Enfermedad oncológica (cáncer)
245	C22.3	Enfermedad oncológica (cáncer)
246	C22.4	Enfermedad oncológica (cáncer)
247	C22.7	Enfermedad oncológica (cáncer)
248	C22.9	Enfermedad oncológica (cáncer)
249	C23.X	Enfermedad oncológica (cáncer)
250	C24.0	Enfermedad oncológica (cáncer)
251	C24.1	Enfermedad oncológica (cáncer)
252	C24.8	Enfermedad oncológica (cáncer)
253	C24.9	Enfermedad oncológica (cáncer)
254	C25.0	Enfermedad oncológica (cáncer)
255	C25.1	Enfermedad oncológica (cáncer)
256	C25.2	Enfermedad oncológica (cáncer)
257	C25.3	Enfermedad oncológica (cáncer)
258	C25.4	Enfermedad oncológica (cáncer)
259	C25.7	Enfermedad oncológica (cáncer)
260	C25.8	Enfermedad oncológica (cáncer)
261	C25.9	Enfermedad oncológica (cáncer)
262	C26.0	Enfermedad oncológica (cáncer)
263	C26.1	Enfermedad oncológica (cáncer)
264	C26.8	Enfermedad oncológica (cáncer)
265	C26.9	Enfermedad oncológica (cáncer)
266	C30.0	Enfermedad oncológica (cáncer)
267	C30.1	Enfermedad oncológica (cáncer)
268	C31.0	Enfermedad oncológica (cáncer)
269	C31.1	Enfermedad oncológica (cáncer)
270	C31.2	Enfermedad oncológica (cáncer)
271	C31.3	Enfermedad oncológica (cáncer)
272	C31.8	Enfermedad oncológica (cáncer)
273	C31.9	Enfermedad oncológica (cáncer)
274	C32.0	Enfermedad oncológica (cáncer)
275	C32.1	Enfermedad oncológica (cáncer)
276	C32.2	Enfermedad oncológica (cáncer)
277	C32.3	Enfermedad oncológica (cáncer)
278	C32.8	Enfermedad oncológica (cáncer)
279	C32.9	Enfermedad oncológica (cáncer)
280	C33.X	Enfermedad oncológica (cáncer)
281	C34.0	Enfermedad oncológica (cáncer)
282	C34.1	Enfermedad oncológica (cáncer)
283	C34.2	Enfermedad oncológica (cáncer)
284	C34.3	Enfermedad oncológica (cáncer)
285	C34.8	Enfermedad oncológica (cáncer)
286	C34.9	Enfermedad oncológica (cáncer)
287	C37.X	Enfermedad oncológica (cáncer)
288	C38.0	Enfermedad oncológica (cáncer)
289	C38.1	Enfermedad oncológica (cáncer)
290	C38.2	Enfermedad oncológica (cáncer)
291	C38.3	Enfermedad oncológica (cáncer)
292	C38.4	Enfermedad oncológica (cáncer)
293	C38.8	Enfermedad oncológica (cáncer)
294	C39.0	Enfermedad oncológica (cáncer)
295	C39.8	Enfermedad oncológica (cáncer)
296	C39.9	Enfermedad oncológica (cáncer)
297	C40.0	Enfermedad oncológica (cáncer)
298	C40.1	Enfermedad oncológica (cáncer)
299	C40.2	Enfermedad oncológica (cáncer)
300	C40.3	Enfermedad oncológica (cáncer)
301	C40.8	Enfermedad oncológica (cáncer)
302	C40.9	Enfermedad oncológica (cáncer)
303	C41.0	Enfermedad oncológica (cáncer)
304	C41.1	Enfermedad oncológica (cáncer)
305	C41.2	Enfermedad oncológica (cáncer)
306	C41.3	Enfermedad oncológica (cáncer)
307	C41.4	Enfermedad oncológica (cáncer)
308	C41.8	Enfermedad oncológica (cáncer)
309	C41.9	Enfermedad oncológica (cáncer)
310	C43.0	Enfermedad oncológica (cáncer)
311	C43.1	Enfermedad oncológica (cáncer)
312	C43.2	Enfermedad oncológica (cáncer)
313	C43.3	Enfermedad oncológica (cáncer)
314	C43.4	Enfermedad oncológica (cáncer)
315	C43.5	Enfermedad oncológica (cáncer)
316	C43.6	Enfermedad oncológica (cáncer)
317	C43.7	Enfermedad oncológica (cáncer)
318	C43.8	Enfermedad oncológica (cáncer)
319	C43.9	Enfermedad oncológica (cáncer)
320	C44.0	Enfermedad oncológica (cáncer)
321	C44.1	Enfermedad oncológica (cáncer)
322	C44.2	Enfermedad oncológica (cáncer)
323	C44.3	Enfermedad oncológica (cáncer)
324	C44.4	Enfermedad oncológica (cáncer)
325	C44.5	Enfermedad oncológica (cáncer)
326	C44.6	Enfermedad oncológica (cáncer)
327	C44.7	Enfermedad oncológica (cáncer)
328	C44.8	Enfermedad oncológica (cáncer)
329	C44.9	Enfermedad oncológica (cáncer)
330	C45.0	Enfermedad oncológica (cáncer)
331	C45.1	Enfermedad oncológica (cáncer)
332	C45.2	Enfermedad oncológica (cáncer)
333	C45.7	Enfermedad oncológica (cáncer)
334	C45.9	Enfermedad oncológica (cáncer)
335	C46.0	Enfermedad oncológica (cáncer)
336	C46.1	Enfermedad oncológica (cáncer)
337	C46.2	Enfermedad oncológica (cáncer)
338	C46.3	Enfermedad oncológica (cáncer)
339	C46.7	Enfermedad oncológica (cáncer)
340	C46.8	Enfermedad oncológica (cáncer)
341	C46.9	Enfermedad oncológica (cáncer)
342	C47.0	Enfermedad oncológica (cáncer)
343	C47.1	Enfermedad oncológica (cáncer)
344	C47.2	Enfermedad oncológica (cáncer)
345	C47.3	Enfermedad oncológica (cáncer)
346	C47.4	Enfermedad oncológica (cáncer)
347	C47.5	Enfermedad oncológica (cáncer)
348	C47.6	Enfermedad oncológica (cáncer)
349	C47.8	Enfermedad oncológica (cáncer)
350	C47.9	Enfermedad oncológica (cáncer)
351	C48.0	Enfermedad oncológica (cáncer)
352	C48.1	Enfermedad oncológica (cáncer)
353	C48.2	Enfermedad oncológica (cáncer)
354	C48.8	Enfermedad oncológica (cáncer)
355	C49.0	Enfermedad oncológica (cáncer)
356	C49.1	Enfermedad oncológica (cáncer)
357	C49.2	Enfermedad oncológica (cáncer)
358	C49.3	Enfermedad oncológica (cáncer)
359	C49.4	Enfermedad oncológica (cáncer)
360	C49.5	Enfermedad oncológica (cáncer)
361	C49.6	Enfermedad oncológica (cáncer)
362	C49.8	Enfermedad oncológica (cáncer)
363	C49.9	Enfermedad oncológica (cáncer)
364	C50.0	Enfermedad oncológica (cáncer)
365	C50.1	Enfermedad oncológica (cáncer)
366	C50.2	Enfermedad oncológica (cáncer)
367	C50.3	Enfermedad oncológica (cáncer)
368	C50.4	Enfermedad oncológica (cáncer)
369	C50.5	Enfermedad oncológica (cáncer)
370	C50.6	Enfermedad oncológica (cáncer)
371	C50.8	Enfermedad oncológica (cáncer)
372	C50.9	Enfermedad oncológica (cáncer)
373	C51.0	Enfermedad oncológica (cáncer)
374	C51.1	Enfermedad oncológica (cáncer)
375	C51.2	Enfermedad oncológica (cáncer)
376	C51.8	Enfermedad oncológica (cáncer)
377	C51.9	Enfermedad oncológica (cáncer)
378	C52.X	Enfermedad oncológica (cáncer)
379	C53.0	Enfermedad oncológica (cáncer)
380	C53.1	Enfermedad oncológica (cáncer)
381	C53.8	Enfermedad oncológica (cáncer)
382	C53.9	Enfermedad oncológica (cáncer)
383	C54.0	Enfermedad oncológica (cáncer)
384	C54.1	Enfermedad oncológica (cáncer)
385	C54.2	Enfermedad oncológica (cáncer)
386	C54.3	Enfermedad oncológica (cáncer)
387	C54.8	Enfermedad oncológica (cáncer)
388	C54.9	Enfermedad oncológica (cáncer)
389	C55.X	Enfermedad oncológica (cáncer)
390	C56.X	Enfermedad oncológica (cáncer)
391	C57.0	Enfermedad oncológica (cáncer)
392	C57.1	Enfermedad oncológica (cáncer)
393	C57.2	Enfermedad oncológica (cáncer)
394	C57.3	Enfermedad oncológica (cáncer)
395	C57.4	Enfermedad oncológica (cáncer)
396	C57.7	Enfermedad oncológica (cáncer)
397	C57.8	Enfermedad oncológica (cáncer)
398	C57.9	Enfermedad oncológica (cáncer)
399	C58.X	Enfermedad oncológica (cáncer)
400	C60.0	Enfermedad oncológica (cáncer)
401	C60.1	Enfermedad oncológica (cáncer)
402	C60.2	Enfermedad oncológica (cáncer)
403	C60.8	Enfermedad oncológica (cáncer)
404	C60.9	Enfermedad oncológica (cáncer)
405	C61.X	Enfermedad oncológica (cáncer)
406	C62.0	Enfermedad oncológica (cáncer)
407	C62.1	Enfermedad oncológica (cáncer)
408	C62.9	Enfermedad oncológica (cáncer)
409	C63.0	Enfermedad oncológica (cáncer)
410	C63.1	Enfermedad oncológica (cáncer)
411	C63.2	Enfermedad oncológica (cáncer)
412	C63.7	Enfermedad oncológica (cáncer)
413	C63.8	Enfermedad oncológica (cáncer)
414	C63.9	Enfermedad oncológica (cáncer)
415	C64.X	Enfermedad oncológica (cáncer)
416	C65.X	Enfermedad oncológica (cáncer)
417	C66.X	Enfermedad oncológica (cáncer)
418	C67.0	Enfermedad oncológica (cáncer)
419	C67.1	Enfermedad oncológica (cáncer)
420	C67.2	Enfermedad oncológica (cáncer)
421	C67.3	Enfermedad oncológica (cáncer)
422	C67.4	Enfermedad oncológica (cáncer)
423	C67.5	Enfermedad oncológica (cáncer)
424	C67.6	Enfermedad oncológica (cáncer)
425	C67.7	Enfermedad oncológica (cáncer)
426	C67.8	Enfermedad oncológica (cáncer)
427	C67.9	Enfermedad oncológica (cáncer)
428	C68.0	Enfermedad oncológica (cáncer)
429	C68.1	Enfermedad oncológica (cáncer)
430	C68.8	Enfermedad oncológica (cáncer)
431	C68.9	Enfermedad oncológica (cáncer)
432	C69.0	Enfermedad oncológica (cáncer)
433	C69.1	Enfermedad oncológica (cáncer)
434	C69.2	Enfermedad oncológica (cáncer)
435	C69.3	Enfermedad oncológica (cáncer)
436	C69.4	Enfermedad oncológica (cáncer)
437	C69.5	Enfermedad oncológica (cáncer)
438	C69.6	Enfermedad oncológica (cáncer)
439	C69.8	Enfermedad oncológica (cáncer)
440	C69.9	Enfermedad oncológica (cáncer)
441	C70.0	Enfermedad oncológica (cáncer)
442	C70.1	Enfermedad oncológica (cáncer)
443	C70.9	Enfermedad oncológica (cáncer)
444	C71.0	Enfermedad oncológica (cáncer)
445	C71.1	Enfermedad oncológica (cáncer)
446	C71.2	Enfermedad oncológica (cáncer)
447	C71.3	Enfermedad oncológica (cáncer)
448	C71.4	Enfermedad oncológica (cáncer)
449	C71.5	Enfermedad oncológica (cáncer)
450	C71.6	Enfermedad oncológica (cáncer)
451	C71.7	Enfermedad oncológica (cáncer)
452	C71.8	Enfermedad oncológica (cáncer)
453	C71.9	Enfermedad oncológica (cáncer)
454	C72.0	Enfermedad oncológica (cáncer)
455	C72.1	Enfermedad oncológica (cáncer)
456	C72.2	Enfermedad oncológica (cáncer)
457	C72.3	Enfermedad oncológica (cáncer)
458	C72.4	Enfermedad oncológica (cáncer)
459	C72.5	Enfermedad oncológica (cáncer)
460	C72.8	Enfermedad oncológica (cáncer)
461	C72.9	Enfermedad oncológica (cáncer)
462	C73.X	Enfermedad oncológica (cáncer)
463	C74.0	Enfermedad oncológica (cáncer)
464	C74.1	Enfermedad oncológica (cáncer)
465	C74.9	Enfermedad oncológica (cáncer)
466	C75.0	Enfermedad oncológica (cáncer)
467	C75.1	Enfermedad oncológica (cáncer)
468	C75.2	Enfermedad oncológica (cáncer)
469	C75.3	Enfermedad oncológica (cáncer)
470	C75.4	Enfermedad oncológica (cáncer)
471	C75.5	Enfermedad oncológica (cáncer)
472	C75.8	Enfermedad oncológica (cáncer)
473	C75.9	Enfermedad oncológica (cáncer)
474	C76.0	Enfermedad oncológica (cáncer)
475	C76.1	Enfermedad oncológica (cáncer)
476	C76.2	Enfermedad oncológica (cáncer)
477	C76.3	Enfermedad oncológica (cáncer)
478	C76.4	Enfermedad oncológica (cáncer)
479	C76.5	Enfermedad oncológica (cáncer)
480	C76.7	Enfermedad oncológica (cáncer)
481	C76.8	Enfermedad oncológica (cáncer)
482	C77.0	Enfermedad oncológica (cáncer)
483	C77.1	Enfermedad oncológica (cáncer)
484	C77.2	Enfermedad oncológica (cáncer)
485	C77.3	Enfermedad oncológica (cáncer)
486	C77.4	Enfermedad oncológica (cáncer)
487	C77.5	Enfermedad oncológica (cáncer)
488	C77.8	Enfermedad oncológica (cáncer)
489	C77.9	Enfermedad oncológica (cáncer)
490	C78.0	Enfermedad oncológica (cáncer)
491	C78.1	Enfermedad oncológica (cáncer)
492	C78.2	Enfermedad oncológica (cáncer)
493	C78.3	Enfermedad oncológica (cáncer)
494	C78.4	Enfermedad oncológica (cáncer)
495	C78.5	Enfermedad oncológica (cáncer)
496	C78.6	Enfermedad oncológica (cáncer)
497	C78.7	Enfermedad oncológica (cáncer)
498	C78.8	Enfermedad oncológica (cáncer)
499	C79.0	Enfermedad oncológica (cáncer)
500	C79.1	Enfermedad oncológica (cáncer)
501	C79.2	Enfermedad oncológica (cáncer)
502	C79.3	Enfermedad oncológica (cáncer)
503	C79.4	Enfermedad oncológica (cáncer)
504	C79.5	Enfermedad oncológica (cáncer)
505	C79.6	Enfermedad oncológica (cáncer)
506	C79.7	Enfermedad oncológica (cáncer)
507	C79.8	Enfermedad oncológica (cáncer)
508	C79.9	Enfermedad oncológica (cáncer)
509	C80.0	Enfermedad oncológica (cáncer)
510	C80.9	Enfermedad oncológica (cáncer)
511	C80.X	Enfermedad oncológica (cáncer)
512	C81.0	Enfermedad oncológica (cáncer)
513	C81.1	Enfermedad oncológica (cáncer)
514	C81.2	Enfermedad oncológica (cáncer)
515	C81.3	Enfermedad oncológica (cáncer)
516	C81.7	Enfermedad oncológica (cáncer)
517	C81.9	Enfermedad oncológica (cáncer)
518	C82.0	Enfermedad oncológica (cáncer)
519	C82.1	Enfermedad oncológica (cáncer)
520	C82.2	Enfermedad oncológica (cáncer)
521	C82.3	Enfermedad oncológica (cáncer)
522	C82.4	Enfermedad oncológica (cáncer)
523	C82.5	Enfermedad oncológica (cáncer)
524	C82.7	Enfermedad oncológica (cáncer)
525	C82.9	Enfermedad oncológica (cáncer)
526	C83.0	Enfermedad oncológica (cáncer)
527	C83.1	Enfermedad oncológica (cáncer)
528	C83.2	Enfermedad oncológica (cáncer)
529	C83.3	Enfermedad oncológica (cáncer)
530	C83.4	Enfermedad oncológica (cáncer)
531	C83.5	Enfermedad oncológica (cáncer)
532	C83.6	Enfermedad oncológica (cáncer)
533	C83.7	Enfermedad oncológica (cáncer)
534	C83.8	Enfermedad oncológica (cáncer)
535	C83.9	Enfermedad oncológica (cáncer)
536	C84.0	Enfermedad oncológica (cáncer)
537	C84.1	Enfermedad oncológica (cáncer)
538	C84.2	Enfermedad oncológica (cáncer)
539	C84.3	Enfermedad oncológica (cáncer)
540	C84.4	Enfermedad oncológica (cáncer)
541	C84.5	Enfermedad oncológica (cáncer)
542	C84.6	Enfermedad oncológica (cáncer)
543	C84.7	Enfermedad oncológica (cáncer)
544	C84.8	Enfermedad oncológica (cáncer)
545	C84.9	Enfermedad oncológica (cáncer)
546	C85.0	Enfermedad oncológica (cáncer)
547	C85.1	Enfermedad oncológica (cáncer)
548	C85.2	Enfermedad oncológica (cáncer)
549	C85.7	Enfermedad oncológica (cáncer)
550	C85.9	Enfermedad oncológica (cáncer)
551	C86.0	Enfermedad oncológica (cáncer)
552	C86.1	Enfermedad oncológica (cáncer)
553	C86.2	Enfermedad oncológica (cáncer)
554	C86.3	Enfermedad oncológica (cáncer)
555	C86.4	Enfermedad oncológica (cáncer)
556	C86.5	Enfermedad oncológica (cáncer)
557	C86.6	Enfermedad oncológica (cáncer)
558	C88.0	Enfermedad oncológica (cáncer)
559	C88.1	Enfermedad oncológica (cáncer)
560	C88.2	Enfermedad oncológica (cáncer)
561	C88.3	Enfermedad oncológica (cáncer)
562	C88.4	Enfermedad oncológica (cáncer)
563	C88.7	Enfermedad oncológica (cáncer)
564	C88.9	Enfermedad oncológica (cáncer)
565	C90.0	Enfermedad oncológica (cáncer)
566	C90.1	Enfermedad oncológica (cáncer)
567	C90.2	Enfermedad oncológica (cáncer)
568	C90.3	Enfermedad oncológica (cáncer)
569	C91.0	Enfermedad oncológica (cáncer)
570	C91.1	Enfermedad oncológica (cáncer)
571	C91.2	Enfermedad oncológica (cáncer)
572	C91.3	Enfermedad oncológica (cáncer)
573	C91.4	Enfermedad oncológica (cáncer)
574	C91.5	Enfermedad oncológica (cáncer)
575	C91.6	Enfermedad oncológica (cáncer)
576	C91.7	Enfermedad oncológica (cáncer)
577	C91.8	Enfermedad oncológica (cáncer)
578	C91.9	Enfermedad oncológica (cáncer)
579	C92.0	Enfermedad oncológica (cáncer)
580	C92.1	Enfermedad oncológica (cáncer)
581	C92.2	Enfermedad oncológica (cáncer)
582	C92.3	Enfermedad oncológica (cáncer)
583	C92.4	Enfermedad oncológica (cáncer)
584	C92.5	Enfermedad oncológica (cáncer)
585	C92.7	Enfermedad oncológica (cáncer)
586	C92.8	Enfermedad oncológica (cáncer)
587	C92.9	Enfermedad oncológica (cáncer)
588	C93.0	Enfermedad oncológica (cáncer)
589	C93.1	Enfermedad oncológica (cáncer)
590	C93.2	Enfermedad oncológica (cáncer)
591	C93.3	Enfermedad oncológica (cáncer)
592	C93.7	Enfermedad oncológica (cáncer)
593	C93.9	Enfermedad oncológica (cáncer)
594	C94.0	Enfermedad oncológica (cáncer)
595	C94.1	Enfermedad oncológica (cáncer)
596	C94.2	Enfermedad oncológica (cáncer)
597	C94.3	Enfermedad oncológica (cáncer)
598	C94.4	Enfermedad oncológica (cáncer)
599	C94.5	Enfermedad oncológica (cáncer)
600	C94.6	Enfermedad oncológica (cáncer)
601	C94.7	Enfermedad oncológica (cáncer)
602	C95.0	Enfermedad oncológica (cáncer)
603	C95.1	Enfermedad oncológica (cáncer)
604	C95.2	Enfermedad oncológica (cáncer)
605	C95.7	Enfermedad oncológica (cáncer)
606	C95.9	Enfermedad oncológica (cáncer)
607	C96.0	Enfermedad oncológica (cáncer)
608	C96.1	Enfermedad oncológica (cáncer)
609	C96.2	Enfermedad oncológica (cáncer)
610	C96.3	Enfermedad oncológica (cáncer)
611	C96.4	Enfermedad oncológica (cáncer)
612	C96.5	Enfermedad oncológica (cáncer)
613	C96.6	Enfermedad oncológica (cáncer)
614	C96.7	Enfermedad oncológica (cáncer)
615	C96.8	Enfermedad oncológica (cáncer)
616	C96.9	Enfermedad oncológica (cáncer)
617	C97.X	Enfermedad oncológica (cáncer)
\.


--
-- Data for Name: grupo_edad; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.grupo_edad (id, decada, grupo_etario) FROM stdin;
0	0-9 	0-9    
1	0-9 	0-9    
2	0-9 	0-9    
3	0-9 	0-9    
4	0-9 	0-9    
5	0-9 	0-9    
6	0-9 	0-9    
7	0-9 	0-9    
8	0-9 	0-9    
9	0-9 	0-9    
10	10-19 	10-19  
11	10-19 	10-19  
12	10-19 	10-19  
13	10-19 	10-19  
14	10-19 	10-19  
15	10-19 	10-19  
16	10-19 	10-19  
17	10-19 	10-19  
18	10-19 	10-19  
19	10-19 	10-19  
20	20-29 	20-24  
21	20-29 	20-24  
22	20-29 	20-24  
23	20-29 	20-24  
24	20-29 	20-24  
25	20-29 	25-59  
26	20-29 	25-59  
27	20-29 	25-59  
28	20-29 	25-59  
29	20-29 	25-59  
30	30-39 	25-59  
31	30-39 	25-59  
32	30-39 	25-59  
33	30-39 	25-59  
34	30-39 	25-59  
35	30-39 	25-59  
36	30-39 	25-59  
37	30-39 	25-59  
38	30-39 	25-59  
39	30-39 	25-59  
40	40-49 	25-59  
41	40-49 	25-59  
42	40-49 	25-59  
43	40-49 	25-59  
44	40-49 	25-59  
45	40-49  	25-59  
46	40-49 	25-59  
47	40-49 	25-59  
48	40-49 	25-59  
49	40-49 	25-59  
50	50-59 	25-59  
51	50-59 	25-59  
52	50-59 	25-59  
53	50-59 	25-59  
54	50-59 	25-59  
55	50-59 	25-59  
56	50-59 	25-59  
57	50-59 	25-59  
58	50-59 	25-59  
59	50-59 	25-59  
60	60-69 	>60  
61	60-69 	>60  
62	60-69 	>60  
63	60-69 	>60  
64	60-69 	>60  
65	60-69 	>60  
66	60-69 	>60  
67	60-69 	>60  
68	60-69 	>60  
69	60-69 	>60  
70	70-79 	>60  
71	70-79 	>60  
72	70-79 	>60  
73	70-79 	>60  
74	70-79 	>60  
75	70-79 	>60  
76	70-79 	>60  
77	70-79 	>60  
78	70-79 	>60  
79	70-79 	>60  
80	80-89 	>60  
81	80-89 	>60  
82	80-89 	>60  
83	80-89 	>60  
84	80-89 	>60  
85	80-89 	>60  
86	80-89 	>60  
87	80-89 	>60  
88	80-89 	>60  
89	80-89 	>60  
90	90-99 	>60  
91	90-99 	>60  
92	90-99 	>60  
93	90-99 	>60  
94	90-99 	>60  
95	90-99 	>60  
96	90-99 	>60  
97	90-99 	>60  
98	90-99 	>60  
99	90-99 	>60  
\.


--
-- TOC entry 3828 (class 0 OID 19378)
-- Dependencies: 470
-- Data for Name: map_coordinates; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.map_coordinates (id, latitude, longitude, importance, type, attempts) FROM stdin;
452	-34.9224035625	-57.945189345833334	0.831	house	1
506	-54.8069332	-68.3073246	1.0096053510126586	administrative	1
527	-34.713238	-58.260306	0.621	house	1
811	-34.6535882	-59.4121948	0.8099999999999999	residential	1
536	-34.9206797	-57.9537638	1.0766550198799103	administrative	1
553	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
812	-29.4127411	-66.8558795	1.055368599659569	administrative	1
657	-33.9099973	-60.5936596	0.81	administrative	1
661	-34.8693586	-57.8787243	0.72	residential	1
685	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
686	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
419	\N	\N	\N	\N	6
735	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
759	-37.3215444	-60.2923036	0.71	isolated_dwelling	1
450	\N	\N	\N	\N	6
762	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
17	-37.14990175918368	-58.48419560204082	0.9309999999999999	\N	3
559	-38.7395785	-62.2387701	0.81	\N	3
617	-34.8688565	-57.8828667	0.9154786067021123	\N	3
724	-34.8688565	-57.8828667	0.9154786067021123	\N	1
1	-37.162178471717176	-58.49183882020202	0.741	\N	3
680	-33.3277089	-60.2165909	1.1638947027800404	\N	3
681	-33.3277089	-60.2165909	1.1638947027800404	\N	3
4	-27.5424328	-66.5150576	0.5700000000000001	\N	4
3	-35.4444122	-60.8842325	0.9801859567047568	\N	4
7	-44.79808577474748	-65.71211372727272	0.6309999999999999	\N	4
564	-34.87473454285714	-57.88840652857143	0.731	\N	1
9	-29.603353	-65.5202607	0.6869036315150677	\N	4
16	-37.3282887	-59.1356957	0.8810861911257393	\N	4
618	-34.8871881	-57.8880135	0.72	\N	1
659	-35.2434429	-59.4812759	0.6199999999999999	\N	1
663	-29.4127411	-66.8558795	1.055368599659569	\N	1
682	-33.3277089	-60.2165909	1.1638947027800404	\N	1
683	-33.3277089	-60.2165909	1.1638947027800404	\N	1
725	-34.8818535	-57.855109	0.72	\N	1
750	-33.3132687	-60.2472792	1.1099999999999999	\N	1
757	-34.89407537142857	-57.97923995714286	0.731	\N	1
760	-27.5797053	-58.87827059752387	0.645	\N	1
763	-33.3277089	-60.2165909	1.1638947027800404	\N	1
766	-33.9082357	-60.5564137	0.6100000000000001	administrative	1
769	-34.8631754	-58.5009786	0.6291246316339033	administrative	1
777	-34.4283191	-58.7586075	0.5199999999999999	residential	1
785	-37.6618769	-63.3617588	0.6099999999999999	isolated_dwelling	1
792	-34.6607521	-59.4372737	0.82	secondary	1
793	-34.6327608	-58.4836413	0.5209999999999999	house	1
794	-34.8688565	-57.8828667	0.9154786067021123	city	1
795	-34.8776082	-57.8832534	0.72	residential	1
809	-29.152218	-67.5089614	0.71	residential	1
548	-33.3714358	-60.204511	0.9199999999999999	residential	1
565	-29.4127411	-66.8558795	1.055368599659569	administrative	1
660	-34.8688565	-57.8828667	0.9154786067021123	city	1
684	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
701	-29.4170964	-66.8392637	0.91	residential	1
726	-34.8693682	-57.8802598	0.72	residential	1
734	-33.3717387	-60.1824049	1.02	residential	1
761	-33.326872175000005	-60.2240294125	1.021	house	1
774	-34.9517677	-57.9879245	0.71	residential	1
775	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
300	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
301	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
302	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
304	-34.9206797	-57.9537638	1.0766550198799103	administrative	1
308	-40.82070312653061	-62.97682845306122	0.831	house	1
313	-34.716571	-58.2977925	0.8205860919307663	administrative	1
314	-29.4170964	-66.8392637	0.91	residential	1
315	-39.029590779591835	-67.57031078979593	0.821	house	1
768	-33.336217358333336	-60.21767691666667	0.9209999999999999	house	1
318	-27.814298	-64.3006249	1.1099999999999999	residential	1
320	-36.2929438	-57.6957458	0.785	suburb	1
345	-31.4173391	-64.183319	0.8088272627962301	administrative	1
786	-43.6946204	-66.49382891126118	0.82	administrative	1
350	-37.5478607	-63.2438921	0.6099999999999999	isolated_dwelling	1
380	-34.61133122244898	-58.40170905918367	0.621	house	1
384	-34.6037283	-58.4125926	0.6580920830180935	neighbourhood	1
818	-34.6535882	-59.4121948	0.8099999999999999	residential	1
387	-34.878347493877556	-57.875196085714286	0.731	house	1
390	-33.3723648	-69.1479533	0.5503615466364415	administrative	1
391	-33.5812925	-69.0154258	0.5358021943488056	administrative	1
823	-34.6586316	-59.4229148	0.7299999999999999	residential	1
392	-33.64925785	-69.14938442271536	0.695	suburb	1
401	-33.5655709	-69.0168408	0.42000000000000004	trunk	1
404	-29.4127411	-66.8558795	0.955368599659569	administrative	1
317	\N	\N	\N	\N	6
405	-29.4127411	-66.8558795	0.955368599659569	administrative	1
412	-29.4127411	-66.8558795	1.055368599659569	administrative	1
824	-34.6577021	-59.4427599	0.7299999999999999	tertiary	1
420	-31.7578496	-60.4939813	0.41000000000000003	residential	1
421	-34.9206797	-57.9537638	1.0766550198799103	administrative	1
423	-34.59577381818182	-58.48748374545454	1.1309999999999998	house	1
825	-34.6506717	-59.4317202	0.8293163531697136	administrative	1
440	-34.8183843	-58.3588486	0.72	residential	1
441	-34.8396666	-58.3952949	0.71	residential	1
442	-29.4505081	-66.8638682	0.91	tertiary	1
826	-34.6597721	-59.4583872	0.72	unclassified	1
449	-32.890106061224486	-62.67808524693878	0.731	house	1
827	-34.6589589	-59.4315365	0.7299999999999999	residential	1
451	-34.6459092	-58.4311004	1.4100000000000001	secondary	1
453	-34.94219835416667	-57.95475999166666	0.831	house	1
474	-51.624326097959184	-69.22115795306122	0.831	house	1
828	-34.6618977	-59.4097564	0.7299999999999999	residential	1
480	-34.7303025	-58.268868	0.8937486180714317	administrative	1
488	-34.8832908	-58.0034914	0.61	residential	1
498	-46.472374599999995	-67.57100144271831	0.91	administrative	1
833	-34.6586316	-59.4229148	0.7299999999999999	residential	1
499	-46.472374599999995	-67.57100144271831	0.91	administrative	1
835	-26.1891705	-58.1860467	0.7299999999999999	secondary	1
840	-33.3277089	-60.2165909	1.1638947027800404	administrative	1
842	-29.3946448	-66.8417892	0.82	residential	1
846	-51.64607595	-69.26322885452636	0.8634245232636014	administrative	1
848	-34.61706755102041	-58.370494191836734	1.1209999999999998	house	1
849	-34.5978838	-58.422587	1.1099999999999999	residential	1
851	-51.624265975510205	-69.22128473673469	0.831	house	1
852	-51.6421151	-69.2240336	0.82	residential	1
855	-36.7502582	-60.3855984	0.71	farm	1
864	-34.6607521	-59.4372737	0.82	secondary	1
868	-34.616391476767674	-58.42883933939394	0.621	house	1
869	-27.7877148	-64.2595062	1.1882699263907444	administrative	1
873	-37.3154085	-59.0864961	0.81	administrative	1
874	-38.1073055	-57.6183716	0.8099999999999999	residential	1
875	-34.9310337375	-57.97611709583333	0.9309999999999999	house	1
876	-34.91385057959184	-57.995640253061225	0.9309999999999999	house	1
877	-34.9581987	-57.9326098	0.8099999999999999	residential	1
878	-34.9028911	-57.9611869	0.91	residential	1
879	-34.931061674999995	-57.976078225	0.831	house	1
880	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
881	-37.3197284755102	-59.1437048755102	0.731	house	1
882	-34.910951	-57.9487987	0.91	secondary	1
883	-37.31329135714286	-59.13173052857143	0.721	house	1
884	-37.31122947142857	-59.13944787142857	0.831	house	1
885	-37.31027249387755	-59.132128518367345	0.731	house	1
886	-37.309608016326536	-59.13981069591837	0.631	house	1
887	-37.3125331122449	-59.13762145918367	0.621	house	1
888	-37.3126884	-59.1355115	0.9209999999999999	house	1
889	-34.9620325	-57.9146894	0.72	residential	1
890	-37.3131453	-59.1443856	0.831	house	1
891	-37.310415179591836	-59.13252366122449	0.731	house	1
892	-37.31450250408164	-59.1419718	0.9209999999999999	house	1
893	-34.926053525	-57.949189675	0.9309999999999999	house	1
894	-34.92619238333333	-57.950330091666665	0.9309999999999999	house	1
895	-34.926412312500005	-57.9523312	0.9309999999999999	house	1
896	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
897	-34.921798	-57.9653327	0.91	secondary	1
898	-34.924495025	-57.947996025	0.9309999999999999	house	1
899	-34.9249015	-57.9523550125	0.9309999999999999	house	1
900	-34.92386877083333	-57.95041947083333	0.9309999999999999	house	1
696	-34.69848777346939	-58.38464342857143	0.631	house	1
918	-34.7115839	-58.3907763	0.8099999999999999	residential	1
921	-51.6432655	-69.2279651	0.6199999999999999	residential	1
924	-34.6618689	-58.7717437	0.8099999999999999	tertiary	1
942	-33.337966975	-60.21435835	1.2209999999999999	house	1
954	-43.2531242	-65.3094407	0.8757782217122114	city	1
967	-43.2740362	-65.3076937	0.6199999999999999	residential	1
966	-43.2740362	-65.3076937	0.6199999999999999	residential	1
969	-43.2740362	-65.3076937	0.6199999999999999	residential	1
970	-43.26011596530612	-65.29747144693877	0.831	house	1
995	-22.1047394	-65.5986643	0.82	tertiary	1
1119	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
1125	-46.543201075	-68.92673196458333	0.42099999999999993	house	1
1131	-34.6915746	-58.3836222	0.8113344887685732	administrative	1
1134	-51.6324111	-69.1951684	0.831	house	1
1140	-34.6075682	-58.4370894	1.6379817834797907	administrative	1
707	-34.9232855375	-57.948348124999995	0.831	house	1
1147	\N	\N	\N	\N	1
1173	\N	\N	\N	\N	1
1179	-34.717108764705884	-58.40042205882353	1.0409999999999997	house	1
1180	-34.85803	-58.3881462	0.7865275868863175	administrative	1
1200	-34.72115516666667	-58.24359954166667	0.721	house	1
1209	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
1217	-34.6732293	-58.5920928	0.82	residential	1
1223	-35.7403278	-60.5572213	0.5519138440405379	village	1
1225	-32.9132076	-68.7925804	0.6299999999999999	residential	1
1227	-34.76705642857143	-58.36269642857143	0.721	house	1
1242	\N	\N	\N	\N	1
1262	-37.336984746938775	-59.14157561428571	0.721	house	1
1295	-34.6653503	-58.8288603	0.71	residential	1
1296	-33.9099973	-60.5936596	0.81	administrative	1
1297	-34.6460954	-58.8300289	0.7273380601845065	administrative	1
1298	-32.8707232	-68.8319762	0.6199999999999999	tertiary	1
1299	-34.5340453	-58.8145729	0.8099999999999999	residential	1
1309	-27.43788882244898	-58.994397034693876	0.6309999999999999	house	1
1315	-34.6433257	-58.7521874	1.103389897696137	administrative	1
1329	-27.44791757142857	-58.97800640204082	0.531	house	1
1338	-34.5920919	-58.7528413	0.61	tertiary	1
1339	-34.6048731	-58.7285519	0.61	residential	1
1340	-34.6170126	-58.7300769	0.61	residential	1
1341	-34.588177	-58.7515073	0.61	residential	1
1342	-34.6012892	-58.7243232	0.61	residential	1
1343	-34.5948381	-58.7450823	0.61	residential	1
1344	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1345	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1348	-34.6109363	-58.7362861	0.8099999999999999	residential	1
1347	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1351	-34.5874364	-58.7580901	0.61	residential	1
1352	-34.6170126	-58.7300769	0.61	residential	1
1353	-34.6170126	-58.7300769	0.61	residential	1
1354	-34.6170126	-58.7300769	0.61	residential	1
1355	-34.5913937	-58.7520983	0.51	residential	1
1356	-34.5913937	-58.7520983	0.51	residential	1
1357	-34.5913937	-58.7520983	0.51	residential	1
1358	-34.6170126	-58.7300769	0.61	residential	1
1359	-34.5920919	-58.7528413	0.61	tertiary	1
1360	-34.5920919	-58.7528413	0.61	tertiary	1
1361	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1362	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1363	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1364	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1365	-34.5948381	-58.7450823	0.61	residential	1
1366	-34.6203908	-58.7274831	0.61	residential	1
1369	-34.5952884	-58.7498157	0.61	residential	1
1370	-29.4127411	-66.8558795	1.055368599659569	administrative	1
1371	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1372	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1377	-34.6170126	-58.7300769	0.61	residential	1
1378	-34.5868284	-58.750788	0.8099999999999999	residential	1
1391	-34.6028114	-58.7297731	0.51	residential	1
1392	-34.5913937	-58.7520983	0.51	residential	1
1393	-34.6075318	-58.7345989	0.51	residential	1
1394	-34.6106358	-58.7305016	0.8099999999999999	residential	1
1395	-34.588177	-58.7515073	0.61	residential	1
1396	-34.6193534	-58.7345645	0.71	residential	1
1397	-34.6193534	-58.7345645	0.71	residential	1
1398	-34.5952884	-58.7498157	0.61	residential	1
1399	-34.5835888	-58.757021	0.61	residential	1
1400	-34.6111598	-58.7276251	0.51	residential	1
1401	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1402	-34.6052163	-58.7274285	0.61	tertiary	1
1412	-34.62886741020408	-58.48164231632653	1.321	house	1
1413	-34.6193534	-58.7345645	0.71	residential	1
1414	-33.9099973	-60.5936596	0.81	administrative	1
1415	-34.6101892	-58.7289063	0.71	residential	1
1416	-34.6061637	-58.7342199	0.61	residential	1
1417	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1418	-34.5913937	-58.7520983	0.71	residential	1
1419	-34.5913937	-58.7520983	0.51	residential	1
1420	-34.5920919	-58.7528413	0.61	tertiary	1
1421	-34.5952884	-58.7498157	0.61	residential	1
1422	-34.5952884	-58.7498157	0.61	residential	1
1423	-34.5952884	-58.7498157	0.61	residential	1
1424	-34.5948381	-58.7450823	0.61	residential	1
1425	-34.5948381	-58.7450823	0.61	residential	1
1426	-34.5920919	-58.7528413	0.61	tertiary	1
1427	-34.5900921	-58.7522276	0.51	residential	1
1428	-34.6172625	-58.7297469	0.61	residential	1
1429	-34.5948381	-58.7450823	0.61	residential	1
1430	-34.5920919	-58.7528413	0.61	tertiary	1
1431	-32.8485043	-68.8166511	1.02	residential	1
1433	-34.5952884	-58.7498157	0.61	residential	1
1434	-32.8690181	-68.8351117	0.6199999999999999	residential	1
1436	-32.8485043	-68.8166511	1.02	residential	1
1440	-34.7862141	-58.3234077	0.9850022978082952	administrative	1
1441	-26.9567733	-60.2026412	0.6373380601845064	administrative	1
1316	-37.2874708	-59.1121191	0.9099999999999999	administrative	1
1451	-34.7303025	-58.268868	0.8937486180714317	administrative	1
1460	-37.309340802040815	-59.1362414510204	0.731	house	1
1461	-37.2911093	-59.1583878	0.82	residential	1
1463	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1464	-34.6061393	-58.7364369	0.61	residential	1
1465	-34.5952884	-58.7498157	0.61	residential	1
1467	-34.649401	-58.7624957	1.01	residential	1
1468	-34.6237339	-58.8603798	0.6083870403687117	administrative	1
1469	-33.9099973	-60.5936596	0.81	administrative	1
1470	-38.7244995	-62.2892236	0.71	primary	1
1471	-33.9099973	-60.5936596	0.81	administrative	1
1472	-33.9099973	-60.5936596	0.81	administrative	1
1473	-33.9099973	-60.5936596	0.81	administrative	1
1474	-34.6510527	-58.6217416	0.7593602693412184	administrative	1
1475	-33.9099973	-60.5936596	0.81	administrative	1
1476	-33.9099973	-60.5936596	0.81	administrative	1
1477	-33.9099973	-60.5936596	0.81	administrative	1
1479	-34.6206642	-58.7702844	0.9199999999999999	residential	1
1481	-33.9099973	-60.5936596	0.81	administrative	1
1482	-34.64711255306123	-58.75813734489796	0.9309999999999999	house	1
1483	-34.5877152	-58.7627484	0.72	residential	1
1484	-33.9099973	-60.5936596	0.81	administrative	1
1486	-33.9099973	-60.5936596	0.81	administrative	1
1487	-34.66158161020408	-58.369012924489795	0.721	house	1
1488	-33.9099973	-60.5936596	0.81	administrative	1
1489	-38.719277	-62.295308	0.81	administrative	1
1490	-33.9099973	-60.5936596	0.81	administrative	1
1491	-33.9099973	-60.5936596	0.81	administrative	1
1492	-33.9099973	-60.5936596	0.81	administrative	1
1493	-33.9099973	-60.5936596	0.81	administrative	1
1494	-33.9099973	-60.5936596	0.81	administrative	1
1495	-33.9099973	-60.5936596	0.81	administrative	1
1496	-33.9099973	-60.5936596	0.81	administrative	1
1497	-33.9099973	-60.5936596	0.81	administrative	1
1498	-33.9099973	-60.5936596	0.81	administrative	1
1499	-33.9099973	-60.5936596	0.81	administrative	1
1500	-34.6456958	-58.8441412	0.71	residential	1
1501	-33.9099973	-60.5936596	0.81	administrative	1
1502	-33.9099973	-60.5936596	0.81	administrative	1
1503	-33.9099973	-60.5936596	0.81	administrative	1
1504	-33.9099973	-60.5936596	0.81	administrative	1
1505	-33.9099973	-60.5936596	0.81	administrative	1
1506	-34.6478478	-58.8778166	0.61	residential	1
1507	-34.6176925	-58.8070582	0.71	residential	1
1508	-33.9099973	-60.5936596	0.81	administrative	1
1509	-33.9099973	-60.5936596	0.81	administrative	1
1510	-34.6193534	-58.7345645	0.71	residential	1
1511	-34.664023	-58.7635345	0.61	residential	1
1512	-34.6796795	-58.8303907	0.71	residential	1
1519	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1520	-34.5920919	-58.7528413	0.61	tertiary	1
1521	-34.6164453	-58.7437495	0.61	residential	1
1522	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1523	-34.6143696	-58.7633591	0.61	residential	1
1524	-34.583455099999995	-58.73748926094075	0.71	administrative	1
1525	-33.9099973	-60.5936596	0.81	administrative	1
1526	-33.9099973	-60.5936596	0.81	administrative	1
1529	-33.9099973	-60.5936596	0.81	administrative	1
1530	-34.6481045	-58.7669138	0.8099999999999999	residential	1
1531	-33.9099973	-60.5936596	0.81	administrative	1
1532	-33.9099973	-60.5936596	0.81	administrative	1
1533	-34.575062	-58.82956	0.82	residential	1
1534	-34.6433257	-58.7521874	0.9933898976961371	administrative	1
1535	-33.9099973	-60.5936596	0.81	administrative	1
1536	-33.9099973	-60.5936596	0.81	administrative	1
1537	-34.5976118	-60.943717	0.511	house	1
1538	-38.719277	-62.295308	0.81	administrative	1
1539	-33.9099973	-60.5936596	0.81	administrative	1
1540	-33.9099973	-60.5936596	0.81	administrative	1
1541	-34.6460954	-58.8300289	0.7273380601845065	administrative	1
1543	-34.6604988	-58.7321695	0.8266605781644638	administrative	1
1466	-33.9099973	-60.5936596	0.81	administrative	1
1544	-33.9099973	-60.5936596	0.81	administrative	1
1548	-34.6460954	-58.8300289	0.7273380601845065	administrative	1
1550	-40.7946443	-62.9605552	0.81	administrative	1
1551	-34.8888515	-58.5618507	0.5199999999999999	residential	1
1406	-37.3282887	-59.1356957	0.8810861911257393	administrative	1
1552	-34.9206797	-57.9537638	1.0766550198799103	administrative	1
1560	-33.897495	-60.575046	0.9663910141518243	city	1
1562	-34.933346	-57.9636706	0.8099999999999999	residential	1
1564	-34.63950704897959	-58.602585553061225	0.721	house	1
1565	-34.6431369	-58.5947185	0.9083325464571608	administrative	1
\.


--
-- Data for Name: semana_epidemiologica; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.semana_epidemiologica (id, nombre_semana, numero_semana, anio, fecha) FROM stdin;
1	Semana 9 2020	9	2020	2020-02-28
2	Semana 10 2020	10	2020	2020-03-04
3	Semana 10 2020	10	2020	2020-03-05
4	Semana 11 2020	11	2020	2020-03-08
5	Semana 11 2020	11	2020	2020-03-09
6	Semana 11 2020	11	2020	2020-03-10
7	Semana 11 2020	11	2020	2020-03-11
8	Semana 11 2020	11	2020	2020-03-12
9	Semana 11 2020	11	2020	2020-03-13
10	Semana 11 2020	11	2020	2020-03-14
11	Semana 12 2020	12	2020	2020-03-15
12	Semana 12 2020	12	2020	2020-03-16
13	Semana 12 2020	12	2020	2020-03-17
14	Semana 12 2020	12	2020	2020-03-18
15	Semana 12 2020	12	2020	2020-03-19
16	Semana 12 2020	12	2020	2020-03-20
17	Semana 12 2020	12	2020	2020-03-21
18	Semana 13 2020	13	2020	2020-03-22
19	Semana 13 2020	13	2020	2020-03-23
20	Semana 13 2020	13	2020	2020-03-24
21	Semana 13 2020	13	2020	2020-03-25
22	Semana 13 2020	13	2020	2020-03-26
23	Semana 13 2020	13	2020	2020-03-27
24	Semana 13 2020	13	2020	2020-03-28
25	Semana 14 2020	14	2020	2020-03-29
26	Semana 14 2020	14	2020	2020-03-30
27	Semana 14 2020	14	2020	2020-03-31
28	Semana 14 2020	14	2020	2020-04-01
29	Semana 14 2020	14	2020	2020-04-02
30	Semana 14 2020	14	2020	2020-04-03
31	Semana 14 2020	14	2020	2020-04-04
32	Semana 15 2020	15	2020	2020-04-05
33	Semana 15 2020	15	2020	2020-04-06
34	Semana 15 2020	15	2020	2020-04-07
35	Semana 15 2020	15	2020	2020-04-08
36	Semana 15 2020	15	2020	2020-04-09
37	Semana 15 2020	15	2020	2020-04-10
38	Semana 15 2020	15	2020	2020-04-11
39	Semana 16 2020	16	2020	2020-04-12
40	Semana 16 2020	16	2020	2020-04-13
41	Semana 16 2020	16	2020	2020-04-14
42	Semana 16 2020	16	2020	2020-04-15
43	Semana 16 2020	16	2020	2020-04-16
44	Semana 16 2020	16	2020	2020-04-17
45	Semana 16 2020	16	2020	2020-04-18
46	Semana 17 2020	17	2020	2020-04-19
47	Semana 17 2020	17	2020	2020-04-20
48	Semana 17 2020	17	2020	2020-04-21
49	Semana 17 2020	17	2020	2020-04-22
50	Semana 17 2020	17	2020	2020-04-23
51	Semana 17 2020	17	2020	2020-04-24
52	Semana 17 2020	17	2020	2020-04-25
53	Semana 18 2020	18	2020	2020-04-26
54	Semana 18 2020	18	2020	2020-04-27
55	Semana 18 2020	18	2020	2020-04-28
56	Semana 18 2020	18	2020	2020-04-29
57	Semana 18 2020	18	2020	2020-04-30
58	Semana 18 2020	18	2020	2020-05-01
59	Semana 18 2020	18	2020	2020-05-02
60	Semana 19 2020	19	2020	2020-05-03
61	Semana 19 2020	19	2020	2020-05-04
62	Semana 19 2020	19	2020	2020-05-05
63	Semana 19 2020	19	2020	2020-05-06
64	Semana 19 2020	19	2020	2020-05-07
65	Semana 19 2020	19	2020	2020-05-08
66	Semana 19 2020	19	2020	2020-05-09
67	Semana 20 2020	20	2020	2020-05-10
68	Semana 20 2020	20	2020	2020-05-11
69	Semana 20 2020	20	2020	2020-05-12
70	Semana 20 2020	20	2020	2020-05-13
71	Semana 20 2020	20	2020	2020-05-14
72	Semana 20 2020	20	2020	2020-05-15
73	Semana 20 2020	20	2020	2020-05-16
74	Semana 21 2020	21	2020	2020-05-17
75	Semana 21 2020	21	2020	2020-05-18
76	Semana 21 2020	21	2020	2020-05-19
77	Semana 21 2020	21	2020	2020-05-20
78	Semana 21 2020	21	2020	2020-05-21
79	Semana 21 2020	21	2020	2020-05-22
80	Semana 21 2020	21	2020	2020-05-23
81	Semana 22 2020	22	2020	2020-05-24
82	Semana 22 2020	22	2020	2020-05-25
83	Semana 22 2020	22	2020	2020-05-26
84	Semana 22 2020	22	2020	2020-05-27
85	Semana 22 2020	22	2020	2020-05-28
86	Semana 22 2020	22	2020	2020-05-29
87	Semana 22 2020	22	2020	2020-05-30
88	Semana 23 2020	23	2020	2020-05-31
89	Semana 23 2020	23	2020	2020-06-01
90	Semana 23 2020	23	2020	2020-06-02
91	Semana 23 2020	23	2020	2020-06-03
92	Semana 23 2020	23	2020	2020-06-04
93	Semana 23 2020	23	2020	2020-06-05
94	Semana 23 2020	23	2020	2020-06-06
95	Semana 24 2020	24	2020	2020-06-07
96	Semana 24 2020	24	2020	2020-06-08
97	Semana 24 2020	24	2020	2020-06-09
98	Semana 24 2020	24	2020	2020-06-10
99	Semana 24 2020	24	2020	2020-06-11
100	Semana 24 2020	24	2020	2020-06-12
101	Semana 24 2020	24	2020	2020-06-13
102	Semana 25 2020	25	2020	2020-06-14
103	Semana 25 2020	25	2020	2020-06-15
104	Semana 25 2020	25	2020	2020-06-16
105	Semana 25 2020	25	2020	2020-06-17
106	Semana 25 2020	25	2020	2020-06-18
107	Semana 25 2020	25	2020	2020-06-19
108	Semana 25 2020	25	2020	2020-06-20
109	Semana 26 2020	26	2020	2020-06-21
110	Semana 26 2020	26	2020	2020-06-22
111	Semana 26 2020	26	2020	2020-06-23
112	Semana 26 2020	26	2020	2020-06-24
113	Semana 26 2020	26	2020	2020-06-25
114	Semana 26 2020	26	2020	2020-06-26
115	Semana 26 2020	26	2020	2020-06-27
116	Semana 27 2020	27	2020	2020-06-28
117	Semana 27 2020	27	2020	2020-06-29
118	Semana 27 2020	27	2020	2020-06-30
119	Semana 27 2020	27	2020	2020-07-01
120	Semana 27 2020	27	2020	2020-07-02
121	Semana 27 2020	27	2020	2020-07-03
122	Semana 27 2020	27	2020	2020-07-04
123	Semana 28 2020	28	2020	2020-07-05
124	Semana 28 2020	28	2020	2020-07-06
125	Semana 28 2020	28	2020	2020-07-07
126	Semana 28 2020	28	2020	2020-07-08
127	Semana 28 2020	28	2020	2020-07-09
128	Semana 28 2020	28	2020	2020-07-10
129	Semana 28 2020	28	2020	2020-07-11
130	Semana 29 2020	29	2020	2020-07-12
131	Semana 29 2020	29	2020	2020-07-13
132	Semana 29 2020	29	2020	2020-07-14
133	Semana 29 2020	29	2020	2020-07-15
134	Semana 29 2020	29	2020	2020-07-16
135	Semana 29 2020	29	2020	2020-07-17
136	Semana 29 2020	29	2020	2020-07-18
137	Semana 30 2020	30	2020	2020-07-19
138	Semana 30 2020	30	2020	2020-07-20
139	Semana 30 2020	30	2020	2020-07-21
140	Semana 30 2020	30	2020	2020-07-22
141	Semana 30 2020	30	2020	2020-07-23
142	Semana 30 2020	30	2020	2020-07-24
143	Semana 30 2020	30	2020	2020-07-25
144	Semana 31 2020	31	2020	2020-07-26
145	Semana 31 2020	31	2020	2020-07-27
146	Semana 31 2020	31	2020	2020-07-28
147	Semana 31 2020	31	2020	2020-07-29
148	Semana 31 2020	31	2020	2020-07-30
149	Semana 31 2020	31	2020	2020-07-31
150	Semana 31 2020	31	2020	2020-08-01
151	Semana 32 2020	32	2020	2020-08-02
152	Semana 32 2020	32	2020	2020-08-03
153	Semana 32 2020	32	2020	2020-08-04
154	Semana 32 2020	32	2020	2020-08-05
155	Semana 32 2020	32	2020	2020-08-06
156	Semana 32 2020	32	2020	2020-08-07
157	Semana 32 2020	32	2020	2020-08-08
158	Semana 33 2020	33	2020	2020-08-09
159	Semana 33 2020	33	2020	2020-08-10
160	Semana 33 2020	33	2020	2020-08-11
161	Semana 33 2020	33	2020	2020-08-12
162	Semana 33 2020	33	2020	2020-08-13
163	Semana 33 2020	33	2020	2020-08-14
164	Semana 33 2020	33	2020	2020-08-15
165	Semana 34 2020	34	2020	2020-08-16
166	Semana 34 2020	34	2020	2020-08-17
167	Semana 34 2020	34	2020	2020-08-18
168	Semana 34 2020	34	2020	2020-08-19
169	Semana 34 2020	34	2020	2020-08-20
170	Semana 34 2020	34	2020	2020-08-21
171	Semana 34 2020	34	2020	2020-08-22
172	Semana 35 2020	35	2020	2020-08-23
173	Semana 35 2020	35	2020	2020-08-24
174	Semana 35 2020	35	2020	2020-08-25
175	Semana 35 2020	35	2020	2020-08-26
176	Semana 35 2020	35	2020	2020-08-27
177	Semana 35 2020	35	2020	2020-08-28
178	Semana 35 2020	35	2020	2020-08-29
179	Semana 36 2020	36	2020	2020-08-30
180	Semana 36 2020	36	2020	2020-08-31
181	Semana 36 2020	36	2020	2020-09-01
182	Semana 36 2020	36	2020	2020-09-02
183	Semana 36 2020	36	2020	2020-09-03
184	Semana 36 2020	36	2020	2020-09-04
185	Semana 36 2020	36	2020	2020-09-05
186	Semana 37 2020	37	2020	2020-09-06
187	Semana 37 2020	37	2020	2020-09-07
188	Semana 37 2020	37	2020	2020-09-08
189	Semana 37 2020	37	2020	2020-09-09
190	Semana 37 2020	37	2020	2020-09-10
191	Semana 37 2020	37	2020	2020-09-11
192	Semana 37 2020	37	2020	2020-09-12
193	Semana 38 2020	38	2020	2020-09-13
194	Semana 38 2020	38	2020	2020-09-14
195	Semana 38 2020	38	2020	2020-09-15
196	Semana 38 2020	38	2020	2020-09-16
197	Semana 38 2020	38	2020	2020-09-17
198	Semana 38 2020	38	2020	2020-09-18
199	Semana 38 2020	38	2020	2020-09-19
200	Semana 39 2020	39	2020	2020-09-20
201	Semana 39 2020	39	2020	2020-09-21
202	Semana 39 2020	39	2020	2020-09-22
203	Semana 39 2020	39	2020	2020-09-23
204	Semana 39 2020	39	2020	2020-09-24
205	Semana 39 2020	39	2020	2020-09-25
206	Semana 39 2020	39	2020	2020-09-26
207	Semana 40 2020	40	2020	2020-09-27
208	Semana 40 2020	40	2020	2020-09-28
209	Semana 40 2020	40	2020	2020-09-29
210	Semana 40 2020	40	2020	2020-09-30
211	Semana 40 2020	40	2020	2020-10-01
212	Semana 40 2020	40	2020	2020-10-02
213	Semana 40 2020	40	2020	2020-10-03
214	Semana 41 2020	41	2020	2020-10-04
215	Semana 41 2020	41	2020	2020-10-05
216	Semana 41 2020	41	2020	2020-10-06
217	Semana 41 2020	41	2020	2020-10-07
218	Semana 41 2020	41	2020	2020-10-08
219	Semana 41 2020	41	2020	2020-10-09
220	Semana 41 2020	41	2020	2020-10-10
221	Semana 42 2020	42	2020	2020-10-11
222	Semana 42 2020	42	2020	2020-10-12
223	Semana 42 2020	42	2020	2020-10-13
224	Semana 42 2020	42	2020	2020-10-14
225	Semana 42 2020	42	2020	2020-10-15
226	Semana 42 2020	42	2020	2020-10-16
227	Semana 42 2020	42	2020	2020-10-17
228	Semana 43 2020	43	2020	2020-10-18
229	Semana 43 2020	43	2020	2020-10-19
230	Semana 43 2020	43	2020	2020-10-20
231	Semana 43 2020	43	2020	2020-10-21
232	Semana 43 2020	43	2020	2020-10-22
233	Semana 43 2020	43	2020	2020-10-23
234	Semana 43 2020	43	2020	2020-10-24
235	Semana 44 2020	44	2020	2020-10-25
236	Semana 44 2020	44	2020	2020-10-26
237	Semana 44 2020	44	2020	2020-10-27
238	Semana 44 2020	44	2020	2020-10-28
239	Semana 44 2020	44	2020	2020-10-29
240	Semana 44 2020	44	2020	2020-10-30
241	Semana 44 2020	44	2020	2020-10-31
242	Semana 45 2020	45	2020	2020-11-01
243	Semana 45 2020	45	2020	2020-11-02
244	Semana 45 2020	45	2020	2020-11-03
245	Semana 45 2020	45	2020	2020-11-04
246	Semana 45 2020	45	2020	2020-11-05
247	Semana 45 2020	45	2020	2020-11-06
248	Semana 45 2020	45	2020	2020-11-07
249	Semana 46 2020	46	2020	2020-11-08
250	Semana 46 2020	46	2020	2020-11-09
251	Semana 46 2020	46	2020	2020-11-10
252	Semana 46 2020	46	2020	2020-11-11
253	Semana 46 2020	46	2020	2020-11-12
254	Semana 46 2020	46	2020	2020-11-13
255	Semana 46 2020	46	2020	2020-11-14
256	Semana 47 2020	47	2020	2020-11-15
257	Semana 47 2020	47	2020	2020-11-16
258	Semana 47 2020	47	2020	2020-11-17
259	Semana 47 2020	47	2020	2020-11-18
260	Semana 47 2020	47	2020	2020-11-19
261	Semana 47 2020	47	2020	2020-11-20
262	Semana 47 2020	47	2020	2020-11-21
263	Semana 48 2020	48	2020	2020-11-22
264	Semana 48 2020	48	2020	2020-11-23
265	Semana 48 2020	48	2020	2020-11-24
266	Semana 48 2020	48	2020	2020-11-25
267	Semana 48 2020	48	2020	2020-11-26
268	Semana 48 2020	48	2020	2020-11-27
269	Semana 48 2020	48	2020	2020-11-28
270	Semana 49 2020	49	2020	2020-11-29
271	Semana 49 2020	49	2020	2020-11-30
272	Semana 49 2020	49	2020	2020-12-01
273	Semana 49 2020	49	2020	2020-12-02
274	Semana 49 2020	49	2020	2020-12-03
275	Semana 49 2020	49	2020	2020-12-04
276	Semana 49 2020	49	2020	2020-12-05
277	Semana 50 2020	50	2020	2020-12-06
278	Semana 50 2020	50	2020	2020-12-07
279	Semana 50 2020	50	2020	2020-12-08
280	Semana 50 2020	50	2020	2020-12-09
281	Semana 50 2020	50	2020	2020-12-10
282	Semana 50 2020	50	2020	2020-12-11
283	Semana 50 2020	50	2020	2020-12-12
284	Semana 51 2020	51	2020	2020-12-13
285	Semana 51 2020	51	2020	2020-12-14
286	Semana 51 2020	51	2020	2020-12-15
287	Semana 51 2020	51	2020	2020-12-16
288	Semana 51 2020	51	2020	2020-12-17
289	Semana 51 2020	51	2020	2020-12-18
290	Semana 51 2020	51	2020	2020-12-19
291	Semana 52 2020	52	2020	2020-12-20
292	Semana 52 2020	52	2020	2020-12-21
293	Semana 52 2020	52	2020	2020-12-22
294	Semana 52 2020	52	2020	2020-12-23
295	Semana 52 2020	52	2020	2020-12-24
296	Semana 52 2020	52	2020	2020-12-25
297	Semana 52 2020	52	2020	2020-12-26
298	Semana 53 2020	53	2020	2020-12-27
299	Semana 53 2020	53	2020	2020-12-28
300	Semana 53 2020	53	2020	2020-12-29
301	Semana 53 2020	53	2020	2020-12-30
302	Semana 53 2020	53	2020	2020-12-31
303	Semana 53 2020	53	2020	2021-01-01
304	Semana 53 2020	53	2020	2021-01-02
305	Semana 1 2021	1	2021	2021-01-03
306	Semana 1 2021	1	2021	2021-01-04
307	Semana 1 2021	1	2021	2021-01-05
308	Semana 1 2021	1	2021	2021-01-06
309	Semana 1 2021	1	2021	2021-01-07
310	Semana 1 2021	1	2021	2021-01-08
311	Semana 1 2021	1	2021	2021-01-09
312	Semana 2 2021	2	2021	2021-01-10
313	Semana 2 2021	2	2021	2021-01-11
314	Semana 2 2021	2	2021	2021-01-12
315	Semana 2 2021	2	2021	2021-01-13
316	Semana 2 2021	2	2021	2021-01-14
317	Semana 2 2021	2	2021	2021-01-15
318	Semana 2 2021	2	2021	2021-01-16
319	Semana 3 2021	3	2021	2021-01-17
320	Semana 3 2021	3	2021	2021-01-18
321	Semana 3 2021	3	2021	2021-01-19
322	Semana 3 2021	3	2021	2021-01-20
323	Semana 3 2021	3	2021	2021-01-21
324	Semana 3 2021	3	2021	2021-01-22
325	Semana 3 2021	3	2021	2021-01-23
326	Semana 4 2021	4	2021	2021-01-24
327	Semana 4 2021	4	2021	2021-01-25
328	Semana 4 2021	4	2021	2021-01-26
329	Semana 4 2021	4	2021	2021-01-27
330	Semana 4 2021	4	2021	2021-01-28
331	Semana 4 2021	4	2021	2021-01-29
332	Semana 4 2021	4	2021	2021-01-30
333	Semana 5 2021	5	2021	2021-01-31
334	Semana 5 2021	5	2021	2021-02-01
335	Semana 5 2021	5	2021	2021-02-02
336	Semana 5 2021	5	2021	2021-02-03
337	Semana 5 2021	5	2021	2021-02-04
338	Semana 5 2021	5	2021	2021-02-05
339	Semana 5 2021	5	2021	2021-02-06
340	Semana 6 2021	6	2021	2021-02-07
341	Semana 6 2021	6	2021	2021-02-08
342	Semana 6 2021	6	2021	2021-02-09
343	Semana 6 2021	6	2021	2021-02-10
344	Semana 6 2021	6	2021	2021-02-11
345	Semana 6 2021	6	2021	2021-02-12
346	Semana 6 2021	6	2021	2021-02-13
347	Semana 7 2021	7	2021	2021-02-14
348	Semana 7 2021	7	2021	2021-02-15
349	Semana 7 2021	7	2021	2021-02-16
350	Semana 7 2021	7	2021	2021-02-17
351	Semana 7 2021	7	2021	2021-02-18
352	Semana 7 2021	7	2021	2021-02-19
353	Semana 7 2021	7	2021	2021-02-20
354	Semana 8 2021	8	2021	2021-02-21
355	Semana 8 2021	8	2021	2021-02-22
356	Semana 8 2021	8	2021	2021-02-23
357	Semana 8 2021	8	2021	2021-02-24
358	Semana 8 2021	8	2021	2021-02-25
359	Semana 8 2021	8	2021	2021-02-26
360	Semana 8 2021	8	2021	2021-02-27
361	Semana 9 2021	9	2021	2021-02-28
362	Semana 9 2021	9	2021	2021-03-01
363	Semana 9 2021	9	2021	2021-03-02
364	Semana 9 2021	9	2021	2021-03-03
365	Semana 9 2021	9	2021	2021-03-04
366	Semana 9 2021	9	2021	2021-03-05
367	Semana 9 2021	9	2021	2021-03-06
368	Semana 10 2021	10	2021	2021-03-07
369	Semana 10 2021	10	2021	2021-03-08
370	Semana 10 2021	10	2021	2021-03-09
371	Semana 10 2021	10	2021	2021-03-10
372	Semana 10 2021	10	2021	2021-03-11
373	Semana 10 2021	10	2021	2021-03-12
374	Semana 10 2021	10	2021	2021-03-13
375	Semana 11 2021	11	2021	2021-03-14
376	Semana 11 2021	11	2021	2021-03-15
377	Semana 11 2021	11	2021	2021-03-16
378	Semana 11 2021	11	2021	2021-03-17
379	Semana 11 2021	11	2021	2021-03-18
380	Semana 11 2021	11	2021	2021-03-19
381	Semana 11 2021	11	2021	2021-03-20
382	Semana 12 2021	12	2021	2021-03-21
383	Semana 12 2021	12	2021	2021-03-22
384	Semana 12 2021	12	2021	2021-03-23
385	Semana 12 2021	12	2021	2021-03-24
386	Semana 12 2021	12	2021	2021-03-25
387	Semana 12 2021	12	2021	2021-03-26
388	Semana 12 2021	12	2021	2021-03-27
389	Semana 13 2021	13	2021	2021-03-28
390	Semana 13 2021	13	2021	2021-03-29
391	Semana 13 2021	13	2021	2021-03-30
392	Semana 13 2021	13	2021	2021-03-31
393	Semana 13 2021	13	2021	2021-04-01
394	Semana 13 2021	13	2021	2021-04-02
395	Semana 13 2021	13	2021	2021-04-03
396	Semana 14 2021	14	2021	2021-04-04
397	Semana 14 2021	14	2021	2021-04-05
398	Semana 14 2021	14	2021	2021-04-06
399	Semana 14 2021	14	2021	2021-04-07
400	Semana 14 2021	14	2021	2021-04-08
401	Semana 14 2021	14	2021	2021-04-09
402	Semana 14 2021	14	2021	2021-04-10
403	Semana 15 2021	15	2021	2021-04-11
404	Semana 15 2021	15	2021	2021-04-12
405	Semana 15 2021	15	2021	2021-04-13
406	Semana 15 2021	15	2021	2021-04-14
407	Semana 15 2021	15	2021	2021-04-15
408	Semana 15 2021	15	2021	2021-04-16
409	Semana 15 2021	15	2021	2021-04-17
410	Semana 16 2021	16	2021	2021-04-18
411	Semana 16 2021	16	2021	2021-04-19
412	Semana 16 2021	16	2021	2021-04-20
413	Semana 16 2021	16	2021	2021-04-21
414	Semana 16 2021	16	2021	2021-04-22
415	Semana 16 2021	16	2021	2021-04-23
416	Semana 16 2021	16	2021	2021-04-24
417	Semana 17 2021	17	2021	2021-04-25
418	Semana 17 2021	17	2021	2021-04-26
419	Semana 17 2021	17	2021	2021-04-27
420	Semana 17 2021	17	2021	2021-04-28
421	Semana 17 2021	17	2021	2021-04-29
422	Semana 17 2021	17	2021	2021-04-30
423	Semana 17 2021	17	2021	2021-05-01
424	Semana 18 2021	18	2021	2021-05-02
425	Semana 18 2021	18	2021	2021-05-03
426	Semana 18 2021	18	2021	2021-05-04
427	Semana 18 2021	18	2021	2021-05-05
428	Semana 18 2021	18	2021	2021-05-06
429	Semana 18 2021	18	2021	2021-05-07
430	Semana 18 2021	18	2021	2021-05-08
431	Semana 19 2021	19	2021	2021-05-09
432	Semana 19 2021	19	2021	2021-05-10
433	Semana 19 2021	19	2021	2021-05-11
434	Semana 19 2021	19	2021	2021-05-12
435	Semana 19 2021	19	2021	2021-05-13
436	Semana 19 2021	19	2021	2021-05-14
437	Semana 19 2021	19	2021	2021-05-15
438	Semana 20 2021	20	2021	2021-05-16
439	Semana 20 2021	20	2021	2021-05-17
440	Semana 20 2021	20	2021	2021-05-18
441	Semana 20 2021	20	2021	2021-05-19
442	Semana 20 2021	20	2021	2021-05-20
443	Semana 20 2021	20	2021	2021-05-21
444	Semana 20 2021	20	2021	2021-05-22
445	Semana 21 2021	21	2021	2021-05-23
446	Semana 21 2021	21	2021	2021-05-24
447	Semana 21 2021	21	2021	2021-05-25
448	Semana 21 2021	21	2021	2021-05-26
449	Semana 21 2021	21	2021	2021-05-27
450	Semana 21 2021	21	2021	2021-05-28
451	Semana 21 2021	21	2021	2021-05-29
452	Semana 22 2021	22	2021	2021-05-30
453	Semana 22 2021	22	2021	2021-05-31
454	Semana 22 2021	22	2021	2021-06-01
455	Semana 22 2021	22	2021	2021-06-02
456	Semana 22 2021	22	2021	2021-06-03
457	Semana 22 2021	22	2021	2021-06-04
458	Semana 22 2021	22	2021	2021-06-05
459	Semana 23 2021	23	2021	2021-06-06
460	Semana 23 2021	23	2021	2021-06-07
461	Semana 23 2021	23	2021	2021-06-08
462	Semana 23 2021	23	2021	2021-06-09
463	Semana 23 2021	23	2021	2021-06-10
464	Semana 23 2021	23	2021	2021-06-11
465	Semana 23 2021	23	2021	2021-06-12
466	Semana 24 2021	24	2021	2021-06-13
467	Semana 24 2021	24	2021	2021-06-14
468	Semana 24 2021	24	2021	2021-06-15
469	Semana 24 2021	24	2021	2021-06-16
470	Semana 24 2021	24	2021	2021-06-17
471	Semana 24 2021	24	2021	2021-06-18
472	Semana 24 2021	24	2021	2021-06-19
473	Semana 25 2021	25	2021	2021-06-20
474	Semana 25 2021	25	2021	2021-06-21
475	Semana 25 2021	25	2021	2021-06-22
476	Semana 25 2021	25	2021	2021-06-23
477	Semana 25 2021	25	2021	2021-06-24
478	Semana 25 2021	25	2021	2021-06-25
479	Semana 25 2021	25	2021	2021-06-26
480	Semana 26 2021	26	2021	2021-06-27
481	Semana 26 2021	26	2021	2021-06-28
482	Semana 26 2021	26	2021	2021-06-29
483	Semana 26 2021	26	2021	2021-06-30
484	Semana 26 2021	26	2021	2021-07-01
485	Semana 26 2021	26	2021	2021-07-02
486	Semana 26 2021	26	2021	2021-07-03
487	Semana 27 2021	27	2021	2021-07-04
488	Semana 27 2021	27	2021	2021-07-05
489	Semana 27 2021	27	2021	2021-07-06
490	Semana 27 2021	27	2021	2021-07-07
491	Semana 27 2021	27	2021	2021-07-08
492	Semana 27 2021	27	2021	2021-07-09
493	Semana 27 2021	27	2021	2021-07-10
494	Semana 28 2021	28	2021	2021-07-11
495	Semana 28 2021	28	2021	2021-07-12
496	Semana 28 2021	28	2021	2021-07-13
497	Semana 28 2021	28	2021	2021-07-14
498	Semana 28 2021	28	2021	2021-07-15
499	Semana 28 2021	28	2021	2021-07-16
500	Semana 28 2021	28	2021	2021-07-17
501	Semana 29 2021	29	2021	2021-07-18
502	Semana 29 2021	29	2021	2021-07-19
503	Semana 29 2021	29	2021	2021-07-20
504	Semana 29 2021	29	2021	2021-07-21
505	Semana 29 2021	29	2021	2021-07-22
506	Semana 29 2021	29	2021	2021-07-23
507	Semana 29 2021	29	2021	2021-07-24
508	Semana 30 2021	30	2021	2021-07-25
509	Semana 30 2021	30	2021	2021-07-26
510	Semana 30 2021	30	2021	2021-07-27
511	Semana 30 2021	30	2021	2021-07-28
512	Semana 30 2021	30	2021	2021-07-29
513	Semana 30 2021	30	2021	2021-07-30
514	Semana 30 2021	30	2021	2021-07-31
515	Semana 31 2021	31	2021	2021-08-01
516	Semana 31 2021	31	2021	2021-08-02
517	Semana 31 2021	31	2021	2021-08-03
518	Semana 31 2021	31	2021	2021-08-04
519	Semana 31 2021	31	2021	2021-08-05
520	Semana 31 2021	31	2021	2021-08-06
521	Semana 31 2021	31	2021	2021-08-07
522	Semana 32 2021	32	2021	2021-08-08
523	Semana 32 2021	32	2021	2021-08-09
524	Semana 32 2021	32	2021	2021-08-10
525	Semana 32 2021	32	2021	2021-08-11
526	Semana 32 2021	32	2021	2021-08-12
527	Semana 32 2021	32	2021	2021-08-13
528	Semana 32 2021	32	2021	2021-08-14
529	Semana 33 2021	33	2021	2021-08-15
530	Semana 33 2021	33	2021	2021-08-16
531	Semana 33 2021	33	2021	2021-08-17
532	Semana 33 2021	33	2021	2021-08-18
533	Semana 33 2021	33	2021	2021-08-19
534	Semana 33 2021	33	2021	2021-08-20
535	Semana 33 2021	33	2021	2021-08-21
536	Semana 34 2021	34	2021	2021-08-22
537	Semana 34 2021	34	2021	2021-08-23
538	Semana 34 2021	34	2021	2021-08-24
539	Semana 34 2021	34	2021	2021-08-25
540	Semana 34 2021	34	2021	2021-08-26
541	Semana 34 2021	34	2021	2021-08-27
542	Semana 34 2021	34	2021	2021-08-28
543	Semana 35 2021	35	2021	2021-08-29
544	Semana 35 2021	35	2021	2021-08-30
545	Semana 35 2021	35	2021	2021-08-31
546	Semana 35 2021	35	2021	2021-09-01
547	Semana 35 2021	35	2021	2021-09-02
548	Semana 35 2021	35	2021	2021-09-03
549	Semana 35 2021	35	2021	2021-09-04
550	Semana 36 2021	36	2021	2021-09-05
551	Semana 36 2021	36	2021	2021-09-06
552	Semana 36 2021	36	2021	2021-09-07
553	Semana 36 2021	36	2021	2021-09-08
554	Semana 36 2021	36	2021	2021-09-09
555	Semana 36 2021	36	2021	2021-09-10
556	Semana 36 2021	36	2021	2021-09-11
557	Semana 37 2021	37	2021	2021-09-12
558	Semana 37 2021	37	2021	2021-09-13
559	Semana 37 2021	37	2021	2021-09-14
560	Semana 37 2021	37	2021	2021-09-15
561	Semana 37 2021	37	2021	2021-09-16
562	Semana 37 2021	37	2021	2021-09-17
563	Semana 37 2021	37	2021	2021-09-18
564	Semana 38 2021	38	2021	2021-09-19
565	Semana 38 2021	38	2021	2021-09-20
566	Semana 38 2021	38	2021	2021-09-21
567	Semana 38 2021	38	2021	2021-09-22
568	Semana 38 2021	38	2021	2021-09-23
569	Semana 38 2021	38	2021	2021-09-24
570	Semana 38 2021	38	2021	2021-09-25
571	Semana 39 2021	39	2021	2021-09-26
572	Semana 39 2021	39	2021	2021-09-27
573	Semana 39 2021	39	2021	2021-09-28
574	Semana 39 2021	39	2021	2021-09-29
575	Semana 39 2021	39	2021	2021-09-30
576	Semana 39 2021	39	2021	2021-10-01
577	Semana 39 2021	39	2021	2021-10-02
578	Semana 40 2021	40	2021	2021-10-03
579	Semana 40 2021	40	2021	2021-10-04
580	Semana 40 2021	40	2021	2021-10-05
581	Semana 40 2021	40	2021	2021-10-06
582	Semana 40 2021	40	2021	2021-10-07
583	Semana 40 2021	40	2021	2021-10-08
584	Semana 40 2021	40	2021	2021-10-09
585	Semana 41 2021	41	2021	2021-10-10
586	Semana 41 2021	41	2021	2021-10-11
587	Semana 41 2021	41	2021	2021-10-12
588	Semana 41 2021	41	2021	2021-10-13
589	Semana 41 2021	41	2021	2021-10-14
590	Semana 41 2021	41	2021	2021-10-15
591	Semana 41 2021	41	2021	2021-10-16
592	Semana 42 2021	42	2021	2021-10-17
593	Semana 42 2021	42	2021	2021-10-18
594	Semana 42 2021	42	2021	2021-10-19
595	Semana 42 2021	42	2021	2021-10-20
596	Semana 42 2021	42	2021	2021-10-21
597	Semana 42 2021	42	2021	2021-10-22
598	Semana 42 2021	42	2021	2021-10-23
599	Semana 43 2021	43	2021	2021-10-24
600	Semana 43 2021	43	2021	2021-10-25
601	Semana 43 2021	43	2021	2021-10-26
602	Semana 43 2021	43	2021	2021-10-27
603	Semana 43 2021	43	2021	2021-10-28
604	Semana 43 2021	43	2021	2021-10-29
605	Semana 43 2021	43	2021	2021-10-30
606	Semana 44 2021	44	2021	2021-10-31
607	Semana 44 2021	44	2021	2021-11-01
608	Semana 44 2021	44	2021	2021-11-02
609	Semana 44 2021	44	2021	2021-11-03
610	Semana 44 2021	44	2021	2021-11-04
611	Semana 44 2021	44	2021	2021-11-05
612	Semana 44 2021	44	2021	2021-11-06
613	Semana 45 2021	45	2021	2021-11-07
614	Semana 45 2021	45	2021	2021-11-08
615	Semana 45 2021	45	2021	2021-11-09
616	Semana 45 2021	45	2021	2021-11-10
617	Semana 45 2021	45	2021	2021-11-11
618	Semana 45 2021	45	2021	2021-11-12
619	Semana 45 2021	45	2021	2021-11-13
620	Semana 46 2021	46	2021	2021-11-14
621	Semana 46 2021	46	2021	2021-11-15
622	Semana 46 2021	46	2021	2021-11-16
623	Semana 46 2021	46	2021	2021-11-17
624	Semana 46 2021	46	2021	2021-11-18
625	Semana 46 2021	46	2021	2021-11-19
626	Semana 46 2021	46	2021	2021-11-20
627	Semana 47 2021	47	2021	2021-11-21
628	Semana 47 2021	47	2021	2021-11-22
629	Semana 47 2021	47	2021	2021-11-23
630	Semana 47 2021	47	2021	2021-11-24
631	Semana 47 2021	47	2021	2021-11-25
632	Semana 47 2021	47	2021	2021-11-26
633	Semana 47 2021	47	2021	2021-11-27
634	Semana 48 2021	48	2021	2021-11-28
635	Semana 48 2021	48	2021	2021-11-29
636	Semana 48 2021	48	2021	2021-11-30
637	Semana 48 2021	48	2021	2021-12-01
638	Semana 48 2021	48	2021	2021-12-02
639	Semana 48 2021	48	2021	2021-12-03
640	Semana 48 2021	48	2021	2021-12-04
641	Semana 49 2021	49	2021	2021-12-05
642	Semana 49 2021	49	2021	2021-12-06
643	Semana 49 2021	49	2021	2021-12-07
644	Semana 49 2021	49	2021	2021-12-08
645	Semana 49 2021	49	2021	2021-12-09
646	Semana 49 2021	49	2021	2021-12-10
647	Semana 49 2021	49	2021	2021-12-11
648	Semana 50 2021	50	2021	2021-12-12
649	Semana 50 2021	50	2021	2021-12-13
650	Semana 50 2021	50	2021	2021-12-14
651	Semana 50 2021	50	2021	2021-12-15
652	Semana 50 2021	50	2021	2021-12-16
653	Semana 50 2021	50	2021	2021-12-17
654	Semana 50 2021	50	2021	2021-12-18
655	Semana 51 2021	51	2021	2021-12-19
656	Semana 51 2021	51	2021	2021-12-20
657	Semana 51 2021	51	2021	2021-12-21
658	Semana 51 2021	51	2021	2021-12-22
659	Semana 51 2021	51	2021	2021-12-23
660	Semana 51 2021	51	2021	2021-12-24
661	Semana 51 2021	51	2021	2021-12-25
662	Semana 52 2021	52	2021	2021-12-26
663	Semana 52 2021	52	2021	2021-12-27
664	Semana 52 2021	52	2021	2021-12-28
665	Semana 52 2021	52	2021	2021-12-29
666	Semana 52 2021	52	2021	2021-12-30
667	Semana 52 2021	52	2021	2021-12-31
668	Semana 52 2021	52	2021	2022-01-01
669	Semana 1 2022	1	2022	2022-01-02
670	Semana 1 2022	1	2022	2022-01-03
671	Semana 1 2022	1	2022	2022-01-04
672	Semana 1 2022	1	2022	2022-01-05
673	Semana 1 2022	1	2022	2022-01-06
674	Semana 1 2022	1	2022	2022-01-07
675	Semana 1 2022	1	2022	2022-01-08
676	Semana 2 2022	2	2022	2022-01-09
677	Semana 2 2022	2	2022	2022-01-10
678	Semana 2 2022	2	2022	2022-01-11
679	Semana 2 2022	2	2022	2022-01-12
680	Semana 2 2022	2	2022	2022-01-13
681	Semana 2 2022	2	2022	2022-01-14
682	Semana 2 2022	2	2022	2022-01-15
683	Semana 3 2022	3	2022	2022-01-16
684	Semana 3 2022	3	2022	2022-01-17
685	Semana 3 2022	3	2022	2022-01-18
686	Semana 3 2022	3	2022	2022-01-19
687	Semana 3 2022	3	2022	2022-01-20
688	Semana 3 2022	3	2022	2022-01-21
689	Semana 3 2022	3	2022	2022-01-22
690	Semana 4 2022	4	2022	2022-01-23
691	Semana 4 2022	4	2022	2022-01-24
692	Semana 4 2022	4	2022	2022-01-25
693	Semana 4 2022	4	2022	2022-01-26
694	Semana 4 2022	4	2022	2022-01-27
695	Semana 4 2022	4	2022	2022-01-28
696	Semana 4 2022	4	2022	2022-01-29
697	Semana 5 2022	5	2022	2022-01-30
698	Semana 5 2022	5	2022	2022-01-31
699	Semana 5 2022	5	2022	2022-02-01
700	Semana 5 2022	5	2022	2022-02-02
701	Semana 5 2022	5	2022	2022-02-03
702	Semana 5 2022	5	2022	2022-02-04
703	Semana 5 2022	5	2022	2022-02-05
704	Semana 6 2022	6	2022	2022-02-06
705	Semana 6 2022	6	2022	2022-02-07
706	Semana 6 2022	6	2022	2022-02-08
707	Semana 6 2022	6	2022	2022-02-09
708	Semana 6 2022	6	2022	2022-02-10
709	Semana 6 2022	6	2022	2022-02-11
710	Semana 6 2022	6	2022	2022-02-12
711	Semana 7 2022	7	2022	2022-02-13
712	Semana 7 2022	7	2022	2022-02-14
713	Semana 7 2022	7	2022	2022-02-15
714	Semana 7 2022	7	2022	2022-02-16
715	Semana 7 2022	7	2022	2022-02-17
716	Semana 7 2022	7	2022	2022-02-18
717	Semana 7 2022	7	2022	2022-02-19
718	Semana 8 2022	8	2022	2022-02-20
719	Semana 8 2022	8	2022	2022-02-21
720	Semana 8 2022	8	2022	2022-02-22
721	Semana 8 2022	8	2022	2022-02-23
722	Semana 8 2022	8	2022	2022-02-24
723	Semana 8 2022	8	2022	2022-02-25
724	Semana 8 2022	8	2022	2022-02-26
725	Semana 9 2022	9	2022	2022-02-27
726	Semana 9 2022	9	2022	2022-02-28
727	Semana 9 2022	9	2022	2022-03-01
728	Semana 9 2022	9	2022	2022-03-02
729	Semana 9 2022	9	2022	2022-03-03
730	Semana 9 2022	9	2022	2022-03-04
731	Semana 9 2022	9	2022	2022-03-05
732	Semana 10 2022	10	2022	2022-03-06
733	Semana 10 2022	10	2022	2022-03-07
734	Semana 10 2022	10	2022	2022-03-08
735	Semana 10 2022	10	2022	2022-03-09
736	Semana 10 2022	10	2022	2022-03-10
737	Semana 10 2022	10	2022	2022-03-11
738	Semana 10 2022	10	2022	2022-03-12
739	Semana 11 2022	11	2022	2022-03-13
740	Semana 11 2022	11	2022	2022-03-14
741	Semana 11 2022	11	2022	2022-03-15
742	Semana 11 2022	11	2022	2022-03-16
743	Semana 11 2022	11	2022	2022-03-17
744	Semana 11 2022	11	2022	2022-03-18
745	Semana 11 2022	11	2022	2022-03-19
746	Semana 12 2022	12	2022	2022-03-20
747	Semana 12 2022	12	2022	2022-03-21
748	Semana 12 2022	12	2022	2022-03-22
749	Semana 12 2022	12	2022	2022-03-23
750	Semana 12 2022	12	2022	2022-03-24
751	Semana 12 2022	12	2022	2022-03-25
752	Semana 12 2022	12	2022	2022-03-26
753	Semana 13 2022	13	2022	2022-03-27
754	Semana 13 2022	13	2022	2022-03-28
755	Semana 13 2022	13	2022	2022-03-29
756	Semana 13 2022	13	2022	2022-03-30
757	Semana 13 2022	13	2022	2022-03-31
758	Semana 13 2022	13	2022	2022-04-01
759	Semana 13 2022	13	2022	2022-04-02
760	Semana 14 2022	14	2022	2022-04-03
761	Semana 14 2022	14	2022	2022-04-04
762	Semana 14 2022	14	2022	2022-04-05
763	Semana 14 2022	14	2022	2022-04-06
764	Semana 14 2022	14	2022	2022-04-07
765	Semana 14 2022	14	2022	2022-04-08
766	Semana 14 2022	14	2022	2022-04-09
767	Semana 15 2022	15	2022	2022-04-10
768	Semana 15 2022	15	2022	2022-04-11
769	Semana 15 2022	15	2022	2022-04-12
770	Semana 15 2022	15	2022	2022-04-13
771	Semana 15 2022	15	2022	2022-04-14
772	Semana 15 2022	15	2022	2022-04-15
773	Semana 15 2022	15	2022	2022-04-16
774	Semana 16 2022	16	2022	2022-04-17
775	Semana 16 2022	16	2022	2022-04-18
776	Semana 16 2022	16	2022	2022-04-19
777	Semana 16 2022	16	2022	2022-04-20
778	Semana 16 2022	16	2022	2022-04-21
779	Semana 16 2022	16	2022	2022-04-22
780	Semana 16 2022	16	2022	2022-04-23
781	Semana 17 2022	17	2022	2022-04-24
782	Semana 17 2022	17	2022	2022-04-25
783	Semana 17 2022	17	2022	2022-04-26
784	Semana 17 2022	17	2022	2022-04-27
785	Semana 17 2022	17	2022	2022-04-28
786	Semana 17 2022	17	2022	2022-04-29
787	Semana 17 2022	17	2022	2022-04-30
788	Semana 18 2022	18	2022	2022-05-01
789	Semana 18 2022	18	2022	2022-05-02
790	Semana 18 2022	18	2022	2022-05-03
791	Semana 18 2022	18	2022	2022-05-04
792	Semana 18 2022	18	2022	2022-05-05
793	Semana 18 2022	18	2022	2022-05-06
794	Semana 18 2022	18	2022	2022-05-07
795	Semana 19 2022	19	2022	2022-05-08
796	Semana 19 2022	19	2022	2022-05-09
797	Semana 19 2022	19	2022	2022-05-10
798	Semana 19 2022	19	2022	2022-05-11
799	Semana 19 2022	19	2022	2022-05-12
800	Semana 19 2022	19	2022	2022-05-13
801	Semana 19 2022	19	2022	2022-05-14
802	Semana 20 2022	20	2022	2022-05-15
803	Semana 20 2022	20	2022	2022-05-16
804	Semana 20 2022	20	2022	2022-05-17
805	Semana 20 2022	20	2022	2022-05-18
806	Semana 20 2022	20	2022	2022-05-19
807	Semana 20 2022	20	2022	2022-05-20
808	Semana 20 2022	20	2022	2022-05-21
809	Semana 21 2022	21	2022	2022-05-22
810	Semana 21 2022	21	2022	2022-05-23
811	Semana 21 2022	21	2022	2022-05-24
812	Semana 21 2022	21	2022	2022-05-25
813	Semana 21 2022	21	2022	2022-05-26
814	Semana 21 2022	21	2022	2022-05-27
815	Semana 21 2022	21	2022	2022-05-28
816	Semana 22 2022	22	2022	2022-05-29
817	Semana 22 2022	22	2022	2022-05-30
818	Semana 22 2022	22	2022	2022-05-31
819	Semana 22 2022	22	2022	2022-06-01
820	Semana 22 2022	22	2022	2022-06-02
821	Semana 22 2022	22	2022	2022-06-03
822	Semana 22 2022	22	2022	2022-06-04
823	Semana 23 2022	23	2022	2022-06-05
824	Semana 23 2022	23	2022	2022-06-06
825	Semana 23 2022	23	2022	2022-06-07
826	Semana 23 2022	23	2022	2022-06-08
827	Semana 23 2022	23	2022	2022-06-09
828	Semana 23 2022	23	2022	2022-06-10
829	Semana 23 2022	23	2022	2022-06-11
830	Semana 24 2022	24	2022	2022-06-12
831	Semana 24 2022	24	2022	2022-06-13
832	Semana 24 2022	24	2022	2022-06-14
833	Semana 24 2022	24	2022	2022-06-15
834	Semana 24 2022	24	2022	2022-06-16
835	Semana 24 2022	24	2022	2022-06-17
836	Semana 24 2022	24	2022	2022-06-18
837	Semana 25 2022	25	2022	2022-06-19
838	Semana 25 2022	25	2022	2022-06-20
839	Semana 25 2022	25	2022	2022-06-21
840	Semana 25 2022	25	2022	2022-06-22
841	Semana 25 2022	25	2022	2022-06-23
842	Semana 25 2022	25	2022	2022-06-24
843	Semana 25 2022	25	2022	2022-06-25
844	Semana 26 2022	26	2022	2022-06-26
845	Semana 26 2022	26	2022	2022-06-27
846	Semana 26 2022	26	2022	2022-06-28
847	Semana 26 2022	26	2022	2022-06-29
848	Semana 26 2022	26	2022	2022-06-30
849	Semana 26 2022	26	2022	2022-07-01
850	Semana 26 2022	26	2022	2022-07-02
851	Semana 27 2022	27	2022	2022-07-03
852	Semana 27 2022	27	2022	2022-07-04
853	Semana 27 2022	27	2022	2022-07-05
854	Semana 27 2022	27	2022	2022-07-06
855	Semana 27 2022	27	2022	2022-07-07
856	Semana 27 2022	27	2022	2022-07-08
857	Semana 27 2022	27	2022	2022-07-09
858	Semana 28 2022	28	2022	2022-07-10
859	Semana 28 2022	28	2022	2022-07-11
860	Semana 28 2022	28	2022	2022-07-12
861	Semana 28 2022	28	2022	2022-07-13
862	Semana 28 2022	28	2022	2022-07-14
863	Semana 28 2022	28	2022	2022-07-15
864	Semana 28 2022	28	2022	2022-07-16
865	Semana 29 2022	29	2022	2022-07-17
866	Semana 29 2022	29	2022	2022-07-18
867	Semana 29 2022	29	2022	2022-07-19
868	Semana 29 2022	29	2022	2022-07-20
869	Semana 29 2022	29	2022	2022-07-21
870	Semana 29 2022	29	2022	2022-07-22
871	Semana 29 2022	29	2022	2022-07-23
872	Semana 30 2022	30	2022	2022-07-24
873	Semana 30 2022	30	2022	2022-07-25
874	Semana 30 2022	30	2022	2022-07-26
875	Semana 30 2022	30	2022	2022-07-27
876	Semana 30 2022	30	2022	2022-07-28
877	Semana 30 2022	30	2022	2022-07-29
878	Semana 30 2022	30	2022	2022-07-30
879	Semana 31 2022	31	2022	2022-07-31
880	Semana 31 2022	31	2022	2022-08-01
881	Semana 31 2022	31	2022	2022-08-02
882	Semana 31 2022	31	2022	2022-08-03
883	Semana 31 2022	31	2022	2022-08-04
884	Semana 31 2022	31	2022	2022-08-05
885	Semana 31 2022	31	2022	2022-08-06
886	Semana 32 2022	32	2022	2022-08-07
887	Semana 32 2022	32	2022	2022-08-08
888	Semana 32 2022	32	2022	2022-08-09
889	Semana 32 2022	32	2022	2022-08-10
890	Semana 32 2022	32	2022	2022-08-11
891	Semana 32 2022	32	2022	2022-08-12
892	Semana 32 2022	32	2022	2022-08-13
893	Semana 33 2022	33	2022	2022-08-14
894	Semana 33 2022	33	2022	2022-08-15
895	Semana 33 2022	33	2022	2022-08-16
896	Semana 33 2022	33	2022	2022-08-17
897	Semana 33 2022	33	2022	2022-08-18
898	Semana 33 2022	33	2022	2022-08-19
899	Semana 33 2022	33	2022	2022-08-20
900	Semana 34 2022	34	2022	2022-08-21
901	Semana 34 2022	34	2022	2022-08-22
902	Semana 34 2022	34	2022	2022-08-23
903	Semana 34 2022	34	2022	2022-08-24
904	Semana 34 2022	34	2022	2022-08-25
905	Semana 34 2022	34	2022	2022-08-26
906	Semana 34 2022	34	2022	2022-08-27
907	Semana 34 2022	34	2022	2022-08-28
908	Semana 35 2022	35	2022	2022-08-29
909	Semana 35 2022	35	2022	2022-08-30
910	Semana 35 2022	35	2022	2022-08-31
911	Semana 35 2022	35	2022	2022-09-01
912	Semana 35 2022	35	2022	2022-09-02
913	Semana 35 2022	35	2022	2022-09-03
914	Semana 36 2022	36	2022	2022-09-04
915	Semana 36 2022	36	2022	2022-09-05
916	Semana 36 2022	36	2022	2022-09-06
917	Semana 36 2022	36	2022	2022-09-07
918	Semana 36 2022	36	2022	2022-09-08
919	Semana 36 2022	36	2022	2022-09-09
920	Semana 36 2022	36	2022	2022-09-10
921	Semana 37 2022	37	2022	2022-09-11
922	Semana 37 2022	37	2022	2022-09-12
923	Semana 37 2022	37	2022	2022-09-13
924	Semana 37 2022	37	2022	2022-09-14
925	Semana 37 2022	37	2022	2022-09-15
926	Semana 37 2022	37	2022	2022-09-16
927	Semana 37 2022	37	2022	2022-09-17
928	Semana 38 2022	38	2022	2022-09-18
929	Semana 38 2022	38	2022	2022-09-19
930	Semana 38 2022	38	2022	2022-09-20
931	Semana 38 2022	38	2022	2022-09-21
932	Semana 38 2022	38	2022	2022-09-22
933	Semana 38 2022	38	2022	2022-09-23
934	Semana 38 2022	38	2022	2022-09-24
935	Semana 39 2022	39	2022	2022-09-25
936	Semana 39 2022	39	2022	2022-09-26
937	Semana 39 2022	39	2022	2022-09-27
938	Semana 39 2022	39	2022	2022-09-28
939	Semana 39 2022	39	2022	2022-09-29
940	Semana 39 2022	39	2022	2022-09-30
941	Semana 39 2022	39	2022	2022-10-01
942	Semana 40 2022	40	2022	2022-10-02
943	Semana 40 2022	40	2022	2022-10-03
944	Semana 40 2022	40	2022	2022-10-04
945	Semana 40 2022	40	2022	2022-10-05
946	Semana 40 2022	40	2022	2022-10-06
947	Semana 40 2022	40	2022	2022-10-07
948	Semana 40 2022	40	2022	2022-10-08
949	Semana 41 2022	41	2022	2022-10-09
950	Semana 41 2022	41	2022	2022-10-10
951	Semana 41 2022	41	2022	2022-10-11
952	Semana 41 2022	41	2022	2022-10-12
953	Semana 41 2022	41	2022	2022-10-13
954	Semana 41 2022	41	2022	2022-10-14
955	Semana 41 2022	41	2022	2022-10-15
956	Semana 42 2022	42	2022	2022-10-16
957	Semana 42 2022	42	2022	2022-10-17
958	Semana 42 2022	42	2022	2022-10-18
959	Semana 42 2022	42	2022	2022-10-19
960	Semana 42 2022	42	2022	2022-10-20
961	Semana 42 2022	42	2022	2022-10-21
962	Semana 42 2022	42	2022	2022-10-22
963	Semana 43 2022	43	2022	2022-10-23
964	Semana 43 2022	43	2022	2022-10-24
965	Semana 43 2022	43	2022	2022-10-25
966	Semana 43 2022	43	2022	2022-10-26
967	Semana 43 2022	43	2022	2022-10-27
968	Semana 43 2022	43	2022	2022-10-28
969	Semana 43 2022	43	2022	2022-10-29
970	Semana 44 2022	44	2022	2022-10-30
971	Semana 44 2022	44	2022	2022-10-31
972	Semana 44 2022	44	2022	2022-11-01
973	Semana 44 2022	44	2022	2022-11-02
974	Semana 44 2022	44	2022	2022-11-03
975	Semana 44 2022	44	2022	2022-11-04
976	Semana 44 2022	44	2022	2022-11-05
977	Semana 45 2022	45	2022	2022-11-06
978	Semana 45 2022	45	2022	2022-11-07
979	Semana 45 2022	45	2022	2022-11-08
980	Semana 45 2022	45	2022	2022-11-09
981	Semana 45 2022	45	2022	2022-11-10
982	Semana 45 2022	45	2022	2022-11-11
983	Semana 45 2022	45	2022	2022-11-12
984	Semana 46 2022	46	2022	2022-11-13
985	Semana 46 2022	46	2022	2022-11-14
986	Semana 46 2022	46	2022	2022-11-15
987	Semana 46 2022	46	2022	2022-11-16
988	Semana 46 2022	46	2022	2022-11-17
989	Semana 46 2022	46	2022	2022-11-18
990	Semana 46 2022	46	2022	2022-11-19
991	Semana 47 2022	47	2022	2022-11-20
992	Semana 47 2022	47	2022	2022-11-21
993	Semana 47 2022	47	2022	2022-11-22
994	Semana 47 2022	47	2022	2022-11-23
995	Semana 47 2022	47	2022	2022-11-24
996	Semana 47 2022	47	2022	2022-11-25
997	Semana 47 2022	47	2022	2022-11-26
998	Semana 48 2022	48	2022	2022-11-27
999	Semana 48 2022	48	2022	2022-11-28
1000	Semana 48 2022	48	2022	2022-11-29
1001	Semana 48 2022	48	2022	2022-11-30
1002	Semana 48 2022	48	2022	2022-12-01
1003	Semana 48 2022	48	2022	2022-12-02
1004	Semana 48 2022	48	2022	2022-12-03
1005	Semana 49 2022	49	2022	2022-12-04
1006	Semana 49 2022	49	2022	2022-12-05
1007	Semana 49 2022	49	2022	2022-12-06
1008	Semana 49 2022	49	2022	2022-12-07
1009	Semana 49 2022	49	2022	2022-12-08
1010	Semana 49 2022	49	2022	2022-12-09
1011	Semana 49 2022	49	2022	2022-12-10
1012	Semana 50 2022	50	2022	2022-12-11
1013	Semana 50 2022	50	2022	2022-12-12
1014	Semana 50 2022	50	2022	2022-12-13
1015	Semana 50 2022	50	2022	2022-12-14
1016	Semana 50 2022	50	2022	2022-12-15
1017	Semana 50 2022	50	2022	2022-12-16
1018	Semana 50 2022	50	2022	2022-12-17
1019	Semana 51 2022	51	2022	2022-12-18
1020	Semana 51 2022	51	2022	2022-12-19
1021	Semana 51 2022	51	2022	2022-12-20
1022	Semana 51 2022	51	2022	2022-12-21
1023	Semana 51 2022	51	2022	2022-12-22
1024	Semana 51 2022	51	2022	2022-12-23
1025	Semana 51 2022	51	2022	2022-12-24
1026	Semana 52 2022	52	2022	2022-12-25
1027	Semana 52 2022	52	2022	2022-12-26
1028	Semana 52 2022	52	2022	2022-12-27
1029	Semana 52 2022	52	2022	2022-12-28
1030	Semana 52 2022	52	2022	2022-12-29
1031	Semana 52 2022	52	2022	2022-12-30
1032	Semana 52 2022	52	2022	2022-12-31
\.

--
-- TOC entry 3822 (class 0 OID 19354)
-- Dependencies: 464
-- Data for Name: termino_variable; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.termino_variable (id, concepto, perf_term, id_snomed, id_variable_tipo, id_enfermedad) FROM stdin;
1	coronavirus 2 del síndrome respiratorio agudo severo detectado (hallazgo)	coronavirus 2 del síndrome respiratorio agudo severo detectado (hallazgo)	1240581000000104	1	1
2	infección asintomática por coronavirus 2 del síndrome respiratorio agudo severo (hallazgo)	infección asintomática por coronavirus 2 del síndrome respiratorio agudo severo (hallazgo)	189486241000119100	1	1
6	enfermedad causada por coronavirus del síndrome respiratorio agudo severo 2 (trastorno)	enfermedad causada por coronavirus del síndrome respiratorio agudo severo 2 (trastorno)	840539006	1	1
7	neumonía causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	neumonía causada por coronavirus 2 del síndrome respiratorio agudo severo	882784691000119100	1	1
8	bronquitis aguda causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	bronquitis aguda causada por coronavirus 2 del síndrome respiratorio agudo severo	138389411000119105	1	1
9	linfocitopenia debida a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	linfocitopenia debida a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	866151004	1	1
10	miocarditis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	miocarditis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	1240531000000103	1	1
11	disnea causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	disnea causada por coronavirus 2 del síndrome respiratorio agudo severo	119981000146107	1	1
12	fiebre causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	fiebre causada por coronavirus 2 del síndrome respiratorio agudo severo	119751000146104	1	1
13	otitis media debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	otitis media debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	1240521000000100	1	1
14	 conjuntivitis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno) |	conjuntivitis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	119741000146102	1	1
15	miocardiopatía debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	miocardiopatía debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	119731000146105	1	1
16	encefalopatía debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	encefalopatía debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	1240561000000108	1	1
17	trombocitopenia debida a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	trombocitopenia debida a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	866152006	1	1
18	infección del tracto respiratorio inferior causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	infección del tracto respiratorio inferior causada por coronavirus 2 del síndrome respiratorio agudo severo	 880529761000119102	1	1
19	lesión renal aguda debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	lesión renal aguda debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	870589006	1	1
20	sepsis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	sepsis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	870588003	1	1
21	síndrome de distrés respiratorio agudo debido a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	síndrome de distrés respiratorio agudo debido a coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	674814021000119106	1	1
22	rabdomiólisis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	rabdomiólisis debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	870591003	1	1
23	insuficiencia respiratoria hipoxémica aguda debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	insuficiencia respiratoria hipoxémica aguda debida a enfermedad causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	870590002	1	1
24	infección del tracto respiratorio superior causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	infección del tracto respiratorio superior causada por coronavirus 2 del síndrome respiratorio agudo severo	1240541000000107	1	1
27	infección por coronavirus (trastorno)	infección por coronavirus (trastorno)	186747009	1	1
28	neumonía causada por coronavirus humano (trastorno)	neumonía causada por coronavirus humano (trastorno)	713084008	1	1
29	neumonía causada por coronavirus del síndrome respiratorio agudo grave (trastorno)	neumonía causada por coronavirus del síndrome respiratorio agudo grave (trastorno)	441590008	1	1
31	sospecha de enfermedad causada por COVID-19	sospecha de enfermedad causada por coronavirus del síndrome respiratorio agudo severo 2 (situación)	840544004	2	1
35	Sospecha de infección por coronavirus	sospecha de infección por coronavirus (situación)	700217006	2	1
36	dengue	dengue (trastorno)	38362002	1	2
37	dengue hemorrágico	fiebre hemorrágica dengue (trastorno)	20927009	3	2
38	dengue sin signos de alarma	dengue sin signos de alarma (trastorno)	722862003	1	2
39	dengue con signos de alarma	dengue con signos de alarma (trastorno)	722862003	1	2
40	síndrome de shock por Dengue	síndrome de shock por Dengue (trastorno)	409671005	3	2
41	encefalitis por virus del dengue	encefalitis causada por virus del dengue (trastorno)	1163101003	1	2
42	mielitis causada por virus Dengue	mielitis causada por virus Dengue (trastorno)	866057003	1	2
43	fiebre hemorrágica por Dengue, grado I	fiebre hemorrágica por Dengue, grado I (trastorno)	409676000	3	2
44	fiebre hemorrágica por Dengue, grado IV	fiebre hemorrágica por Dengue, grado IV (trastorno)	409679007	3	2
45	fiebre hemorrágica por Dengue, grado II	fiebre hemorrágica por Dengue, grado II (trastorno)	409677009	3	2
46	fiebre hemorrágica por Dengue, grado III	fiebre hemorrágica por Dengue, grado III (trastorno)	409678004	3	2
47	anticuerpo anti-dengue, IgM, positivo	anticuerpo anti-dengue, inmunoglobulina M, positivo (hallazgo)	409693000	1	2
48	anticuerpo anti-dengue, IgM, negativo	anticuerpo inmunoglobulina M anti-dengue, negativo (hallazgo)	409692005	2	2
49	anticuerpo anti-dengue, IgG, negativo	anticuerpo anti-dengue, inmunoglobulina G, negativo (hallazgo)	409694006	2	2
50	anticuerpo anti-dengue, IgG, positivo	anticuerpo anti-dengue, inmunoglobulina G, positivo (hallazgo)	409695007	1	2
51	virus del dengue	virus del dengue (organismo)	34348001	1	2
52	virus del dengue, tipo 2	virus del dengue, tipo 2 (organismo)	41328007	1	2
53	virus del dengue, tipo 1	virus del dengue, tipo 1 (organismo)	60588009	1	2
54	virus del dengue, tipo 4	virus del dengue, tipo 4 (organismo)	60588009	1	2
55	virus del dengue, tipo 3	virus del dengue, tipo 3 (organismo)	8467002	1	2
56	subgrupo de virus del Dengue	subgrupo de virus del Dengue (organismo)	243604005	1	2
57	ensayo para ácido nucleico de dengue	ensayo para ácido nucleico de dengue (procedimiento)	398560008	2	2
58	administración de vacuna contra el dengue	administración de vacuna que contiene antígeno de virus Dengue como único ingrediente (procedimiento)	827179001	4	2
59	educación sobre brote epidémico de dengue	educación sobre brote epidémico de fiebre por dengue (procedimiento)	698613000	4	2
60	determinación del ADN del virus del dengue	determinación del ácido desoxirribonucleico del virus del dengue (procedimiento)	122326000	2	2
61	test PCR para detección del virus del Dengue	prueba de la reacción de polimerasa en cadena para el virus del Dengue (procedimiento)	399302007	2	2
62	medición de anticuerpos anti-virus del dengue	medición de anticuerpos anti-virus del dengue (procedimiento)	121993008	2	2
63	determinación del antígeno del virus del dengue	determinación del antígeno del virus del dengue (procedimiento)	122176006	2	2
64	medición del nivel de IgG contra el virus del dengue	medición del nivel de inmunoglobulina G contra el virus del dengue (procedimiento)	315112006	2	2
65	medición del nivel de IgM contra el virus del dengue	medición del nivel de inmunoglobulina M contra el virus del dengue (procedimiento)	315113001	2	2
66	determinación del ARN del virus 1, 2, 3 y 4 del dengue	determinación del ácido ribonucleico del virus 1, 2, 3 y 4 del dengue (procedimiento)	118026001	2	2
67	medición de anticuerpos anti-virus del dengue serotipo 1	medición de anticuerpos anti-virus del dengue serotipo 1 (procedimiento)	121988005	2	2
68	medición de anticuerpos anti-virus del dengue serotipo 2	medición de anticuerpos anti-virus del dengue serotipo 2 (procedimiento)	121989002	2	2
69	medición de anticuerpos anti-virus del dengue serotipo 4	medición de anticuerpos anti-virus del dengue serotipo 4 (procedimiento)	121992003	2	2
70	medición de anticuerpos anti-virus del dengue serotipo 3	medición de anticuerpos anti-virus del dengue serotipo 3 (procedimiento)	121990006	2	2
71	medición de anticuerpos contra el virus del Dengue, tipo IgG	medición de anticuerpos contra el virus del Dengue, tipo inmunoglobulina G (procedimiento)	409691003	2	2
72	determinación de anticuerpos contra el virus del Dengue, tipo IgM	determinación de anticuerpos contra el virus del Dengue, tipo inmunoglobulina M (procedimiento)	409689006	2	2
73	ARN de virus Dengue 1	ácido ribonucleico de virus Dengue 1 (sustancia)	707875002	2	2
74	ARN de virus Dengue 3	ácido ribonucleico de virus Dengue 3 (sustancia)	707877005	2	2
75	ARN de virus Dengue 2	ácido ribonucleico de virus Dengue 2 (sustancia)	707876001	2	2
76	ARN de virus Dengue 4	ácido ribonucleico de virus Dengue 4 (sustancia)	707878000	2	2
77	antígeno de virus Dengue	antígeno de virus Dengue (sustancia)	121020003	2	2
78	ADN del virus del dengue	ácido desoxirribonucleico del virus del dengue (sustancia)	121182007	2	2
79	anticuerpo anti-dengue, IgM	anticuerpo anti-dengue, inmunoglobulina M (sustancia)	409680005	2	2
80	anticuerpo anti-dengue, IgG	anticuerpo anti-dengue, inmunoglobulina G (sustancia)	409690002	2	2
81	anticuerpo anti - virus del dengue	anticuerpo anti - virus del dengue (sustancia)	120734004	2	2
82	ácido ribonucleico de virus Dengue	ácido ribonucleico de virus Dengue (sustancia)	783725005	2	2
83	anticuerpo anti - virus del dengue, tipo 1	anticuerpo anti - virus del dengue, tipo 1 (sustancia)	120872001	2	2
84	anticuerpo anti - virus del dengue, tipo 4	anticuerpo anti - virus del dengue, tipo 4 (sustancia)	120879005	2	2
85	anticuerpo anti - virus del dengue, tipo 3	anticuerpo anti - virus del dengue, tipo 3 (sustancia)	120874000	2	2
86	anticuerpo anti - virus del dengue, tipo 2	anticuerpo anti - virus del dengue, tipo 2 (sustancia)	120873006	2	2
87	sospecha de dengue	sospecha de dengue (situación)	418429061000132101	2	2
88	vacuna con antígeno de virus Dengue	vacuna que contiene antígeno de virus Dengue (producto medicinal)	840563003	4	2
89	vacuna con antígeno de virus Dengue como único ingrediente	vacuna que contiene antígeno de virus Dengue como único ingrediente (producto medicinal)	871720004	4	2
90	faringitis	síndrome de fiebre periódica y estomatitis aftosa con faringitis y linfadenitis cervical (trastorno)	717231003	5	3
91	fiebre	fiebre manchada de las Montañas Rocosas (trastorno)	186772009	5	3
92	fiebre	fiebre por mordedura de rata (trastorno)	1685005	5	3
93	fiebre	enfermedad por virus Zika (trastorno)	3928002	5	3
94	fiebre	fiebre tifoidea (trastorno)	4834000	5	3
95	fiebre	enfermedad por virus Banzi (trastorno)	6270009	5	3
96	fiebre	fiebre de origen desconocido (hallazgo)	7520000	5	3
97	fiebre	fiebre purpúrica brasileña (trastorno)	8554002	5	3
98	fiebre	fiebre de Mayaro (trastorno)	9164007	5	3
99	fiebre	enfermedad por el virus Tensaw (trastorno)	9602009	5	3
100	fiebre	fiebre aséptica (hallazgo)	9619006	5	3
101	fiebre	fiebre recidivante transmitida por garrapatas (trastorno)	10301003	5	3
102	fiebre	fiebre de Bebaru (trastorno)	11917008	5	3
103	fiebre	fiebre amarilla (trastorno)	16541001	5	3
104	fiebre	fiebre hemorrágica por arbovirus (trastorno)	16766000	5	3
105	fiebre	fiebre de Lassa (trastorno)	19065005	5	3
106	fiebre	fiebre hemorrágica dengue (trastorno)	20927009	5	3
107	fiebre	fiebre Sennetsu (trastorno)	21013006	5	3
108	fiebre	fiebre por Elokomin (trastorno)	22404003	5	3
109	fiebre	fiebre del Río Bravo (trastorno)	23122001	5	3
110	fiebre	enfermedad por el virus Caraparu (trastorno)	24776000	5	3
111	fiebre	enfermedad por el virus Oriboca (trastorno)	25582006	5	3
112	fiebre	fiebre recurrente del Cáucaso (trastorno)	27578005	5	3
113	fiebre	fiebre Sindbis (trastorno)	28477001	5	3
114	fiebre	fiebre Tahyna (trastorno)	30945003	5	3
115	fiebre	fiebre recurrente de Asia Y/O África (trastorno)	31120005	5	3
116	fiebre	enfermedad por el virus Wyeomyia (trastorno)	32556003	5	3
117	fiebre	fiebre de Spondweni (trastorno)	33877000	5	3
118	fiebre	enfermedad por el virus Guaroa (trastorno)	36448002	5	3
119	fiebre	parotiditis (trastorno)	36989005	5	3
120	fiebre	enfermedad por el virus Ilesha (trastorno)	37780006	5	3
121	fiebre	dengue (trastorno)	38362002	5	3
122	fiebre	fiebre recurrente del oeste de los Estados Unidos (trastorno)	39002001	5	3
123	fiebre	enfermedad por virus Piry (trastorno)	41348000	5	3
124	fiebre	convulsión febril (hallazgo)	41497008	5	3
125	fiebre	fiebre amarilla de la jungla (trastorno)	42100005	5	3
126	fiebre	fiebre héctica (hallazgo)	42136008	5	3
127	fiebre	enfermedad por el virus Kemerovo (trastorno)	42523002	5	3
128	fiebre	fiebre de Wesselsbron (trastorno)	43220007	5	3
129	fiebre	fiebre de Mucambo (trastorno)	43416006	5	3
130	fiebre	fiebre recurrente de África Central Y/O Sudáfrica (trastorno)	43626008	5	3
131	fiebre	fiebre de Uganda S (trastorno)	44110002	5	3
132	fiebre	enfermedad por el virus Tacaiuma (trastorno)	44362006	5	3
133	fiebre	enfermedad por el virus Bwamba (trastorno)	44583001	5	3
134	fiebre	enfermedad por el virus Calovo (trastorno)	46121008	5	3
135	fiebre	fiebre Izumi (trastorno)	47277009	5	3
136	fiebre	enfermedad de Brill - Zinsser (trastorno)	47761007	5	3
137	fiebre	fiebre hemorrágica de Omsk (trastorno)	48113006	5	3
138	fiebre	enfermedad por el virus Guama (trastorno)	48400007	5	3
139	fiebre	enfermedad por el virus Restan (trastorno)	48922006	5	3
140	fiebre	fiebre del bosque Semliki (trastorno)	49142006	5	3
141	fiebre	deshidratación por fiebre en el recién nacido (trastorno)	49513005	5	3
142	fiebre	enfermedad por el virus Tataguine (trastorno)	50386009	5	3
143	fiebre	fiebre paratifoidea tipo C (trastorno)	51254007	5	3
144	fiebre	enfermedad por el virus Thogoto (trastorno)	51638003	5	3
145	fiebre	fiebre Quaranfil (trastorno)	51682007	5	3
146	fiebre	fiebre estreptobacilar (trastorno)	52138004	5	3
147	fiebre	fiebre recurrente de la Península Ibérica Y/O del noroeste de África (trastorno)	52635002	5	3
148	fiebre	fiebre cíclica (hallazgo)	52715007	5	3
149	fiebre	estomatitis vesicular por virus Indiana (trastorno)	53632005	5	3
150	fiebre	fiebre del agua negra (trastorno)	56625005	5	3
151	fiebre	fiebre recurrente del sur de los Estados Unidos, México, América Central Y/O América del Sur (trastorno)	58827009	5	3
152	fiebre	fiebre hemorrágica argentina (trastorno)	58868000	5	3
153	fiebre	fiebre transitoria del recién nacido (trastorno)	60025004	5	3
154	fiebre	enfermedad por el virus Madrid (trastorno)	60774007	5	3
155	fiebre	fiebre histérica (hallazgo)	62166005	5	3
156	fiebre	fiebre Batai (trastorno)	62674007	5	3
157	fiebre	fiebre remitente (hallazgo)	63993003	5	3
158	fiebre	fiebre hemorrágica boliviana (trastorno)	67247008	5	3
159	fiebre	enfermedad por el virus Germistan (trastorno)	69931008	5	3
160	fiebre	faringoconjuntivitis adenoviral (trastorno)	70385007	5	3
161	fiebre	fiebre paratifoidea tipo B (trastorno)	71085009	5	3
162	fiebre	enfermedad por el virus Oropouche (trastorno)	72880002	5	3
163	fiebre	enfermedad por el virus Murutucu (trastorno)	73701003	5	3
164	fiebre	fiebre hemorrágica arenavirósica (trastorno)	73730005	5	3
165	fiebre	fiebre amarilla urbana (trastorno)	74166005	5	3
166	fiebre	enfermedad por el virus Ganjam (trastorno)	74581008	5	3
167	fiebre	fiebre recurrente de América Central Y/O América del Sur (trastorno)	74873003	5	3
168	fiebre	ornitosis (trastorno)	75116005	5	3
169	fiebre	enfermedad por el virus Marituba (trastorno)	75336004	5	3
170	fiebre	brucelosis (trastorno)	75702008	5	3
171	fiebre	enfermedad por el virus Changuinola (trastorno)	76446006	5	3
172	fiebre	fiebre paratifoidea tipo A (trastorno)	76623002	5	3
173	fiebre	enfermedad por el virus Chagres (trastorno)	76872006	5	3
174	fiebre	leptospirosis (trastorno)	77377001	5	3
175	fiebre	fiebre intermitente (hallazgo)	77957000	5	3
176	fiebre	enfermedad por el virus Bunyamwera (trastorno)	79376002	5	3
177	fiebre	fiebre por granos (trastorno)	79958002	5	3
178	fiebre	enfermedad por arañazo de gato (trastorno)	79974007	5	3
179	fiebre	enfermedad por el virus Dugbe (trastorno)	80795005	5	3
180	fiebre	enfermedad por virus Chandipura (trastorno)	81182003	5	3
181	fiebre	enfermedad por el virus Ossa (trastorno)	81472005	5	3
182	fiebre	fiebre de las trincheras (trastorno)	82214002	5	3
183	fiebre	enfermedad virósica de los Everglades (trastorno)	84579002	5	3
184	fiebre	enfermedad por el virus Itaqui (trastorno)	85436005	5	3
185	fiebre	fiebre de Onyong - nyong (trastorno)	85579005	5	3
186	fiebre	fiebre paratifoidea (trastorno)	85904008	5	3
187	fiebre	fiebre de Kunjin (trastorno)	87048000	5	3
188	fiebre	coccidioidomicosis pulmonar primaria (trastorno)	88036000	5	3
189	fiebre	fiebre recurrente de Irán Y/O Asia Central (trastorno)	88808006	5	3
190	fiebre	enfermedad por el virus Catu (trastorno)	89805002	5	3
191	fiebre	nanukayami (trastorno)	93465000	5	3
192	fiebre	endocarditis por fiebre Q (trastorno)	95890006	5	3
193	fiebre	fiebre ondulante (hallazgo)	102496004	5	3
194	fiebre	fiebre de Chikungunya (trastorno)	111864006	5	3
195	fiebre	enfermedad por virus Bussuquara (trastorno)	111866008	5	3
196	fiebre	fiebre por etiocolanona (trastorno)	123977005	5	3
197	fiebre	fiebre botonosa (trastorno)	186774005	5	3
198	fiebre	leishmaniasis visceral (trastorno)	186803007	5	3
199	fiebre	fiebre puerperal de origen desconocido (trastorno)	200277008	5	3
200	fiebre	pirexia puerperal (trastorno)	237348005	5	3
201	fiebre	fiebre de Oroya (trastorno)	240453002	5	3
202	fiebre	fiebre hemorrágica viral (trastorno)	240523007	5	3
203	fiebre	fiebre hemorrágica filoviral (trastorno)	240525000	5	3
204	fiebre	fiebre bifásica (hallazgo)	248444008	5	3
205	fiebre	bartonelosis (trastorno)	266123003	5	3
206	fiebre	fiebre fluvial del Japón (trastorno)	271425001	5	3
207	fiebre	mononucleosis infecciosa (trastorno)	271558008	5	3
208	fiebre	fiebre por Pixuna (trastorno)	186612006	5	3
209	fiebre	fiebre por Leptorpira canicola (trastorno)	186957004	5	3
210	fiebre	hepatitis en la fiebre amarilla (trastorno)	197342009	5	3
211	fiebre	fiebre por humidificador (trastorno)	233774000	5	3
212	fiebre	miocarditis por fiebre Q (trastorno)	233867000	5	3
213	fiebre	pericarditis por fiebre Q (trastorno)	233884006	5	3
214	fiebre	fiebre de Pontiac (trastorno)	240447002	5	3
215	fiebre	fiebre de Sepik (trastorno)	240499000	5	3
216	fiebre	fiebre por Maguari (trastorno)	240502001	5	3
217	fiebre	fiebre trivittatus (trastorno)	240507007	5	3
218	fiebre	fiebre de Isfahan (trastorno)	240513003	5	3
219	fiebre	fase de la fiebre (entidad observable)	248431003	5	3
220	fiebre	fiebre hemorrágica venezolana (trastorno)	359673001	5	3
221	fiebre	fiebre de Candiru (trastorno)	240522002	5	3
222	fiebre	fiebre manchada de las Montañas Rocosas orientales (trastorno)	240616003	5	3
223	fiebre	fiebre filariásica bancroftiana (trastorno)	240822009	5	3
224	fiebre	aumento gradual de la fiebre (hallazgo)	271750004	5	3
225	fiebre	fiebre irregular (hallazgo)	271753002	5	3
226	fiebre	fiebre con escalofríos (hallazgo)	274640006	5	3
227	fiebre	fase ascendente de la fiebre (hallazgo)	248432005	5	3
228	fiebre	fase de meseta de la fiebre (hallazgo)	248433000	5	3
229	fiebre	fase de caída de la fiebre (hallazgo)	248434006	5	3
230	fiebre	fiebre prolongada (hallazgo)	248435007	5	3
231	fiebre	fiebre ligeramente remitente (hallazgo)	248436008	5	3
232	fiebre	fiebre palúdica (hallazgo)	248437004	5	3
233	fiebre	fiebre cotidiana (hallazgo)	248438009	5	3
234	fiebre	fiebre cotidiana doble (hallazgo)	248439001	5	3
235	fiebre	fiebre terciana maligna (hallazgo)	248441000	5	3
236	fiebre	fiebre cuartana (hallazgo)	248442007	5	3
237	fiebre	fiebre, variación diurna (hallazgo)	248445009	5	3
238	fiebre	fiebre defervescente (hallazgo)	248447001	5	3
239	fiebre	fiebre posoperatoria (hallazgo)	248450003	5	3
240	fiebre	fiebre posparto (hallazgo)	248451004	5	3
241	fiebre	infección por Schistosoma japonicum (trastorno)	268058007	5	3
242	fiebre	fiebre central (hallazgo)	248449003	5	3
243	fiebre	aumento agudo de la fiebre (hallazgo)	271749004	5	3
244	fiebre	fiebre (hallazgo)	386661006	5	3
245	fiebre	fiebre baja (hallazgo)	304213008	5	3
246	fiebre	fiebre diurna inversa (hallazgo)	248446005	5	3
247	fiebre	fiebre hepática intermitente (hallazgo)	248443002	5	3
248	fiebre	fiebre continua (hallazgo)	271751000	5	3
249	fiebre	descenso rápido de la fiebre (hallazgo)	271754008	5	3
250	fiebre	descenso gradual de la fiebre (hallazgo)	271755009	5	3
251	fiebre	fiebre espirilar (trastorno)	19044004	5	3
252	fiebre	fiebre del valle del Rift (trastorno)	402917003	5	3
253	fiebre	fiebre por virus Manzanilla (trastorno)	5497006	5	3
254	fiebre	fiebre en escalera (hallazgo)	271752007	5	3
255	fiebre	paludismo por Plasmodium falciparum (trastorno)	62676009	5	3
256	fiebre	fiebre manchada de las Montañas Rocosas occidentales (trastorno)	240615004	5	3
257	fiebre	fiebre filariásica de Malasia (trastorno)	240827003	5	3
258	fiebre	fiebre filariásica de Timor (trastorno)	240832002	5	3
259	fiebre	fiebre recurrente transmitida por piojos (trastorno)	14683004	5	3
260	fiebre	fiebre de Crimea (trastorno)	402918008	5	3
261	fiebre	fiebre hemorrágica del Congo (trastorno)	402919000	5	3
262	fiebre	fiebre calchaquí (trastorno)	240512008	5	3
263	fiebre	fiebre Q crónica (trastorno)	409552002	5	3
264	fiebre	fiebre Q aguda (trastorno)	409553007	5	3
265	fiebre	hepatitis por fiebre Q (trastorno)	409554001	5	3
266	fiebre	meningitis aséptica por fiebre Q (trastorno)	409555000	5	3
267	fiebre	osteomielitis por fiebre Q (trastorno)	409557008	5	3
268	fiebre	fiebre hemorrágica por Dengue, grado I (trastorno)	409676000	5	3
269	fiebre	fiebre hemorrágica por Dengue, grado II (trastorno)	409677009	5	3
270	fiebre	fiebre hemorrágica por Dengue, grado III (trastorno)	409678004	5	3
271	fiebre	fiebre hemorrágica por Dengue, grado IV (trastorno)	409679007	5	3
272	fiebre	transpiración por fiebre (hallazgo)	186694006	5	3
273	fiebre	fiebre por picadura de garrapata sudafricana (trastorno)	415561000	5	3
274	fiebre	fiebre recidivante (trastorno)	420079008	5	3
275	fiebre	escarlatina (trastorno)	30242009	5	3
276	fiebre	fiebre terciana (hallazgo)	248440004	5	3
277	fiebre	hallazgo relacionado con el patrón de fiebre (hallazgo)	365977007	5	3
278	fiebre	hallazgo relacionado con la fase de la fiebre (hallazgo)	365989009	5	3
279	fiebre	fiebre hemorrágica brasileña (trastorno)	240524001	5	3
280	fiebre	enfermedad por virus Ébola (trastorno)	37109004	5	3
281	fiebre	fiebre posterior a procedimiento (hallazgo)	130091000119103	5	3
282	fiebre	fiebre superior a 38 grados Celsius (hallazgo)	426000000	5	3
283	fiebre	sepsis puerperal (trastorno)	2858002	5	3
284	fiebre	fiebre crónica (hallazgo)	704425001	5	3
285	fiebre	pirexia de origen desconocido concomitante con infección por virus de la inmunodeficiencia humana (trastorno)	713731001	5	3
286	fiebre	infección causada por Theileria parva (trastorno)	17658005	5	3
287	fiebre	fiebre hemorrágica causada por virus Lujo (trastorno)	716585008	5	3
288	fiebre	fiebre hemorrágica causada por virus Chapare (trastorno)	716584007	5	3
289	fiebre	fiebre hemorrágica con síndrome renal (trastorno)	716864001	5	3
290	fiebre	fiebre causada por virus (hallazgo)	10151000132103	5	3
291	fiebre	fiebre del nilo occidental (trastorno)	721000221106	5	3
292	fiebre	fiebre amarilla sospecha de epizootia (trastorno)	2291000221109	5	3
293	fiebre	fiebre debida a Leptospira autumnalis (trastorno)	26275000	5	3
294	fiebre	fiebre debida a infección (hallazgo)	722892007	5	3
295	fiebre	fiebre causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	119751000146104	5	3
296	fiebre	fiebre del humidificador (trastorno)	48347002	5	3
297	fiebre	mononucleosis infecciosa causada por virus del herpes humano 4 (trastorno)	1186997009	5	3
298	fiebre	fiebre de recién nacido (trastorno)	95627000	5	3
299	fiebre	fiebre por mordedura de gato (trastorno)	199177009	5	3
300	fiebre-faringitis	faringitis por mononucleosis infecciosa (trastorno)	232401004	5	3
301	fiebre-gripe-influenza	fiebre Q (trastorno)	186788009	5	3
302	fiebre-neumonia	neumonía en la fiebre Q (trastorno)	32286006	5	3
303	fiebre-neumonia	neumonía en la fiebre tifoidea (trastorno)	45312009	5	3
304	fiebre-tos	tos con fiebre (hallazgo)	135883003	5	3
305	faringitis	síndrome de fiebre periódica y estomatitis aftosa con faringitis y linfadenitis cervical (trastorno)	717231003	6	3
306	faringitis-gripe-influenza	gripe con faringitis (trastorno)	195924009	6	3
307	fiebre	faringoconjuntivitis adenoviral (trastorno)	70385007	6	3
308	fiebre-faringitis	faringitis por mononucleosis infecciosa (trastorno)	232401004	6	3
309	fiebre-neumonia	neumonía en la fiebre Q (trastorno)	32286006	6	3
310	fiebre-neumonia	neumonía en la fiebre tifoidea (trastorno)	45312009	6	3
311	fiebre-tos	tos con fiebre (hallazgo)	135883003	6	3
312	gripe	pleurodinia epidémica (trastorno)	83264000	6	3
313	gripe	gripe con compromiso del tracto gastrointestinal (trastorno)	195929004	6	3
314	gripe	gripe causada por virus Influenza A subtipo H5 (trastorno)	713083002	6	3
315	gripe	gripe causada por virus Influenza A subtipo H7 (trastorno)	450715004	6	3
316	gripe	gripe causada por virus Influenza A subtipo H7N9 (trastorno)	707448003	6	3
317	gripe	gripe causada por virus Influenza A subtipo H9 (trastorno)	450716003	6	3
318	gripe	gripe causada por virus influenza estacional (trastorno)	719590007	6	3
319	gripe	gripe causada por virus influenza pandémico (trastorno)	719865001	6	3
320	gripe	infección causada por virus Hendra (trastorno)	773582002	6	3
321	gripe	gripe causada por virus Influenza A subtipo H3N2 (trastorno)	772810003	6	3
322	gripe	gripe causada por virus Influenza A subtipo H5N1 (trastorno)	772828001	6	3
323	gripe-influenza	enfermedad similar a la gripe (hallazgo)	95891005	6	3
324	gripe-influenza	gripe con laringitis (trastorno)	195923003	6	3
325	gripe-influenza	gripe asociada con la atención médica (trastorno)	408687004	6	3
326	gripe-influenza	gripe (trastorno)	6142004	6	3
327	gripe-influenza	gripe causada por virus Influenza A subtipo H1N1 (trastorno)	442696006	6	3
328	gripe-influenza	gripe causada por virus Influenza A (trastorno)	442438000	6	3
329	gripe-influenza	gripe causada por virus influenza B (trastorno)	24662006	6	3
330	gripe-influenza	gripe causada por virus influenza C (trastorno)	81524006	6	3
331	gripe-influenza-neumonia	neumonía y gripe (trastorno)	195878008	6	3
332	gripe-influenza-neumonia	neumonía causada por virus de la Influenza A (trastorno)	772839003	6	3
333	influenza	laringitis por Haemophilus influenzae (trastorno)	41048006	6	3
334	influenza	bronconeumonía por influenza (trastorno)	41269000	6	3
335	influenza	influenza con encefalopatía (trastorno)	74644004	6	3
336	influenza	infección por Haemophilus influenzae (trastorno)	91428005	6	3
337	influenza	laringitis aguda por Haemophilus influenzae (trastorno)	195684009	6	3
338	influenza	síntomas tipo gripales (hallazgo)	315642008	6	3
339	influenza	enfermedad invasiva por Haemophilus influenzae (trastorno)	406583002	6	3
340	influenza	bronquiolitis causada por virus influenza (trastorno)	10629191000119100	6	3
341	influenza	infección por Haemophilus influenzae tipo b (trastorno)	709410003	6	3
342	influenza-neumonia	neumonía por Haemophilus influenzae (trastorno)	70036007	6	3
343	influenza-neumonia	neumonía causada por virus influenza H1N1 (trastorno)	142931000119100	6	3
344	influenza-neumonia	neumonía causada por virus influenza (trastorno)	16311000119108	6	3
345	influenza-sinusitis	sinusitis causada por Haemophilus influenzae (trastorno)	721755003	6	3
346	laringotraqueitis	laringotraqueítis causada por el virus parainfluenza (trastorno)	10809006	6	3
347	laringotraqueitis	laringotraqueítis aguda sin obstrucción (trastorno)	37948003	6	3
348	laringotraqueitis	difteria laríngea (trastorno)	50215002	6	3
349	laringotraqueitis	laringotraqueítis (trastorno)	55130001	6	3
350	laringotraqueitis	laringotraqueítis aguda con obstrucción (trastorno)	59967003	6	3
351	laringotraqueitis	laringotraqueítis aguda (trastorno)	64375000	6	3
352	laringotraqueitis	laringotraqueítis crónica (trastorno)	83271005	6	3
353	laringotraqueitis	laringitis y laringotraqueítis crónicas (trastorno)	195810009	6	3
354	laringotraqueitis	laringotraqueítis viral aguda (trastorno)	301824001	6	3
355	neumonia	neumonía por Salmonella (trastorno)	2523007	6	3
356	neumonia	candidiasis pulmonar (trastorno)	3487004	6	3
357	neumonia	bronquiolitis aguda (trastorno)	5505005	6	3
358	neumonia	neumonía estafilocócica (trastorno)	22754005	6	3
359	neumonia	neumonía intersticial linfocítica (trastorno)	44274007	6	3
360	neumonia	neumonía catarral (trastorno)	50804000	6	3
361	neumonia	neumonía bacteriana (trastorno)	53084003	6	3
362	neumonia	neumonía peribronquial (trastorno)	55679008	6	3
363	neumonia	neumonía no resuelta (trastorno)	57702005	6	3
364	neumonia	neumonía por Achromobacter (trastorno)	61884008	6	3
365	neumonia	neumonía intersticial (trastorno)	64667001	6	3
366	neumonia	neumonía causada por el virus parainfluenza (trastorno)	64917006	6	3
367	neumonia	síndrome de Löffler (trastorno)	64936001	6	3
368	neumonia	neumonía por cuerpo extraño (trastorno)	65141002	6	3
369	neumonia	neumonía lobular no resuelta (trastorno)	66429007	6	3
370	neumonia	neumonía organizada (trastorno)	68409003	6	3
371	neumonia	neumonía infecciosa adquirida en el período prenatal (trastorno)	71926009	6	3
372	neumonia	neumonía granulomatosa (trastorno)	72656004	6	3
373	neumonia	neumonía viral (trastorno)	75570004	6	3
374	neumonia	neumonía de Pittsburgh (trastorno)	76090006	6	3
375	neumonia	neumonía tuberculosa (trastorno)	80003002	6	3
376	neumonia	ornitosis con neumonía (trastorno)	81164001	6	3
377	neumonia	neumonía en la micosis sistémica (trastorno)	84753008	6	3
378	neumonia	neumonía hipostásica (trastorno)	85469005	6	3
379	neumonia	gastroenteritis ulcerada aguda complicada con neumonía (trastorno)	109814008	6	3
380	neumonia	neumonía en la aspergilosis (trastorno)	111900000	6	3
381	neumonia	neumonía focal (trastorno)	123590007	6	3
382	neumonia	neumonía confluente (trastorno)	123591006	6	3
383	neumonia	pulmón urémico (trastorno)	123595002	6	3
384	neumonia	neumonía intersticial inespecífica (trastorno)	129452008	6	3
385	neumonia	neumonía de los legionarios (trastorno)	195889001	6	3
386	neumonia	neumonía causada por el virus de la varicela (trastorno)	195911009	6	3
387	neumonia	neumonía (trastorno)	233604007	6	3
388	neumonia	neumonía por neumococos (trastorno)	233607000	6	3
389	neumonia	neumonía micótica (trastorno)	233613009	6	3
390	neumonia	neumonía micobacteriana (trastorno)	233618000	6	3
391	neumonia	neumonía neonatal (trastorno)	233619008	6	3
392	neumonia	neumonía por parásitos (trastorno)	233620002	6	3
393	neumonia	neumonitis intersticial de células gigantes (trastorno)	233625007	6	3
394	neumonia	neumonía por colesterol (trastorno)	233728004	6	3
395	neumonia	neumonía intersticial aguda (trastorno)	236302005	6	3
396	neumonia	neumonía lobular (trastorno)	278516003	6	3
397	neumonia	neumonía infecciosa (trastorno)	312342009	6	3
398	neumonia	eosinofilia pulmonar (trastorno)	367542003	6	3
399	neumonia	neumonía lobar neumocócica (trastorno)	266350000	6	3
400	neumonia	neumonía bacteriana congénita (trastorno)	276693005	6	3
401	neumonia	neumonía neonatal por aspiración (trastorno)	276695003	6	3
402	neumonia	neumonía estreptocócica del grupo B (trastorno)	195886008	6	3
403	neumonia	neumonía por Proteus (trastorno)	195888009	6	3
404	neumonia	neumonía actinomicótica (trastorno)	195908008	6	3
405	neumonia	absceso de pulmón con neumonía (trastorno)	196112005	6	3
406	neumonia	neumonía bacteriana secundaria (trastorno)	308906005	6	3
407	neumonia	neumonía posquirúrgica (trastorno)	314978007	6	3
408	neumonia	neumonía atípica (trastorno)	233606009	6	3
409	neumonia	neumonía meningocócica (trastorno)	233608005	6	3
410	neumonia	neumonía hemorrágica (trastorno)	233617005	6	3
411	neumonia	neumonía intersticial mononuclear (trastorno)	233623000	6	3
412	neumonia	neumonía por herpes simple (trastorno)	233624006	6	3
413	neumonia	neumonía por nocardias (trastorno)	195909000	6	3
414	neumonia	neumonía neonatal por Chlamydia (trastorno)	233610007	6	3
415	neumonia	neumonía por rickettsias (trastorno)	233621003	6	3
416	neumonia	eosinofilia pulmonar criptogénica (trastorno)	233692000	6	3
417	neumonia	neumonía basal (trastorno)	300999006	6	3
418	neumonia	neumonía de lóbulo superior derecho (trastorno)	301004001	6	3
419	neumonia	histoplasmosis pulmonar africana (trastorno)	187052004	6	3
420	neumonia	neumonía posobstructiva (trastorno)	371072008	6	3
421	neumonia	neumonía extrahospitalaria (trastorno)	385093006	6	3
422	neumonia	neumonía de lóbulo superior izquierdo (trastorno)	301002002	6	3
423	neumonia	neumonía de lóbulo inferior izquierdo (trastorno)	301000005	6	3
424	neumonia	neumonía por adenovirus (trastorno)	41207000	6	3
425	neumonia	neumonía gangrenosa (trastorno)	7063008	6	3
426	neumonia	neumonía por micobacterias no tuberculosas (trastorno)	277869007	6	3
427	neumonia	neumonía por citomegalovirus (trastorno)	7678002	6	3
428	neumonia	neumonía de lóbulo medio derecho (trastorno)	301003007	6	3
429	neumonia	neumonía por carbunco (trastorno)	195902009	6	3
430	neumonia	neumonía de lóbulo inferior derecho (trastorno)	301001009	6	3
431	neumonia	neumonía estacional criptogénica en organización, con colestasis bioquímica (trastorno)	233713004	6	3
432	neumonia	neumonía intersticial descamativa (trastorno)	8549006	6	3
433	neumonia	neumonía bilateral (trastorno)	407671000	6	3
434	neumonia	neumonía bacteriana asociada con la atención médica (trastorno)	408680002	6	3
435	neumonia	neumonía por Pneumocystis jiroveci (trastorno)	415125002	6	3
436	neumonia	neumonía posarampionosa (trastorno)	191727003	6	3
437	neumonia	neumonía del lóbulo de la língula (trastorno)	426696003	6	3
438	neumonia	neumonía hospitalaria (trastorno)	425464007	6	3
439	neumonia	neumonía basal bilateral (trastorno)	425996009	6	3
440	neumonia	neumonía asociada con el uso de respirador (trastorno)	429271009	6	3
441	neumonia	neumonía causada por Histoplasma (trastorno)	442094008	6	3
442	neumonia	neumonía causada por infección con Streptococcus pyogenes (trastorno)	441942006	6	3
443	neumonia	neumonía causada por coronavirus del síndrome respiratorio agudo grave (trastorno)	441590008	6	3
444	neumonia	enfermedad por crioaglutininas debida a neumonía por Mycoplasma (trastorno)	48397003	6	3
445	neumonia	neumonía con coccidioidomicosis (trastorno)	195904005	6	3
446	neumonia	neumonía cavitaria (trastorno)	471272001	6	3
447	neumonia	neumonía recurrente (trastorno)	699014000	6	3
448	neumonia	neumonía intersticial idiopática (trastorno)	700249006	6	3
449	neumonia	neumonía aguda debida a coccidioidomicosis (trastorno)	184431000119108	6	3
450	neumonia	neumonía eosinofílica idiopática (trastorno)	708031000	6	3
451	neumonia	neumonía bacteriana concomitante con infección por virus de la inmunodeficiencia humana (trastorno)	713544008	6	3
452	neumonia	neumonía causada por coronavirus humano (trastorno)	713084008	6	3
453	neumonia	neumonía bacteriana recurrente (trastorno)	713525001	6	3
454	neumonia	neumonía bacteriana recurrente concomitante con infección por virus de la inmunodeficiencia humana (trastorno)	713526000	6	3
455	neumonia	neumonía causada por Escherichia coli (trastorno)	51530003	6	3
456	neumonia	neumonía causada por bacterias gramnegativas (trastorno)	430395005	6	3
457	neumonia	neumonía causada por bacterias aeróbicas (trastorno)	409665004	6	3
458	neumonia	neumonía causada por bacterias anaerobias (trastorno)	409664000	6	3
459	neumonia	neumonía causada por Histoplasma capsulatum (trastorno)	38699009	6	3
460	neumonia	neumonía causada por metapneumovirus humano (trastorno)	445096001	6	3
461	neumonia	neumonía causada por Klebsiella pneumoniae (trastorno)	64479007	6	3
462	neumonia	neumonía causada por Staphylococcus aureus resistente a la meticilina (trastorno)	124691000119101	6	3
463	neumonia	neumonía causada por Staphylococcus aureus sensible a la meticilina (trastorno)	128711000119106	6	3
464	neumonia	neumonía causada por organismo tipo pleuroneumonía (trastorno)	195896004	6	3
465	neumonia	neumonía causada por Proteus mirabilis (trastorno)	39172002	6	3
466	neumonia	neumonía causada por Pseudomonas (trastorno)	41381004	6	3
467	neumonia	neumonía causada por virus sincicial respiratorio (trastorno)	195881003	6	3
468	neumonia	neumonía causada por Schistosoma haematobium (trastorno)	707508008	6	3
469	neumonia	neumonía causada por Schistosoma japonicum (trastorno)	707507003	6	3
470	neumonia	neumonía causada por Schistosoma mansoni (trastorno)	707503004	6	3
471	neumonia	neumonía causada por Staphylococcus aureus (trastorno)	441658007	6	3
472	neumonia	neumonía causada por Streptococcus (trastorno)	34020007	6	3
473	neumonia	neumonitis causada por toxoplasmosis adquirida (trastorno)	46207001	6	3
474	neumonia	neumonía causada por Mycoplasma pneumoniae (trastorno)	46970008	6	3
475	neumonia	neumonía causada por Leishmania (trastorno)	240635003	6	3
476	neumonia	neumonía criptogénica organizada (trastorno)	719218000	6	3
477	neumonia	síndrome de neumonía idiopática (trastorno)	12381000132107	6	3
478	neumonia	neumonía eosinofílica aguda idiopática (trastorno)	724499007	6	3
479	neumonia	neumonía causada por Chlamydia pneumoniae (trastorno)	724498004	6	3
480	neumonia	neumonía causada por bacterias grampositivas (trastorno)	733051000	6	3
481	neumonia	neumonía causada por Chlamydiaceae (trastorno)	233609002	6	3
482	neumonia	neumonía causada por coronavirus 2 del síndrome respiratorio agudo severo (trastorno)	882784691000119000	6	3
483	neumonia	neumonía causada por Acinetobacter (trastorno)	1010634002	6	3
484	neumonia	neumonía causada por Enterococcus resistente a vancomicina (trastorno)	1149093006	6	3
485	neumonia	neumonía debida a sarampión (trastorno)	195900001	6	3
486	neumonia	neumonía viral debida a mononucleosis infecciosa causada por virus del herpes humano tipo 4 (trastorno)	1187256004	6	3
487	neumonia	neumonía causada por organismo del género Enterobacter (trastorno)	1176988004	6	3
488	neumonia	neumonía con síndrome de inmunodeficiencia adquirida (trastorno)	421671002	6	3
489	neumonia	neumonía bacteriana con síndrome de inmunodeficiencia adquirida (trastorno)	420544002	6	3
490	neumonia	neumonía neumocócica con síndrome de inmunodeficiencia adquirida (trastorno)	420787001	6	3
491	neumonia	neumonía viral con síndrome de inmunodeficiencia adquirida (trastorno)	421508002	6	3
492	sinusitis	sinusitis esfenoidal (trastorno)	13266007	6	3
493	sinusitis	sinusitis aguda (trastorno)	15805002	6	3
494	sinusitis	sinusitis etmoidal (trastorno)	18643000	6	3
495	sinusitis	sinusitis (trastorno)	36971009	6	3
496	sinusitis	sinusitis etmoidal aguda (trastorno)	67832005	6	3
497	sinusitis	sinusitis maxilar aguda (trastorno)	68272006	6	3
498	sinusitis	sinusitis bacteriana aguda (trastorno)	75498004	6	3
499	sinusitis	sinusitis esfenoidal aguda (trastorno)	77919000	6	3
500	sinusitis	sinusitis frontal (trastorno)	78737005	6	3
501	sinusitis	supuración aguda de seno nasal (trastorno)	80600003	6	3
502	sinusitis	sinusitis maxilar (trastorno)	88348008	6	3
503	sinusitis	barosinusitis (trastorno)	88548007	6	3
504	sinusitis	sinusitis frontal aguda (trastorno)	91038008	6	3
505	sinusitis	sinusitis recurrente (trastorno)	195788001	6	3
506	sinusitis	sinusitis aguda recurrente (trastorno)	232391008	6	3
507	sinusitis	sinusitis frontal aguda con osteomielitis del hueso frontal (trastorno)	232389000	6	3
508	sinusitis	sinusitis obstructiva (trastorno)	371127003	6	3
509	sinusitis	sinusitis supurativa con complicaciones (trastorno)	232390009	6	3
510	sinusitis	sinusitis alérgica por hongos (trastorno)	425011002	6	3
511	sinusitis	sinusitis crónica recurrente (trastorno)	427909005	6	3
512	sinusitis	sinusitis micótica invasiva (trastorno)	429427008	6	3
513	sinusitis	sinusitis viral (trastorno)	444814009	6	3
514	sinusitis	sinusitis bacteriana (trastorno)	703470001	6	3
515	sinusitis	sinusitis fúngica (trastorno)	104041000119108	6	3
516	sinusitis	sinusitis concomitante con pólipos nasales (trastorno)	41931000119102	6	3
517	sinusitis	sinusitis causada por Streptococcus pneumoniae (trastorno)	721741006	6	3
518	sinusitis	sinusitis aguda causada por hongo (trastorno)	725916003	6	3
519	sinusitis	sinusitis aguda causada por virus (trastorno)	725917007	6	3
520	sinusitis	neuropatía craneal debida a sinusitis (trastorno)	840459008	6	3
521	tos	tos seca (hallazgo)	11833005	6	3
522	tos	tos metálica (hallazgo)	20670007	6	3
523	tos	tos productiva (hallazgo)	28743005	6	3
524	tos	tos paroxística (hallazgo)	43025008	6	3
525	tos	tos postprandial (hallazgo)	46789001	6	3
526	tos	tos del fumador (trastorno)	46802002	6	3
527	tos	tos (hallazgo)	49727002	6	3
528	tos	tos ferina (hallazgo)	59994004	6	3
529	tos	tos nocturna (hallazgo)	62548007	6	3
530	tos	tos matinal (hallazgo)	62618004	6	3
531	tos	incremento de la tos (hallazgo)	62731002	6	3
532	tos	tos espasmódica (hallazgo)	63000007	6	3
533	tos	síncope tusivo (hallazgo)	90129003	6	3
534	tos	síndrome de cefalea por tos (hallazgo)	95658004	6	3
535	tos	supresión de la tos (hallazgo)	102580004	6	3
536	tos	tos postural (hallazgo)	111962006	6	3
537	tos	característica de la tos (entidad observable)	364054002	6	3
538	tos	síndrome tipo tos ferina (trastorno)	271567008	6	3
539	tos	características de la tos (entidad observable)	248592006	6	3
540	tos	capacidad para toser (entidad observable)	289107006	6	3
541	tos	capacidad para toser y expectorar (entidad observable)	301244000	6	3
542	tos	capacidad para toser voluntariamente (entidad observable)	306779000	6	3
543	tos	rasgos toscos (hallazgo)	248185005	6	3
544	tos	hallazgo relacionado con la capacidad de toser voluntariamente (hallazgo)	366125009	6	3
545	tos	capaz de toser voluntariamente (hallazgo)	306780002	6	3
546	tos	incapaz de toser voluntariamente (hallazgo)	306781003	6	3
547	tos	dificultad para toser voluntariamente (hallazgo)	306782005	6	3
548	tos	capaz de toser (hallazgo)	289113002	6	3
549	tos	tose (hallazgo)	289114008	6	3
550	tos	dificultad para toser (hallazgo)	289116005	6	3
551	tos	incapaz de toser (hallazgo)	248590003	6	3
552	tos	tos efectiva (hallazgo)	301236000	6	3
553	tos	tos persistente (hallazgo)	284523002	6	3
554	tos	tos de causa inexplicable (hallazgo)	315246003	6	3
555	tos	tos matutina (hallazgo)	161932002	6	3
556	tos	tos vespertina (hallazgo)	161933007	6	3
557	tos	tos alérgica (hallazgo)	300959008	6	3
558	tos	tos crupal (hallazgo)	289965001	6	3
559	tos	tos/sibilancia nocturnos (hallazgo)	161947006	6	3
560	tos	tos productiva - esputo claro (hallazgo)	161923004	6	3
561	tos	tos productiva - esputo verde (hallazgo)	161924005	6	3
562	tos	tos productiva - esputo amarillo (hallazgo)	161925006	6	3
563	tos	tos psicógena (hallazgo)	191954008	6	3
564	tos	tos dolorosa (hallazgo)	247410004	6	3
565	tos	reflejo de la tos (entidad observable)	34606001	6	3
566	tos	tos a través de fístula traqueoesofágica (hallazgo)	248594007	6	3
567	tos	tos inefectiva (hallazgo)	276314008	6	3
568	tos	impulso de la tumoración con la tos (entidad observable)	364640009	6	3
569	tos	tos perruna (hallazgo)	17986004	6	3
570	tos	tose al tragar (hallazgo)	248593001	6	3
571	tos	tos en reposo (hallazgo)	7142008	6	3
572	tos	incapaz de eliminar esputo mediante la tos (hallazgo)	225575005	6	3
573	tos	tos ferina (trastorno)	27836007	6	3
574	tos	tos durante el ejercicio (hallazgo)	19282004	6	3
575	tos	púrpura por vómitos y tos prolongados (trastorno)	402850004	6	3
576	tos	tos ferina asociada con la atención médica (trastorno)	408682005	6	3
577	tos	tos (entidad observable)	263731006	6	3
578	tos	tos vacuna (hallazgo)	62427007	6	3
579	tos	broncomoniliasis (trastorno)	418122003	6	3
580	tos	congestión de vías respiratorias y tos (trastorno)	417850002	6	3
581	tos	síntoma que empeora con la tos (hallazgo)	162480005	6	3
582	tos	vómito postusígeno (trastorno)	424580008	6	3
583	tos	dolor provocado por toser (hallazgo)	427146008	6	3
584	tos	hallazgo relacionado con el impulso de la tumoración con la tos (hallazgo)	300864006	6	3
585	tos	hallazgo relacionado con la capacidad para toser (hallazgo)	366124008	6	3
586	tos	capaz de eliminar esputo mediante la tos (hallazgo)	225576006	6	3
587	tos	tos disminuida (hallazgo)	52673003	6	3
588	tos	tos persistente luego de infección respiratoria por virus (trastorno)	445241004	6	3
589	tos	sin fuerza para toser (hallazgo)	769211009	6	3
590	tos	fuerza de la tos (entidad observable)	769210005	6	3
591	tos-neumonia	tos convulsa agravada por neumonía (trastorno)	59475000	6	3
592	tos-neumonia	salmonelosis no tifoidea invasiva (trastorno)	763772002	6	3
593	tos-neumonia	neumonía necrosante causada por Staphylococcus aureus productor de leucocidina de Panton-Valentine (trastorno)	763888005	6	3
594	neumonia	neumonía gonocócica (trastorno)	1087061000119106	6	3
595	neumonia	neumonía causada por Ascaris (trastorno)	1082721000119101	6	3
596	neumonia	neumonía por rubéola (trastorno)	1092361000119109	6	3
597	neumonia	neumonía causada por Bordetella parapertussis (trastorno)	1092951000119106	6	3
\.


--
-- TOC entry 3823 (class 0 OID 19360)
-- Dependencies: 465
-- Data for Name: variable_tipo; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.variable_tipo (id, description) FROM stdin;
1	Confirmado
2	Sospecha
3	Grave
4	Otro
5	Fiebre Infecciosa
6	Afectación respiratoria infecciosa
\.

--
-- Data for Name: enfermedad; Type: TABLE DATA; Schema: tableros; Owner: dashboarduser
--

COPY tableros.enfermedad (id, description) FROM stdin;
1	Covid19
2	Dengue
3	Fiebre y Sintomas respiratorios
\.


-- Completed on 2022-07-15 20:03:29 UTC

--
-- PostgreSQL database dump complete
--

