# Migration

If you are migrating from a previous shipper installation on ericswpark/shipper, you may have to go through a couple of steps before your existing data is compatible with this repository.

## Rename the volumes

The previous repository did not have named volumes, so Docker Compose would automatically prepend the folder name when creating the volumes. This has now been fixed, but this problem does mean that you will have to **rename** those previously created volumes if you want to seamlessly migrate without a fresh start.

For example, if your folder structure went something like this:

```
shipper_project/
    docker-compose.yml
```

Then the created volumes would have names like `shipper_project_media_volume`.

Unfortunately, Docker does not give us a convenient command or way to rename volumes, which means we will have to create a new volume with the desired name, create a temporary container that mounts both volumes and copies the data across, and delete the old volume when all's said and done. This is needlessly convoluted (seriously, Docker team, what were you guys thinking?!) Here are the steps:

```
docker volume create --name shipper_media_volume
docker run --rm -it -v shipper_project_media_volume:/from -v shipper_media_volume:/to alpine ash -c "cd /from ; cp -av . /to"
docker volume rm shipper_project_media_volume
```

Rinse and repeat for the `postgres` and `static` volumes as well, making sure to replace the volume names as necessary.


## Upgrade the database

The `docker-compose.yml` file lists PostgreSQL 13.6 as the database version as of right now. While this is the same major release as the version that was previously on the ericswpark/shipper repository, future updates to this file may go up to PostgreSQL 14, necessitating a migration with the `pg_upgrade` tool.

I've checked out a number of ways of automating this process and making it seamless for the sysadmins. Unfortunately, database systems are usually very picky about how they are treated and what sort of data lives on them and that makes an automated upgrade unfeasible and/or extremely dangerous, with possibilities of data loss. So I've opted not to go for this method.

Instead, you can go about this in one of the two ways listed below:

1. Manually dump the database on PostgreSQL's Docker image and restore with an updated PostgreSQL image
2. Use the backup/restore feature of Django

Option 2 is not implemented as of right now, so you will have to use option 1. In the future, option 2 will be provided as well when django-dbbackup releases a stable version. (That is probably when I'll update the Docker Compose file to use PostgreSQL 14.)

To perform option 1, [follow the dump and restore portions in the Database Operations documentation page.](Database-Operations.md)