# Entorno de desarrollo para Arphai Dashboard

## Antes de empezar

> Es necesario tener instalado en tu sistema operativo los siguiente programas

- git
- docker  **Testeado con Docker version 20.10.14**
- docker-compose **Testeado con Docker Compose version v2.3.3**
- make
- node/npm (preferentemente con nvm) **Tener instalado minimo  Node v16.17.0 o superior**


Es habitual al instalar docker, no tener tu usuario en el grupo docker. Solución `usermod -aG docker $TU_USUARIO`

## Aplicacion de dashboard

> Ver [Documentación de VUELIX](README.vuelix.md) - Vuelix is a Vue 3 + Vite starter template to scaffold new projects really fast and with a great developer experience.



## Accesibilidad

Auditamos con esta biblioteca [vue-a11y](https://github.com/vue-a11y/vue-axe-next) que utiliza [axe-core](https://github.com/dequelabs/axe-core/). Toma en cuenta las siguientes [reglas](https://github.com/dequelabs/axe-core/blob/develop/doc/rule-descriptions.md).


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

## Datos geo

> Ver [README](scripts/README.md)

## Dockerizacion

## Flujo de uso en Produccion y en Desarrollo

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

### Produccion

1. Se deben modificar del archivo .env.example ( tanto en el root y en la carpeta backend) a .env y completar con los datos necesario

2. Luego se debe ejecutar los siguientes comandos desde makefile:

```bash
  make recreate-data-dashboard-prod
```

3. Luego ejecutar para buildear el frontend y levantar los servicios necesarios.

```bash
  make build-prod
  make start-prod
```

### Desarrollo

1. Se deben renombrar todas los .env. a .env (en el root y en la carpeta backend) y completar con los datos necesario

2. Luego se debe ejecutar los siguientes comandos desde makefile:

```bash
  make recreate-db-develop
```

3. 3. Luego ejecutar para levantar los servicios

```bash
  make start
```

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
  - CUBEJS_DEV_MODE
```

Esta variable es la que permite conectar luego la aplicacion de VUE con CUBE.
La variable CUBEJS_DEV_MODE debe estar en false en produccion y true en desarollo

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

### Desarrollo

**Carga de backup del esquema publico,creacion de esquema dashboard,carga de datos en en esquema y de tabla snvs**
```bash
 make recreate-db-develop
```

**Dropear este esquema previamente generando un dump de la tabla snvs en el directorio /develop/databases/dump/**

```bash
make drop-dashboard-schema
```

**Borrar todos los cambios en la db en desarrollo**

```bash
make drop-all-db
```

**Comando para cargar un archivo en la DB en desarollo**

```bash
make run-query-file FILE=path/del/archivo.sql
```


**Comandos para la utilización de docker-compose**

```bash
make start
make stop
make reset
make hard-reset #Este particularmente borra los volumenes e imagenes
make cube-restart
```


**Existen tambien separadas algunos otros comandos mas especificos**

```bash
make load-csv-snvs
make backup-snvs-table
make restore-snvs-table
make create-dashboard-schema
```
### Produccion

**Comando para agregar a db tablas y vistas  del schema tableros y  vistas, carga de datos en estas tablas**

```bash
make recreate-data-dashboard-prod
```

**Comando para cargar un archivo en la DB en produccion**

```bash
make run-file-in-db FILE=path/de/archivo.sql
```

El archivo debe ser de extension .sql para que se ejecute correctamente.

**Comando para borrar toda la información agregada en producción y dejar la db en producción**

```bash
make run-file-in-db FILE=/deploy/production/databases/scripts/03-remove-dashboard-prod.sql
```

**Comandos para la utilización de docker-compose en producción**

```bash
make build-prod
make start-prod
make stop-prod
make reset-prod
make down-prod
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

#### Comandos generales para usar el docker

Tenemos los siguientes comandos para utilizar:

```bash
make start
make stop
make reset
make hard-reset #Este particularmente borra los volumenes e imagenes
make cube-restart
```
