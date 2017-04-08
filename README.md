# Challenge-48H
[![Build Status](https://travis-ci.org/Yuri-M-Dias/challenge-48h-backend.svg?branch=master)](https://travis-ci.org/Yuri-M-Dias/challenge-48h-backend)

This is a project for an interview.

## Running the project

If you have docker setup without a sudo password, you can use the provided script
to create two containers with all that you need already:
```bash
$ bash docker-run-redis-and-pg.sh
```

Then you need to create the user with appropriate roles. This script
will create the user with the default password and necessary roles, you
just need to input your `postgres` user password when requested:
```bash
$ bash init-user-db.sh
```
This project uses [Figaro]() to manage enviroment variables, so you need
to have an appropriate `application.yml` file:

```yaml
# config/application.yml

challenge_pg_user: "challenge48h"
challenge_pg_password: "challenge48h"
```

Then, to install dependencies and run the database:
```bash
$ bundle install
$ rake db:create
$ rake db:migrate
```

Finaly, just start the rails server and navigate to localhost:3000

```bash
$ rails s
```

## Project description

There are two clients: users and trainers.

Each of these has the ability to log into the website through authentication.

Once signed in, they can see in the front page and the button ‘chat' showing up.

Clicking on chat you see all the messages in which the logged client is involved.

Then, you can click over ‘New chat’ and you are given a form to send a new message.

In the form you have to select the receiver (either a user or a trainer).

Editing and deleting messages isn’t allowed.

You can create an admin user if you want to make these operations.
