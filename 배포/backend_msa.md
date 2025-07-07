### File Structure

```
/homepage_init_be_msa
ㄴ/homepage_init_backend (cloned from github)
ㄴ/homepage_init_bot (this repo, also cloned from github)
ㄴ.env
ㄴdocker-compose.yml
```

### `docker-compose.yml` contents

the compose files from each of the repos are combined in the root directory of the MSA

```yaml
services:
  backend:
    build: ./homepage_init_backend
    ports:
      - "8080:8080"
    networks:
      - app-net
    env_file:
      - ./homepage_init_backend/.env
    volumes:
      - ./homepage_init_backend:/app/
    depends_on:
      - rabbitmq
    entrypoint: bash
    command: >
      -c '
      echo "Checking DB at /app/${SQLITE_FILENAME}";

      if [ ! -f "/app/${SQLITE_FILENAME}" ]; then
        echo "Database was not found. Initializing...";
        mkdir -p /app/db
        chmod +x ./script/*.sh &&
        ./script/init_db.sh "/app/${SQLITE_FILENAME}" &&
        ./script/insert_scsc_global_status.sh "/app/${SQLITE_FILENAME}" &&
        ./script/insert_user_roles.sh "/app/${SQLITE_FILENAME}" &&
        ./script/insert_majors.sh "/app/${SQLITE_FILENAME}" ./docs/majors.csv &&
        ./script/insert_boards.sh "/app/${SQLITE_FILENAME}" &&
        ./script/insert_sample_users.sh "/app/${SQLITE_FILENAME}" &&
        ./script/insert_sample_articles.sh "/app/${SQLITE_FILENAME}";
      else
        echo "Database already exists. Skipping initialization.";
      fi;

      exec fastapi run main.py --host 0.0.0.0 --port 8080
      '
  rabbitmq:
    image: rabbitmq:3-management
    ports:
      - "15672:15672"
      - "5672:5672"
    networks:
      - app-net
    environment:
      - RABBITMQ_DEFAULT_USER=guest
      - RABBITMQ_DEFAULT_PASS=guest
    healthcheck:
      test: ["CMD", "rabbitmq-diagnostics", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5
  bot:
    build: ./homepage_init_bot
    ports:
      - "8081:8081"
    networks:
      - app-net
    env_file:
      - ./homepage_init_bot/.env
    volumes:
      - ./homepage_init_bot:/app/
    depends_on:
      rabbitmq:
        condition: service_healthy
  redis:
    image: redis:7
    ports:
      - "6379:6379"
    networks:
      - app-net
networks:
  app-net:

```

### `.env` contents

#### `./.env`
Required when executing `docker-compose.yml` at root. The file location is relative to `./homepage_init_backend/`, i.e. it must be the same variable declared as below in `./homepage_init_backend/.env`.

```
SQLITE_FILENAME="db/YOUR_DB_FILENAME.db"
```

#### `./homepage_init_backend/.env`

```
API_SECRET="some-secret-code"
JWT_SECRET="some-session-secret"
JWT_VALID_SECONDS=3600
SQLITE_FILENAME="db/YOUR_DB_FILENAME.db"
IMAGE_DIR="static/image/photo/"
IMAGE_MAX_SIZE=10000000
FILE_DIR="download/"
FILE_MAX_SIZE=10000000
ARTICLE_DIR="static/article/"
USER_CHECK=FALSE
ENROLLMENT_FEE=300000
CORS_ALL_ACCEPT=FALSE
RABBITMQ_HOST="rabbitmq"
REPLY_QUEUE="main_response_queue"
DISCORD_RECEIVE_QUEUE="discord_bot_queue"
```

#### `./homepage_init_bot/.env`

```
RABBITMQ_HOST="rabbitmq"
MAIN_BACKEND_HOST="backend"
DISCORD_RECEIVE_QUEUE="discord_bot_queue"
TOKEN="your-discord-bot-token"
COMMAND_PREFIX="!"
API_SECRET="some-secret-code"
```

### Running

In the root directory,

```bash
docker-compose up --build
```
