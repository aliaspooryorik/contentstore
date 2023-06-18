## Quick Installation

install Dependancies (ColdBox etc)

```
box install
```

This will setup all the needed dependencies for each application template.

Next, edit the `.env` file to have the correct settings for your server. For example:

```
DB_DATABASE=your_contentstore
DB_SCHEMA=your_contentstore
```

Migrations are included for setting up tables etc if you don't have an existing database.

Migrations can be run using `migrate up` in CommandBox.

Note that if you haven't run migrations previously, you'll need to:

```
box install commandbox-migrations
box migrate install
box migrate up
box migrate seed run
```

Database Connection details if you need them are in `.cfmigrations.json`

You can then type:

```
box server start
```

And run the application.


If you used cfmigration to install the seed then you'll have a default user of `testuseraccount` / `Password123!`


## Lucee

Lucee admin is a `/lucee/admin/server.cfm`

## Formatting

Code should be formatted using the rules in `.cfformat.json`. These rules match the ColdBox framework standards.

You can format code on-demand by running

```
cfformat watch
```

## Tests

tests are included in the `/tests/` folder.

End to end tests require cbPlaywright to be set up with a target browser which you can install using:

```
box playwright install chromium
```

New tests can be created with the help of `box playwright codegen`
