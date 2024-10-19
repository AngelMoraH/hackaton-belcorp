from fastapi import FastAPI
from utils.middlewares import setup_middlewares
from routers import bot

app = FastAPI()

setup_middlewares(app)

app.include_router(bot.router)
