#!/usr/bin/env bash
# 2021-10-12: OW
# Originally from: https://github.com/nickjer/singularity-rstudio

PROGRAM=$(basename $0)

#exec >$PROGRAM.debug
#exec 2>&1
#set -x

# Confirm username is supplied
if [[ $# -le 1 ]]; then
  echo "Usage: auth USERNAME"
  exit 1
fi

USERNAME="${1}"

# Confirm password environment variable exists
if [[ -z "${RSTUDIO_PASSWORD}" ]]; then
  echo "The environment variable RSTUDIO_PASSWORD is not set"
  exit 1
fi

# Read in the password from user
read -s -p "Password: " PASSWORD
echo ""

# Authenticate user
if [[ "${USER}" == "${USERNAME}" && "${PASSWORD}" == "${RSTUDIO_PASSWORD}" ]]; then
  echo "Successful authentication"
  exit 0
else
  echo "Invalid authentication"
  exit 1
fi
