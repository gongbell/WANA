#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BROWN='\033[0;33m'
NC='\033[0m'

CDT_CONTAINER=${CDT_CONTAINER:-"eoscanada/eosio-cdt"}
CDT_VERSION=${CDT_VERSION:-"v1.6.1"}

image_id="${CDT_CONTAINER}:${CDT_VERSION}"

set +e
images=`docker images | grep -E "${CDT_CONTAINER}\s+${CDT_VERSION}"`
exit_code=$?
if [[ $exit_code != 0 ]]; then
    echo "Docker image [${image_id}] does not exist yet, pulling it..."
    docker pull ${image_id}
fi
set -e

if [[ $1 == "clean" ]]; then
    $ROOT/clean.sh
    echo ""
fi

printf "${BROWN}Starting container and compiling${NC}\n"
docker run --rm -it -v "$ROOT:/contract" -w /contract "${image_id}" ./compile.sh
