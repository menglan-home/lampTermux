#!/usr/bin/env bash

BINARYS=(
  lamp lamp-check
)

function binaryFile() {

  stat "RUN" "Warning" "Copying binary file for shortcut lampTermux"

  for BINARY in ${BINARYS[@]}; do
    cp $(pwd)/binary/${BINARY} ${PREFIX}/bin
    if [ -f ${PREFIX}/bin/${BINARY} ]; then
      stat "CHECKING" "Success" "Copying binary file ${BINARY} success"
    else
      stat "CHECKING" "Danger" "Copying binary file ${BINARY} failed"
    fi
  done

}