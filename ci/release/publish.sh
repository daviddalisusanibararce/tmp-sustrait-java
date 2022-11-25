#!/usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

gradle clean :core:publishToSonatype :isthmus:publishToSonatype closeSonatypeStagingRepository
