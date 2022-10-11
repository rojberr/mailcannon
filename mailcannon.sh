#!/bin/bash

set -e

bold_echo() {
    echo -e "\e[1m$@\e[0m"
}

export NUMBER_OF_CONTAINERS=1

if (($# == 0)); then
  echo "See usage with: ./$(basename "$0") --help"
  exit 0
fi

while (($# > 0)); do
  case "${1}" in
  stop)
    docker-compose down
    bold_echo "Containers stopped"
    exit 0
    ;;
  --containers)
    shift
    if ((${1} > 0)); then
      export NUMBER_OF_CONTAINERS=${1}
      docker-compose up -d
      bold_echo "Containers started"
    else
      echo "Containers # must be > 0"
      exit 0
    fi
    ;;
  --help)
    echo "Usage: $(basename "$0") [ --containers # | stop ]"
    echo "  --containers #      start # containers to ramp up the SMTP load"
    echo "  stop                stops all running mailcannon containers"
    exit 0
    ;;
  *)
    echo "Unknown parameter passed: ${1}, ignoring. See usage with: ./$(basename "$0") --help" >&2
    ;;
  esac
  shift
done