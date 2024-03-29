#!/bin/bash
set -e

if [[ "$1" = "serve" ]]; then
    curl -o model-store/qna2.mar "${URL_QNA2}"
    shift 1
    torchserve --start --model-store model-store
else
    eval "$@"
fi

# prevent docker exit
tail -f /dev/null
