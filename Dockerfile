# Use the same version defined in your docker-compose.yml
FROM postgres:16

# 1. Handle Initialization Scripts
# The official Postgres image automatically runs .sql files placed within
# /docker-entrypoint-initdb.d/ on the first container startup.
COPY ./sql/00_init /docker-entrypoint-initdb.d/

# 2. Handle Makefile Scripts
# Your Makefile attempts to run scripts located at /sql/10_queries,
# /sql/20_aggregates, etc. inside the container. We copy the entire
# local ./sql folder to /sql inside the image.
COPY ./sql /sql