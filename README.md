# Airkemist Docker

This is a repository that contains a docker-compose.yml file. It allows to set up  all the Airkemist servers in specific containers.

## Prerequisites

You need to install these 2 components:
* [Docker](https://docs.docker.com/compose/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Start up Airkemist

You can execute Airkemist without hassle by following  these few steps.

### 1/ Fork the Airkemist repository in Github

### 2/ Clone your fork

Clone your fork of airkemist at the root of "airkemist-docker" projet.

```sh
$ git clone git@github.com:<YOUR_USERNAME>/airkemist.git
```

### 3/ Create the "system folder"

Create a "system" empty directory or import existing one at the root of "airkemist-docker" project.

```sh
$ mkdir system
```

### 4/ Up the Docker configuration

```sh
$ docker-compose up -d
```

### 5/ Copy your dump database

```sh
cp airkemist.dump postgres/dumps
```

### 6/ Initialize Airkemist application

```
$ sh init.sh
```

### 7/ Edit your /etc/hosts files

```sh
127.0.0.1 www.pharmacievoisin.local
127.0.0.1 admin.airkemit.local
```

### 8/ Open the application in your browsers

* Type `www.pharmacievoisin.local` to render the frontend.
* Type `admin.airkemist.local` to render the backend. (See below for password)

Note: It could take some time before Puma starts. Meanwhile you will get a Nginx error. Refresh the page until it will be rendered. 
To get some log about this, type `docker-compose up` instead of `docker-compose up -d`

## Workflow for a daily work.

### 1/ Get the last version of Airkemist

"upstream" is the original repository. The one from which you forked.

```sh
$ git checkout master
$ git fetch upstream
$ git merge upstream/master
$ git checkout <YOUR_CURRENT_BRANCH>
$ git merge master
```

**IMPORTANT: Dont't work on the master branch. Never.**

### 2/ Start Airkemist containers

```sh
$ docker-compose up -d
```

### 3/ Execute the load.sh script

```sh
$ sh load.sh
```


## Extra

### Password for backend

* email: `e.pharmacie.voisin@gmail.com`
* password: `D9KDYBeZue8i`
