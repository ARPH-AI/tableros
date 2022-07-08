# Entorno de desarrollo para Arphai Dashboard

## Aplicacion de dashboard

> Ver [Documentación de VUELIX](README.vuelix.md) - Vuelix is a Vue 3 + Vite starter template to scaffold new projects really fast and with a great developer experience.

### Montar infraestructura desarrollo 1er vez

> Recordar tener un dump de la DB que contenga al menos el esquema public de HSI

Usar variables de ambiente por defecto:

```
cp .env.example .env
```

Inicializa todos los servicios (pgadmin, postgres y cube)

```
make start
```

## Accesibilidad

Auditamos con esta biblioteca [vue-a11y](https://github.com/vue-a11y/vue-axe-next) que utiliza [axe-core](https://github.com/dequelabs/axe-core/). Toma en cuenta las siguientes [reglas](https://github.com/dequelabs/axe-core/blob/develop/doc/rule-descriptions.md).

## Datos geo

- Departamentos de Provincias Argentinas: [mgaitan/departamentos_argentina](https://github.com/mgaitan/departamentos_argentina/)
- [Provincias geo Json](https://infra.datos.gob.ar/catalog/modernizacion/dataset/7/distribution/7.2/download/provincias.json)

### Transformación al json de provincias

> El zoom máximo hay que trasnsformarlo segun UI
> Se modifico departamentos-ciudad_autonoma_de_buenos_aires.json para que los numeros de COMUNA X (reemplazar 1 por 01)

```
cat provincias-argentina.json | jq '[.[] | {iso_nombre: .iso_nombre, centroide: .centroide, zoom: 7 } ] | sort_by(.iso_nombre)'
```

# Vuelix Documentation

Vuelix is a Vue 3 + Vite starter template to scaffold new projects really fast and with a great developer experience.

## Table of contents

Restaura DB desde dump de HSI

```
make restore-db-dump BACKUP_FILE="ruta_archivo_de_dump"
```

### Instalar dependencias

```
npm install
```

### ~~Generar Código de API~~

> (**Actualmente no es necesario Código de API esta commiteado**)
> **NOTE:** Requiere java `jvm` tien que estar instalado.

```
npm run gen-api
```

### Start the development server

```
npm run dev
```

Usa en el navegador: [http://localhost:3000](http://localhost:3000)

### Build

To build the app, run

```
npm run build
```

And to preview it, after building the app run

```
npm run serve
```

Usa en el navegador: [http://localhost:5000](http://localhost:5000)

### Modificar Esquema o datos iniciales de DB

> Hace un backup de tabla snvs, borra esquema completo con datos y vuelve a crearlo reaturando los datos iniciales y snvs

```
make drop-dashboard-schema
make load-dashboard-changes
```

### Accesibilidad

Auditamos con esta biblioteca [vue-a11y](https://github.com/vue-a11y/vue-axe-next) que utiliza [axe-core](https://github.com/dequelabs/axe-core/). Toma en cuenta las siguientes [reglas](https://github.com/dequelabs/axe-core/blob/develop/doc/rule-descriptions.md).

## Configuración Desarrollo

Poner credenciales de Cube en .env.development

## Dockerizacion

Para facilitar el desarrollo se genero una dockerizacion de los siguientes servicios.

```bash
- Postgres
- Cube
- PgAdmin
```

### Postgres

El servicio de Postgres va ser la base de datos que usaremos para todo el proyecto

#### Esquema de Carpetas

En la el directorio `develop/databases` podemos encontrar las siguientes cosas

- `config/servers/local:` Archivo con variables de entorno
- `scripts/init`: Carpeta donde se ejecutan los script al inicializar [Ver para mas info](#script-inicializacion)
- `scripts/dump`: Carpeta donde se almacenan los dumps
- `scripts/onlydata`: Carpeta donde se almacenan backups de los datos asociados al esquema tablero
- `scripts/schema`: Carpeta donde se almacenan backup del esquema tablero

#### Variables de Entornos para postgres

Es necesario definir en el .env del proyecto las siguientes variables para el uso en la db.

```bash
  - PG_HOST
  - PG_PORT
  - PG_DBNAME
  - PG_USER
  - PG_PASSWORD
```

#### Script inicializacion

Si queremos que al ejecutarse por primera vez que se ejecuten ciertas consultas,deben guardarse en la siguiente carpeta : `develop/databases/script/init/` y siguiendo el formato `01-nombredelaconsulta.sql`, se van a ejecutar en orden ascendente
Igualmente para mas precision, leer la siguiente documentación: [Initialization Scripts](https://hub.docker.com/_/postgres)

### Cube

> Playground [http://localhost:4040](http://localhost:4040)

#### Esquema de Carpetas

En la el directorio `cubejs` podemos encontrar las siguientes cosas:

- Carpeta Schema: Donde se definen los schemas que usara Cube
- Archivo `cube.js`: Archivo de configuracion de nuestra instancia
- Archivo `package.json`: Versiones de las dependecias de cube

#### Variables de Entornos para Cube

La variable particular que tenemos de Cube es la siguiente:

```bash
  - CUBE_SECRET
```

Esta variable es la que permite conectar luego la aplicacion de VUE con CUBE

#### Archivos de configuracion

Particularmente hay un volumen donde se pueden agregar archivos de configuración , modificar el package.json asociado a cube. Esta carpeta es ´develop/docker-data/cubejs´

#### Playground en navegador

Para utilizar el playground de CUBE, se puede acceder desde un navegador a la siguiente url : ´localhost:4040´

### PGADMIN

> [http://localhost:9090](http://localhost:9090)

#### Esquema de Carpetas

En la el directorio `develop/databases` podemos encontrar las siguientes cosas

- `config/pgadmin/dbserver:` Archivo de configuracion de la instancia de PGADMIN

#### Variables de Entornos para PGADMIN

Las variable particular que tenemos en PGADMIN es la siguiente:

```bash
  - PG_ADMIN_DEFAULT_EMAIL
  - PG_ADMIN_DEFAULT_PASSWORD
```

Son las credenciales para poder acceder desde el navegador desde ´localhost:9090´

### Makefile

Se genero un archivo de makefile para ayudar al uso de este entorno de desarollo

#### Comando para actualizar cambios en el esquema tableros

**Este comando crea el esquema tableros, carga la data de la base y reinicia el servicio de cube (presupone que anteriormente se utilizo make drop-dashboard-schema**

```bash
 make load-dashboard-changes
```

**Dropear este esquema previamente generando un dump de la tabla snvs en el directorio /develop/databases/dump/**

```bash
make drop-dashboard-schema
```

**Existen tambien separadas algunos otros comandos mas especificos**

```bash
make backup-snvs-table
make restore-snvs-table
make create-dashboard-schema
```

#### Comandos para trabajar con la DB

**Crear el esquema tablero vacio sin datos**

```bash
make create-dashboard-schema
```

**Generar un dump de un schema en particular que exista en la db**

```bash
make dump-schema SCHEMA="nombredelesquema"
```

**Restaurar un schema con los datos**

```bash
make restore-schema SCHEMA="nombredelesquema"
```

**Dropear un schema que exista en la db**

```bash
make drop-schema SCHEMA="nombredelesquema"
```

**Aplicar un dump de la db entera**

```bash
make restore-db-dump BACKUP_FILE="rutaalarchivo"
```

**Dropear toda la db**

```bash
make drop-all-db
```

#### Comandos generales para usar el docker

Tenemos los siguientes comandos para utilizar:

```bash
make start
make stop
make reset
make hard-reset #Este particularmente borra los volumenes
make cube-restart
```
