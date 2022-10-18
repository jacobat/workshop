# Laptop Setup - Eventide Workshop

## Software Prerequisites

- Ruby (minimum version: 2.4)
- Postgres (minimum version: 9.5)
- Git (minimum version: 2)

## Setup

### Start Postgres

If you've installed Postgres through Homebrew on Mac:

```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

If you don't want to start it as a daemon, open a new terminal window and run:

```
postgres -D /usr/local/var/postgres
```

Note that closing the terminal window will cause the database to shut down. If you've started the database with `Postgres -D`, keep the terminal window open for as long as you need to use the database.

On nix:

```
sudo systemctl start postgresql
```

#### Note for Linux Users

Postgres installations on Linux can vary between OS distributions as well as the package manager used.

When Postgres is installed on a Linux machine, it is often configured by default for security considerations that reflect server operations. Make sure that you are aware of the runtime requirements of Postgres on your environment if you are running Linux.

In particular, many Postgres setups on Linux require passwords for all database connections over TCP. This will either need to be disabled, or passwords will have to be configured for the role used during the workshop exercises.

#### Warning About Docker and Kubernetes

Running Postgres in Docker or Kubernetes can be problematic for the kinds of workflows used in the workshop.

The database used in the workshop will be dropped and recreated frequently. Running Postgres on a remote system, like a container, will require explicit configuration of security and access control for the database every time the database is dropped and re-created. This will inevitability cause a student to fall behind unless they have significant fluency with the technologies in-use.

If you choose to run Postgres in a container, you should already be at a level of significant fluency with both the container technology and with Postgres. If you're not fluent in these technologies, it's recommended that you install Postgres directly in the host system.

For Mac users, using Homebrew to install Postgres is recommended. For Linux users, the usual package manager for the platform should be used.

### Clone this Repository

This is the repository that we'll be working with through the course the workshop.

Clone the workshop repository to your machine:

```
git clone git@github.com:eventide-tutorial/workshop.git
```

Or, if you prefer to retrieve the repository over HTTPS rather than SSH:

```
git clone https://github.com/eventide-tutorial/workshop.git
```

### Change Directory to the Workshop Directory

```
cd workshop
```

## Test the Setup

### Change Directory to the Setup Verification Directory

```
cd verify_setup
```

### Install the Gems

```
./install-gems.sh
```

### Create the Database

A database named `message_store` along with a user of the same name will be created.

Run:

```
bundle exec mdb-recreate-db
```

### Copy the Database Settings Example File

```
cp settings/message_store_postgres.json.example settings/message_store_postgres.json
```

### Set the Database Password (Optional)

If your database installation requires a password (see _Note for Linux Users_ above), edit `settings/message_store_postgres.json` and change the password value to the database's password.

### Run the Test

```
./test.sh
```

If everything is working correctly, you should see the following output:

```
Running /Users/sbellware/projects/eventide/tutorial/account-component-skeleton/test/automated/database_connection.rb
Database Connection
  Connects on first use

```

### Get the Example Project Code

```
cd ..
./get-account-code.sh
```
