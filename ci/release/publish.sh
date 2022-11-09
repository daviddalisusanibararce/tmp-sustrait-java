#!/usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

gradle wrapper
./gradlew clean publishToSonatype closeSonatypeStagingRepository
