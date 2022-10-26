#!make
include .env

SHELL := /bin/bash
ROOT := ./deploy/develop/databases
ROOT_PROD := ./deploy/production/databases
SERVERCFS := $(ROOT)/configs/servers
SQLSCRIPTS := $(ROOT)/scripts
SCHEMA:= tableros

#####################
# DEVELOP INFRASTRUCTURE 
#####################

envfile:
	@echo ":::::: Generating envfile for infrastructure"
	cp .env.example .env

start:
	@echo ":::::: Starting dockerized infrastructure"
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.develop.yml up -d --remove-orphans

stop:
	@echo ":::::: Stopping dockerized infrastructure"
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.develop.yml stop	

down:
	@echo ":::::: Stopping dockerized infrastructure"
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.develop.yml down

reset:
	@echo ":::::: Resetting dockerized infrastructure"
	make stop
	make start

hard-reset:
	@echo ":::::: Resetting volumes"
	make full-down	
	make start

full-down:
	@echo "::::::: Full Down"
	make down
	docker image rm arphai_backend
	docker volume rm arphai_dashboard-psqlserver-volume  arphai_pgadmin-service-volume

#####################
# DB-DEVELOP
#####################

recreate-db-develop:
	make load-public-schema
	make create-dashboard-schema
	make load-data-dashboard
	make load-csv-snvs
	make cube-restart

create-dashboard-schema:
	@echo ":::::: Create DASHBOARD DB Schema"
	docker cp $(SQLSCRIPTS)/schemas/01-create-dashboard-schema.sql postgres-dashboard:/01-create-dashboard-schema.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 01-create-dashboard-schema.sql
	docker cp $(SQLSCRIPTS)/schemas/02-create-esquemasnvs.sql postgres-dashboard:/02-create-esquemasnvs.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 02-create-esquemasnvs.sql
	docker cp $(SQLSCRIPTS)/schemas/03-create-snvs-index.sql postgres-dashboard:/03-create-snvs-index.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 03-create-snvs-index.sql
	docker cp $(SQLSCRIPTS)/schemas/04-create-dashboard-views.sql postgres-dashboard:/04-create-dashboard-views.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 04-create-dashboard-views.sql

load-public-schema:
	@echo ":::::: Load Public DB Schema"
	docker cp $(SQLSCRIPTS)/schemas/05-backup-public.sql postgres-dashboard:/05-backup-public.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 05-backup-public.sql

load-dashboard-changes:
	@echo ":::::: Create DASHBOARD DB Schema and load data"
	make create-dashboard-schema
	make load-public-schema
	make load-data-dashboard
	make cube-restart

load-data-dashboard:
	@echo ":::::: Load  SVNS table and DASHBOARD DB data "
	docker cp $(SQLSCRIPTS)/onlydata/only-data-dashboard.sql postgres-dashboard:/only-data-dashboard.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f only-data-dashboard.sql

load-csv-snvs:

	docker cp $(SQLSCRIPTS)/onlydata/primeros_100.csv postgres-dashboard:/primeros_100.csv
	docker exec postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -c "SET datestyle = 'ISO, DMY';COPY tableros.snvs FROM '/primeros_100.csv' WITH (FORMAT csv);"

backup-snvs-table:
	@echo ":::::: Dump SVNS table"
	docker exec postgres-dashboard pg_dump -F c -U $(PG_USER) -d $(PG_DBNAME) --data-only -t tableros.snvs > $(SQLSCRIPTS)/dump/table-snvs.dump

restore-snvs-table:
	@echo ":::::: Load SNVS table"
	docker cp $(SQLSCRIPTS)/dump/table-snvs.dump postgres-dashboard:/table-snvs.dump
	docker exec postgres-dashboard pg_restore -U $(PG_USER) --no-password -d $(PG_DBNAME) -t snvs --verbose  table-snvs.dump

drop-dashboard-schema:
	@echo ":::::: Dropping DASHBOARD DB Schema"
	make backup-snvs-table
	docker exec postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -c "DROP SCHEMA IF EXISTS $(SCHEMA) CASCADE;"

restore-db-dump:
	@echo ":::::: Restoring DUMP DB from file"
	docker cp $(BACKUP_FILE) postgres-dashboard:/backup.dump
	docker exec postgres-dashboard psql -h localhost -U $(PG_USER) -d $(PG_DBNAME) -f /backup.dump


drop-all-db:
	@echo ":::::: Delete all DB in Postgres"
	make down
	docker volume rm arphai-dashboard_dashboard-psqlserver-volume
	make start

#####################
# PRODUCTION DB
#####################

create-file-dashboard-prod:
	PG_USER=$(PG_USER) envsubst < $(ROOT_PROD)/scripts/template/01-populate-dashboard-schema-prod-template > $(ROOT_PROD)/scripts/01-populate-dashboard-schema-prod.sql
	PG_USER=$(PG_USER) envsubst < $(ROOT_PROD)/scripts/template/02-create-dashboard-views-prod-template > $(ROOT_PROD)/scripts/02-create-dashboard-views-prod.sql

recreate-data-dashboard-prod:
	make create-file-dashboard-prod
	PGPASSWORD=$(PG_PASSWORD) psql -h $(PG_HOST) -U $(PG_USER) -d $(PG_DBNAME) -p $(PG_PORT) -f $(ROOT_PROD)/scripts/01-populate-dashboard-schema-prod.sql
	PGPASSWORD=$(PG_PASSWORD) psql -h $(PG_HOST) -U $(PG_USER) -d $(PG_DBNAME) -p $(PG_PORT) -f $(ROOT_PROD)/scripts/02-create-dashboard-views-prod.sql
	PGPASSWORD=$(PG_PASSWORD) psql -h $(PG_HOST) -U $(PG_USER) -d $(PG_DBNAME) -p $(PG_PORT) -f $(ROOT_PROD)/scripts/onlydata/onlydata-dashboard.sql

recreate-in-new-db:
	@echo ":::::: Recreate DB"
	PGPASSWORD=$(PG_PASSWORD) psql -h $(PG_HOST) -U $(PG_USER) -d $(PG_DBNAME) -p$(PG_PORT) -f $(SQLSCRIPTS)/schemas/03-create-snvs-index.sql
	PGPASSWORD=$(PG_PASSWORD) psql -h $(PG_HOST) -U $(PG_USER) -d $(PG_DBNAME) -p$(PG_PORT) -f $(SQLSCRIPTS)/schemas/05-backup-public.sql

#####################
# PRODUCTION INFRASTRUCTURE 
#####################


build-prod:
	make build-frontend
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.production.yml build

start-prod:
	@echo ":::::: Starting dockerized production infrastructure"
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.production.yml up -d

stop-prod:
	@echo ":::::: Stopping dockerized production infrastructure"
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.production.yml down

reset-prod:
	@echo ":::::: Resetting dockerized production infrastructure"
	make stop-prod
	make start-prod

down-prod:
	docker-compose -p arphai -f docker-compose.yml -f docker-compose.production.yml down

#####################
# GENERALS
#####################

build-frontend:
	@echo ":::::: Build Vite frontend"
	npm install -g vite
	npm install
	npm run build

cube-restart:
	@echo ":::::: Restart Cube"
	docker restart cube-dashboard

cmd-dashboard:
	docker exec -i postgres-dashboard bash -c "$(CMD)"

run-query:
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -c "$(QUERY)"

run-query-file:
	docker cp $(SQLSCRIPTS)/$(FILE).sql postgres-dashboard:/$(FILE).sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f $(FILE).sql

killALL:
	docker-compose down && docker volume prune

change-password:
	docker exec postgres-dashboard psql -h localhost -U $(PG_USER) -c "ALTER USER $(PG_USER) PASSWORD '$(PG_PASSWORD)';"


#####################
# DB-GENERALS
#####################

dump-schema:
	@echo ":::::: Dumping DASHBOARD DB Schema"
	docker exec postgres-dashboard pg_dump -F c -U $(PG_USER) -s $(PG_DBNAME) -n $(SCHEMA) > $(SQLSCRIPTS)/dump/schema-$(SCHEMA).dump

restore-schema:
	@echo ":::::: Restoring DASHBOARD DB Schema"
	docker exec postgres-dashboard pg_restore -U $(PG_USER) --no-password -d $(PG_DBNAME) --schema-only --verbose scripts/schema-$(SCHEMA).dump


