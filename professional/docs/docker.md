# Docker Operations

Compose groups used in the lab have included:
- `management.yml`
- `media.yml`
- `cloud.yml`
- `downloads.yml`
- `proxy.yml`

## Core commands
```bash
docker ps
docker ps -a
docker volume ls
docker network ls
docker system df
docker compose config
docker compose up -d
docker compose ps
docker compose logs
```

For a failure:
```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker stats --no-stream
```

Never commit passwords, tokens, private keys or `.env` files.
