#!/usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

gradle wrapper
./gradlew clean :isthmus:publishToSonatype :isthmus:publishToSonatype :isthmus:closeSonatypeStagingRepository :core:closeSonatypeStagingRepository
