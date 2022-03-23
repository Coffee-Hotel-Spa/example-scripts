#!/bin/bash

# Show help
function Help() {
    echo "This script searches a web page for occurences of a given word."
    echo
    echo "Syntax: wpfind [OPTIONS] URL TERM"
    echo
    echo "options:"
    echo "-h | --help     Show help"
    echo "-c | --count    Count the number of occurences."
    echo
    exit 0
}

while [[ $# -gt 0 ]]; do
    case $1 in 
        -h|--help)
            Help
            shift
            ;;
        -c|--count)
            COUNT=true
            shift
            ;;
        *)
            URL=$1
            TERM=$2
            shift 2
            ;;
    esac
done

matchcount=$(curl -s $URL | grep -o "$TERM" | wc -l)

if [ "$COUNT" == "true" ]; then
    echo $matchcount
else
    echo true
fi
