#!/bin/bash
battery_status=$(acpi | awk '{print $3}' | tr -d ',')
echo "Battery: $battery_status"

