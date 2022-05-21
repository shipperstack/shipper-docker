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

Make sure to substitute `db` and `pdbuser` if you have customized those in the Docker Compose file or in the environment file.

You should now have a dump file called `dump.sql` in your current directory. Now is the time to make any changes, such as deleting the database volume, upgrading the PostgreSQL version, and so on. If you have made the necessary changes, move on to the next section.

## Restore

To restore a dump of the database, first start up the shipper-docker instance and make sure the PostgreSQL database is running. Make sure you are in the directory with the `dump.sql` file. Execute:

```
# Copy the dump file to the volume by spinning up a temporary Docker image (seriously Docker team why the hell do we have to do this?!)
docker run --rm -v shipper_postgres_data:/target -v $(pwd):/source alpine cp /source/dump.sql /target

# Connect to the current database instance inside the Docker Compose file
docker-compose exec db bash

# Import
psql -U pdbuser -d shipper < /var/lib/postgresql/data/dump.sql

# Delete the dump file
rm /var/lib/postgresql/data/dump.sql
```

Make sure to substitute `shipper_postgres_data`, `pdbuser`, and `shipper` if you have customized those in the Docker Compose file or in the environment files.
