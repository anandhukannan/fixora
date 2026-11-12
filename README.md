# Fixora

A web application for booking local home-service workers (plumbing, electrical, cleaning, carpentry and more). It is aimed at people who are new to a city and don't know reliable workers, but anyone can use it.

> **Status: work in progress.** This is a learning project that I'm building step by step. The service browsing and worker listing are working; accounts and bookings are in progress.

## What works now

- Browse available services (loaded from the database through the API)
- Click a service to see the workers who offer it, with city, experience, and price
- REST API built with FastAPI, backed by a MySQL database

## What I'm building next

- [ ] Signup and login (password hashing, token-based authentication)
- [ ] Worker registration and profiles
- [ ] Booking a worker for a date and time, with status updates
- [ ] Reviews after completed jobs
- [ ] Admin controls

## Tech stack

| Layer | Technology |
|---|---|
| Frontend | HTML, CSS, JavaScript |
| Backend | Python, FastAPI |
| Database | MySQL |
| Tools | Git, GitHub, VS Code, Postman, PopSQL |

## How it works

```
Browser (HTML/CSS/JS)  ->  FastAPI backend  ->  MySQL database
```

The pages use JavaScript `fetch()` to call the API. The API runs parameterized SQL queries against MySQL and returns JSON.

## Database

Seven tables: `users`, `services`, `worker_profiles`, `worker_services` (many-to-many link between workers and services), `availability`, `bookings`, `reviews`. The structure is in `database/schema.sql` and the sample data is in `database/seed.sql`.

## API endpoints (so far)

| Method | Endpoint | Description |
|---|---|---|
| GET | `/` | Welcome message |
| GET | `/health` | Health check |
| GET | `/services` | List all services |
| GET | `/workers?service=Plumbing` | List workers offering a service |

Interactive docs are available at `/docs` when the server is running.

## Project structure

```
fixora/
├── frontend/    HTML, CSS, JavaScript
├── backend/     FastAPI app (main.py, db.py)
├── database/    schema.sql, seed.sql
└── README.md
```

## Running it locally

1. **Database:** install MySQL, then run `database/schema.sql` followed by `database/seed.sql`.
2. **Backend:**
   ```bash
   cd backend
   python -m venv venv
   venv\Scripts\activate        # Windows
   pip install -r requirements.txt
   ```
   Create a `.env` file in `backend/`:
   ```
   DB_HOST=localhost
   DB_USER=your_mysql_user
   DB_PASSWORD=your_mysql_password
   DB_NAME=fixora
   ```
   Start the server:
   ```bash
   uvicorn main:app --reload
   ```
3. **Frontend:** open `frontend/services.html` with a local server (for example, the VS Code Live Server extension).

## What I'm learning from this project

Relational database design (keys, relationships, JOINs), building REST APIs, connecting a frontend to a backend, avoiding SQL injection with parameterized queries, and using Git from the start of a project.