# File should only be sourced (thanks https://stackoverflow.com/a/28776166)
sourced=0
if [ -n "$ZSH_VERSION" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) sourced=1;; esac
elif [ -n "$KSH_VERSION" ]; then
  [ "$(cd -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")" != "$(cd -- "$(dirname -- "${.sh.file}")" && pwd -P)/$(basename -- "${.sh.file}")" ] && sourced=1
elif [ -n "$BASH_VERSION" ]; then
  (return 0 2>/dev/null) && sourced=1
else # All other shells: examine $0 for known shell binary filenames.
     # Detects `sh` and `dash`; add additional shell filenames as needed.
  case ${0##*/} in sh|-sh|dash|-dash) sourced=1;; esac
fi

if [[ $sourced = 0 ]]; then
  echo "File should not be run directly, it should only be sourced.";
  exit 1;
fi

# Verify .env file exists
if [ ! -f .env ]; then
  echo "Please create the .env file with all necessary variables before running script";
  exit 1;
fi

# Reset all variables
unset DEV_DOCKER_CONTAINER_NAME
unset DEV_DB_PORT
unset DEV_POSTGRES_USER
unset DEV_POSTGRES_PASSWORD
unset DEV_APP_DB_USER
unset DEV_APP_DB_PASS
unset DEV_APP_DB_NAME

# Export env vars
export $(grep -v '^#' .env | xargs)

# Verify env vars
if [ -z ${DEV_DOCKER_CONTAINER_NAME} ] || [ -v "$DEV_DOCKER_CONTAINER_NAME" ]; then
  echo "Please set \$DEV_DOCKER_CONTAINER_NAME in the .env file";
  exit 1;
fi

if [ -z ${DEV_DB_PORT} ] || [ -v "$DEV_DB_PORT" ]; then
  echo "Please set \$DEV_DB_PORT in the .env file";
  exit 1;
fi

if [ -z ${DEV_POSTGRES_USER} ] || [ -v "$DEV_POSTGRES_USER" ]; then
  echo "Please set \DEV_POSTGRES_USER in the .env file";
  exit 1;
fi

if [ -z ${DEV_POSTGRES_PASSWORD} ] || [ -v "$DEV_POSTGRES_PASSWORD" ]; then
  echo "Please set \$DEV_POSTGRES_PASSWORD in the .env file";
  exit 1;
fi

if [ -z ${DEV_APP_DB_USER} ] || [ -v "$DEV_APP_DB_USER" ]; then
  echo "Please set \$DEV_APP_DB_USER in the .env file";
  exit 1;
fi

if [ -z ${DEV_APP_DB_PASS} ] || [ -v "$DEV_APP_DB_PASS" ]; then
  echo "Please set \$DEV_APP_DB_PASS in the .env file";
  exit 1;
fi

if [ -z ${DEV_APP_DB_NAME} ] || [ -v "$DEV_APP_DB_NAME" ]; then
  echo "Please set \$DEV_APP_DB_NAME in the .env file";
  exit 1;
fi

if ! [[ $DEV_DB_PORT =~ ^[0-9]+$ ]]; then
  echo "Please set \$DEV_DB_PORT to a NUMERIC value only, not '$DEV_DB_PORT'";
  exit 1;
fi
