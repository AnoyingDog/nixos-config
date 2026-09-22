#!/usr/bin/env bash
if ! systemctl --user is-active --quiet gsr-replay; then
  notify-send "gsr-replay not running" "Starting the service..."\
  --urgency critical --app-name "gpu-screen-recorder.sh "
  systemctl start --user gsr-replay --now
  exit 1
fi
pkill --signal SIGUSR1 -x gpu-screen-reco
notify-send "Clip saved" "Last 60s written to ~/Videos/Clips"
