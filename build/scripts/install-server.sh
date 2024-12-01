#! /bin/bash

(cd "${WORK_DIR}" || exit

  "${STEAM_DIR}"/steamcmd.sh \
    +force_install_dir "${WORK_DIR}/${SERVER_DIR}" \
    +login "anonymous" \
    +app_update "996560" -beta early-server-build \
    +quit

)
