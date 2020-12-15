#!/bin/sh

validate() {
    if [ -z "$PLUGIN_AUTH_TOKEN" ]
    then
        echo "Auth Token is not set!"
        exit 1
    fi
    NETLIFY_AUTH_TOKEN="$PLUGIN_AUTH_TOKEN"

    if [ -z "$PLUGIN_SITE_ID" ]
    then
        echo "Site ID is not set!"
        exit 1
    fi
    NETLIFY_SITE_ID="$PLUGIN_SITE_ID"
}

generate_flags() {
    FLAGS="--prod"

    if [ -n "$PLUGIN_DIR" ]
    then
        FLAGS="$FLAGS --dir $PLUGIN_DIR"
    fi
}

main() {
    validate
    generate_flags
    netlify deploy "$FLAGS"
}

main
