# Configuration

## Set up configuration files

The configuration keys and values can be found in the files `example.env` and `example.env.db`. To use them, first copy them:

- `example.env` -> `.env`
- `example.env.db` -> `.env.db`

Then edit the files and adjust the values as necessary. More information is available in the files and in the [shipper wiki, available here.][shipper-wiki-configuration]

**Note**: If you're setting up configuration files for the development environment, copy the above files into the `dev/` directory and make changes in there.

[shipper-wiki-configuration]: https://github.com/shipperstack/shipper/blob/master/docs/sysadmin/Configuration.md

## Create a password for Flower

Flower is a monitoring tool for Celery workers. It is important that you create an access control password to prevent unauthorized access to the Flower instance.

Run the following within the `nginx/` configuration directory:

```
htpasswd -c .htpasswd admin # or any username you prefer
```

Once you're done configuring shipper, [move to the Installation section](Installation.md).
