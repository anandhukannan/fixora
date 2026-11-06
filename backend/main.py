from fastapi import FastAPI
from db import get_connection

app = FastAPI()

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