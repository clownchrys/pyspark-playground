.PHONY: build up save load down status

build:
	docker compose build

up:
	docker compose up -d

save:
	docker save -o ./dist/pyspark-playground_localstack.tar pyspark-playground:localstack
	docker save -o ./dist/pyspark-playground_spark.tar pyspark-playground:spark
	docker save -o ./dist/pyspark-playground_dashboard.tar pyspark-playground:dashboard

load:
	docker load -i ./dist/pyspark-playground_localstack.tar
	docker load -i ./dist/pyspark-playground_spark.tar
	docker load -i ./dist/pyspark-playground_dashboard.tar

down:
	docker compose down

status:
	docker compose ps -a
