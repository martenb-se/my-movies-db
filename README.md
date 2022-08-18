# Database - MyMovies Project
This is a simple project created for fun, it allows you to keep track of your favourite movies or tv-series.
It was created using [PostgresSQL](https://www.postgresql.org/), [Spring Boot](https://spring.io/projects/spring-boot) and [VueJS](https://vuejs.org/).

This is the **database** for the project. The main repository is:
[MyMovies Project](https://github.com/martenb-se/my-movies)

## Requirements
### Software
* **Docker Compose**, [Installation instructions](https://docs.docker.com/compose/install/).

## Install
### Clone
Clone the repository and enter it
```shell
git clone git@github.com:martenb-se/my-movies-db.git
cd my-movies-db
```

### Preparation
In order to run or test the *MyMovies Project **database***, the following must be performed.

#### Environment Settings
Create a *.env* (dotenv) file in the root directory and fill out the following variables:
```dotenv
DEV_DOCKER_CONTAINER_NAME=EDIT_ME

DEV_DB_PORT=EDIT_ME
DEV_POSTGRES_USER=EDIT_ME
DEV_POSTGRES_PASSWORD=EDIT_ME

DEV_APP_DB_USER=EDIT_ME
DEV_APP_DB_PASS=EDIT_ME
DEV_APP_DB_NAME=EDIT_ME
```

Where
* `DEV_DOCKER_CONTAINER_NAME` is the name of the docker container that will be created.
* `DEV_DB_PORT` is the port where the database will be exposed.
* `DEV_POSTGRES_USER` is the username for the database admin.
* `DEV_POSTGRES_PASSWORD` is the password for the database admin.
* `DEV_APP_DB_USER` is the username for the user in charge of the MyMovies application.
* `DEV_APP_DB_PASS` is the password for the user in charge of the MyMovies application.
* `DEV_APP_DB_NAME` is the database that will be used by the MyMovies application.

## Start
In order to load the environment, and to verify that health checks are good, run the Docker Compose Script
```shell
./run.sh
```

### Sample printout from running
```text
$ ./run.sh
[+] Running 2/2
 ⠿ Network dev-my-movies-network-database  Created        0.0s
 ⠿ Container dev-my-movies-db              Started        0.6s
Waiting for container health-check to finish..
Waiting for container health-check to finish..
Waiting for container health-check to finish..
Docker container dev-my-movies-db is now ready!
```

## Stop and Uninstall
In order to stop the container and clean everything up, run:
```shell
./clean.sh
```

## Run Tests
In order to test the database (when it's running), run the following:
```shell
./run.tests.pgtap.sh
```

### Sample printout from running tests
```text
$ ./run.tests.pgtap.sh
[+] Running 1/0
 ⠿ Container dev-my-movies-db        Running                                                                                                                                                            0.0s
Waiting for database...
2022/08/17 13:10:03 Waiting for: tcp://db:5432
2022/08/17 13:10:03 Connected to tcp://db:5432

Running tests: /test/*.sql
/test/my_movies-movies-add_complete_data.sql .................................. ok   
/test/my_movies-movies-add_use_defaults.sql ................................... ok   
/test/my_movies-movies-check_constraint_imdb_id_empty.sql ..................... ok   
/test/my_movies-movies-check_constraint_imdb_id_null.sql ...................... ok   
/test/my_movies-movies-check_constraint_imdb_id_too_long.sql .................. ok   
/test/my_movies-movies-check_constraint_imdbid_uniqie.sql ..................... ok   
/test/my_movies-movies-check_constraint_name_empty.sql ........................ ok   
/test/my_movies-movies-check_constraint_name_null.sql ......................... ok   
/test/my_movies-movies-check_constraint_name_too_long.sql ..................... ok   
/test/my_movies-movies-check_constraint_seen_false_rating_set.sql ............. ok   
/test/my_movies-movies-check_constraint_seen_null.sql ......................... ok   
/test/my_movies-movies-check_constraint_seen_true_rating_null.sql ............. ok   
/test/my_movies-movies-check_constraint_seen_true_rating_too_high.sql ......... ok   
/test/my_movies-movies-check_constraint_seen_true_rating_too_low.sql .......... ok   
/test/my_movies-movies-check_constraint_seen_unset_rating_set.sql ............. ok   
/test/my_movies-movies-constraints_not_null.sql ............................... ok   
/test/my_movies-movies-table_exists.sql ....................................... ok   
/test/my_movies-movies-update_check_constraint_seen_true_rating_too_high.sql .. ok   
/test/my_movies-movies-update_check_constraint_seen_true_rating_too_low.sql ... ok   
/test/my_movies-movies-update_check_constraint_seen_unset_rating_set.sql ...... ok   
All tests successful.
Files=20, Tests=25,  1 wallclock secs ( 0.06 usr  0.02 sys +  0.05 cusr  0.03 csys =  0.16 CPU)
Result: PASS
```
