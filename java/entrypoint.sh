#!/bin/bash
cd /home/container || exit 1

# Configure colors
GREEN='\033[38;5;46m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;201m'
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
cat << 'EOF'
.:::::::::-                                                                 .:::         ::::     ::::::::::   
:::     ::::                                           +::=                 .:::-       :::::   -::::    -:::: 
:::       ::-    ::::::     --: :::::        :::::   =:::::...    :::::     .:::::     ::::::  ::::         :::
:::       ::-  :::::.:::::  :::::-:::::-  ::::::::::  .::::... :::::.:::::  .:: :::-  ::: :::  :::             
::::::::::::  :::      -::  :::      ::-  ===     ::-  +::=   :::      :::: .::  -:::::-  :::  ::-             
.::::::::=    ::::::::::::- :::      ::.  -::::::::::  +::=   ::::::::::::: .::    :::    :::  :::             
::-    :::-   :::           :::      ::. -::      :::  +::=   :::           .::     -     :::  ::::         :::
:::     -:::  -::::   ::::  :::      ::. :::-   :::::   :::=+  :::-   ::::  .::           :::   ::::::+ =::::: 
::-       ::::  -:::::::    :::      :::   :::::::.::    ::::.   :::::::    .::           :::      :::::::::   
EOF
echo -e "========================================================================================================"
echo -e "${PURPLE}This is a RenateMC Infrastructure, if you have any issues please contact dchu096 ${RESET_COLOR}"
echo -e "========================================================================================================"
echo -e "${GREEN} booting up your server"
eval "${MODIFIED_STARTUP}"
echo -e "${RED}Your server is now off${RESET_COLOR}"
