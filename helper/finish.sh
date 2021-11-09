#!/usr/bin/env bash

MYTERMUX_VERSION="0.6.0"

function alertFinish() {

  echo -e "⚠️ Restart Termux so that the service-daemon is started."
  echo -e "⚠️ On first boot run 'lamp' to start service."
  echo -e "⚠️ To check status web server run 'lamp-check' 
    (require start service first).\n"

}

function alertNotification() {

  IMAGE_PATH="${HOME}/.config/mytermux/alert/images"
  IMAGE_FILE_NAME="finish.png"

  termux-notification --sound -t "myTermux v${MYTERMUX_VERSION} has been installed" --image-path ${IMAGE_PATH}/${IMAGE_FILE_NAME}

}

function alertTorch() {

  termux-toast -b "#A8D7FE" -c "#373E4D" -g middle "myTermux v${MYTERMUX_VERSION} has been installed"

}


function mainAlert() {

  alertFinish
  # alertNotification
  # alertTorch

}
