#!/bin/bash

sites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://som221site.com")
log_file="website_status.log"

> "$log_file"

echo "Початок перевірки сайтів"

for site in "${sites[@]}"; do
    if curl -s -o /dev/null -L -f "$site"; then
        result="$site is UP"
    else
        result="$site is DOWN"
    fi
    echo "$result" | tee -a "$log_file"
done

echo "Результати перевірки записані у файл $log_file"

