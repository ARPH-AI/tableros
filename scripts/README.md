# Documentación

- Poblaciones por departamentos: [INDEX](https://www.indec.gob.ar/indec/web/Nivel4-Tema-2-24-119)
- Departamentos de Provincias Argentinas: [mgaitan/departamentos_argentina](https://github.com/mgaitan/departamentos_argentina/)
- [Provincias geo Json](https://infra.datos.gob.ar/catalog/modernizacion/dataset/7/distribution/7.2/download/provincias.json)

## Geojson
> Transformación al json de provincias

- El zoom máximo hay que trasnsformarlo segun UI
- Se modifico departamentos-ciudad_autonoma_de_buenos_aires.json para que los numeros de COMUNA X (reemplazar 1 por 01)

```
cat provincias-argentina.json | jq '[.[] | {iso_nombre: .iso_nombre, centroide: .centroide, zoom: 7 } ] | sort_by(.iso_nombre)'
```


## Población x Departamento
> Planillas de cálculo obtenida de https://www.indec.gob.ar/indec/web/Nivel4-Tema-2-24-119

- Fuentes descargadas en **./orig_files**
- A partir de los xls se genera csv (completamente manual) - Ejemplo **proy_1025_depto_total.csv**
- Luego se procesa para obtener **"./poblacion_por_departamento.json"** con `python3 custom_csv_to_json.py`

### Modificaciones directas para obtener consistencia con el geojson

```
45c45
<         "JUAN BAUTISTA ALBERDI": {
---
>         "JUAN B. ALBERDI": {
766c766
<         "GENERAL GUEMES": {
---
>         "GENERAL G\u00dcEMES": {
2635c2635
<         "JOSE C PAZ": {
---
>         "JOSE C. PAZ": {
3139c3139
<         "LEANDRO N ALEM": {
---
>         "LEANDRO N. ALEM": {
3732c3732
< }
---
> }
```

## Minificación

`jq -c . archivo.json > archivo.minificado.json`

