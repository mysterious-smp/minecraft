# api/minecraft_server.py

import os
import subprocess
import json
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Minecraft Server API"}

@app.post("/start")
def start_server(version: str, server_type: str):
    if server_type not in ["paper", "spigot", "vanilla"]:
        raise HTTPException(status_code=400, detail="Invalid server type")

    # Command to start the Minecraft server, customize as needed
    server_start_command = f"start_minecraft_server.sh {version} {server_type}"

    try:
        subprocess.run(server_start_command, check=True, shell=True)
        return {"status": "Server started successfully"}
    except subprocess.CalledProcessError as e:
        raise HTTPException(status_code=500, detail=str(e))

