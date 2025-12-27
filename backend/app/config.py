import os

class Settings:
    DATABASE_URL = os.getenv("DATABASE_URL", "postgres://localhost")

settings = Settings()
