from typing import Annotated
from fastapi import FastAPI, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

from app.deps import get_db
from app.models import User

app = FastAPI()

@app.get("/")
async def root():
    return { "status": "ok" }

@app.post("/users")
async def create_user(
    name: str,
    db: Annotated[AsyncSession, Depends(get_db)],
):
    user = User(name=name)
    db.add(user)
    await db.commit()
    await db.refresh(user)
    return user

@app.get("/users")
async def list_users(
    db: Annotated[AsyncSession, Depends(get_db)],
):
    result = await db.execute(select(User))
    return result.scalars().all()

