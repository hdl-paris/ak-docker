## Process to start Airkemist

### Fork the Airkemist repository

### Clone your fork

Clone your fork of airkemist at the root of "airkemist-docker" projet.

```sh
$ git clone git@github.com:<YOUR_USERNAME>/airkemist.git
```

### Create the "system folder"

Create a "system" empty directory or import existing one at the root of "airkemist-docker" projet.

```sh
$ mkdir system
```

### Up the Docker configuration

```sh
$ docker-compose up -d
```

### 7/ Initialize the DB

```
$ docker-compose run ak_support sh init.sh
```

### Import the DB

```sh
$
```
