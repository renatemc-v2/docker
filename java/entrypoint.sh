#!/bin/bash
cd /home/container || exit 1

# Configure colors
PURPLE='\033[38;5;129m'
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
                        ================
                    ========================
                 -======+              +=======
               ======                      ======
             -====                            =====
            ====                                ====
           ====  ============      ============= ====
          ====    ============   =============    +===
         ====      =====   ==========   =====      +===
        ====         ====   =======    =====        ====
        ===           =====   =====  =====           ===
       ====            =====   +=========            ====
       ===+                     +======+             ====
       ===+                     +======+             +===
       ====            =====   ==========            ====
        ===           ====+   ====+   ====           ===
        ===+        +====   =======    =====        *===
         ===       =====   ====+=====   +====       ===
         +===     ============   +============+    ===+
          +===   ===========+      +===========+  ====
           +===+                                +====
            +++=+                              +=+=+
              +++++                          +++++
                ++++++                    ++++++
                  +++++++++          +++++++++
                     ++++++++++++++++++++++
                           ++++++++++
EOF
echo -e "========================================================================================================"
echo -e "Welcome to ${PURPLE}Expanse! Need help? Reach us on Discord: discord.gg/expanse ${RESET_COLOR}"
echo -e "========================================================================================================"
echo -e "${GREEN} booting up your server"
eval "${MODIFIED_STARTUP}"
echo -e "${RED}Your server is now off${RESET_COLOR}"
