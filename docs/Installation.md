# Installation

To install shipper using Docker, first clone this entire repository:

```
git clone --depth=1 https://github.com/shipperstack/shipper-docker
cd shipper-docker
```

Make sure you have configured shipper to your liking by using [the configuration documentation available here](Configuration.md).

Copy any SSH keys you need to mirror builds to in the `ssh/` directory. (If you don't know what this means, you can make an empty directory and safely skip copying any files into it for now.)

Fetch command shortcuts from the activate file:

```
source activate
```

You can run `helpme` if you want to see all the available shortcut commands.

Run:

```
setlatest
dcup
```

to start your shipper-docker instance.

We're not done yet; the database hasn't been initialized yet and the static files need to be collected. Fortunately, a script will do this for us. Run:

```
./django-update.sh
```

And it should automatically apply any unapplied migrations, generate translation files and collect static files for you.

Before you can start configuring and using shipper, you need an administrator account to make any changes in the admin page. Run:

```
dcx web python3 manage.py createsuperuser
```

Done! You should now have an instance of shipper running in Docker. Make any changes to your web server (nginx, Apache, etc.) to reverse-proxy to your shipper instance.