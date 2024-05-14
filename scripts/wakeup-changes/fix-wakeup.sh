#!/bin/bash
cat /proc/acpi/wakeup | grep 'XHC.*enabled'

if [[ $? -eq 0 ]]; then
  echo XHC >/proc/acpi/wakeup
fi
