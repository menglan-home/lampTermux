#!/usr/bin/env bash

APACHE_CONFIGURATION_PATH="${PREFIX}/etc/apache2"
APACHE_CONFIGURATION_FILE_NAME="httpd.conf"
LAMPTERMUX_CONFIGURATION_PATH="${HOME}/.config/lampTermux"
BACKUP_CONFIGURATION_FILE_NAME="httpd.conf.default"

CUSTOM_HTDOCS_PATH="${HOME}/lampTermux-htdocs"

function configuration() {

  stat "RUN" "Warning" "Backup default configuration apache"

  if [ -d ${LAMPTERMUX_CONFIGURATION_PATH} ]; then
    cp ${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURATION_FILE_NAME} ${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}
    if [ -f ${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME} ]; then
      stat "CHECKING" "Success" "Backup success to '${COLOR_WARNING}${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}${COLOR_BASED}'"
    else
      stat "CHECKING" "Danger" "Backup failed to '${COLOR_WARNING}${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}${COLOR_BASED}'"
    fi
  else
    mkdir -p ${LAMPTERMUX_CONFIGURATION_PATH}
    cp ${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURATION_FILE_NAME} ${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}
    if [ -f ${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME} ]; then
      stat "CHECKING" "Success" "Backup success to '${COLOR_WARNING}${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}${COLOR_BASED}'"
    else
      stat "CHECKING" "Danger" "Backup failed to '${COLOR_WARNING}${LAMPTERMUX_CONFIGURATION_PATH}/${BACKUP_CONFIGURATION_FILE_NAME}${COLOR_BASED}'"
    fi
  fi

  stat "RUN" "Warning" "Copy lampTermux apache configuration"

  cp $(pwd)/httpd.conf ${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURATION_FILE_NAME}
  
  if [ -f ${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURATION_FILE_NAME} ]; then
    stat "CHECKING" "Success" "Copying success to '${COLOR_WARNING}${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURTAION_FILE_NAME}${COLOR_BASED}'"
  else
    stat "CHECKING" "Danger" "Copying failed to '${COLOR_WARNING}${APACHE_CONFIGURATION_PATH}/${APACHE_CONFIGURTAION_FILE_NAME}${COLOR_BASED}'"
  fi

  stat "RUN" "Warning" "Creating custom htdocs directory"

  if [ -d ${CUSTOM_HTDOCS_PATH} ]; then
    stat "CHECKING" "Success" "Creating custom htdocs success"
    stat "RUN" "Warning" "Creating file index.php for phpinfo();"
    phpInfo
  else
    mkdir ${CUSTOM_HTDOCS_PATH}
    stat "CHECKING" "Success" "Creating custom htdocs success"
    stat "RUN" "Warning" "Creating file index.php for phpinfo();"
    phpInfo
  fi

}

function phpInfo() {
  echo "<?php phpinfo(); ?>" >> ${CUSTOM_HTDOCS_PATH}/index.php
  if [ -f ${CUSTOM_HTDOCS_PATH}/index.php ]; then
    stat "CHECKING" "Success" "Creating file index.php success"
  else
    stat "CHECKING" "Danger" "Creating file index.php failed"
  fi
}