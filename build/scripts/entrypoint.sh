#! /bin/bash

(cd "${WORK_DIR}" || exit
  [ "$ENABLE_PATCHES" = "true" ] && "${BIN_DIR}"/apply-patches.sh

  ln -s "${AUTO_CONFIG_DIR}" "${CONFIG_DIR}"

  su "${USER}" -c "${BIN_DIR}"/entrypoint_unprivileged.sh
  su "${USER}" -c "$@"
)