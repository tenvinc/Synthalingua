#!/bin/bash

set -e

script_dir="$(dirname "$(realpath "$0")")"

docker buildx build \
    -t synthalingua \
    -f ${script_dir}/Dockerfile \
    --build-context dockerfiles=${script_dir} \
    ${script_dir}/..