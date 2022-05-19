# Database Operations

## Dump

To create a dump of the database, run:

```
docker-compose exec db pg_dumpall -U pdbuser > dump.sql
```

Make sure to change `db` and `pdbuser` if you have customized those in the Docker Compose file.

### I don't have the Docker Compose file right now!

Run:

```
docker run --rm -v ${pwd}:/tmp -v shipper_postgres_data:/var/lib/postgresql/data -w /tmp postgres:13.6-alpine pg_dumpall -U pdbuser > dump.sql
```

Again, change `shipper_postgres_data`, `postgres:13.6-alpine`, `pdbuser` and `shipper` based on previous Docker Compose values and environment variable values.

## Restore

To restore a dump of the database, first start up the shipper-docker instance and make sure the PostgreSQL database is running. Make sure you are in the directory with the `dump.sql` file. Execute:

```
# Copy the dump file to the volume by spinning up a temporary Docker image (seriously Docker team why the hell do we have to do this?!)
docker run --rm -v shipper_postgres_data:/target -v ${pwd}:/source alpine cp /source/dump.sql /target

# Connect to the current database instance inside the Docker Compose file
docker-compose exec db bash

# Import
psql -U pdbuser -d shipper < {mapped_volume_folder_path}/dump.sql

# Delete the dump file
rm dump.sql
```

### I don't have the Docker Compose file right now!

Run:

```
docker run --rm -v ${pwd}:/tmp -v shipper_postgres_data:/var/lib/postgresql/data -w /tmp postgres:14-alpine psql -U pdbuser -d shipper < dump.sql
```

Again, don't forget to change `shipper_postgres_data`, `postgres:14-alpine`, `pdbuser` and `shipper` based on previous Docker Compose values and environment variable values.