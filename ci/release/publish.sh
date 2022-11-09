#!/usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

gradle wrapper
#./gradlew clean publishToSonatype closeSonatypeStagingRepository

./gradlew clean publishToSonatype -PSONATYPE_USER=$SONATYPE_USER -PSONATYPE_PASSWORD=$SONATYPE_PASSWORD -PSIGNING_KEY_ID=$SIGNING_KEY_ID -PSIGNING_PASSWORD=$SIGNING_PASSWORD -PSIGNING_KEY=$SIGNING_KEY
