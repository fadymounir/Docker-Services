# Sentry Self-Hosted (Docker Setup)

This project contains a ready-to-use **Sentry self-hosted setup** using Docker & Docker Compose.

---


---

## 🚀 Setup Instructions

### 1. Create Global Network
This network allows Sentry to talk with Postgres & Redis (if external).

```bash
chmod +x global_network.sh
./global_network.sh


2. Prepare PostgreSQL

Connect to your Postgres instance (replace postgres_global with your container/service name):
docker exec -it postgres_global psql -U postgres

Inside psql:

-- Create user
CREATE USER sentry WITH PASSWORD 'sentry_password';
-- Create database
CREATE DATABASE sentry OWNER sentry;
-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE sentry TO sentry;


2.1 Configure Environment

Edit the sentry/.env file with your database, Redis, and email settings:



DB_HOST=postgres_global
DB_PORT=5432
DB_USER=sentry
DB_PASSWORD=sentry_password
DB_NAME=sentry

REDIS_HOST=redis_global
REDIS_PORT=6379
REDIS_PASSWORD=secretpass

SENTRY_SECRET_KEY=your-secret-key

3. Start Services

From the /sentry folder:

docker compose --env-file .env up -d --build


This will start:

sentry-web → Web UI on port 8001

sentry-cron → Cron jobs

sentry-worker → Background workers

4. Run Database Migrations

Run the upgrade once:

docker exec -it sentry-web sentry upgrade


Enter your admin email & password when prompted.

5. Access Sentry

Open http://localhost:8001
 in your browser.
Login with the credentials you created.

🔧 Useful Commands

Stop services

docker compose down


View logs

docker logs -f sentry-web
docker logs -f sentry-worker
docker logs -f sentry-cron


Restart services

docker compose restart


Rebuild services

docker compose up -d --build

📌 Notes

Ensure Postgres and Redis are running and accessible on the global_network.

Change SENTRY_SECRET_KEY in .env for production.

Default web port is 8001 (changeable in docker-compose.yml).

🎉 You now have a fully working Sentry self-hosted environment in Docker!


---

Do you want me to include **examples for external Postgres + Redis setup** in this README too, or just keep it focused on Sentry itself?
