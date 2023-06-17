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
install commandbox-migrations
migrate install
```

Database Connection details if you need them are in `.cfmigrations.json`


You can then type:

```
box server start
```

And run the application.


By default the application is secured but there are no users. You can create user in the database directly to get you started. For example for a user with the password of `Password123!`:

```
INSERT INTO `tblusers`
(`username`, `email`, `firstname`, `lastname`, `password`, `active`)
VALUES
('newuser', 'new@user.com', 'New', 'User', '$2a$12$Lsdc4.gK3xPpbcN01rOW4.R18EQXqhNKb/EstymUbPH6tNWD9SxCm', 1);
```

Formatting

Code should be formatted using the rules in `.cfformat.json`. These rules match the ColdBox framework standards.

You can format code on-demand by running

```
cfformat watch
```