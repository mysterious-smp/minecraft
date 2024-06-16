#!/bin/bash

VERSION=$1
SERVER_TYPE=$2
SERVER_DIR="/"

mkdir -p $SERVER_DIR
cd $SERVER_DIR

# Download the server jar based on the type and version
if [ "$SERVER_TYPE" == "paper" ]; then
    wget -O server.jar "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/latest/downloads/paper-$VERSION-latest.jar"
elif [ "$SERVER_TYPE" == "spigot" ]; then
    wget -O server.jar "https://download.getbukkit.org/spigot/spigot-$VERSION.jar"
elif [ "$SERVER_TYPE" == "vanilla" ]; then
    wget -O server.jar "https://launcher.mojang.com/v1/objects/<hash>/server.jar"
else
    echo "Invalid server type"
    exit 1
fi

# Start the Minecraft server
java -Xmx1024M -Xms10240M -jar server.jar nogui
