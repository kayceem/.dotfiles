#!/usr/bin/env bash

pending_status="$(supergfxctl -P)"

if [[ "$pending_status" == "Unknown" ]]; then
  mode="$(supergfxctl -g)"
  state="$(supergfxctl -S)"
  echo "{\"text\":\"$mode\", \"tooltip\":\"$state\"}"
else
  echo "{\"text\":\"Pending: $pending_status\", \"tooltip\":\"Logout required!\"}"
fi
