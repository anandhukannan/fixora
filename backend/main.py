from fastapi import FastAPI
from db import get_connection

app = FastAPI()

from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def home():
    return {"message": "Welcome to Fixora API"}

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/services")
def get_services():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, name, description FROM services")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return rows

@app.get("/workers")
def get_workers(service: str):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
        SELECT u.id, u.name, wp.city, wp.experience_years, ws.price
        FROM users u
        JOIN worker_profiles wp ON wp.user_id = u.id
        JOIN worker_services ws ON ws.worker_id = u.id
        JOIN services s ON s.id = ws.service_id
        WHERE s.name = %s AND u.is_active = TRUE
    """
    cursor.execute(query, (service,))
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return rows