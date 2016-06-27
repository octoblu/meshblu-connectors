#!/bin/bash

usage(){
  echo "USAGE: mac-uninstall-script <connector-uuid>"
  echo ""
  echo "  -h, --help      print this help text"
  echo "<connector-uuid> can be also set by using env CONNECTOR_UUID"
}

panic() {
  local message="$1"
  echo "Error: $message"
  exit 1
}

clean_up() {
  local uuid="$1"
  local connector_path="$HOME/.octoblu/MeshbluConnectors/$uuid"
  rm -rf "$connector_path"
}

get_launch_file() {
  local uuid="$1"
  echo "${HOME}/Library/LaunchAgents/com.octoblu.${uuid}.plist"
}

unload_service() {
  local uuid="$1"
  local launch_agent="$(get_launch_file "$uuid")"
  launchctl unload "$launch_agent"
}

remove_service_file() {
  local uuid="$1"
  local launch_agent="$(get_launch_file "$uuid")"
  rm "$launch_agent"
}

main() {
  local uuid="$1"
  if [ "$uuid" == "--help" -o "$uuid" == "-h" ]; then
    usage
    exit 0
  fi

  if [ -z "$uuid" ]; then
    uuid="$CONNECTOR_UUID"
  fi

  if [ -z "$uuid" ]; then
    usage
    echo "Missing <connector-uuid>"
    exit 1
  fi

  unload_service "$uuid" || panic "unable to unload service"
  remove_service_file "$uuid" || panic "unable to remove service file"
  clean_up "$uuid" || panic "unable to clean up connector"
}

main "$@"
