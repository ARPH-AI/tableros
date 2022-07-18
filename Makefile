#!make
include .env

SHELL := /bin/bash
ROOT := ./develop/databases
SERVERCFS := $(ROOT)/configs/servers
SQLSCRIPTS := $(ROOT)/scripts
SCHEMA:= tableros

#####################
# INFRASTRUCTURE
#####################

envfile:
	@echo ":::::: Generating envfile for infrastructure"
	cp .env.example .env

start:
	@echo ":::::: Starting dockerized infrastructure"
	docker-compose up -d

stop:
	@echo ":::::: Stopping dockerized infrastructure"
	docker-compose down

reset:
	@echo ":::::: Resetting dockerized infrastructure"
	make stop
	make start

hard-reset:
	@echo ":::::: Resetting volumes"
	make stop
	docker volume prune -f
	make start


#####################
# DB
#####################

load-dashboard-changes:
	@echo ":::::: Create DASHBOARD DB Schema and load data"
	make create-dashboard-schema
	make load-data-dashboard
	make cube-restart


create-dashboard-schema:
	@echo ":::::: Create DASHBOARD DB Schema"
	docker cp $(SQLSCRIPTS)/schemas/01-create-dashboard-schema.sql postgres-dashboard:/01-create-dashboard-schema.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 01-create-dashboard-schema.sql
	docker cp $(SQLSCRIPTS)/schemas/02-create-dashboard-views.sql postgres-dashboard:/02-create-dashboard-views.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f 02-create-dashboard-views.sql

load-data-dashboard:
	@echo ":::::: Load  SVNS table and DASHBOARD DB data "
	make restore-snvs-table
	docker cp $(SQLSCRIPTS)/onlydata/only-data-dashboard.sql postgres-dashboard:/only-data-dashboard.sql
	docker exec -i postgres-dashboard psql -U $(PG_USER) -d $(PG_DBNAME) -f only-data-dashboard.sql


backup-snvs-table:
	@echo ":::::: Dump SVNS table"
	docker exec postgres-dashboard pg_dump -F c -U $(PG_USER) -d $(PG_DBNAME) --data-only -t tableros.snvs > $(SQLSCRIPTS)/dump/table-snvs.dump

restore-snvs-table:
	@echo ":::::: Load SNVS table"
	docker cp $(SQLSCRIPTS)/dump/table-snvs.dump postgres-dashboard:/table-snvs.dump
	docker exec postgres-dashboard pg_restore -U $(PG_USER) --no-password -d $(PG_DBNAME) -t snvs --verbose  table-snvs.dump

dump-schema:
	@echo ":::::: Dumping DASHBOARD DB Schema"
	docker exec postgres-dashboard pg_dump -F c -U $(PG_USER) -s $(PG_DBNAME) -n $(SCHEMA) > $(SQLSCRIPTS)/dump/schema-$(SCHEMA).dump

restore-schema:
	@echo ":::::: Restoring DASHBOARD DB Schema"
	docker exec postgres-dashboard pg_restore -U $(PG_USER) --no-password -d $(PG_DBNAME) --schema-only --verbose scripts/schema-$(SCHEMA).dump

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
	docker-compose down
	docker volume rm arphai-dashboard_dashboard-psqlserver-volume
	make start

#####################
# GENERALS
#####################

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
