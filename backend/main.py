from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Welcome to Fixora API"}

@app.get("/health")
def health():
    return {"status": "ok"}