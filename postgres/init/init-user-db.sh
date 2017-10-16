#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER airkemist  ENCRYPTED PASSWORD 'airkemist' SUPERUSER;
    CREATE DATABASE airkemist_development;
    CREATE DATABASE airkemist_test;
    GRANT ALL PRIVILEGES ON DATABASE airkemist_development TO airkemist;
    GRANT ALL PRIVILEGES ON DATABASE airkemist_test TO airkemist;
    ALTER DATABASE airkemist_development OWNER TO airkemist;
    ALTER DATABASE airkemist_test OWNER TO airkemist;
    CREATE EXTENSION unaccent;
EOSQL
