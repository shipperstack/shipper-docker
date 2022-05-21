# Database Operations

## Dump

To create a dump of the database, make sure the database service is first running. If it is not running, start it with:

```
docker-compose up -d db
```

Then run:

```
docker-compose exec db pg_dumpall -U pdbuser > dump.sql
```

Make sure to substitute `db` and `pdbuser` if you have customized those in the Docker Compose file.

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
