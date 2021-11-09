#!/usr/bin/env bash

HELPERS=(
  colors animation banner package config switchcase
  binary stat signal screen cursor finish
)

for HELPER in ${HELPERS[@]}; do
  source $(pwd)/helper/${HELPER}.sh
done

function main() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  clear
  banner

  packages
  switchCase "Install" "Packages" installPackages

  configuration

  binaryFile

  mainAlert

}

screenSize main